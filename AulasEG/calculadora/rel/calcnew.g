grammar calc_better;

@header{
import java.util.HashMap;
import java.util.ArrayList;
}


@members{
enum Tipo {REAL, INT};

//*===========  Par ============= */
public class Par{
	private String tipo;
	private float value;
	
	public Par(){
		this.tipo = "";
		this.value = 0;
	}
	
	public Par(String tipo, float value){
		this.tipo = tipo;
		this.value = value;
	}
	
	public String getTipo(){return this.tipo;}	
	public float getValue(){return this.value;}
	
	public void setTipo(String tipo){this.tipo = tipo;}	
	public void setValue(float val){this.value = val;}
}

}



language returns [HashMap<String,Par> identificadores]
	 @init {HashMap <String,Par>declarations_in = new HashMap<String,Par>();}
	:	 ((declaration[declarations_in]{declarations_in=$declaration.declarations_out;} 
		  |attrib [declarations_in] {declarations_in=$declaration.declarations_out;} 
		  | io[declarations_in]) ';' )*
		  		{$identificadores = $declaration.declarations_out;}
	;
	
declaration [HashMap<String,Par> declarations_in] returns [HashMap<String,Par> declarations_out]
	:	(tipo=Type_Int | tipo=Type_Real)   ID {
						if (declarations_in.containsKey($ID.text)){
							System.out.println( "ERRO: A variavel " + $ID.text +" ja foi declarada antes.\n");
							
							}
						else	{
							Par p = new Par($tipo.text,0);
					 		 declarations_in.put($ID.text, p);
							}
							declarations_out = declarations_in;
						}
	;

attrib	[HashMap<String,Par> declarations_in] returns [HashMap<String,Par> declarations_out]
	:	ID '=' expression [declarations_in] 
			{
				if (!declarations_in.containsKey($ID.text)){
					 System.out.println("ERRO: A variavel "+ $ID.text + " ainda nao foi declarada!\n" );
				}
				else {
					Tipo tipo;
					if ($expression.valor == Math.round($expression.valor)) {
 					   tipo = Tipo.INT;
					} else {
					    tipo = Tipo.REAL;
					}
					if (declarations_in.get($ID.text).getTipo().equals("int") && tipo == Tipo.REAL ){
						System.out.println( "Warning: Possivel perda de precis‹o! (guardar real em variavel inteira)");
						Par p = declarations_in.get($ID.text);
						p.setValue(Math.round($expression.valor));
					}
					else{
						Par p = declarations_in.get($ID.text);
						p.setValue($expression.valor);
					}	
					System.out.println($ID.text + " == " + declarations_in.get($ID.text).getValue());
 			 		declarations_out = declarations_in;
				}
			}
	;
	 
io	[HashMap<String,Par> declarations_in]
	:	'?' ID {}
	|	'!' expression [declarations_in]
	;
	
expression [HashMap<String,Par> declarations_in] 
	returns [Tipo tipo, float valor]
	: 
	|	t1=term[declarations_in]{$valor = $t1.valor;} (operatorAdd t2=term[declarations_in]{
									if($operatorAdd.text.equals("+"))
										$valor = $valor + $t2.valor;
									else
						 				$valor = $valor - $t2.valor;
						 			})*  {}		
	;
	
term	[HashMap<String,Par> declarations_in]
	returns [float valor]
	:	f1=factor[declarations_in]{$valor = $f1.valor;} (operatorMul f2=factor[declarations_in]{
									if($operatorMul.text.equals("*"))																	
										$valor = $valor * $f2.valor;
									else
										$valor = $valor / $f2.valor;
										})* {}  
	;
	
factor	[HashMap<String,Par> declarations_in]
	returns [float valor]
	:	'(' expression[declarations_in] ')' {$valor = $expression.valor;}
	| 	value[declarations_in] {$valor = $value.valor;} 
	;
	
operatorAdd
	:	'+' | '-'
	;
	
operatorMul
	:	'*' | 'div'
	;
	
operator:	'+' | '-' | '*' | 'div'
	;
	

value  	[HashMap<String,Par> declarations_in]
	returns[float valor]
 	:	ID {$valor = declarations_in.get($ID.text).getValue();} 
 		| INT {$valor = Integer.parseInt($INT.text);}
 		| FLOAT {$valor = Float.parseFloat($FLOAT.text);}
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

