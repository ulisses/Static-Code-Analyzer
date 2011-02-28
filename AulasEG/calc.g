grammar calc;

@header{
import java.util.HashMap;
import java.util.ArrayList;
}


@members{
enum Tipo {REAL, INT};
//HashMap<String, Integer> table= new HashMap<String,Integer>
}



language returns [HashMap<String,String> identificadores]
	 @init {HashMap <String,String>declarations_in = new HashMap<String,String>();}
	:	 ((declaration[declarations_in]{declarations_in=$declaration.declarations_out;} 
		  |attrib [declarations_in]
		  | io[declarations_in]) ';' )*
		  		{$identificadores = $declaration.declarations_out;}
	;
	
declaration [HashMap<String,String> declarations_in] returns [HashMap<String,String> declarations_out]
	:	(tipo=Type_Int | tipo=Type_Real)   ID {
						if (declarations_in.containsKey($ID.text)){
							System.out.println( "A variavel " + $ID.text +" ja foi declarada antes.\n");
							declarations_out = declarations_in;
							}
						else							
					 		 declarations_in.put($ID.text, $tipo.text);
					 		 declarations_out = declarations_in;
						}
	;

attrib	[HashMap<String,String> declarations_in]
	:	ID '=' expression [declarations_in] 
			{
				if (!declarations_in.containsKey($ID.text)){
					 System.out.println("A variavel "+ $ID.text + " ainda nao foi declarada!\n" );
					 }
				else {
//					tipo = declarations_in.get($ID.text);
					System.out.println("tipo Ž" + $expression.tipo);
					
				}
			}
	;
	 
io	[HashMap<String,String> declarations_in]
	:	'?' ID {}
	|	'!' expression [declarations_in]
	;
	
expression [HashMap<String,String> declarations_in] 
	returns [Tipo tipo]
           @init {Tipo val = Tipo.INT;} 
	: 
	|	t1=term[declarations_in] (operatorAdd t2=term[declarations_in]{if($t2.tipo == Tipo.REAL) val = Tipo.REAL;})* {
								if($t1.tipo == Tipo.REAL || val == Tipo.REAL)
							 		tipo = Tipo.REAL; else tipo = Tipo.INT;}   
					
	;
	
term	[HashMap<String,String> declarations_in]
	returns [Tipo tipo]
	@init {Tipo val = Tipo.INT;}
	:	f1=factor[declarations_in] (operatorMul f2=factor[declarations_in]{if($f2.tipo == Tipo.REAL) val = Tipo.REAL;})* 
							{if($f1.tipo == Tipo.REAL || val == Tipo.REAL)
							 	tipo = Tipo.REAL; else tipo = Tipo.INT;}  
	;
	
factor	[HashMap<String,String> declarations_in]
	returns [Tipo tipo]
	:	'(' expression[declarations_in] ')' {tipo = $expression.tipo;}
	| 	value[declarations_in] {tipo = $value.tipo;} 
	;
	
operatorAdd
	:	'+' | '-'
	;
	
operatorMul
	:	'*' | 'div'
	;
	
operator:	'+' | '-' | '*' | 'div'
	;
	

value  	[HashMap<String,String> declarations_in]
	returns[Tipo tipo] 
 	:	ID {String type = declarations_in.get($ID.text);
 		if (type.equals("int"))tipo = Tipo.INT; else tipo = Tipo.REAL; 
 		} 
 		| INT {tipo = Tipo.INT;}
 		| FLOAT {tipo = Tipo.REAL;}
 	;

Type_Int:	 'int'
	;
		
Type_Real
	:	'real'	 
	;


ID  :	('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

INT :	'0'..'9'+
    ;

FLOAT
    :   ('0'..'9')+ '.' ('0'..'9')* EXPONENT?
    |   '.' ('0'..'9')+ EXPONENT?
    |   ('0'..'9')+ EXPONENT
    ;

COMMENT
    :   '//' ~('\n'|'\r')* '\r'? '\n' {$channel=HIDDEN;}
    |   '/*' ( options {greedy=false;} : . )* '*/' {$channel=HIDDEN;}
    ;

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;} 
    ;

fragment
EXPONENT : ('e'|'E') ('+'|'-')? ('0'..'9')+ ;

