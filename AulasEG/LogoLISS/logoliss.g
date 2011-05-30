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

public class Variavel{
	public Tipo tipo;
	public String nome;
	public int valor;
	public ArrayList<Integer> lista;
	
	public Variavel(){
		this.tipo = Tipo.Integer;
		this.valor = 0;
		this.nome = "";
		this.lista = new ArrayList<Integer>();
	}
	
	public Variavel(String name, int value, ArrayList<Integer> list, Tipo type){
		this.tipo = type;
		this.valor = value;
		this.lista = list;
		this.nome = name;
	}
	
	public String toString(){
		String str = "";
		if(this.tipo == Tipo.Boolean){
			str = "Variável " + this.nome + "\nTipo Booleano\nValor " + this.valor + "\n";
		}
		if(this.tipo == Tipo.Integer){
			str = "Variável " + this.nome + "\nTipo Inteiro\nValor " + this.valor + "\n";			
		}
		if(this.tipo == Tipo.Array){
			str = "Variável " + this.nome + "\nTipo Array\nTamanho " + this.valor + "\nValores:\n";
			for(int x : this.lista){
				str = str + x + "\n";
			}			
		}
		return str;
	}
}

public class Position {
	public int x;
	public int y;
	
	public Position(){
		this.x = 0;
		this.y = 0;
	}
	public Position(int x1, int y1){
		this.x = x1;
		this.y = y1;
	}
}

public class ListaVar {
	public HashMap<String,Variavel> lista;
	public int state; //estado do robo
	public boolean penup;
	public Position pos;
	
	public ListaVar(){
		this.lista = new HashMap<String,Variavel>();
		this.state = 0;
		this.penup = true;
		this.pos = new Position();
	}
	
	public ListaVar(ArrayList<Variavel> array){
		this.lista = new HashMap<String,Variavel>();
		for(Variavel v : array){
			this.lista.put(v.nome,v);
		}
		this.state = 0;
		this.penup = true;
		this.pos = new Position();
	}
	
	public Variavel getVar(String str){
		return this.lista.get(str);
	}
}

}

//**************************program*************************
logoliss 
    	:    PROGRAM    IDENT        '{'    body    '}'    
    	;
    
body
@init{ListaVar list;}
    	:    DECLARATIONS        dec=declarations		
    	     STATEMENTS {//for(Variavel v : $dec.lista_out) System.out.println(v.toString());
    	     			list = new ListaVar($dec.lista_out);
    	     		}       statements[list]
    	;

//**************************declarations*************************

declarations
returns[ArrayList<Variavel> lista_out]
@init{ArrayList<Variavel> lista = new ArrayList<Variavel>();}
    	:    	dec=declaration {for(Variavel var : $dec.lista_out){ lista.add(var);}}        
    		( decls=declarations {System.out.println("Adicionando elementos!");
    		for(Variavel var : $decls.lista_out){ lista.add(var);}} )?
    		{$lista_out = lista;}
    	;
    
declaration
returns[ArrayList<Variavel> lista_out]
    	:    vd=variable_declaration {$lista_out = $vd.lista_out;}
    	;
    
variable_declaration
returns[ArrayList<Variavel> lista_out]
    	:    vars{$lista_out = $vars.lista_out;}    '->'    tt=type{	Tipo x = $tt.t_out;
    									int tamanho = $tt.s_out;
    									System.out.println("Tamanho:" + $lista_out.size());
	    								for(Variavel va : $lista_out){
	    									va.tipo = x; 
	    									if(va.tipo == Tipo.Array){ 
	    										va.valor = tamanho;
	    									}
	    								} 
	    								if(x == Tipo.Array){
	    									for(Variavel var : $lista_out){
	    										int tam = var.lista.size();
	    										while(tam < var.valor){
	    											var.lista.add(0);
	    											tam++;
	    										}
	    									}
	    								}
    								}  ';'
    	;

