
PROGRAM 	[Pp][Rr][Oo][Gg][Rr][Aa][Mm]
DECLARATIONS 	[Dd][Ee][Cc][Ll][Aa][Rr][Aa][Tt][Ii][Oo][Nn][Ss]
STATEMENTS 	[Ss][Tt][Aa][Tt][Ee][Mm][Ee][Nn][Tt][Ss]
SUCC 		[Ss][Uu][Cc][Cc]
PRED 		[Pp][Rr][Ee][Dd]
IF 		[Ii][Ff]
ELSE		[Ee][Ll][Ss][Ee]
THEN		[Tt][Hh][Ee][Nn]
WHILE		[Ww][Hh][Ii][Ll][Ee]
INTEGER		[Ii][Nn][Tt][Ee][Gg][Ee][Rr]
BOOLEAN		[Bb][Oo][Oo][Ll][Ee][Aa][Nn]
ARRAY		[Aa][Rr][Rr][Aa][Yy]
SIZE		[Ss][Ii][Zz][Ee]
TRUE		[T][R][U][E]
FALSE		[F][A][L][S][E]
FORWARD		[Ff][Oo][Rr][Ww][Aa][Rr][Dd]
BACKWARD	[Bb][Aa][Cc][Kk][Ww][Aa][Rr][Dd]
RRIGHT		[Rr][Rr][Ii][Gg][Hh][Tt]
RLEFT		[Rr][Ll][Ee][Ff][Tt]
PEN		[Pp][Ee][Nn]
UP		[Uu][Pp]
DOWN		[Dd][Oo][Ww][Nn]
GOTO		[Gg][Oo][Tt][Oo]
WHERE		[Ww][Hh][Ee][Rr][Ee]
SAY		[Ss][Aa][Yy]
ASK		[Aa][Ss][Kk]
OU		"||"
E		"&&"
MULTMULT	"**"
IGUAL		"=="
DIF		"!="
MENORIGUAL	"<="
MAIORIGUAL	">="
IN		[Ii][Nn]
SETA 		"->"
NUM		[0-9]+
LETRA		[a-zA-Z]
STRING		\"[^"]+\"
IDENT		[a-zA-Z][a-zA-Z0-9]*

%%

{PROGRAM}		{return(PROGRAM);}
{DECLARATIONS}		{return(DECLARATIONS);}
{STATEMENTS}		{return(STATEMENTS);}
{SUCC}			{yylval.vals=(char*)strdup(yytext);return(SUCC);}
{PRED}			{yylval.vals=(char*)strdup(yytext);return(PRED);}
{IF}			{return(IF);}
{ELSE}			{return(ELSE);}
{THEN}			{return(THEN);}
{WHILE}			{return(WHILE);}
{INTEGER}		{return(INTEGER);}
{BOOLEAN}		{return(BOOLEAN);}
{ARRAY}			{return(ARRAY);}
{SIZE}			{return(SIZE);}
{TRUE}			{yylval.vals=(char*)strdup(yytext);return(TRUE);}
{FALSE}			{yylval.vals=(char*)strdup(yytext);return(FALSE);}
{FORWARD}		{return(FORWARD);}
{BACKWARD}		{return(BACKWARD);}
{RRIGHT}		{return(RRIGHT);}
{RLEFT}			{return(RLEFT);}
{PEN}			{return(PEN);}
{UP}			{return(UP);}
{DOWN}			{return(DOWN);}
{GOTO}			{return(GOTO);}
{WHERE}			{return(WHERE);}
{SAY}			{return(SAY);}
{ASK}			{return(ASK);}
{OU}			{return(OU);}
{E}			{return(E);}
{MULTMULT}		{return(MULTMULT);}
{IGUAL}			{return(IGUAL);}
{DIF}			{return(DIF);}
{MENORIGUAL}		{return(MENORIGUAL);}
{MAIORIGUAL}		{return(MAIORIGUAL);}
{IN}			{return(IN);}
{SETA}			{return(SETA);}
[+-]			{yylval.vals=(char*)strdup(yytext);return(yytext[0]);}
[,;<>]			{return(yytext[0]);}
[?\[\]()/!*]		{return(yytext[0]);}
[{]			{return(yytext[0]);}
[}]			{return(yytext[0]);}
[=]			{return(yytext[0]);}
{NUM}			{yylval.valn=atoi(yytext);return(NUM);}
{STRING}		{yylval.vals=(char*)strdup(yytext);return(STRING);}
{IDENT}			{yylval.vals=(char*)strdup(yytext);return(IDENT);}
" "|\n|\t		{;}
			

%%

int yywrap()
{ return(1); }

