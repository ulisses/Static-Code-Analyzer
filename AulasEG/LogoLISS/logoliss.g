grammar logoliss;

tokens{
    TRUE='TRUE';
    FALSE='FALSE';
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
    
vars    :    var    (','    vars)?
    ;

var    :    IDENT    value_var
    ;
    
value_var
    :    ('=')    inic_var
    |
    ;

type    :    INTEGER
    |    BOOLEAN
    |    ARRAY    SIZE    NUM
    ;
    
inic_var
    :    constant
    |    array_definition
    ;
    
constant
    :    NUM
    |    STRING
    |    TRUE
    |    FALSE
    ;

    
//************************ Declarations: Variables: Array_Definition

array_definition 
    :    '[' array_initialization ']'
    ;
    
array_initialization
    :    elem     ','    array_initialization     
    |     elem
    ;

elem
    :    NUM
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