type    
returns[Tipo t_out, int s_out]
	:    INTEGER				{$t_out = Tipo.Integer; $s_out = 0;}
    	|    BOOLEAN				{$t_out = Tipo.Boolean; $s_out = 0;}
    	|    ARRAY    SIZE    NUM		{$t_out = Tipo.Array; $s_out = Integer.parseInt($NUM.text);}
    	;
        
vars
returns[ArrayList<Variavel> lista_out]
@init{ArrayList<Variavel> lista = new ArrayList<Variavel>();}    
	:    var{lista.add($var.v_out);}    (','    vs=vars {for(Variavel va : $vs.lista_out) lista.add(va);})? {$lista_out = lista;}
    	;

var
returns[Variavel v_out]
@init{Variavel v = new Variavel();}
	:    IDENT{v.nome = $IDENT.text;}    vv=value_var {v.valor = $vv.value_out; v.lista = $vv.lista_out; $v_out = v;}
    	;
    
value_var
returns[int value_out, ArrayList<Integer> lista_out]
    	:    ('=')    iv=inic_var 	{$value_out = $iv.value_out; $lista_out = $iv.lista_out;}
    	|				{$value_out = 0; $lista_out = new ArrayList<Integer>();}
    	;

inic_var
returns[int value_out, ArrayList<Integer> lista_out]
    	:    constant			{$value_out = $constant.value_out; $lista_out = new ArrayList<Integer>();}
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

statements[ListaVar list_in]
returns[ListaVar list_out]
	:    (statement[list_in])+
	;
              
statement[ListaVar list_in]
returns[ListaVar list_out]
	:     turtle_commands[list_in]
	|     assignment[list_in]
	|     conditional_statement[list_in]
	|     iterative_statement[list_in]
	;
    
//************************* Turtle Statement
turtle_commands[ListaVar list_in]
returns[ListaVar list_out]
	:    step[list_in]
	|    rotate 			{list_in.state += $rotate.value_out; if(list_in.state < 0)list_in.state += 360;if(list_in.state >= 360)list_in.state -= 360; $list_out = $list_in;}
	|    mode			{list_in.penup = $mode.state_out; $list_out = list_in;}
	|    dialogue[list_in]		{System.out.println("Dialogos a serem ignorados...");}
	|    loc=location		{Position pes = new Position($loc.x_out,$loc.y_out); list_in.pos = pes; list_out=list_in;} 
	;
    
step[ListaVar list_in]
returns[ListaVar list_out]
	:    FORWARD     expression[list_in] 
	|    BACKWARD     expression[list_in]
	;
        
rotate
returns[int value_out]
	:     RRIGHT	{$value_out = 90;}
	|     RLEFT	{$value_out = -90;}
	;
          
mode 
returns[boolean state_out]
	:    PEN     likeaboss{$state_out = $likeaboss.state_out;}
	;

likeaboss 
returns[boolean state_out]
	:    	UPS	{$state_out = true;}
	|	DOWNS	{$state_out = false;}
	;
    
dialogue[ListaVar list_in]
returns[ListaVar list_out]     
	:    say_statement[list_in]
	|    ask_statement[list_in]
	;

location
returns[int x_out, int y_out]
	:    GOTO     a=NUM{$x_out = Integer.parseInt($a.text);}     ','     b=NUM{$y_out = Integer.parseInt($b.text);}
	|     WHERE{$x_out = 1; $y_out = 1;}	'?'
	;
            
//************************* Assignment Statement
assignment[ListaVar list_in]
returns[ListaVar list_out] 
	:    variable[list_in]     '='     expression[list_in]
	;

variable[ListaVar list_in]
returns[ListaVar list_out, int value_out]
	:    IDENT     (array_acess[list_in])?	{$value_out = 5;}
	;

array_acess[ListaVar list_in]
returns[ListaVar list_out]
	:    '['     single_expression[list_in]     ']'
	;

//*********************** Expression
expression[ListaVar list_in]
returns[ListaVar list_out]
options{k=2;}
	:    single_expression[list_in]    (rel_op     expression[list_in])?
	;

