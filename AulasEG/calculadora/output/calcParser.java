// $ANTLR 3.3 Nov 30, 2010 12:45:30 /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g 2011-03-21 23:26:50

import java.util.HashMap;
import java.util.ArrayList;


import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

import org.antlr.runtime.debug.*;
import java.io.IOException;
public class calcParser extends DebugParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "Type_Int", "Type_Real", "ID", "INT", "FLOAT", "EXPONENT", "COMMENT", "WS", "';'", "'='", "'?'", "'!'", "'('", "')'", "'+'", "'-'", "'*'", "'div'"
    };
    public static final int EOF=-1;
    public static final int T__12=12;
    public static final int T__13=13;
    public static final int T__14=14;
    public static final int T__15=15;
    public static final int T__16=16;
    public static final int T__17=17;
    public static final int T__18=18;
    public static final int T__19=19;
    public static final int T__20=20;
    public static final int T__21=21;
    public static final int Type_Int=4;
    public static final int Type_Real=5;
    public static final int ID=6;
    public static final int INT=7;
    public static final int FLOAT=8;
    public static final int EXPONENT=9;
    public static final int COMMENT=10;
    public static final int WS=11;

    // delegates
    // delegators

    public static final String[] ruleNames = new String[] {
        "invalidRule", "factor", "value", "operator", "operatorAdd", "language", 
        "attrib", "term", "expression", "operatorMul", "io", "declaration"
    };
    public static final boolean[] decisionCanBacktrack = new boolean[] {
        false, // invalid decision
        false, false, false, false, false, false, false, false, false
    };

     
        public int ruleLevel = 0;
        public int getRuleLevel() { return ruleLevel; }
        public void incRuleLevel() { ruleLevel++; }
        public void decRuleLevel() { ruleLevel--; }
        public calcParser(TokenStream input) {
            this(input, DebugEventSocketProxy.DEFAULT_DEBUGGER_PORT, new RecognizerSharedState());
        }
        public calcParser(TokenStream input, int port, RecognizerSharedState state) {
            super(input, state);
            DebugEventSocketProxy proxy =
                new DebugEventSocketProxy(this, port, null);
            setDebugListener(proxy);
            try {
                proxy.handshake();
            }
            catch (IOException ioe) {
                reportError(ioe);
            }
        }
    public calcParser(TokenStream input, DebugEventListener dbg) {
        super(input, dbg, new RecognizerSharedState());

    }
    protected boolean evalPredicate(boolean result, String predicate) {
        dbg.semanticPredicate(result, predicate);
        return result;
    }


    public String[] getTokenNames() { return calcParser.tokenNames; }
    public String getGrammarFileName() { return "/Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g"; }


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






    // $ANTLR start "language"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:42:1: language returns [HashMap<String,Par> identificadores] : ( ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] ) ';' )* ;
    public final HashMap<String,Par> language() throws RecognitionException {
        HashMap<String,Par> identificadores = null;

        HashMap<String,Par> declaration1 = null;


        HashMap <String,Par>declarations_in = new HashMap<String,Par>();
        try { dbg.enterRule(getGrammarFileName(), "language");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(42, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:44:2: ( ( ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] ) ';' )* )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:44:5: ( ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] ) ';' )*
            {
            dbg.location(44,5);
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:44:5: ( ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] ) ';' )*
            try { dbg.enterSubRule(2);

            loop2:
            do {
                int alt2=2;
                try { dbg.enterDecision(2, decisionCanBacktrack[2]);

                int LA2_0 = input.LA(1);

                if ( ((LA2_0>=Type_Int && LA2_0<=ID)||(LA2_0>=14 && LA2_0<=15)) ) {
                    alt2=1;
                }


                } finally {dbg.exitDecision(2);}

                switch (alt2) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:44:6: ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] ) ';'
            	    {
            	    dbg.location(44,6);
            	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:44:6: ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] )
            	    int alt1=3;
            	    try { dbg.enterSubRule(1);
            	    try { dbg.enterDecision(1, decisionCanBacktrack[1]);

            	    switch ( input.LA(1) ) {
            	    case Type_Int:
            	    case Type_Real:
            	        {
            	        alt1=1;
            	        }
            	        break;
            	    case ID:
            	        {
            	        alt1=2;
            	        }
            	        break;
            	    case 14:
            	    case 15:
            	        {
            	        alt1=3;
            	        }
            	        break;
            	    default:
            	        NoViableAltException nvae =
            	            new NoViableAltException("", 1, 0, input);

            	        dbg.recognitionException(nvae);
            	        throw nvae;
            	    }

            	    } finally {dbg.exitDecision(1);}

            	    switch (alt1) {
            	        case 1 :
            	            dbg.enterAlt(1);

            	            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:44:7: declaration[declarations_in]
            	            {
            	            dbg.location(44,7);
            	            pushFollow(FOLLOW_declaration_in_language38);
            	            declaration1=declaration(declarations_in);

            	            state._fsp--;

            	            dbg.location(44,35);
            	            declarations_in=declaration1;

            	            }
            	            break;
            	        case 2 :
            	            dbg.enterAlt(2);

            	            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:45:6: attrib[declarations_in]
            	            {
            	            dbg.location(45,6);
            	            pushFollow(FOLLOW_attrib_in_language48);
            	            attrib(declarations_in);

            	            state._fsp--;


            	            }
            	            break;
            	        case 3 :
            	            dbg.enterAlt(3);

            	            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:46:7: io[declarations_in]
            	            {
            	            dbg.location(46,7);
            	            pushFollow(FOLLOW_io_in_language58);
            	            io(declarations_in);

            	            state._fsp--;


            	            }
            	            break;

            	    }
            	    } finally {dbg.exitSubRule(1);}

            	    dbg.location(46,28);
            	    match(input,12,FOLLOW_12_in_language62); 

            	    }
            	    break;

            	default :
            	    break loop2;
                }
            } while (true);
            } finally {dbg.exitSubRule(2);}

            dbg.location(47,7);
            identificadores = declaration1;

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(48, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "language");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return identificadores;
    }
    // $ANTLR end "language"


    // $ANTLR start "declaration"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:50:1: declaration[HashMap<String,Par> declarations_in] returns [HashMap<String,Par> declarations_out] : (tipo= Type_Int | tipo= Type_Real ) ID ;
    public final HashMap<String,Par> declaration(HashMap<String,Par> declarations_in) throws RecognitionException {
        HashMap<String,Par> declarations_out = null;

        Token tipo=null;
        Token ID2=null;

        try { dbg.enterRule(getGrammarFileName(), "declaration");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(50, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:51:2: ( (tipo= Type_Int | tipo= Type_Real ) ID )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:51:4: (tipo= Type_Int | tipo= Type_Real ) ID
            {
            dbg.location(51,4);
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:51:4: (tipo= Type_Int | tipo= Type_Real )
            int alt3=2;
            try { dbg.enterSubRule(3);
            try { dbg.enterDecision(3, decisionCanBacktrack[3]);

            int LA3_0 = input.LA(1);

            if ( (LA3_0==Type_Int) ) {
                alt3=1;
            }
            else if ( (LA3_0==Type_Real) ) {
                alt3=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 3, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(3);}

            switch (alt3) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:51:5: tipo= Type_Int
                    {
                    dbg.location(51,9);
                    tipo=(Token)match(input,Type_Int,FOLLOW_Type_Int_in_declaration94); 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:51:21: tipo= Type_Real
                    {
                    dbg.location(51,25);
                    tipo=(Token)match(input,Type_Real,FOLLOW_Type_Real_in_declaration100); 

                    }
                    break;

            }
            } finally {dbg.exitSubRule(3);}

            dbg.location(51,39);
            ID2=(Token)match(input,ID,FOLLOW_ID_in_declaration105); 
            dbg.location(51,42);

            						if (declarations_in.containsKey((ID2!=null?ID2.getText():null))){
            							System.out.println( "A variavel " + (ID2!=null?ID2.getText():null) +" ja foi declarada antes.\n");
            							declarations_out = declarations_in;
            							}
            						else	{
            							Par p = new Par((tipo!=null?tipo.getText():null),0);
            					 		 declarations_in.put((ID2!=null?ID2.getText():null), p);
            					 		 declarations_out = declarations_in;
            							} 
            						

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(62, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "declaration");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return declarations_out;
    }
    // $ANTLR end "declaration"


    // $ANTLR start "attrib"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:64:1: attrib[HashMap<String,Par> declarations_in] : ID '=' expression[declarations_in] ;
    public final void attrib(HashMap<String,Par> declarations_in) throws RecognitionException {
        Token ID3=null;
        calcParser.expression_return expression4 = null;


        try { dbg.enterRule(getGrammarFileName(), "attrib");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(64, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:65:2: ( ID '=' expression[declarations_in] )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:65:4: ID '=' expression[declarations_in]
            {
            dbg.location(65,4);
            ID3=(Token)match(input,ID,FOLLOW_ID_in_attrib120); 
            dbg.location(65,7);
            match(input,13,FOLLOW_13_in_attrib122); 
            dbg.location(65,11);
            pushFollow(FOLLOW_expression_in_attrib124);
            expression4=expression(declarations_in);

            state._fsp--;

            dbg.location(66,4);

            				if (!declarations_in.containsKey((ID3!=null?ID3.getText():null))){
            					 System.out.println("A variavel "+ (ID3!=null?ID3.getText():null) + " ainda nao foi declarada!\n" );
            					 }
            				else {
            					if (declarations_in.get((ID3!=null?ID3.getText():null)).getTipo().equals("int") && (expression4!=null?expression4.tipo:null) == Tipo.REAL ){
            						System.out.println( "Possivel perda de precis‹o! (guardar real em variavel inteira)");
            						Par p = declarations_in.get((ID3!=null?ID3.getText():null));
            						p.setValue(Math.round((expression4!=null?expression4.valor:0.0f)));
            					}
            					else
            					{
            						Par p = declarations_in.get((ID3!=null?ID3.getText():null));
            						p.setValue((expression4!=null?expression4.valor:0.0f));
            					}
            					System.out.println((ID3!=null?ID3.getText():null) + " == " + declarations_in.get((ID3!=null?ID3.getText():null)).getValue() );
            				}
            			

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(84, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "attrib");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "attrib"


    // $ANTLR start "io"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:86:1: io[HashMap<String,Par> declarations_in] : ( '?' ID | '!' expression[declarations_in] );
    public final void io(HashMap<String,Par> declarations_in) throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "io");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(86, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:87:2: ( '?' ID | '!' expression[declarations_in] )
            int alt4=2;
            try { dbg.enterDecision(4, decisionCanBacktrack[4]);

            int LA4_0 = input.LA(1);

            if ( (LA4_0==14) ) {
                alt4=1;
            }
            else if ( (LA4_0==15) ) {
                alt4=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 4, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(4);}

            switch (alt4) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:87:4: '?' ID
                    {
                    dbg.location(87,4);
                    match(input,14,FOLLOW_14_in_io147); 
                    dbg.location(87,8);
                    match(input,ID,FOLLOW_ID_in_io149); 
                    dbg.location(87,11);


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:88:4: '!' expression[declarations_in]
                    {
                    dbg.location(88,4);
                    match(input,15,FOLLOW_15_in_io156); 
                    dbg.location(88,8);
                    pushFollow(FOLLOW_expression_in_io158);
                    expression(declarations_in);

                    state._fsp--;


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(89, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "io");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "io"

    public static class expression_return extends ParserRuleReturnScope {
        public Tipo tipo;
        public float valor;
    };

    // $ANTLR start "expression"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:91:1: expression[HashMap<String,Par> declarations_in] returns [Tipo tipo, float valor] : ( | t1= term[declarations_in] ( operatorAdd t2= term[declarations_in] )* );
    public final calcParser.expression_return expression(HashMap<String,Par> declarations_in) throws RecognitionException {
        calcParser.expression_return retval = new calcParser.expression_return();
        retval.start = input.LT(1);

        calcParser.term_return t1 = null;

        calcParser.term_return t2 = null;

        calcParser.operatorAdd_return operatorAdd5 = null;


        Tipo val = Tipo.INT; /*float valor; Tipo tipo;*/
        try { dbg.enterRule(getGrammarFileName(), "expression");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(91, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:94:2: ( | t1= term[declarations_in] ( operatorAdd t2= term[declarations_in] )* )
            int alt6=2;
            try { dbg.enterDecision(6, decisionCanBacktrack[6]);

            int LA6_0 = input.LA(1);

            if ( (LA6_0==12||LA6_0==17) ) {
                alt6=1;
            }
            else if ( ((LA6_0>=ID && LA6_0<=FLOAT)||LA6_0==16) ) {
                alt6=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 6, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(6);}

            switch (alt6) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:95:2: 
                    {
                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:95:4: t1= term[declarations_in] ( operatorAdd t2= term[declarations_in] )*
                    {
                    dbg.location(95,6);
                    pushFollow(FOLLOW_term_in_expression203);
                    t1=term(declarations_in);

                    state._fsp--;

                    dbg.location(95,28);
                    retval.valor = (t1!=null?t1.valor:0.0f);
                    dbg.location(95,50);
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:95:50: ( operatorAdd t2= term[declarations_in] )*
                    try { dbg.enterSubRule(5);

                    loop5:
                    do {
                        int alt5=2;
                        try { dbg.enterDecision(5, decisionCanBacktrack[5]);

                        int LA5_0 = input.LA(1);

                        if ( ((LA5_0>=18 && LA5_0<=19)) ) {
                            alt5=1;
                        }


                        } finally {dbg.exitDecision(5);}

                        switch (alt5) {
                    	case 1 :
                    	    dbg.enterAlt(1);

                    	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:95:51: operatorAdd t2= term[declarations_in]
                    	    {
                    	    dbg.location(95,51);
                    	    pushFollow(FOLLOW_operatorAdd_in_expression208);
                    	    operatorAdd5=operatorAdd();

                    	    state._fsp--;

                    	    dbg.location(95,65);
                    	    pushFollow(FOLLOW_term_in_expression212);
                    	    t2=term(declarations_in);

                    	    state._fsp--;

                    	    dbg.location(95,87);

                    	    									if((t2!=null?t2.tipo:null) == Tipo.REAL)
                    	    										val = Tipo.REAL;
                    	    									if((operatorAdd5!=null?input.toString(operatorAdd5.start,operatorAdd5.stop):null).equals("+"))
                    	    										retval.valor = retval.valor + (t2!=null?t2.valor:0.0f);
                    	    									else
                    	    						 				retval.valor = retval.valor - (t2!=null?t2.valor:0.0f);
                    	    						 			

                    	    }
                    	    break;

                    	default :
                    	    break loop5;
                        }
                    } while (true);
                    } finally {dbg.exitSubRule(5);}

                    dbg.location(103,10);
                     
                    									if((t1!=null?t1.tipo:null) == Tipo.REAL || val == Tipo.REAL)
                    							 		retval.tipo = Tipo.REAL;
                    							 	else 
                    							 		retval.tipo = Tipo.INT;
                    							 	

                    }
                    break;

            }
            retval.stop = input.LT(-1);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(109, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "expression");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "expression"

    public static class term_return extends ParserRuleReturnScope {
        public Tipo tipo;
        public float valor;
    };

    // $ANTLR start "term"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:111:1: term[HashMap<String,Par> declarations_in] returns [Tipo tipo, float valor] : f1= factor[declarations_in] ( operatorMul f2= factor[declarations_in] )* ;
    public final calcParser.term_return term(HashMap<String,Par> declarations_in) throws RecognitionException {
        calcParser.term_return retval = new calcParser.term_return();
        retval.start = input.LT(1);

        calcParser.factor_return f1 = null;

        calcParser.factor_return f2 = null;

        calcParser.operatorMul_return operatorMul6 = null;


        Tipo val = Tipo.INT; /*float valor; Tipo tipo;*/
        try { dbg.enterRule(getGrammarFileName(), "term");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(111, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:114:2: (f1= factor[declarations_in] ( operatorMul f2= factor[declarations_in] )* )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:114:4: f1= factor[declarations_in] ( operatorMul f2= factor[declarations_in] )*
            {
            dbg.location(114,6);
            pushFollow(FOLLOW_factor_in_term256);
            f1=factor(declarations_in);

            state._fsp--;

            dbg.location(114,30);
            retval.valor = (f1!=null?f1.valor:0.0f);
            dbg.location(114,52);
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:114:52: ( operatorMul f2= factor[declarations_in] )*
            try { dbg.enterSubRule(7);

            loop7:
            do {
                int alt7=2;
                try { dbg.enterDecision(7, decisionCanBacktrack[7]);

                int LA7_0 = input.LA(1);

                if ( ((LA7_0>=20 && LA7_0<=21)) ) {
                    alt7=1;
                }


                } finally {dbg.exitDecision(7);}

                switch (alt7) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:114:53: operatorMul f2= factor[declarations_in]
            	    {
            	    dbg.location(114,53);
            	    pushFollow(FOLLOW_operatorMul_in_term261);
            	    operatorMul6=operatorMul();

            	    state._fsp--;

            	    dbg.location(114,67);
            	    pushFollow(FOLLOW_factor_in_term265);
            	    f2=factor(declarations_in);

            	    state._fsp--;

            	    dbg.location(114,91);

            	    									if((f2!=null?f2.tipo:null) == Tipo.REAL)
            	    										val = Tipo.REAL;
            	    									if((operatorMul6!=null?input.toString(operatorMul6.start,operatorMul6.stop):null).equals("*"))																	
            	    										retval.valor = retval.valor * (f2!=null?f2.valor:0.0f);
            	    									else
            	    										retval.valor = retval.valor / (f2!=null?f2.valor:0.0f);
            	    										

            	    }
            	    break;

            	default :
            	    break loop7;
                }
            } while (true);
            } finally {dbg.exitSubRule(7);}

            dbg.location(122,8);
            if((f1!=null?f1.tipo:null) == Tipo.REAL || val == Tipo.REAL) 
            							 	retval.tipo = Tipo.REAL;
            							 else 
            							 	retval.tipo = Tipo.INT;
            							 

            }

            retval.stop = input.LT(-1);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(127, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "term");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "term"

    public static class factor_return extends ParserRuleReturnScope {
        public Tipo tipo;
        public float valor;
    };

    // $ANTLR start "factor"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:129:1: factor[HashMap<String,Par> declarations_in] returns [Tipo tipo,float valor] : ( '(' expression[declarations_in] ')' | v= value[declarations_in] );
    public final calcParser.factor_return factor(HashMap<String,Par> declarations_in) throws RecognitionException {
        calcParser.factor_return retval = new calcParser.factor_return();
        retval.start = input.LT(1);

        calcParser.value_return v = null;

        calcParser.expression_return expression7 = null;


        try { dbg.enterRule(getGrammarFileName(), "factor");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(129, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:132:2: ( '(' expression[declarations_in] ')' | v= value[declarations_in] )
            int alt8=2;
            try { dbg.enterDecision(8, decisionCanBacktrack[8]);

            int LA8_0 = input.LA(1);

            if ( (LA8_0==16) ) {
                alt8=1;
            }
            else if ( ((LA8_0>=ID && LA8_0<=FLOAT)) ) {
                alt8=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 8, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(8);}

            switch (alt8) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:132:4: '(' expression[declarations_in] ')'
                    {
                    dbg.location(132,4);
                    match(input,16,FOLLOW_16_in_factor301); 
                    dbg.location(132,8);
                    pushFollow(FOLLOW_expression_in_factor303);
                    expression7=expression(declarations_in);

                    state._fsp--;

                    dbg.location(132,36);
                    match(input,17,FOLLOW_17_in_factor306); 
                    dbg.location(132,40);
                    retval.tipo = (expression7!=null?expression7.tipo:null); retval.valor = (expression7!=null?expression7.valor:0.0f);

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:133:5: v= value[declarations_in]
                    {
                    dbg.location(133,6);
                    pushFollow(FOLLOW_value_in_factor316);
                    v=value(declarations_in);

                    state._fsp--;

                    dbg.location(133,30);
                    retval.tipo = (v!=null?v.tipo:null); retval.valor = (v!=null?v.valor:0.0f);

                    }
                    break;

            }
            retval.stop = input.LT(-1);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(134, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "factor");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "factor"

    public static class operatorAdd_return extends ParserRuleReturnScope {
    };

    // $ANTLR start "operatorAdd"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:136:1: operatorAdd : ( '+' | '-' );
    public final calcParser.operatorAdd_return operatorAdd() throws RecognitionException {
        calcParser.operatorAdd_return retval = new calcParser.operatorAdd_return();
        retval.start = input.LT(1);

        try { dbg.enterRule(getGrammarFileName(), "operatorAdd");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(136, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:137:2: ( '+' | '-' )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:
            {
            dbg.location(137,2);
            if ( (input.LA(1)>=18 && input.LA(1)<=19) ) {
                input.consume();
                state.errorRecovery=false;
            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                dbg.recognitionException(mse);
                throw mse;
            }


            }

            retval.stop = input.LT(-1);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(138, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "operatorAdd");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "operatorAdd"

    public static class operatorMul_return extends ParserRuleReturnScope {
    };

    // $ANTLR start "operatorMul"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:140:1: operatorMul : ( '*' | 'div' );
    public final calcParser.operatorMul_return operatorMul() throws RecognitionException {
        calcParser.operatorMul_return retval = new calcParser.operatorMul_return();
        retval.start = input.LT(1);

        try { dbg.enterRule(getGrammarFileName(), "operatorMul");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(140, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:141:2: ( '*' | 'div' )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:
            {
            dbg.location(141,2);
            if ( (input.LA(1)>=20 && input.LA(1)<=21) ) {
                input.consume();
                state.errorRecovery=false;
            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                dbg.recognitionException(mse);
                throw mse;
            }


            }

            retval.stop = input.LT(-1);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(142, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "operatorMul");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "operatorMul"


    // $ANTLR start "operator"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:144:1: operator : ( '+' | '-' | '*' | 'div' );
    public final void operator() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "operator");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(144, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:144:9: ( '+' | '-' | '*' | 'div' )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:
            {
            dbg.location(144,9);
            if ( (input.LA(1)>=18 && input.LA(1)<=21) ) {
                input.consume();
                state.errorRecovery=false;
            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                dbg.recognitionException(mse);
                throw mse;
            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(145, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "operator");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "operator"

    public static class value_return extends ParserRuleReturnScope {
        public Tipo tipo;
        public float valor;
    };

    // $ANTLR start "value"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:148:1: value[HashMap<String,Par> declarations_in] returns [Tipo tipo, float valor] : ( ID | INT | FLOAT );
    public final calcParser.value_return value(HashMap<String,Par> declarations_in) throws RecognitionException {
        calcParser.value_return retval = new calcParser.value_return();
        retval.start = input.LT(1);

        Token ID8=null;
        Token INT9=null;
        Token FLOAT10=null;

        try { dbg.enterRule(getGrammarFileName(), "value");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(148, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:151:3: ( ID | INT | FLOAT )
            int alt9=3;
            try { dbg.enterDecision(9, decisionCanBacktrack[9]);

            switch ( input.LA(1) ) {
            case ID:
                {
                alt9=1;
                }
                break;
            case INT:
                {
                alt9=2;
                }
                break;
            case FLOAT:
                {
                alt9=3;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 9, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }

            } finally {dbg.exitDecision(9);}

            switch (alt9) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:151:5: ID
                    {
                    dbg.location(151,5);
                    ID8=(Token)match(input,ID,FOLLOW_ID_in_value398); 
                    dbg.location(151,8);
                    String type = declarations_in.get((ID8!=null?ID8.getText():null)).getTipo();
                     		if (type.equals("int"))retval.tipo = Tipo.INT; else retval.tipo = Tipo.REAL; 
                     		retval.valor = declarations_in.get((ID8!=null?ID8.getText():null)).getValue();
                     		

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:155:6: INT
                    {
                    dbg.location(155,6);
                    INT9=(Token)match(input,INT,FOLLOW_INT_in_value408); 
                    dbg.location(155,10);
                    retval.tipo = Tipo.INT; retval.valor = Integer.parseInt((INT9!=null?INT9.getText():null));

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc.g:156:6: FLOAT
                    {
                    dbg.location(156,6);
                    FLOAT10=(Token)match(input,FLOAT,FOLLOW_FLOAT_in_value417); 
                    dbg.location(156,12);
                    retval.tipo = Tipo.REAL; retval.valor = Float.parseFloat((FLOAT10!=null?FLOAT10.getText():null));

                    }
                    break;

            }
            retval.stop = input.LT(-1);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(157, 3);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "value");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "value"

    // Delegated rules


 

    public static final BitSet FOLLOW_declaration_in_language38 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_attrib_in_language48 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_io_in_language58 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_language62 = new BitSet(new long[]{0x000000000000C072L});
    public static final BitSet FOLLOW_Type_Int_in_declaration94 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_Type_Real_in_declaration100 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_ID_in_declaration105 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_attrib120 = new BitSet(new long[]{0x0000000000002000L});
    public static final BitSet FOLLOW_13_in_attrib122 = new BitSet(new long[]{0x00000000000101C0L});
    public static final BitSet FOLLOW_expression_in_attrib124 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_14_in_io147 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_ID_in_io149 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_15_in_io156 = new BitSet(new long[]{0x00000000000101C0L});
    public static final BitSet FOLLOW_expression_in_io158 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_term_in_expression203 = new BitSet(new long[]{0x00000000000C0002L});
    public static final BitSet FOLLOW_operatorAdd_in_expression208 = new BitSet(new long[]{0x00000000000D01C0L});
    public static final BitSet FOLLOW_term_in_expression212 = new BitSet(new long[]{0x00000000000C0002L});
    public static final BitSet FOLLOW_factor_in_term256 = new BitSet(new long[]{0x0000000000300002L});
    public static final BitSet FOLLOW_operatorMul_in_term261 = new BitSet(new long[]{0x00000000003101C0L});
    public static final BitSet FOLLOW_factor_in_term265 = new BitSet(new long[]{0x0000000000300002L});
    public static final BitSet FOLLOW_16_in_factor301 = new BitSet(new long[]{0x00000000000301C0L});
    public static final BitSet FOLLOW_expression_in_factor303 = new BitSet(new long[]{0x0000000000020000L});
    public static final BitSet FOLLOW_17_in_factor306 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_value_in_factor316 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_operatorAdd0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_operatorMul0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_operator0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_value398 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INT_in_value408 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_FLOAT_in_value417 = new BitSet(new long[]{0x0000000000000002L});

}