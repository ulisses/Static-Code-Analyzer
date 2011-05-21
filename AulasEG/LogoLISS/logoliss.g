grammar logoliss;

tokens{
    TRUE='TRUE';
    FALSE='FALSE';
}

@header{
import java.util.HashMap;
import java.util.ArrayList;
}

@members{
enum Tipo {Integer, Boolean, Array};

}

//**************************program*************************
logoliss 
    	:    PROGRAM    IDENT        '{'    body    '}'    
    	;
    
body
    	:    DECLARATIONS        declarations         STATEMENTS        statements
    	;

//**************************declarations*************************

declarations
    	:    declaration        declarations?
    	;
    
declaration
    	:    variable_declaration
    	;
    
//**************************declarations: variables*************************
    
variable_declaration
    	:    vars    '->'    type    ';'
    	;
    
vars    
	:    var    (','    vars)?
    	;

var    
	:    IDENT    value_var
    	;
    
value_var
    	:    ('=')    inic_var
    	|
    	;

type    
returns[Tipo t_out, int s_out]
	:    INTEGER				{$t_out = Tipo.Integer; $s_out = 0;}
    	|    BOOLEAN				{$t_out = Tipo.Boolean; $s_out = 0;}
    	|    ARRAY    SIZE    NUM		{$t_out = Tipo.Array; $s_out = Integer.parseInt($NUM.text);}
    	;
    
inic_var
returns[int value_out, ArrayList<Integer> lista_out]
    	:    constant			{$value_out = $constant.value_out; $lista_out = null;}
    	|    ad=array_definition		{$value_out = $ad.lista_out.size(); $lista_out = $ad.lista_out;}
    	;
    
constant
returns[int value_out]
    	:    NUM	{$value_out = Integer.parseInt($NUM.text);} 
//    	|    STRING
    	|    TRUE	{$value_out = 1;}
    	|    FALSE	{$value_out = 0;}
    	;

//************************ Declarations: Variables: Array_Definition

array_definition
returns[ArrayList<Integer> lista_out]
    :    '[' air=array_initialization{lista_out=$air.lista_out;} ']'
    ;
    
array_initialization
returns[ArrayList<Integer> lista_out]
@init{ArrayList<Integer> lista = new ArrayList<Integer>();}
    :    el=elem     ','    lst=array_initialization  	{lista.add($el.value_out); for(int x : $lst.lista_out){lista.add(x);} lista_out = lista;
    							}
    |     elem	{lista.add($elem.value_out);lista_out = lista;}
    ;

elem
returns[int value_out]
    :    NUM	{$value_out = Integer.parseInt($NUM.text);}
    ;

//************************* Statements

statements
    :    statement+
              ;
              
statement
    :    turtle_commands
    |     assignment
    |     conditional_statement
    |     iterative_statement
    ;
    
//************************* Turtle Statement
turtle_commands
    :    step
    |    rotate
    |    mode
    |    dialogue
    |    location
    ;
    
step 
    :    FORWARD     expression
        |    BACKWARD     expression
        ;
        
rotate    :     RRIGHT
          |     RLEFT
          ;
          
mode     :    PEN     likeaboss
    ;

likeaboss
    :    (UPS|DOWNS)
    ;
    
dialogue     :    say_statement
            |    ask_statement
    ;

location    :    GOTO     NUM     ','     NUM
    |     WHERE    '?'
    ;
            
//************************* Assignment Statement
assignment 
    :    variable     '='     expression
    ;

variable
    :    IDENT     (array_acess)?
    ;

array_acess
    :    '['     single_expression     ']'
    ;

//*********************** Expression
expression
options{k=2;}
    :    single_expression    (rel_op     expression)?
    ;

//******** Single_Expression
single_expression
    :    term    (add_op single_expression)?
    ;

//******* Term
term
    :    factor    (mul_op    term)?    
    ;

//******* Factor
factor
options{k=3;}
    :    constant
    |    variable
    |    succorpred
    |    ('+'|'-'|'!')? '('    expression    ')'
    ;

//******** Operators
add_op 
    :     '+'
          |     '-'
         |     '||'
    ;

mul_op
    :    '*'
           |     '/'
           |     '&&'
           |     '**'
    ;