//******** Single_Expression
single_expression[ListaVar list_in]
returns[ListaVar list_out]
	:    term[list_in]    (add_op single_expression[list_in])?
	;

//******* Term
term[ListaVar list_in]
returns[ListaVar list_out,int value_out]
	:    factor[list_in]    (mul_op    term[list_in])?    
	;

//******* Factor
factor[ListaVar list_in]
returns[ListaVar list_out, int value_out]
options{k=3;}
	:    c=constant						{$value_out = $c.value_out;}
	|    v=variable[list_in]				{$value_out = $v.value_out;}
	|    s=succorpred[list_in]				{$value_out = $s.value_out;}
	|    ('+'|'-'|'!')? '('    e=expression[list_in]    ')'	{$value_out = 2;}
	;

//******** Operators
add_op 
returns[int aop_out]
	:     '+'	{$aop_out = 1;}
	|     '-'	{$aop_out = 2;}
	|     '||'	{$aop_out = 3;}
	;

mul_op
returns[int mop_out]
	:    '*'	{$mop_out = 1;}
	|     '/'	{$mop_out = 2;}
	|     '&&'	{$mop_out = 3;}
	|     '**'	{$mop_out = 4;}
	;

rel_op 
returns[int rop_out]
	:    '=='	{$rop_out = 1;}
	|     '!='	{$rop_out = 2;}
	|     '<'	{$rop_out = 3;}
	|     '>'	{$rop_out = 4;}
	|     '<='	{$rop_out = 5;}
	|     '>='	{$rop_out = 6;}
	|     'in'	{$rop_out = 7;}
	;

//******** SuccOrPredd
succorpred [ListaVar list_in]
returns[ListaVar list_out, int value_out]
	:     suc=succpred		IDENT {Variavel v = list_in.getVar($IDENT.text); v.valor += $suc.value_out;$value_out = v.valor;$list_out = list_in;}
	;

succpred 
returns[int value_out]
	:    SUCC	{$value_out = 1;}
	|    PRED	{$value_out = -1;}
	;

//********************* IO Statements
say_statement [ListaVar list_in]
returns[ListaVar list_out]
	:    SAY     '('     expression[list_in]     ')'
	;

ask_statement [ListaVar list_in]
returns[ListaVar list_out]
	:    ASK     '('     STRING     ','     variable[list_in]     ')'
	;

//********************* Conditional & Iterative Statements
conditional_statement[ListaVar list_in]
returns[ListaVar list_out]
	:    ifthenelse_stat[list_in]
	;

iterative_statement[ListaVar list_in]
returns[ListaVar list_out]
	:    while_stat[list_in]
	;

//******** IfThenElse_Stat
ifthenelse_stat[ListaVar list_in]
returns[ListaVar list_out]
	:    IF    expression[list_in]
	|    THEN    '{'     statements[list_in]     '}'
	|    else_expression[list_in]
	;

else_expression[ListaVar list_in]
returns[ListaVar list_out]
	:     ELSE    '{'     statements[list_in]     '}'
	;

//******** While_Stat
while_stat[ListaVar list_in]
returns[ListaVar list_out]
        :    WHILE    '('     expression[list_in]     ')'     '{'     statements[list_in]     '}'
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
        
WHILE 	:	 ('W'|'w')('H'|'h')('I'|'i')('L'|'l')('E'|'e')
        ;

STATEMENTS :    ('S'|'s')('T'|'t')('A'|'a')('T'|'t')('E'|'e')('M'|'m')('E'|'e')('N'|'n')('T'|'t')('S'|'s')
        ;
        
BOOLEAN 
	:	       ('B'|'b')('O'|'o')('O'|'o')('L'|'l')('E'|'e')('A'|'a')('N'|'n')
;
        
DECLARATIONS 
	:	  ('D'|'d')('E'|'e')('C'|'c')('L'|'l')('A'|'a')('R'|'r')('A'|'a')('T'|'t')('I'|'i')('O'|'o')('N'|'n')('S'|'s')
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
