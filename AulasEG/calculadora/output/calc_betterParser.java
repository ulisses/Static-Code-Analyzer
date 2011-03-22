// $ANTLR 3.3 Nov 30, 2010 12:45:30 /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g 2011-03-21 23:43:45

import java.util.HashMap;
import java.util.ArrayList;


import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

import org.antlr.runtime.debug.*;
import java.io.IOException;
public class calc_betterParser extends DebugParser {
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
        "invalidRule", "operator", "io", "value", "language", "factor", 
        "term", "operatorMul", "expression", "declaration", "operatorAdd", 
        "attrib"
    };
    public static final boolean[] decisionCanBacktrack = new boolean[] {
        false, // invalid decision
        false, false, false, false, false, false, false, false, false
    };

     
        public int ruleLevel = 0;
        public int getRuleLevel() { return ruleLevel; }
        public void incRuleLevel() { ruleLevel++; }
        public void decRuleLevel() { ruleLevel--; }
        public calc_betterParser(TokenStream input) {
            this(input, DebugEventSocketProxy.DEFAULT_DEBUGGER_PORT, new RecognizerSharedState());
        }
        public calc_betterParser(TokenStream input, int port, RecognizerSharedState state) {
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
    public calc_betterParser(TokenStream input, DebugEventListener dbg) {
        super(input, dbg, new RecognizerSharedState());

    }
    protected boolean evalPredicate(boolean result, String predicate) {
        dbg.semanticPredicate(result, predicate);
        return result;
    }


    public String[] getTokenNames() { return calc_betterParser.tokenNames; }
    public String getGrammarFileName() { return "/Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g"; }


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
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:38:1: language returns [HashMap<String,Par> identificadores] : ( ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] ) ';' )* ;
    public final HashMap<String,Par> language() throws RecognitionException {
        HashMap<String,Par> identificadores = null;

        HashMap<String,Par> declaration1 = null;


        HashMap <String,Par>declarations_in = new HashMap<String,Par>();
        try { dbg.enterRule(getGrammarFileName(), "language");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(38, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:40:2: ( ( ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] ) ';' )* )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:40:5: ( ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] ) ';' )*
            {
            dbg.location(40,5);
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:40:5: ( ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] ) ';' )*
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

            	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:40:6: ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] ) ';'
            	    {
            	    dbg.location(40,6);
            	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:40:6: ( declaration[declarations_in] | attrib[declarations_in] | io[declarations_in] )
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

            	            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:40:7: declaration[declarations_in]
            	            {
            	            dbg.location(40,7);
            	            pushFollow(FOLLOW_declaration_in_language38);
            	            declaration1=declaration(declarations_in);

            	            state._fsp--;

            	            dbg.location(40,35);
            	            declarations_in=declaration1;

            	            }
            	            break;
            	        case 2 :
            	            dbg.enterAlt(2);

            	            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:41:6: attrib[declarations_in]
            	            {
            	            dbg.location(41,6);
            	            pushFollow(FOLLOW_attrib_in_language48);
            	            attrib(declarations_in);

            	            state._fsp--;

            	            dbg.location(41,31);
            	            declarations_in=declaration1;

            	            }
            	            break;
            	        case 3 :
            	            dbg.enterAlt(3);

            	            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:42:7: io[declarations_in]
            	            {
            	            dbg.location(42,7);
            	            pushFollow(FOLLOW_io_in_language61);
            	            io(declarations_in);

            	            state._fsp--;


            	            }
            	            break;

            	    }
            	    } finally {dbg.exitSubRule(1);}

            	    dbg.location(42,28);
            	    match(input,12,FOLLOW_12_in_language65); 

            	    }
            	    break;

            	default :
            	    break loop2;
                }
            } while (true);
            } finally {dbg.exitSubRule(2);}

            dbg.location(43,7);
            identificadores = declaration1;

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(44, 2);

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
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:46:1: declaration[HashMap<String,Par> declarations_in] returns [HashMap<String,Par> declarations_out] : (tipo= Type_Int | tipo= Type_Real ) ID ;
    public final HashMap<String,Par> declaration(HashMap<String,Par> declarations_in) throws RecognitionException {
        HashMap<String,Par> declarations_out = null;

        Token tipo=null;
        Token ID2=null;

        try { dbg.enterRule(getGrammarFileName(), "declaration");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(46, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:47:2: ( (tipo= Type_Int | tipo= Type_Real ) ID )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:47:4: (tipo= Type_Int | tipo= Type_Real ) ID
            {
            dbg.location(47,4);
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:47:4: (tipo= Type_Int | tipo= Type_Real )
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

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:47:5: tipo= Type_Int
                    {
                    dbg.location(47,9);
                    tipo=(Token)match(input,Type_Int,FOLLOW_Type_Int_in_declaration97); 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:47:21: tipo= Type_Real
                    {
                    dbg.location(47,25);
                    tipo=(Token)match(input,Type_Real,FOLLOW_Type_Real_in_declaration103); 

                    }
                    break;

            }
            } finally {dbg.exitSubRule(3);}

            dbg.location(47,39);
            ID2=(Token)match(input,ID,FOLLOW_ID_in_declaration108); 
            dbg.location(47,42);

            						if (declarations_in.containsKey((ID2!=null?ID2.getText():null))){
            							System.out.println( "ERRO: A variavel " + (ID2!=null?ID2.getText():null) +" ja foi declarada antes.\n");
            							
            							}
            						else	{
            							Par p = new Par((tipo!=null?tipo.getText():null),0);
            					 		 declarations_in.put((ID2!=null?ID2.getText():null), p);
            							}
            							declarations_out = declarations_in;
            						

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(58, 2);

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
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:60:1: attrib[HashMap<String,Par> declarations_in] returns [HashMap<String,Par> declarations_out] : ID '=' expression[declarations_in] ;
    public final HashMap<String,Par> attrib(HashMap<String,Par> declarations_in) throws RecognitionException {
        HashMap<String,Par> declarations_out = null;

        Token ID3=null;
        calc_betterParser.expression_return expression4 = null;


        try { dbg.enterRule(getGrammarFileName(), "attrib");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(60, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:61:2: ( ID '=' expression[declarations_in] )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:61:4: ID '=' expression[declarations_in]
            {
            dbg.location(61,4);
            ID3=(Token)match(input,ID,FOLLOW_ID_in_attrib127); 
            dbg.location(61,7);
            match(input,13,FOLLOW_13_in_attrib129); 
            dbg.location(61,11);
            pushFollow(FOLLOW_expression_in_attrib131);
            expression4=expression(declarations_in);

            state._fsp--;

            dbg.location(62,4);

            				if (!declarations_in.containsKey((ID3!=null?ID3.getText():null))){
            					 System.out.println("ERRO: A variavel "+ (ID3!=null?ID3.getText():null) + " ainda nao foi declarada!\n" );
            				}
            				else {
            					Tipo tipo;
            					if ((expression4!=null?expression4.valor:0.0f) == Math.round((expression4!=null?expression4.valor:0.0f))) {
             					   tipo = Tipo.INT;
            					} else {
            					    tipo = Tipo.REAL;
            					}
            					if (declarations_in.get((ID3!=null?ID3.getText():null)).getTipo().equals("int") && tipo == Tipo.REAL ){
            						System.out.println( "Warning: Possivel perda de precis‹o! (guardar real em variavel inteira)");
            						Par p = declarations_in.get((ID3!=null?ID3.getText():null));
            						p.setValue(Math.round((expression4!=null?expression4.valor:0.0f)));
            					}
            					else{
            						Par p = declarations_in.get((ID3!=null?ID3.getText():null));
            						p.setValue((expression4!=null?expression4.valor:0.0f));
            					}	
            					System.out.println((ID3!=null?ID3.getText():null) + " == " + declarations_in.get((ID3!=null?ID3.getText():null)).getValue());
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
        dbg.location(86, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "attrib");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return declarations_out;
    }
    // $ANTLR end "attrib"


    // $ANTLR start "io"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:88:1: io[HashMap<String,Par> declarations_in] : ( '?' ID | '!' expression[declarations_in] );
    public final void io(HashMap<String,Par> declarations_in) throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "io");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(88, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:89:2: ( '?' ID | '!' expression[declarations_in] )
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

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:89:4: '?' ID
                    {
                    dbg.location(89,4);
                    match(input,14,FOLLOW_14_in_io154); 
                    dbg.location(89,8);
                    match(input,ID,FOLLOW_ID_in_io156); 
                    dbg.location(89,11);


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:90:4: '!' expression[declarations_in]
                    {
                    dbg.location(90,4);
                    match(input,15,FOLLOW_15_in_io163); 
                    dbg.location(90,8);
                    pushFollow(FOLLOW_expression_in_io165);
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
        dbg.location(91, 2);

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
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:93:1: expression[HashMap<String,Par> declarations_in] returns [Tipo tipo, float valor] : ( | t1= term[declarations_in] ( operatorAdd t2= term[declarations_in] )* );
    public final calc_betterParser.expression_return expression(HashMap<String,Par> declarations_in) throws RecognitionException {
        calc_betterParser.expression_return retval = new calc_betterParser.expression_return();
        retval.start = input.LT(1);

        float t1 = 0.0f;

        float t2 = 0.0f;

        calc_betterParser.operatorAdd_return operatorAdd5 = null;


        try { dbg.enterRule(getGrammarFileName(), "expression");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(93, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:95:2: ( | t1= term[declarations_in] ( operatorAdd t2= term[declarations_in] )* )
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

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:96:2: 
                    {
                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:96:4: t1= term[declarations_in] ( operatorAdd t2= term[declarations_in] )*
                    {
                    dbg.location(96,6);
                    pushFollow(FOLLOW_term_in_expression193);
                    t1=term(declarations_in);

                    state._fsp--;

                    dbg.location(96,28);
                    retval.valor = t1;
                    dbg.location(96,50);
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:96:50: ( operatorAdd t2= term[declarations_in] )*
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

                    	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:96:51: operatorAdd t2= term[declarations_in]
                    	    {
                    	    dbg.location(96,51);
                    	    pushFollow(FOLLOW_operatorAdd_in_expression198);
                    	    operatorAdd5=operatorAdd();

                    	    state._fsp--;

                    	    dbg.location(96,65);
                    	    pushFollow(FOLLOW_term_in_expression202);
                    	    t2=term(declarations_in);

                    	    state._fsp--;

                    	    dbg.location(96,87);

                    	    									if((operatorAdd5!=null?input.toString(operatorAdd5.start,operatorAdd5.stop):null).equals("+"))
                    	    										retval.valor = retval.valor + t2;
                    	    									else
                    	    						 				retval.valor = retval.valor - t2;
                    	    						 			

                    	    }
                    	    break;

                    	default :
                    	    break loop5;
                        }
                    } while (true);
                    } finally {dbg.exitSubRule(5);}

                    dbg.location(101,16);


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
        dbg.location(102, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "expression");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "expression"


    // $ANTLR start "term"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:104:1: term[HashMap<String,Par> declarations_in] returns [float valor] : f1= factor[declarations_in] ( operatorMul f2= factor[declarations_in] )* ;
    public final float term(HashMap<String,Par> declarations_in) throws RecognitionException {
        float valor = 0.0f;

        float f1 = 0.0f;

        float f2 = 0.0f;

        calc_betterParser.operatorMul_return operatorMul6 = null;


        try { dbg.enterRule(getGrammarFileName(), "term");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(104, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:106:2: (f1= factor[declarations_in] ( operatorMul f2= factor[declarations_in] )* )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:106:4: f1= factor[declarations_in] ( operatorMul f2= factor[declarations_in] )*
            {
            dbg.location(106,6);
            pushFollow(FOLLOW_factor_in_term232);
            f1=factor(declarations_in);

            state._fsp--;

            dbg.location(106,30);
            valor = f1;
            dbg.location(106,52);
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:106:52: ( operatorMul f2= factor[declarations_in] )*
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

            	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:106:53: operatorMul f2= factor[declarations_in]
            	    {
            	    dbg.location(106,53);
            	    pushFollow(FOLLOW_operatorMul_in_term237);
            	    operatorMul6=operatorMul();

            	    state._fsp--;

            	    dbg.location(106,67);
            	    pushFollow(FOLLOW_factor_in_term241);
            	    f2=factor(declarations_in);

            	    state._fsp--;

            	    dbg.location(106,91);

            	    									if((operatorMul6!=null?input.toString(operatorMul6.start,operatorMul6.stop):null).equals("*"))																	
            	    										valor = valor * f2;
            	    									else
            	    										valor = valor / f2;
            	    										

            	    }
            	    break;

            	default :
            	    break loop7;
                }
            } while (true);
            } finally {dbg.exitSubRule(7);}

            dbg.location(111,15);


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(112, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "term");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return valor;
    }
    // $ANTLR end "term"


    // $ANTLR start "factor"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:114:1: factor[HashMap<String,Par> declarations_in] returns [float valor] : ( '(' expression[declarations_in] ')' | value[declarations_in] );
    public final float factor(HashMap<String,Par> declarations_in) throws RecognitionException {
        float valor = 0.0f;

        calc_betterParser.expression_return expression7 = null;

        float value8 = 0.0f;


        try { dbg.enterRule(getGrammarFileName(), "factor");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(114, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:116:2: ( '(' expression[declarations_in] ')' | value[declarations_in] )
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

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:116:4: '(' expression[declarations_in] ')'
                    {
                    dbg.location(116,4);
                    match(input,16,FOLLOW_16_in_factor268); 
                    dbg.location(116,8);
                    pushFollow(FOLLOW_expression_in_factor270);
                    expression7=expression(declarations_in);

                    state._fsp--;

                    dbg.location(116,36);
                    match(input,17,FOLLOW_17_in_factor273); 
                    dbg.location(116,40);
                    valor = (expression7!=null?expression7.valor:0.0f);

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:117:5: value[declarations_in]
                    {
                    dbg.location(117,5);
                    pushFollow(FOLLOW_value_in_factor281);
                    value8=value(declarations_in);

                    state._fsp--;

                    dbg.location(117,28);
                    valor = value8;

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
        dbg.location(118, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "factor");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return valor;
    }
    // $ANTLR end "factor"

    public static class operatorAdd_return extends ParserRuleReturnScope {
    };

    // $ANTLR start "operatorAdd"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:120:1: operatorAdd : ( '+' | '-' );
    public final calc_betterParser.operatorAdd_return operatorAdd() throws RecognitionException {
        calc_betterParser.operatorAdd_return retval = new calc_betterParser.operatorAdd_return();
        retval.start = input.LT(1);

        try { dbg.enterRule(getGrammarFileName(), "operatorAdd");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(120, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:121:2: ( '+' | '-' )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:
            {
            dbg.location(121,2);
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
        dbg.location(122, 2);

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
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:124:1: operatorMul : ( '*' | 'div' );
    public final calc_betterParser.operatorMul_return operatorMul() throws RecognitionException {
        calc_betterParser.operatorMul_return retval = new calc_betterParser.operatorMul_return();
        retval.start = input.LT(1);

        try { dbg.enterRule(getGrammarFileName(), "operatorMul");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(124, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:125:2: ( '*' | 'div' )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:
            {
            dbg.location(125,2);
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
        dbg.location(126, 2);

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
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:128:1: operator : ( '+' | '-' | '*' | 'div' );
    public final void operator() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "operator");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(128, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:128:9: ( '+' | '-' | '*' | 'div' )
            dbg.enterAlt(1);

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:
            {
            dbg.location(128,9);
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
        dbg.location(129, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "operator");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "operator"


    // $ANTLR start "value"
    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:132:1: value[HashMap<String,Par> declarations_in] returns [float valor] : ( ID | INT | FLOAT );
    public final float value(HashMap<String,Par> declarations_in) throws RecognitionException {
        float valor = 0.0f;

        Token ID9=null;
        Token INT10=null;
        Token FLOAT11=null;

        try { dbg.enterRule(getGrammarFileName(), "value");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(132, 1);

        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:134:3: ( ID | INT | FLOAT )
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

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:134:5: ID
                    {
                    dbg.location(134,5);
                    ID9=(Token)match(input,ID,FOLLOW_ID_in_value361); 
                    dbg.location(134,8);
                    valor = declarations_in.get((ID9!=null?ID9.getText():null)).getValue();

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:135:6: INT
                    {
                    dbg.location(135,6);
                    INT10=(Token)match(input,INT,FOLLOW_INT_in_value371); 
                    dbg.location(135,10);
                    valor = Integer.parseInt((INT10!=null?INT10.getText():null));

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:136:6: FLOAT
                    {
                    dbg.location(136,6);
                    FLOAT11=(Token)match(input,FLOAT,FOLLOW_FLOAT_in_value380); 
                    dbg.location(136,12);
                    valor = Float.parseFloat((FLOAT11!=null?FLOAT11.getText():null));

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
        dbg.location(137, 3);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "value");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return valor;
    }
    // $ANTLR end "value"

    // Delegated rules


 

    public static final BitSet FOLLOW_declaration_in_language38 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_attrib_in_language48 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_io_in_language61 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_language65 = new BitSet(new long[]{0x000000000000C072L});
    public static final BitSet FOLLOW_Type_Int_in_declaration97 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_Type_Real_in_declaration103 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_ID_in_declaration108 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_attrib127 = new BitSet(new long[]{0x0000000000002000L});
    public static final BitSet FOLLOW_13_in_attrib129 = new BitSet(new long[]{0x00000000000101C0L});
    public static final BitSet FOLLOW_expression_in_attrib131 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_14_in_io154 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_ID_in_io156 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_15_in_io163 = new BitSet(new long[]{0x00000000000101C0L});
    public static final BitSet FOLLOW_expression_in_io165 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_term_in_expression193 = new BitSet(new long[]{0x00000000000C0002L});
    public static final BitSet FOLLOW_operatorAdd_in_expression198 = new BitSet(new long[]{0x00000000000D01C0L});
    public static final BitSet FOLLOW_term_in_expression202 = new BitSet(new long[]{0x00000000000C0002L});
    public static final BitSet FOLLOW_factor_in_term232 = new BitSet(new long[]{0x0000000000300002L});
    public static final BitSet FOLLOW_operatorMul_in_term237 = new BitSet(new long[]{0x00000000003101C0L});
    public static final BitSet FOLLOW_factor_in_term241 = new BitSet(new long[]{0x0000000000300002L});
    public static final BitSet FOLLOW_16_in_factor268 = new BitSet(new long[]{0x00000000000301C0L});
    public static final BitSet FOLLOW_expression_in_factor270 = new BitSet(new long[]{0x0000000000020000L});
    public static final BitSet FOLLOW_17_in_factor273 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_value_in_factor281 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_operatorAdd0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_operatorMul0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_operator0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_value361 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INT_in_value371 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_FLOAT_in_value380 = new BitSet(new long[]{0x0000000000000002L});

}