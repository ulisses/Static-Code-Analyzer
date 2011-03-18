grammar logoliss;

tokens{
	Program = 'PROGRAM';Declarations = 'DECLARATIONS';Statements = 'STATEMENTS';
	Integer = 'INTEGER';Boolean = 'BOOLEAN';Array = 'ARRAY';Size = 'SIZE';True = 'TRUE';
	False = 'FALSE';Forward = 'FORWARD';Backward = 'BACKWARD';Rright = 'RRIGHT';Rleft = 'RLEFT';
	Pen = 'PEN';Up = 'UP';Down = 'DOWN';Goto = 'GOTO';Where = 'WHERE';Succ = 'SUCC';
	Pred = 'PRED';Say = 'SAY';Ask = 'ASK';If = 'IF';Then = 'THEN';Else = 'ELSE';While = 'WHILE';
}

@header{
	;
}

@members{

}

//**************************program*************************

logoliss 
	:	Program	'identifier'		'{'	body	'}'	
	;
	
body
	:	Declarations		declarations
	|	Statements		statements
	;
	
//**************************declarations*************************

declarations
	:	declaration		declarations	
	|	declaration
	;
	
declaration
	:	variable_declaration
	;
	
//**************************declarations: variables*************************
	
variable_declaration
	:	vars	'->'	type	';'
	;
	
vars	:	var	','	vars
	|	var
	;

var	:	'IDENTIFIER'	value_var
	;
	
value_var
	:	'='	inic_var
	;

type	:	Integer	
	|	Boolean
	|	Array	Size	'Number'
	;
	
inic_var
	:	constant
	|	array_definition
	;
	
constant
	:	sign	'Numero'
	|	'String'
	;
	
sign	:	'+'
	|	'-'
	;
	
//************************ Declarations: Variables: Array_Definition

array_definition 
	:	'[' array_initialization ']'
	;
	
array_initialization
	:	elem 	','	array_initialization 	
	| 	elem
	;

elem
	:	sign 	'Núu'
	;

//************************* Statements

statements
	:	statement 	statements
          	|  	statement
          	;
          	
statement
	:	turtle_commands
	| 	assignment
	| 	conditional_statement
	| 	iterative_statement
	;
	
//************************* Turtle Statement
turtle_commands
	:	step
	|	rotate
	|	mode
	|	dialogue
	|	location
	;
	
step 
	:	Forward 	expression
    	|	Backward 	expression
    	;
    	
rotate	: 	Rright
      	| 	Rleft
      	;
      	
mode 	:	Pen 	Up
    	| 	Pen	Down
	;
	
dialogue 	:	say_statement
        	|	ask_statement
	;

location	:	Goto 	'numero'	 ',' 	'number'
	| 	Where	'?'
	;
	        
//************************* Assignment Statement
assignment 
	:	variable 	'=' 	expression
	;

variable
	:	'Identifier' 	array_acess
	;

array_acess
	:
        	| 	'['	 single_expression 	']'
	;

//*********************** Expression
expression
	:	single_expression
	|	single_expression	rel_op 	expression 	
	;

//******** Single_Expression
single_expression
	:	term
	| 	term add_op single_expression 
	;

//******* Term
term
	:	factor
	|	factor	mul_op	term	
	;

//******* Factor
factor
	:	constant
	|	variable
	|	succorpred
	|	'!'	expression
	|	'+'	expression
	|	'-'	expression	
	|	'('	expression	')'
	;

//******** Operators
add_op 
	: 	'+'
      	| 	'-'
     	| 	'||'
	;

mul_op
	:	'*'
       	| 	'/'
       	| 	'&&'
       	| 	'**'
	;

rel_op 
	:	'=='
       	| 	'!='
       	| 	'<'
       	| 	'>'
       	| 	'<='
       	| 	'>='
       	| 	'in'
	;

//******** SuccOrPredd
succorpred
	: 	succpred 	'identifier'
	;

succpred
	:	Succ
        | 	Pred
	;

//********************* IO Statements
say_statement
	:	Say 	'(' 	expression	 ')'
	;

ask_statement
	:	Ask 	'(' 	'string' 	',' 	variable 	')'
	;

//********************* Conditional & Iterative Statements
conditional_statement
	:	ifthenelse_stat
	;

iterative_statement
	:	while_stat
	;

//******** IfThenElse_Stat
ifthenelse_stat		
		:	If	expression
               	|	Then	'{' 	statements 	'}'
              	|	else_expression
              	;
else_expression
		:
               	| 	Else 	'{' 	statements 	'}'
		;

//******** While_Stat
while_stat
		:	While	'(' 	expression 	')' 	'{' 	statements 	'}'
		;
