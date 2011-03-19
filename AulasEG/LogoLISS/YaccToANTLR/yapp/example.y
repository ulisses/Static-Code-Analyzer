Liss			: PROGRAM IDENT '{' Body '}'
				;
Body			: DECLARATIONS Declarations 
       			  STATEMENTS Statements
				;
Declarations		: Declaration
					| Declarations Declaration
					;
Declaration		: Variable_Declaration
				;
Variable_Declaration 	: Vars SETA Type ';'
			;
Vars			: Var 
			| Vars ',' Var
			;
Var			: IDENT Value_Var 
			;
Value_Var   		: 
			| '=' Inic_Var 
			;
Type		: INTEGER
			| BOOLEAN
			| ARRAY SIZE NUM
			;
Inic_Var		: Constant	
			| Array_Definition 
			;
Constant		: '(' Sign NUM ')' 
			| TRUE
			| FALSE 
			;
Sign		: 
			| '+' 
			| '-'
 			;
Array_Definition 	: '[' Array_Initialization ']'
					;
Array_Initialization 	: Elem
						| Array_Initialization ',' Elem
						;
Elem		: Sign NUM
			;
Statements		: Statement
	    		| Statements Statement
				;
Statement	: Turtle_Commands
	   		| Assignment
			| Conditional_Statement
			| Iterative_Statement
			;
Turtle_Commands		: Step 
		 			| Rotate
					| Mode
					| Dialogue
					| Location
					;
Step		: FORWARD Expression
       		| BACKWARD Expression
			;
Rotate		: RRIGHT
	 		| RLEFT
			;
Mode			: PEN UP
       			| PEN DOWN
				;
Dialogue		: Say_Statement
	  			| Ask_Statement
				;
Location	: GOTO NUM ',' NUM
	  		| WHERE '?'
			;
Assignment		: Variable '=' Expression
	    		;
Variable		: IDENT Array_Acess
	  			;
Array_Acess		: 
	     		| '[' Single_Expression ']'
				;
Expression		: Single_Expression
	    		| Expression Rel_Op Single_Expression
				;
Single_Expression	: Term
		  			| Single_Expression Add_Op Term
					;
Term			: Factor
       			| Term Mul_Op Factor
				;
Factor		: Constant 
	 		| Variable
			| SuccOrPred
			| '(' '!' Expression ')'
			| '(' '+' Expression ')'
			| '(' '-' Expression ')'
			| '(' Expression ')'
			;
Add_Op		: '+'
	 		| '-'
			| OU
			;
Mul_Op		: '*'
	 		| '/'
			| E
			| MULTMULT
			;
Rel_Op		: IGUAL
	 		| DIF
			| '<'
			| '>'
			| MENORIGUAL
			| MAIORIGUAL
			| IN
			;
SuccOrPred		: SuccPred IDENT
	    		;
SuccPred		: SUCC
	  			| PRED
				;
Say_Statement	: SAY '(' Expression ')'
	       		;
Ask_Statement	: ASK '(' STRING ',' Variable ')'
	       		;
Conditional_Statement	: IfThenElse_Stat
		      			;
Iterative_Statement	: While_Stat
		    		;
IfThenElse_Stat		: IF Expression THEN '{' Statements '}' Else_Expression
		 			;
Else_Expression		:
		 			| ELSE '{' Statements '}'
					;
While_Stat		: WHILE '(' Expression ')' '{' Statements '}'
	    		;
