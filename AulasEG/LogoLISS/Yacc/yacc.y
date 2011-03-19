%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include "hashtable.h"

	
long PC=0;

typedef struct Vars {
	char* nome;
	char* valor;
	struct Vars* next;
}tVarString;
	
tVarString* nodo;
	
typedef struct ParIdentValor {
	char* nome;
	char* valor;
}ParIdVl;

typedef struct {
	int valorInt;
	char* valorString;
	}Parconst;
%}


%token DECLARATIONS
%token STATEMENTS 
%token SUCC
%token PRED
%token IF
%token ELSE
%token THEN
%token WHILE
%token INTEGER 
%token BOOLEAN
%token ARRAY
%token SIZE
%token <vals>TRUE
%token <vals>FALSE
%token FORWARD
%token BACKWARD
%token RRIGHT
%token RLEFT
%token PEN
%token UP
%token DOWN
%token GOTO
%token WHERE
%token SAY
%token ASK
%token OU
%token E
%token MULTMULT
%token IGUAL
%token DIF
%token MENORIGUAL
%token MAIORIGUAL
%token IN
%token SETA
%token PROGRAM
%token <valn>NUM
%token <vals>STRING
%token <vals>IDENT

%left '<' '>' MENORIGUAL MAIORIGUAL IGUAL E MULTMULT DIF OU
%left <vals>'+' '-'
%left '*' '/'

%type <par>Var
%type <vals>Constant
%type <vals>Sign
%type <vals>Value_Var
%type <vals>Inic_Var
%type <valn>Type

%union{
	int valn;
	char *vals;
	float valr;
	ParIdVl par;
	Parconst parConst;
}


%start LISS

%%

LISS			: PROGRAM IDENT '{' Body '}'
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
		      	{
					tVarString* aux = nodo;
					while(aux!=NULL)
					{
						if(lookup(aux->nome) != NULL)
						{
							yyerror("VAR Duplicadas");
							exit(0);
						}
						else
						{
							if(!insere(aux->nome,$3,PC))
							{
								yyerror("SEGMENTATION FAULT");
								exit(0);
							}
							switch($3)
							{
								case 0 : printf("pushi %d",atoi(aux->valor));break;
								case 1 : 
										if(strcmp("TRUE",aux->valor)==0)
											printf("pushi 1\n");
										else
											if(strcmp("FALSE",aux->valor)==0)
												printf("pushi 0\n");
											else
											{
												yyerror("Tipo boolean incorrecto");
												exit(0);
											}
										
										break;
							}
							PC++;
						}
						aux = aux->next;
					}
					printf("start\n");
					node = NULL;
			}
			;
Vars			: Var 
       			{
				tVarString* aux = (tVarString*)malloc(sizeof(tVarString));
				aux->nome = $1.nome;
				aux->valor = $1.valor;
				aux->next = NULL;
				nodo=aux;
			}
			| Vars ',' Var
			{
				tVarString* aux = (tVarString*)malloc(sizeof(tVarString));
				aux->nome = $3.nome;
				aux->valor = $3.valor;
				aux->next = nodo;
				nodo = aux;
			}
			;
Var			: IDENT Value_Var 
      			{
				$$.nome = $1;
				$$.valor = $2;
				}
			;
Value_Var   		: 
	      		{
				$$ = "";
			}
			| '=' Inic_Var 
			{
				$$ = $2;
			}
			;
Type		: INTEGER {$$=0;}
			| BOOLEAN {$$=1;}
			| ARRAY SIZE NUM {$$=2;} 
			;
Inic_Var		: Constant	
	  		{
				$$ = $1;
			}
			| Array_Definition 
			{
				$$ = "";
			}
			;
Constant		: '(' Sign NUM ')' 
	  		{
				$$ = (char*)malloc(sizeof($3));
				char *res = (char*)malloc(sizeof($3));
				if(strcmp($2,"-")==0)
				{	
					sprintf(res,"-%d",$3);
					$$ = res;
				}
				else
				{
					sprintf(res,"%d",$3);
					$$=res;	
				}	
			}
			| TRUE  {$$ = $1; }
			| FALSE  {$$ = $1; }
			;
Sign		: {$$ = "";}
			| '+' {$$ = $1;}
			| '-' {$$ = $1;} 
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
%%

#include "lex.yy.c"


int yyerror(char *s)
{
	fprintf(stderr,"ERRO: %s \n",s);
	return 0;
}


int main()
{
	nodo = NULL;
	inithashtab();
	yyparse();
	return(0);
}