rel_op 
    :    '=='
           |     '!='
           |     '<'
           |     '>'
           |     '<='
           |     '>='
           |     'in'
    ;

//******** SuccOrPredd
succorpred
    :     succpred     IDENT
    ;

succpred
    :    SUCC
            |    PRED
    ;

//********************* IO Statements
say_statement
    :    SAY     '('     expression     ')'
    ;

ask_statement
    :    ASK     '('     STRING     ','     variable     ')'
    ;

//********************* Conditional & Iterative Statements
conditional_statement
    :    ifthenelse_stat
    ;

iterative_statement
    :    while_stat
    ;

//******** IfThenElse_Stat
ifthenelse_stat        
        :    IF    expression
                   |    THEN    '{'     statements     '}'
                  |    else_expression
                  ;

else_expression    :     ELSE    '{'     statements     '}'
        ;

//******** While_Stat
while_stat
        :    WHILE    '('     expression     ')'     '{'     statements     '}'
        ;
        
PRED :  ('P'|'p')('R'|'r')('E'|'e')('D'|'d')
        ;

GOTO :  ('G'|'g')('O'|'o')('T'|'t')('O'|'o')
        ;

RRIGHT :        ('R'|'r')('R'|'r')('I'|'i')('G'|'g')('H'|'h')('T'|'t')
        ;

FORWARD :       ('F'|'f')('O'|'o')('R'|'r')('W'|'w')('A'|'a')('R'|'r')('D'|'d')
        ;

IF :    ('I'|'i')('F'|'f')
        ;

PROGRAM :       ('P'|'p')('R'|'r')('O'|'o')('G'|'g')('R'|'r')('A'|'a')('M'|'m')
        ;

INTEGER :       ('I'|'i')('N'|'n')('T'|'t')('E'|'e')('G'|'g')('E'|'e')('R'|'r')
        ;

ELSE :  ('E'|'e')('L'|'l')('S'|'s')('E'|'e')
        ;

ASK :   ('A'|'a')('S'|'s')('K'|'k')
        ;

SIZE :  ('S'|'s')('I'|'i')('Z'|'z')('E'|'e')
        ;

RLEFT : ('R'|'r')('L'|'l')('E'|'e')('F'|'f')('T'|'t')
        ;

UPS :    ('U'|'u')('P'|'p')
        ;

THEN :  ('T'|'t')('H'|'h')('E'|'e')('N'|'n')
        ;

WHILE : ('W'|'w')('H'|'h')('I'|'i')('L'|'l')('E'|'e')
        ;

STATEMENTS :    ('S'|'s')('T'|'t')('A'|'a')('T'|'t')('E'|'e')('M'|'m')('E'|'e')('N'|'n')('T'|'t')('S'|'s')
        ;

BOOLEAN :       ('B'|'b')('O'|'o')('O'|'o')('L'|'l')('E'|'e')('A'|'a')('N'|'n')
        ;

DECLARATIONS :  ('D'|'d')('E'|'e')('C'|'c')('L'|'l')('A'|'a')('R'|'r')('A'|'a')('T'|'t')('I'|'i')('O'|'o')('N'|'n')('S'|'s')
    ;
    
ARRAY : ('A'|'a')('R'|'r')('R'|'r')('A'|'a')('Y'|'y')
        ;

BACKWARD :      ('B'|'b')('A'|'a')('C'|'c')('K'|'k')('W'|'w')('A'|'a')('R'|'r')('D'|'d')
        ;

IN :    ('I'|'i')('N'|'n')
        ;

WHERE : ('W'|'w')('H'|'h')('E'|'e')('R'|'r')('E'|'e')
        ;

SAY :   ('S'|'s')('A'|'a')('Y'|'y')
        ;

PEN :   ('P'|'p')('E'|'e')('N'|'n')
        ;
        
SUCC :    ('S'|'s')('U'|'u')('C'|'c')('C'|'c')
    ;
    
DOWNS :  ('D'|'d')('O'|'o')('W'|'w')('N'|'n')
        ;

IDENT : ('a'..'z'|'A'..'Z')('a'..'z'|'A'..'Z'|'0'..'9')*
        ;

NUM :   ('+'|'-')?('0'..'9')+
        ;

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;

STRING
    :  '"' ( ~('\\'|'"') )* '"'
    ;
