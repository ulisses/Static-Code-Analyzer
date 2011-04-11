// $ANTLR 3.3 Nov 30, 2010 12:45:30 /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g 2011-04-11 11:50:06

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

import org.antlr.runtime.debug.*;
import java.io.IOException;
public class logolissParser extends DebugParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "TRUE", "FALSE", "PROGRAM", "IDENT", "DECLARATIONS", "STATEMENTS", "INTEGER", "BOOLEAN", "ARRAY", "SIZE", "NUM", "STRING", "FORWARD", "BACKWARD", "RRIGHT", "RLEFT", "PEN", "UPS", "DOWNS", "GOTO", "WHERE", "SUCC", "PRED", "SAY", "ASK", "IF", "THEN", "ELSE", "WHILE", "IN", "WS", "'{'", "'}'", "'->'", "';'", "','", "'='", "'['", "']'", "'?'", "'+'", "'-'", "'!'", "'('", "')'", "'||'", "'*'", "'/'", "'&&'", "'**'", "'=='", "'!='", "'<'", "'>'", "'<='", "'>='", "'in'"
    };
    public static final int EOF=-1;
    public static final int T__35=35;
    public static final int T__36=36;
    public static final int T__37=37;
    public static final int T__38=38;
    public static final int T__39=39;
    public static final int T__40=40;
    public static final int T__41=41;
    public static final int T__42=42;
    public static final int T__43=43;
    public static final int T__44=44;
    public static final int T__45=45;
    public static final int T__46=46;
    public static final int T__47=47;
    public static final int T__48=48;
    public static final int T__49=49;
    public static final int T__50=50;
    public static final int T__51=51;
    public static final int T__52=52;
    public static final int T__53=53;
    public static final int T__54=54;
    public static final int T__55=55;
    public static final int T__56=56;
    public static final int T__57=57;
    public static final int T__58=58;
    public static final int T__59=59;
    public static final int T__60=60;
    public static final int TRUE=4;
    public static final int FALSE=5;
    public static final int PROGRAM=6;
    public static final int IDENT=7;
    public static final int DECLARATIONS=8;
    public static final int STATEMENTS=9;
    public static final int INTEGER=10;
    public static final int BOOLEAN=11;
    public static final int ARRAY=12;
    public static final int SIZE=13;
    public static final int NUM=14;
    public static final int STRING=15;
    public static final int FORWARD=16;
    public static final int BACKWARD=17;
    public static final int RRIGHT=18;
    public static final int RLEFT=19;
    public static final int PEN=20;
    public static final int UPS=21;
    public static final int DOWNS=22;
    public static final int GOTO=23;
    public static final int WHERE=24;
    public static final int SUCC=25;
    public static final int PRED=26;
    public static final int SAY=27;
    public static final int ASK=28;
    public static final int IF=29;
    public static final int THEN=30;
    public static final int ELSE=31;
    public static final int WHILE=32;
    public static final int IN=33;
    public static final int WS=34;

    // delegates
    // delegators

    public static final String[] ruleNames = new String[] {
        "invalidRule", "declaration", "expression", "elem", "rotate", "vars", 
        "ifthenelse_stat", "step", "term", "assignment", "array_definition", 
        "inic_var", "body", "array_initialization", "declarations", "mode", 
        "variable", "while_stat", "conditional_statement", "say_statement", 
        "succorpred", "var", "add_op", "turtle_commands", "succpred", "ask_statement", 
        "else_expression", "iterative_statement", "single_expression", "variable_declaration", 
        "statement", "statements", "dialogue", "mul_op", "value_var", "factor", 
        "constant", "type", "logoliss", "rel_op", "likeaboss", "location", 
        "array_acess"
    };
    public static final boolean[] decisionCanBacktrack = new boolean[] {
        false, // invalid decision
        false, false, false, false, false, false, false, false, false, false, 
            false, false, false, false, false, false, false, false, false
    };

     
        public int ruleLevel = 0;
        public int getRuleLevel() { return ruleLevel; }
        public void incRuleLevel() { ruleLevel++; }
        public void decRuleLevel() { ruleLevel--; }
        public logolissParser(TokenStream input) {
            this(input, DebugEventSocketProxy.DEFAULT_DEBUGGER_PORT, new RecognizerSharedState());
        }
        public logolissParser(TokenStream input, int port, RecognizerSharedState state) {
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
    public logolissParser(TokenStream input, DebugEventListener dbg) {
        super(input, dbg, new RecognizerSharedState());

    }
    protected boolean evalPredicate(boolean result, String predicate) {
        dbg.semanticPredicate(result, predicate);
        return result;
    }


    public String[] getTokenNames() { return logolissParser.tokenNames; }
    public String getGrammarFileName() { return "/Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g"; }



    // $ANTLR start "logoliss"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:10:1: logoliss : PROGRAM IDENT '{' body '}' ;
    public final void logoliss() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "logoliss");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(10, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:11:5: ( PROGRAM IDENT '{' body '}' )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:11:10: PROGRAM IDENT '{' body '}'
            {
            dbg.location(11,10);
            match(input,PROGRAM,FOLLOW_PROGRAM_in_logoliss43); 
            dbg.location(11,21);
            match(input,IDENT,FOLLOW_IDENT_in_logoliss48); 
            dbg.location(11,34);
            match(input,35,FOLLOW_35_in_logoliss57); 
            dbg.location(11,41);
            pushFollow(FOLLOW_body_in_logoliss62);
            body();

            state._fsp--;

            dbg.location(11,49);
            match(input,36,FOLLOW_36_in_logoliss67); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(12, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "logoliss");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "logoliss"


    // $ANTLR start "body"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:14:1: body : DECLARATIONS declarations STATEMENTS statements ;
    public final void body() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "body");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(14, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:15:5: ( DECLARATIONS declarations STATEMENTS statements )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:15:10: DECLARATIONS declarations STATEMENTS statements
            {
            dbg.location(15,10);
            match(input,DECLARATIONS,FOLLOW_DECLARATIONS_in_body95); 
            dbg.location(15,30);
            pushFollow(FOLLOW_declarations_in_body104);
            declarations();

            state._fsp--;

            dbg.location(15,51);
            match(input,STATEMENTS,FOLLOW_STATEMENTS_in_body114); 
            dbg.location(15,69);
            pushFollow(FOLLOW_statements_in_body123);
            statements();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(16, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "body");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "body"


    // $ANTLR start "declarations"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:20:1: declarations : declaration ( declarations )? ;
    public final void declarations() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "declarations");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(20, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:21:5: ( declaration ( declarations )? )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:21:10: declaration ( declarations )?
            {
            dbg.location(21,10);
            pushFollow(FOLLOW_declaration_in_declarations149);
            declaration();

            state._fsp--;

            dbg.location(21,29);
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:21:29: ( declarations )?
            int alt1=2;
            try { dbg.enterSubRule(1);
            try { dbg.enterDecision(1, decisionCanBacktrack[1]);

            int LA1_0 = input.LA(1);

            if ( (LA1_0==IDENT) ) {
                alt1=1;
            }
            } finally {dbg.exitDecision(1);}

            switch (alt1) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:21:29: declarations
                    {
                    dbg.location(21,29);
                    pushFollow(FOLLOW_declarations_in_declarations158);
                    declarations();

                    state._fsp--;


                    }
                    break;

            }
            } finally {dbg.exitSubRule(1);}


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(22, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "declarations");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "declarations"


    // $ANTLR start "declaration"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:24:1: declaration : variable_declaration ;
    public final void declaration() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "declaration");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(24, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:25:5: ( variable_declaration )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:25:10: variable_declaration
            {
            dbg.location(25,10);
            pushFollow(FOLLOW_variable_declaration_in_declaration183);
            variable_declaration();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(26, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "declaration");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "declaration"


    // $ANTLR start "variable_declaration"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:30:1: variable_declaration : vars '->' type ';' ;
    public final void variable_declaration() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "variable_declaration");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(30, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:31:5: ( vars '->' type ';' )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:31:10: vars '->' type ';'
            {
            dbg.location(31,10);
            pushFollow(FOLLOW_vars_in_variable_declaration213);
            vars();

            state._fsp--;

            dbg.location(31,18);
            match(input,37,FOLLOW_37_in_variable_declaration218); 
            dbg.location(31,26);
            pushFollow(FOLLOW_type_in_variable_declaration223);
            type();

            state._fsp--;

            dbg.location(31,34);
            match(input,38,FOLLOW_38_in_variable_declaration228); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(32, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "variable_declaration");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "variable_declaration"


    // $ANTLR start "vars"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:34:1: vars : var ( ',' vars )? ;
    public final void vars() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "vars");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(34, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:34:9: ( var ( ',' vars )? )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:34:14: var ( ',' vars )?
            {
            dbg.location(34,14);
            pushFollow(FOLLOW_var_in_vars251);
            var();

            state._fsp--;

            dbg.location(34,21);
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:34:21: ( ',' vars )?
            int alt2=2;
            try { dbg.enterSubRule(2);
            try { dbg.enterDecision(2, decisionCanBacktrack[2]);

            int LA2_0 = input.LA(1);

            if ( (LA2_0==39) ) {
                alt2=1;
            }
            } finally {dbg.exitDecision(2);}

            switch (alt2) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:34:22: ',' vars
                    {
                    dbg.location(34,22);
                    match(input,39,FOLLOW_39_in_vars257); 
                    dbg.location(34,29);
                    pushFollow(FOLLOW_vars_in_vars262);
                    vars();

                    state._fsp--;


                    }
                    break;

            }
            } finally {dbg.exitSubRule(2);}


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(35, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "vars");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "vars"


    // $ANTLR start "var"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:37:1: var : IDENT value_var ;
    public final void var() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "var");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(37, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:37:8: ( IDENT value_var )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:37:13: IDENT value_var
            {
            dbg.location(37,13);
            match(input,IDENT,FOLLOW_IDENT_in_var283); 
            dbg.location(37,22);
            pushFollow(FOLLOW_value_var_in_var288);
            value_var();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(38, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "var");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "var"


    // $ANTLR start "value_var"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:40:1: value_var : ( ( '=' ) inic_var | );
    public final void value_var() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "value_var");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(40, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:41:5: ( ( '=' ) inic_var | )
            int alt3=2;
            try { dbg.enterDecision(3, decisionCanBacktrack[3]);

            int LA3_0 = input.LA(1);

            if ( (LA3_0==40) ) {
                alt3=1;
            }
            else if ( (LA3_0==37||LA3_0==39) ) {
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

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:41:10: ( '=' ) inic_var
                    {
                    dbg.location(41,10);
                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:41:10: ( '=' )
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:41:11: '='
                    {
                    dbg.location(41,11);
                    match(input,40,FOLLOW_40_in_value_var313); 

                    }

                    dbg.location(41,19);
                    pushFollow(FOLLOW_inic_var_in_value_var319);
                    inic_var();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:43:5: 
                    {
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
        dbg.location(43, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "value_var");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "value_var"


    // $ANTLR start "type"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:45:1: type : ( INTEGER | BOOLEAN | ARRAY SIZE NUM );
    public final void type() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "type");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(45, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:45:9: ( INTEGER | BOOLEAN | ARRAY SIZE NUM )
            int alt4=3;
            try { dbg.enterDecision(4, decisionCanBacktrack[4]);

            switch ( input.LA(1) ) {
            case INTEGER:
                {
                alt4=1;
                }
                break;
            case BOOLEAN:
                {
                alt4=2;
                }
                break;
            case ARRAY:
                {
                alt4=3;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 4, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }

            } finally {dbg.exitDecision(4);}

            switch (alt4) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:45:14: INTEGER
                    {
                    dbg.location(45,14);
                    match(input,INTEGER,FOLLOW_INTEGER_in_type344); 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:46:10: BOOLEAN
                    {
                    dbg.location(46,10);
                    match(input,BOOLEAN,FOLLOW_BOOLEAN_in_type355); 

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:47:10: ARRAY SIZE NUM
                    {
                    dbg.location(47,10);
                    match(input,ARRAY,FOLLOW_ARRAY_in_type366); 
                    dbg.location(47,19);
                    match(input,SIZE,FOLLOW_SIZE_in_type371); 
                    dbg.location(47,27);
                    match(input,NUM,FOLLOW_NUM_in_type376); 

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
        dbg.location(48, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "type");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "type"


    // $ANTLR start "inic_var"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:50:1: inic_var : ( constant | array_definition );
    public final void inic_var() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "inic_var");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(50, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:51:5: ( constant | array_definition )
            int alt5=2;
            try { dbg.enterDecision(5, decisionCanBacktrack[5]);

            int LA5_0 = input.LA(1);

            if ( ((LA5_0>=TRUE && LA5_0<=FALSE)||(LA5_0>=NUM && LA5_0<=STRING)) ) {
                alt5=1;
            }
            else if ( (LA5_0==41) ) {
                alt5=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 5, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(5);}

            switch (alt5) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:51:10: constant
                    {
                    dbg.location(51,10);
                    pushFollow(FOLLOW_constant_in_inic_var400);
                    constant();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:52:10: array_definition
                    {
                    dbg.location(52,10);
                    pushFollow(FOLLOW_array_definition_in_inic_var411);
                    array_definition();

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
        dbg.location(53, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "inic_var");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "inic_var"


    // $ANTLR start "constant"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:55:1: constant : ( NUM | STRING | TRUE | FALSE );
    public final void constant() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "constant");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(55, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:56:5: ( NUM | STRING | TRUE | FALSE )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(56,5);
            if ( (input.LA(1)>=TRUE && input.LA(1)<=FALSE)||(input.LA(1)>=NUM && input.LA(1)<=STRING) ) {
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
        dbg.location(60, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "constant");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "constant"


    // $ANTLR start "array_definition"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:65:1: array_definition : '[' array_initialization ']' ;
    public final void array_definition() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "array_definition");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(65, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:66:5: ( '[' array_initialization ']' )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:66:10: '[' array_initialization ']'
            {
            dbg.location(66,10);
            match(input,41,FOLLOW_41_in_array_definition496); 
            dbg.location(66,14);
            pushFollow(FOLLOW_array_initialization_in_array_definition498);
            array_initialization();

            state._fsp--;

            dbg.location(66,35);
            match(input,42,FOLLOW_42_in_array_definition500); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(67, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "array_definition");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "array_definition"


    // $ANTLR start "array_initialization"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:69:1: array_initialization : ( elem ',' array_initialization | elem );
    public final void array_initialization() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "array_initialization");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(69, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:70:5: ( elem ',' array_initialization | elem )
            int alt6=2;
            try { dbg.enterDecision(6, decisionCanBacktrack[6]);

            int LA6_0 = input.LA(1);

            if ( (LA6_0==NUM) ) {
                int LA6_1 = input.LA(2);

                if ( (LA6_1==39) ) {
                    alt6=1;
                }
                else if ( (LA6_1==42) ) {
                    alt6=2;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 6, 1, input);

                    dbg.recognitionException(nvae);
                    throw nvae;
                }
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

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:70:10: elem ',' array_initialization
                    {
                    dbg.location(70,10);
                    pushFollow(FOLLOW_elem_in_array_initialization524);
                    elem();

                    state._fsp--;

                    dbg.location(70,19);
                    match(input,39,FOLLOW_39_in_array_initialization530); 
                    dbg.location(70,26);
                    pushFollow(FOLLOW_array_initialization_in_array_initialization535);
                    array_initialization();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:71:11: elem
                    {
                    dbg.location(71,11);
                    pushFollow(FOLLOW_elem_in_array_initialization552);
                    elem();

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
        dbg.location(72, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "array_initialization");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "array_initialization"


    // $ANTLR start "elem"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:74:1: elem : NUM ;
    public final void elem() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "elem");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(74, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:75:5: ( NUM )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:75:10: NUM
            {
            dbg.location(75,10);
            match(input,NUM,FOLLOW_NUM_in_elem572); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(76, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "elem");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "elem"


    // $ANTLR start "statements"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:80:1: statements : ( statement )+ ;
    public final void statements() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "statements");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(80, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:81:5: ( ( statement )+ )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:81:10: ( statement )+
            {
            dbg.location(81,10);
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:81:10: ( statement )+
            int cnt7=0;
            try { dbg.enterSubRule(7);

            loop7:
            do {
                int alt7=2;
                try { dbg.enterDecision(7, decisionCanBacktrack[7]);

                int LA7_0 = input.LA(1);

                if ( (LA7_0==IDENT||(LA7_0>=FORWARD && LA7_0<=PEN)||(LA7_0>=GOTO && LA7_0<=WHERE)||(LA7_0>=SAY && LA7_0<=WHILE)) ) {
                    alt7=1;
                }


                } finally {dbg.exitDecision(7);}

                switch (alt7) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:81:10: statement
            	    {
            	    dbg.location(81,10);
            	    pushFollow(FOLLOW_statement_in_statements594);
            	    statement();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    if ( cnt7 >= 1 ) break loop7;
                        EarlyExitException eee =
                            new EarlyExitException(7, input);
                        dbg.recognitionException(eee);

                        throw eee;
                }
                cnt7++;
            } while (true);
            } finally {dbg.exitSubRule(7);}


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(82, 15);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "statements");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "statements"


    // $ANTLR start "statement"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:84:1: statement : ( turtle_commands | assignment | conditional_statement | iterative_statement );
    public final void statement() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "statement");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(84, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:85:5: ( turtle_commands | assignment | conditional_statement | iterative_statement )
            int alt8=4;
            try { dbg.enterDecision(8, decisionCanBacktrack[8]);

            switch ( input.LA(1) ) {
            case FORWARD:
            case BACKWARD:
            case RRIGHT:
            case RLEFT:
            case PEN:
            case GOTO:
            case WHERE:
            case SAY:
            case ASK:
                {
                alt8=1;
                }
                break;
            case IDENT:
                {
                alt8=2;
                }
                break;
            case IF:
            case THEN:
            case ELSE:
                {
                alt8=3;
                }
                break;
            case WHILE:
                {
                alt8=4;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 8, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }

            } finally {dbg.exitDecision(8);}

            switch (alt8) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:85:10: turtle_commands
                    {
                    dbg.location(85,10);
                    pushFollow(FOLLOW_turtle_commands_in_statement639);
                    turtle_commands();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:86:11: assignment
                    {
                    dbg.location(86,11);
                    pushFollow(FOLLOW_assignment_in_statement651);
                    assignment();

                    state._fsp--;


                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:87:11: conditional_statement
                    {
                    dbg.location(87,11);
                    pushFollow(FOLLOW_conditional_statement_in_statement663);
                    conditional_statement();

                    state._fsp--;


                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:88:11: iterative_statement
                    {
                    dbg.location(88,11);
                    pushFollow(FOLLOW_iterative_statement_in_statement675);
                    iterative_statement();

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
        dbg.location(89, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "statement");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "statement"


    // $ANTLR start "turtle_commands"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:92:1: turtle_commands : ( step | rotate | mode | dialogue | location );
    public final void turtle_commands() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "turtle_commands");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(92, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:93:5: ( step | rotate | mode | dialogue | location )
            int alt9=5;
            try { dbg.enterDecision(9, decisionCanBacktrack[9]);

            switch ( input.LA(1) ) {
            case FORWARD:
            case BACKWARD:
                {
                alt9=1;
                }
                break;
            case RRIGHT:
            case RLEFT:
                {
                alt9=2;
                }
                break;
            case PEN:
                {
                alt9=3;
                }
                break;
            case SAY:
            case ASK:
                {
                alt9=4;
                }
                break;
            case GOTO:
            case WHERE:
                {
                alt9=5;
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

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:93:10: step
                    {
                    dbg.location(93,10);
                    pushFollow(FOLLOW_step_in_turtle_commands700);
                    step();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:94:10: rotate
                    {
                    dbg.location(94,10);
                    pushFollow(FOLLOW_rotate_in_turtle_commands711);
                    rotate();

                    state._fsp--;


                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:95:10: mode
                    {
                    dbg.location(95,10);
                    pushFollow(FOLLOW_mode_in_turtle_commands722);
                    mode();

                    state._fsp--;


                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:96:10: dialogue
                    {
                    dbg.location(96,10);
                    pushFollow(FOLLOW_dialogue_in_turtle_commands733);
                    dialogue();

                    state._fsp--;


                    }
                    break;
                case 5 :
                    dbg.enterAlt(5);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:97:10: location
                    {
                    dbg.location(97,10);
                    pushFollow(FOLLOW_location_in_turtle_commands744);
                    location();

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
        dbg.location(98, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "turtle_commands");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "turtle_commands"


    // $ANTLR start "step"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:100:1: step : ( FORWARD expression | BACKWARD expression );
    public final void step() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "step");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(100, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:101:5: ( FORWARD expression | BACKWARD expression )
            int alt10=2;
            try { dbg.enterDecision(10, decisionCanBacktrack[10]);

            int LA10_0 = input.LA(1);

            if ( (LA10_0==FORWARD) ) {
                alt10=1;
            }
            else if ( (LA10_0==BACKWARD) ) {
                alt10=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 10, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(10);}

            switch (alt10) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:101:10: FORWARD expression
                    {
                    dbg.location(101,10);
                    match(input,FORWARD,FOLLOW_FORWARD_in_step769); 
                    dbg.location(101,22);
                    pushFollow(FOLLOW_expression_in_step775);
                    expression();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:102:14: BACKWARD expression
                    {
                    dbg.location(102,14);
                    match(input,BACKWARD,FOLLOW_BACKWARD_in_step790); 
                    dbg.location(102,27);
                    pushFollow(FOLLOW_expression_in_step796);
                    expression();

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
        dbg.location(103, 9);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "step");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "step"


    // $ANTLR start "rotate"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:105:1: rotate : ( RRIGHT | RLEFT );
    public final void rotate() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "rotate");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(105, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:105:11: ( RRIGHT | RLEFT )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(105,11);
            if ( (input.LA(1)>=RRIGHT && input.LA(1)<=RLEFT) ) {
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
        dbg.location(107, 11);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "rotate");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "rotate"


    // $ANTLR start "mode"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:109:1: mode : PEN likeaboss ;
    public final void mode() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "mode");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(109, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:109:10: ( PEN likeaboss )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:109:15: PEN likeaboss
            {
            dbg.location(109,15);
            match(input,PEN,FOLLOW_PEN_in_mode882); 
            dbg.location(109,23);
            pushFollow(FOLLOW_likeaboss_in_mode888);
            likeaboss();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(110, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "mode");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "mode"


    // $ANTLR start "likeaboss"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:112:1: likeaboss : ( UPS | DOWNS ) ;
    public final void likeaboss() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "likeaboss");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(112, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:113:5: ( ( UPS | DOWNS ) )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:113:10: ( UPS | DOWNS )
            {
            dbg.location(113,10);
            if ( (input.LA(1)>=UPS && input.LA(1)<=DOWNS) ) {
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
        dbg.location(114, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "likeaboss");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "likeaboss"


    // $ANTLR start "dialogue"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:116:1: dialogue : ( say_statement | ask_statement );
    public final void dialogue() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "dialogue");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(116, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:116:14: ( say_statement | ask_statement )
            int alt11=2;
            try { dbg.enterDecision(11, decisionCanBacktrack[11]);

            int LA11_0 = input.LA(1);

            if ( (LA11_0==SAY) ) {
                alt11=1;
            }
            else if ( (LA11_0==ASK) ) {
                alt11=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 11, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(11);}

            switch (alt11) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:116:19: say_statement
                    {
                    dbg.location(116,19);
                    pushFollow(FOLLOW_say_statement_in_dialogue936);
                    say_statement();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:117:18: ask_statement
                    {
                    dbg.location(117,18);
                    pushFollow(FOLLOW_ask_statement_in_dialogue955);
                    ask_statement();

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
        dbg.location(118, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "dialogue");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "dialogue"


    // $ANTLR start "location"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:120:1: location : ( GOTO NUM ',' NUM | WHERE '?' );
    public final void location() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "location");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(120, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:120:13: ( GOTO NUM ',' NUM | WHERE '?' )
            int alt12=2;
            try { dbg.enterDecision(12, decisionCanBacktrack[12]);

            int LA12_0 = input.LA(1);

            if ( (LA12_0==GOTO) ) {
                alt12=1;
            }
            else if ( (LA12_0==WHERE) ) {
                alt12=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 12, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(12);}

            switch (alt12) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:120:18: GOTO NUM ',' NUM
                    {
                    dbg.location(120,18);
                    match(input,GOTO,FOLLOW_GOTO_in_location974); 
                    dbg.location(120,27);
                    match(input,NUM,FOLLOW_NUM_in_location980); 
                    dbg.location(120,35);
                    match(input,39,FOLLOW_39_in_location986); 
                    dbg.location(120,43);
                    match(input,NUM,FOLLOW_NUM_in_location992); 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:121:11: WHERE '?'
                    {
                    dbg.location(121,11);
                    match(input,WHERE,FOLLOW_WHERE_in_location1004); 
                    dbg.location(121,20);
                    match(input,43,FOLLOW_43_in_location1009); 

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
        dbg.location(122, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "location");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "location"


    // $ANTLR start "assignment"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:125:1: assignment : variable '=' expression ;
    public final void assignment() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "assignment");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(125, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:126:5: ( variable '=' expression )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:126:10: variable '=' expression
            {
            dbg.location(126,10);
            pushFollow(FOLLOW_variable_in_assignment1043);
            variable();

            state._fsp--;

            dbg.location(126,23);
            match(input,40,FOLLOW_40_in_assignment1049); 
            dbg.location(126,31);
            pushFollow(FOLLOW_expression_in_assignment1055);
            expression();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(127, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "assignment");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "assignment"


    // $ANTLR start "variable"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:129:1: variable : IDENT ( array_acess )? ;
    public final void variable() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "variable");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(129, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:130:5: ( IDENT ( array_acess )? )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:130:10: IDENT ( array_acess )?
            {
            dbg.location(130,10);
            match(input,IDENT,FOLLOW_IDENT_in_variable1075); 
            dbg.location(130,20);
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:130:20: ( array_acess )?
            int alt13=2;
            try { dbg.enterSubRule(13);
            try { dbg.enterDecision(13, decisionCanBacktrack[13]);

            int LA13_0 = input.LA(1);

            if ( (LA13_0==41) ) {
                alt13=1;
            }
            } finally {dbg.exitDecision(13);}

            switch (alt13) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:130:21: array_acess
                    {
                    dbg.location(130,21);
                    pushFollow(FOLLOW_array_acess_in_variable1082);
                    array_acess();

                    state._fsp--;


                    }
                    break;

            }
            } finally {dbg.exitSubRule(13);}


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(131, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "variable");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "variable"


    // $ANTLR start "array_acess"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:133:1: array_acess : '[' single_expression ']' ;
    public final void array_acess() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "array_acess");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(133, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:134:5: ( '[' single_expression ']' )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:134:10: '[' single_expression ']'
            {
            dbg.location(134,10);
            match(input,41,FOLLOW_41_in_array_acess1104); 
            dbg.location(134,18);
            pushFollow(FOLLOW_single_expression_in_array_acess1110);
            single_expression();

            state._fsp--;

            dbg.location(134,40);
            match(input,42,FOLLOW_42_in_array_acess1116); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(135, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "array_acess");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "array_acess"


    // $ANTLR start "expression"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:138:1: expression options {k=2; } : single_expression ( rel_op expression )? ;
    public final void expression() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "expression");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(138, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:140:5: ( single_expression ( rel_op expression )? )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:140:10: single_expression ( rel_op expression )?
            {
            dbg.location(140,10);
            pushFollow(FOLLOW_single_expression_in_expression1144);
            single_expression();

            state._fsp--;

            dbg.location(140,31);
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:140:31: ( rel_op expression )?
            int alt14=2;
            try { dbg.enterSubRule(14);
            try { dbg.enterDecision(14, decisionCanBacktrack[14]);

            int LA14_0 = input.LA(1);

            if ( ((LA14_0>=54 && LA14_0<=60)) ) {
                alt14=1;
            }
            } finally {dbg.exitDecision(14);}

            switch (alt14) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:140:32: rel_op expression
                    {
                    dbg.location(140,32);
                    pushFollow(FOLLOW_rel_op_in_expression1150);
                    rel_op();

                    state._fsp--;

                    dbg.location(140,43);
                    pushFollow(FOLLOW_expression_in_expression1156);
                    expression();

                    state._fsp--;


                    }
                    break;

            }
            } finally {dbg.exitSubRule(14);}


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(141, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "expression");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "expression"


    // $ANTLR start "single_expression"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:144:1: single_expression : term ( add_op single_expression )? ;
    public final void single_expression() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "single_expression");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(144, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:145:5: ( term ( add_op single_expression )? )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:145:10: term ( add_op single_expression )?
            {
            dbg.location(145,10);
            pushFollow(FOLLOW_term_in_single_expression1179);
            term();

            state._fsp--;

            dbg.location(145,18);
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:145:18: ( add_op single_expression )?
            int alt15=2;
            try { dbg.enterSubRule(15);
            try { dbg.enterDecision(15, decisionCanBacktrack[15]);

            int LA15_0 = input.LA(1);

            if ( ((LA15_0>=44 && LA15_0<=45)||LA15_0==49) ) {
                alt15=1;
            }
            } finally {dbg.exitDecision(15);}

            switch (alt15) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:145:19: add_op single_expression
                    {
                    dbg.location(145,19);
                    pushFollow(FOLLOW_add_op_in_single_expression1185);
                    add_op();

                    state._fsp--;

                    dbg.location(145,26);
                    pushFollow(FOLLOW_single_expression_in_single_expression1187);
                    single_expression();

                    state._fsp--;


                    }
                    break;

            }
            } finally {dbg.exitSubRule(15);}


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(146, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "single_expression");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "single_expression"


    // $ANTLR start "term"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:149:1: term : factor ( mul_op term )? ;
    public final void term() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "term");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(149, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:150:5: ( factor ( mul_op term )? )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:150:10: factor ( mul_op term )?
            {
            dbg.location(150,10);
            pushFollow(FOLLOW_factor_in_term1210);
            factor();

            state._fsp--;

            dbg.location(150,20);
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:150:20: ( mul_op term )?
            int alt16=2;
            try { dbg.enterSubRule(16);
            try { dbg.enterDecision(16, decisionCanBacktrack[16]);

            int LA16_0 = input.LA(1);

            if ( ((LA16_0>=50 && LA16_0<=53)) ) {
                alt16=1;
            }
            } finally {dbg.exitDecision(16);}

            switch (alt16) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:150:21: mul_op term
                    {
                    dbg.location(150,21);
                    pushFollow(FOLLOW_mul_op_in_term1216);
                    mul_op();

                    state._fsp--;

                    dbg.location(150,31);
                    pushFollow(FOLLOW_term_in_term1221);
                    term();

                    state._fsp--;


                    }
                    break;

            }
            } finally {dbg.exitSubRule(16);}


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(151, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "term");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "term"


    // $ANTLR start "factor"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:154:1: factor options {k=3; } : ( constant | variable | succorpred | ( '+' | '-' | '!' )? '(' expression ')' );
    public final void factor() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "factor");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(154, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:156:5: ( constant | variable | succorpred | ( '+' | '-' | '!' )? '(' expression ')' )
            int alt18=4;
            try { dbg.enterDecision(18, decisionCanBacktrack[18]);

            switch ( input.LA(1) ) {
            case TRUE:
            case FALSE:
            case NUM:
            case STRING:
                {
                alt18=1;
                }
                break;
            case IDENT:
                {
                alt18=2;
                }
                break;
            case SUCC:
            case PRED:
                {
                alt18=3;
                }
                break;
            case 44:
            case 45:
            case 46:
            case 47:
                {
                alt18=4;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 18, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }

            } finally {dbg.exitDecision(18);}

            switch (alt18) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:156:10: constant
                    {
                    dbg.location(156,10);
                    pushFollow(FOLLOW_constant_in_factor1255);
                    constant();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:157:10: variable
                    {
                    dbg.location(157,10);
                    pushFollow(FOLLOW_variable_in_factor1266);
                    variable();

                    state._fsp--;


                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:158:10: succorpred
                    {
                    dbg.location(158,10);
                    pushFollow(FOLLOW_succorpred_in_factor1277);
                    succorpred();

                    state._fsp--;


                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:159:10: ( '+' | '-' | '!' )? '(' expression ')'
                    {
                    dbg.location(159,10);
                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:159:10: ( '+' | '-' | '!' )?
                    int alt17=2;
                    try { dbg.enterSubRule(17);
                    try { dbg.enterDecision(17, decisionCanBacktrack[17]);

                    int LA17_0 = input.LA(1);

                    if ( ((LA17_0>=44 && LA17_0<=46)) ) {
                        alt17=1;
                    }
                    } finally {dbg.exitDecision(17);}

                    switch (alt17) {
                        case 1 :
                            dbg.enterAlt(1);

                            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
                            {
                            dbg.location(159,10);
                            if ( (input.LA(1)>=44 && input.LA(1)<=46) ) {
                                input.consume();
                                state.errorRecovery=false;
                            }
                            else {
                                MismatchedSetException mse = new MismatchedSetException(null,input);
                                dbg.recognitionException(mse);
                                throw mse;
                            }


                            }
                            break;

                    }
                    } finally {dbg.exitSubRule(17);}

                    dbg.location(159,25);
                    match(input,47,FOLLOW_47_in_factor1297); 
                    dbg.location(159,32);
                    pushFollow(FOLLOW_expression_in_factor1302);
                    expression();

                    state._fsp--;

                    dbg.location(159,46);
                    match(input,48,FOLLOW_48_in_factor1307); 

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
        dbg.location(160, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "factor");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "factor"


    // $ANTLR start "add_op"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:163:1: add_op : ( '+' | '-' | '||' );
    public final void add_op() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "add_op");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(163, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:164:5: ( '+' | '-' | '||' )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(164,5);
            if ( (input.LA(1)>=44 && input.LA(1)<=45)||input.LA(1)==49 ) {
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
        dbg.location(167, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "add_op");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "add_op"


    // $ANTLR start "mul_op"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:169:1: mul_op : ( '*' | '/' | '&&' | '**' );
    public final void mul_op() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "mul_op");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(169, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:170:5: ( '*' | '/' | '&&' | '**' )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(170,5);
            if ( (input.LA(1)>=50 && input.LA(1)<=53) ) {
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
        dbg.location(174, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "mul_op");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "mul_op"


    // $ANTLR start "rel_op"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:176:1: rel_op : ( '==' | '!=' | '<' | '>' | '<=' | '>=' | 'in' );
    public final void rel_op() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "rel_op");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(176, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:177:5: ( '==' | '!=' | '<' | '>' | '<=' | '>=' | 'in' )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(177,5);
            if ( (input.LA(1)>=54 && input.LA(1)<=60) ) {
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
        dbg.location(184, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "rel_op");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "rel_op"


    // $ANTLR start "succorpred"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:187:1: succorpred : succpred IDENT ;
    public final void succorpred() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "succorpred");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(187, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:188:5: ( succpred IDENT )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:188:11: succpred IDENT
            {
            dbg.location(188,11);
            pushFollow(FOLLOW_succpred_in_succorpred1599);
            succpred();

            state._fsp--;

            dbg.location(188,24);
            match(input,IDENT,FOLLOW_IDENT_in_succorpred1605); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(189, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "succorpred");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "succorpred"


    // $ANTLR start "succpred"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:191:1: succpred : ( SUCC | PRED );
    public final void succpred() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "succpred");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(191, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:192:5: ( SUCC | PRED )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(192,5);
            if ( (input.LA(1)>=SUCC && input.LA(1)<=PRED) ) {
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
        dbg.location(194, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "succpred");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "succpred"


    // $ANTLR start "say_statement"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:197:1: say_statement : SAY '(' expression ')' ;
    public final void say_statement() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "say_statement");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(197, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:198:5: ( SAY '(' expression ')' )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:198:10: SAY '(' expression ')'
            {
            dbg.location(198,10);
            match(input,SAY,FOLLOW_SAY_in_say_statement1665); 
            dbg.location(198,18);
            match(input,47,FOLLOW_47_in_say_statement1671); 
            dbg.location(198,26);
            pushFollow(FOLLOW_expression_in_say_statement1677);
            expression();

            state._fsp--;

            dbg.location(198,41);
            match(input,48,FOLLOW_48_in_say_statement1683); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(199, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "say_statement");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "say_statement"


    // $ANTLR start "ask_statement"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:201:1: ask_statement : ASK '(' STRING ',' variable ')' ;
    public final void ask_statement() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "ask_statement");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(201, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:202:5: ( ASK '(' STRING ',' variable ')' )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:202:10: ASK '(' STRING ',' variable ')'
            {
            dbg.location(202,10);
            match(input,ASK,FOLLOW_ASK_in_ask_statement1703); 
            dbg.location(202,18);
            match(input,47,FOLLOW_47_in_ask_statement1709); 
            dbg.location(202,26);
            match(input,STRING,FOLLOW_STRING_in_ask_statement1715); 
            dbg.location(202,37);
            match(input,39,FOLLOW_39_in_ask_statement1721); 
            dbg.location(202,45);
            pushFollow(FOLLOW_variable_in_ask_statement1727);
            variable();

            state._fsp--;

            dbg.location(202,58);
            match(input,48,FOLLOW_48_in_ask_statement1733); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(203, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "ask_statement");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "ask_statement"


    // $ANTLR start "conditional_statement"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:206:1: conditional_statement : ifthenelse_stat ;
    public final void conditional_statement() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "conditional_statement");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(206, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:207:5: ( ifthenelse_stat )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:207:10: ifthenelse_stat
            {
            dbg.location(207,10);
            pushFollow(FOLLOW_ifthenelse_stat_in_conditional_statement1754);
            ifthenelse_stat();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(208, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "conditional_statement");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "conditional_statement"


    // $ANTLR start "iterative_statement"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:210:1: iterative_statement : while_stat ;
    public final void iterative_statement() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "iterative_statement");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(210, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:211:5: ( while_stat )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:211:10: while_stat
            {
            dbg.location(211,10);
            pushFollow(FOLLOW_while_stat_in_iterative_statement1774);
            while_stat();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(212, 5);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "iterative_statement");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "iterative_statement"


    // $ANTLR start "ifthenelse_stat"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:215:1: ifthenelse_stat : ( IF expression | THEN '{' statements '}' | else_expression );
    public final void ifthenelse_stat() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "ifthenelse_stat");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(215, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:216:9: ( IF expression | THEN '{' statements '}' | else_expression )
            int alt19=3;
            try { dbg.enterDecision(19, decisionCanBacktrack[19]);

            switch ( input.LA(1) ) {
            case IF:
                {
                alt19=1;
                }
                break;
            case THEN:
                {
                alt19=2;
                }
                break;
            case ELSE:
                {
                alt19=3;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 19, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }

            } finally {dbg.exitDecision(19);}

            switch (alt19) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:216:14: IF expression
                    {
                    dbg.location(216,14);
                    match(input,IF,FOLLOW_IF_in_ifthenelse_stat1807); 
                    dbg.location(216,20);
                    pushFollow(FOLLOW_expression_in_ifthenelse_stat1812);
                    expression();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:217:25: THEN '{' statements '}'
                    {
                    dbg.location(217,25);
                    match(input,THEN,FOLLOW_THEN_in_ifthenelse_stat1838); 
                    dbg.location(217,33);
                    match(input,35,FOLLOW_35_in_ifthenelse_stat1843); 
                    dbg.location(217,41);
                    pushFollow(FOLLOW_statements_in_ifthenelse_stat1849);
                    statements();

                    state._fsp--;

                    dbg.location(217,56);
                    match(input,36,FOLLOW_36_in_ifthenelse_stat1855); 

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:218:24: else_expression
                    {
                    dbg.location(218,24);
                    pushFollow(FOLLOW_else_expression_in_ifthenelse_stat1880);
                    else_expression();

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
        dbg.location(219, 19);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "ifthenelse_stat");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "ifthenelse_stat"


    // $ANTLR start "else_expression"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:221:1: else_expression : ELSE '{' statements '}' ;
    public final void else_expression() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "else_expression");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(221, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:221:20: ( ELSE '{' statements '}' )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:221:26: ELSE '{' statements '}'
            {
            dbg.location(221,26);
            match(input,ELSE,FOLLOW_ELSE_in_else_expression1914); 
            dbg.location(221,34);
            match(input,35,FOLLOW_35_in_else_expression1919); 
            dbg.location(221,42);
            pushFollow(FOLLOW_statements_in_else_expression1925);
            statements();

            state._fsp--;

            dbg.location(221,57);
            match(input,36,FOLLOW_36_in_else_expression1931); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(222, 9);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "else_expression");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "else_expression"


    // $ANTLR start "while_stat"
    // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:225:1: while_stat : WHILE '(' expression ')' '{' statements '}' ;
    public final void while_stat() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "while_stat");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(225, 1);

        try {
            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:226:9: ( WHILE '(' expression ')' '{' statements '}' )
            dbg.enterAlt(1);

            // /Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:226:14: WHILE '(' expression ')' '{' statements '}'
            {
            dbg.location(226,14);
            match(input,WHILE,FOLLOW_WHILE_in_while_stat1960); 
            dbg.location(226,23);
            match(input,47,FOLLOW_47_in_while_stat1965); 
            dbg.location(226,31);
            pushFollow(FOLLOW_expression_in_while_stat1971);
            expression();

            state._fsp--;

            dbg.location(226,46);
            match(input,48,FOLLOW_48_in_while_stat1977); 
            dbg.location(226,54);
            match(input,35,FOLLOW_35_in_while_stat1983); 
            dbg.location(226,62);
            pushFollow(FOLLOW_statements_in_while_stat1989);
            statements();

            state._fsp--;

            dbg.location(226,77);
            match(input,36,FOLLOW_36_in_while_stat1995); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(227, 9);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "while_stat");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "while_stat"

    // Delegated rules


 

    public static final BitSet FOLLOW_PROGRAM_in_logoliss43 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_IDENT_in_logoliss48 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_35_in_logoliss57 = new BitSet(new long[]{0x0000000000000100L});
    public static final BitSet FOLLOW_body_in_logoliss62 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_36_in_logoliss67 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_DECLARATIONS_in_body95 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_declarations_in_body104 = new BitSet(new long[]{0x0000000000000200L});
    public static final BitSet FOLLOW_STATEMENTS_in_body114 = new BitSet(new long[]{0x00000001F99F0080L});
    public static final BitSet FOLLOW_statements_in_body123 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_declaration_in_declarations149 = new BitSet(new long[]{0x0000000000000082L});
    public static final BitSet FOLLOW_declarations_in_declarations158 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_variable_declaration_in_declaration183 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_vars_in_variable_declaration213 = new BitSet(new long[]{0x0000002000000000L});
    public static final BitSet FOLLOW_37_in_variable_declaration218 = new BitSet(new long[]{0x0000000000001C00L});
    public static final BitSet FOLLOW_type_in_variable_declaration223 = new BitSet(new long[]{0x0000004000000000L});
    public static final BitSet FOLLOW_38_in_variable_declaration228 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_var_in_vars251 = new BitSet(new long[]{0x0000008000000002L});
    public static final BitSet FOLLOW_39_in_vars257 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_vars_in_vars262 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IDENT_in_var283 = new BitSet(new long[]{0x0000010000000000L});
    public static final BitSet FOLLOW_value_var_in_var288 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_40_in_value_var313 = new BitSet(new long[]{0x000002000000C030L});
    public static final BitSet FOLLOW_inic_var_in_value_var319 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INTEGER_in_type344 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_BOOLEAN_in_type355 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ARRAY_in_type366 = new BitSet(new long[]{0x0000000000002000L});
    public static final BitSet FOLLOW_SIZE_in_type371 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_NUM_in_type376 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_constant_in_inic_var400 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_array_definition_in_inic_var411 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_constant0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_41_in_array_definition496 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_array_initialization_in_array_definition498 = new BitSet(new long[]{0x0000040000000000L});
    public static final BitSet FOLLOW_42_in_array_definition500 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_elem_in_array_initialization524 = new BitSet(new long[]{0x0000008000000000L});
    public static final BitSet FOLLOW_39_in_array_initialization530 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_array_initialization_in_array_initialization535 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_elem_in_array_initialization552 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUM_in_elem572 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_statements594 = new BitSet(new long[]{0x00000001F99F0082L});
    public static final BitSet FOLLOW_turtle_commands_in_statement639 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_assignment_in_statement651 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_conditional_statement_in_statement663 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_iterative_statement_in_statement675 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_step_in_turtle_commands700 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rotate_in_turtle_commands711 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_mode_in_turtle_commands722 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_dialogue_in_turtle_commands733 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_location_in_turtle_commands744 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_FORWARD_in_step769 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_step775 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_BACKWARD_in_step790 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_step796 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_rotate0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_PEN_in_mode882 = new BitSet(new long[]{0x0000000000600000L});
    public static final BitSet FOLLOW_likeaboss_in_mode888 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_likeaboss908 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_say_statement_in_dialogue936 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ask_statement_in_dialogue955 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_GOTO_in_location974 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_NUM_in_location980 = new BitSet(new long[]{0x0000008000000000L});
    public static final BitSet FOLLOW_39_in_location986 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_NUM_in_location992 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_WHERE_in_location1004 = new BitSet(new long[]{0x0000080000000000L});
    public static final BitSet FOLLOW_43_in_location1009 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_variable_in_assignment1043 = new BitSet(new long[]{0x0000010000000000L});
    public static final BitSet FOLLOW_40_in_assignment1049 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_assignment1055 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IDENT_in_variable1075 = new BitSet(new long[]{0x0000020000000002L});
    public static final BitSet FOLLOW_array_acess_in_variable1082 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_41_in_array_acess1104 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_single_expression_in_array_acess1110 = new BitSet(new long[]{0x0000040000000000L});
    public static final BitSet FOLLOW_42_in_array_acess1116 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_single_expression_in_expression1144 = new BitSet(new long[]{0x1FC0000000000002L});
    public static final BitSet FOLLOW_rel_op_in_expression1150 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_expression1156 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_term_in_single_expression1179 = new BitSet(new long[]{0x0002300000000002L});
    public static final BitSet FOLLOW_add_op_in_single_expression1185 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_single_expression_in_single_expression1187 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_factor_in_term1210 = new BitSet(new long[]{0x003C000000000002L});
    public static final BitSet FOLLOW_mul_op_in_term1216 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_term_in_term1221 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_constant_in_factor1255 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_variable_in_factor1266 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_succorpred_in_factor1277 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_factor1288 = new BitSet(new long[]{0x0000800000000000L});
    public static final BitSet FOLLOW_47_in_factor1297 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_factor1302 = new BitSet(new long[]{0x0001000000000000L});
    public static final BitSet FOLLOW_48_in_factor1307 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_add_op0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_mul_op0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_rel_op0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_succpred_in_succorpred1599 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_IDENT_in_succorpred1605 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_succpred0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_SAY_in_say_statement1665 = new BitSet(new long[]{0x0000800000000000L});
    public static final BitSet FOLLOW_47_in_say_statement1671 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_say_statement1677 = new BitSet(new long[]{0x0001000000000000L});
    public static final BitSet FOLLOW_48_in_say_statement1683 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ASK_in_ask_statement1703 = new BitSet(new long[]{0x0000800000000000L});
    public static final BitSet FOLLOW_47_in_ask_statement1709 = new BitSet(new long[]{0x0000000000008000L});
    public static final BitSet FOLLOW_STRING_in_ask_statement1715 = new BitSet(new long[]{0x0000008000000000L});
    public static final BitSet FOLLOW_39_in_ask_statement1721 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_variable_in_ask_statement1727 = new BitSet(new long[]{0x0001000000000000L});
    public static final BitSet FOLLOW_48_in_ask_statement1733 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ifthenelse_stat_in_conditional_statement1754 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_while_stat_in_iterative_statement1774 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IF_in_ifthenelse_stat1807 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_ifthenelse_stat1812 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_THEN_in_ifthenelse_stat1838 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_35_in_ifthenelse_stat1843 = new BitSet(new long[]{0x00000001F99F0080L});
    public static final BitSet FOLLOW_statements_in_ifthenelse_stat1849 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_36_in_ifthenelse_stat1855 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_else_expression_in_ifthenelse_stat1880 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ELSE_in_else_expression1914 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_35_in_else_expression1919 = new BitSet(new long[]{0x00000001F99F0080L});
    public static final BitSet FOLLOW_statements_in_else_expression1925 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_36_in_else_expression1931 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_WHILE_in_while_stat1960 = new BitSet(new long[]{0x0000800000000000L});
    public static final BitSet FOLLOW_47_in_while_stat1965 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_while_stat1971 = new BitSet(new long[]{0x0001000000000000L});
    public static final BitSet FOLLOW_48_in_while_stat1977 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_35_in_while_stat1983 = new BitSet(new long[]{0x00000001F99F0080L});
    public static final BitSet FOLLOW_statements_in_while_stat1989 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_36_in_while_stat1995 = new BitSet(new long[]{0x0000000000000002L});

}