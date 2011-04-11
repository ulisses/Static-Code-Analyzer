// $ANTLR 3.2 Sep 23, 2009 12:02:23 /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g 2011-04-11 11:41:02

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
    public static final int WHERE=24;
    public static final int FORWARD=16;
    public static final int WHILE=32;
    public static final int UPS=21;
    public static final int EOF=-1;
    public static final int T__60=60;
    public static final int IF=29;
    public static final int RLEFT=19;
    public static final int T__55=55;
    public static final int T__56=56;
    public static final int T__57=57;
    public static final int T__58=58;
    public static final int T__51=51;
    public static final int BOOLEAN=11;
    public static final int IN=33;
    public static final int THEN=30;
    public static final int T__52=52;
    public static final int T__53=53;
    public static final int T__54=54;
    public static final int T__59=59;
    public static final int IDENT=7;
    public static final int SUCC=25;
    public static final int GOTO=23;
    public static final int T__50=50;
    public static final int ARRAY=12;
    public static final int T__42=42;
    public static final int INTEGER=10;
    public static final int T__43=43;
    public static final int T__40=40;
    public static final int T__41=41;
    public static final int T__46=46;
    public static final int RRIGHT=18;
    public static final int T__47=47;
    public static final int T__44=44;
    public static final int T__45=45;
    public static final int T__48=48;
    public static final int T__49=49;
    public static final int PRED=26;
    public static final int PEN=20;
    public static final int ELSE=31;
    public static final int ASK=28;
    public static final int BACKWARD=17;
    public static final int DECLARATIONS=8;
    public static final int SAY=27;
    public static final int TRUE=4;
    public static final int NUM=14;
    public static final int WS=34;
    public static final int T__35=35;
    public static final int T__36=36;
    public static final int T__37=37;
    public static final int T__38=38;
    public static final int T__39=39;
    public static final int STATEMENTS=9;
    public static final int PROGRAM=6;
    public static final int DOWNS=22;
    public static final int FALSE=5;
    public static final int SIZE=13;
    public static final int STRING=15;

    // delegates
    // delegators

    public static final String[] ruleNames = new String[] {
        "invalidRule", "else_expression", "rel_op", "rotate", "logoliss", 
        "vars", "term", "statement", "type", "variable_declaration", "step", 
        "mode", "single_expression", "ask_statement", "variable", "succpred", 
        "add_op", "expression", "array_definition", "statements", "factor", 
        "inic_var", "say_statement", "elem", "var", "assignment", "succorpred", 
        "turtle_commands", "mul_op", "body", "while_stat", "declaration", 
        "dialogue", "ifthenelse_stat", "conditional_statement", "iterative_statement", 
        "array_acess", "array_initialization", "location", "constant", "declarations", 
        "likeaboss", "value_var"
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
    public String getGrammarFileName() { return "/home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g"; }



    // $ANTLR start "logoliss"
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:10:1: logoliss : PROGRAM IDENT '{' body '}' ;
    public final void logoliss() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "logoliss");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(10, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:11:2: ( PROGRAM IDENT '{' body '}' )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:11:4: PROGRAM IDENT '{' body '}'
            {
            dbg.location(11,4);
            match(input,PROGRAM,FOLLOW_PROGRAM_in_logoliss31); 
            dbg.location(11,12);
            match(input,IDENT,FOLLOW_IDENT_in_logoliss33); 
            dbg.location(11,19);
            match(input,35,FOLLOW_35_in_logoliss36); 
            dbg.location(11,23);
            pushFollow(FOLLOW_body_in_logoliss38);
            body();

            state._fsp--;

            dbg.location(11,28);
            match(input,36,FOLLOW_36_in_logoliss40); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(12, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:14:1: body : DECLARATIONS declarations STATEMENTS statements ;
    public final void body() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "body");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(14, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:15:2: ( DECLARATIONS declarations STATEMENTS statements )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:15:4: DECLARATIONS declarations STATEMENTS statements
            {
            dbg.location(15,4);
            match(input,DECLARATIONS,FOLLOW_DECLARATIONS_in_body53); 
            dbg.location(15,18);
            pushFollow(FOLLOW_declarations_in_body56);
            declarations();

            state._fsp--;

            dbg.location(15,33);
            match(input,STATEMENTS,FOLLOW_STATEMENTS_in_body60); 
            dbg.location(15,45);
            pushFollow(FOLLOW_statements_in_body63);
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
        dbg.location(16, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:20:1: declarations : declaration ( declarations )? ;
    public final void declarations() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "declarations");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(20, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:21:2: ( declaration ( declarations )? )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:21:4: declaration ( declarations )?
            {
            dbg.location(21,4);
            pushFollow(FOLLOW_declaration_in_declarations77);
            declaration();

            state._fsp--;

            dbg.location(21,17);
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:21:17: ( declarations )?
            int alt1=2;
            try { dbg.enterSubRule(1);
            try { dbg.enterDecision(1);

            int LA1_0 = input.LA(1);

            if ( (LA1_0==IDENT) ) {
                alt1=1;
            }
            } finally {dbg.exitDecision(1);}

            switch (alt1) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:21:17: declarations
                    {
                    dbg.location(21,17);
                    pushFollow(FOLLOW_declarations_in_declarations80);
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
        dbg.location(22, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:24:1: declaration : variable_declaration ;
    public final void declaration() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "declaration");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(24, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:25:2: ( variable_declaration )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:25:4: variable_declaration
            {
            dbg.location(25,4);
            pushFollow(FOLLOW_variable_declaration_in_declaration93);
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
        dbg.location(26, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:30:1: variable_declaration : vars '->' type ';' ;
    public final void variable_declaration() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "variable_declaration");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(30, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:31:2: ( vars '->' type ';' )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:31:4: vars '->' type ';'
            {
            dbg.location(31,4);
            pushFollow(FOLLOW_vars_in_variable_declaration108);
            vars();

            state._fsp--;

            dbg.location(31,9);
            match(input,37,FOLLOW_37_in_variable_declaration110); 
            dbg.location(31,14);
            pushFollow(FOLLOW_type_in_variable_declaration112);
            type();

            state._fsp--;

            dbg.location(31,19);
            match(input,38,FOLLOW_38_in_variable_declaration114); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(32, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:34:1: vars : var ( ',' vars )? ;
    public final void vars() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "vars");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(34, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:34:6: ( var ( ',' vars )? )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:34:8: var ( ',' vars )?
            {
            dbg.location(34,8);
            pushFollow(FOLLOW_var_in_vars125);
            var();

            state._fsp--;

            dbg.location(34,12);
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:34:12: ( ',' vars )?
            int alt2=2;
            try { dbg.enterSubRule(2);
            try { dbg.enterDecision(2);

            int LA2_0 = input.LA(1);

            if ( (LA2_0==39) ) {
                alt2=1;
            }
            } finally {dbg.exitDecision(2);}

            switch (alt2) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:34:13: ',' vars
                    {
                    dbg.location(34,13);
                    match(input,39,FOLLOW_39_in_vars128); 
                    dbg.location(34,17);
                    pushFollow(FOLLOW_vars_in_vars130);
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
        dbg.location(35, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:37:1: var : IDENT value_var ;
    public final void var() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "var");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(37, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:37:5: ( IDENT value_var )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:37:7: IDENT value_var
            {
            dbg.location(37,7);
            match(input,IDENT,FOLLOW_IDENT_in_var142); 
            dbg.location(37,13);
            pushFollow(FOLLOW_value_var_in_var144);
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
        dbg.location(38, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:40:1: value_var : ( ( '=' ) inic_var | );
    public final void value_var() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "value_var");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(40, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:41:2: ( ( '=' ) inic_var | )
            int alt3=2;
            try { dbg.enterDecision(3);

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

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:41:4: ( '=' ) inic_var
                    {
                    dbg.location(41,4);
                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:41:4: ( '=' )
                    dbg.enterAlt(1);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:41:5: '='
                    {
                    dbg.location(41,5);
                    match(input,40,FOLLOW_40_in_value_var157); 

                    }

                    dbg.location(41,10);
                    pushFollow(FOLLOW_inic_var_in_value_var160);
                    inic_var();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:43:2: 
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
        dbg.location(43, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:45:1: type : ( INTEGER | BOOLEAN | ARRAY SIZE NUM );
    public final void type() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "type");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(45, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:45:6: ( INTEGER | BOOLEAN | ARRAY SIZE NUM )
            int alt4=3;
            try { dbg.enterDecision(4);

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

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:45:8: INTEGER
                    {
                    dbg.location(45,8);
                    match(input,INTEGER,FOLLOW_INTEGER_in_type173); 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:46:4: BOOLEAN
                    {
                    dbg.location(46,4);
                    match(input,BOOLEAN,FOLLOW_BOOLEAN_in_type178); 

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:47:4: ARRAY SIZE NUM
                    {
                    dbg.location(47,4);
                    match(input,ARRAY,FOLLOW_ARRAY_in_type183); 
                    dbg.location(47,10);
                    match(input,SIZE,FOLLOW_SIZE_in_type185); 
                    dbg.location(47,15);
                    match(input,NUM,FOLLOW_NUM_in_type187); 

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
        dbg.location(48, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:50:1: inic_var : ( constant | array_definition );
    public final void inic_var() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "inic_var");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(50, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:51:2: ( constant | array_definition )
            int alt5=2;
            try { dbg.enterDecision(5);

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

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:51:4: constant
                    {
                    dbg.location(51,4);
                    pushFollow(FOLLOW_constant_in_inic_var199);
                    constant();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:52:4: array_definition
                    {
                    dbg.location(52,4);
                    pushFollow(FOLLOW_array_definition_in_inic_var204);
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
        dbg.location(53, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:55:1: constant : ( NUM | STRING | TRUE | FALSE );
    public final void constant() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "constant");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(55, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:56:2: ( NUM | STRING | TRUE | FALSE )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(56,2);
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
        dbg.location(60, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:65:1: array_definition : '[' array_initialization ']' ;
    public final void array_definition() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "array_definition");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(65, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:66:2: ( '[' array_initialization ']' )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:66:4: '[' array_initialization ']'
            {
            dbg.location(66,4);
            match(input,41,FOLLOW_41_in_array_definition247); 
            dbg.location(66,8);
            pushFollow(FOLLOW_array_initialization_in_array_definition249);
            array_initialization();

            state._fsp--;

            dbg.location(66,29);
            match(input,42,FOLLOW_42_in_array_definition251); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(67, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:69:1: array_initialization : ( elem ',' array_initialization | elem );
    public final void array_initialization() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "array_initialization");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(69, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:70:2: ( elem ',' array_initialization | elem )
            int alt6=2;
            try { dbg.enterDecision(6);

            int LA6_0 = input.LA(1);

            if ( (LA6_0==NUM) ) {
                int LA6_1 = input.LA(2);

                if ( (LA6_1==42) ) {
                    alt6=2;
                }
                else if ( (LA6_1==39) ) {
                    alt6=1;
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

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:70:4: elem ',' array_initialization
                    {
                    dbg.location(70,4);
                    pushFollow(FOLLOW_elem_in_array_initialization263);
                    elem();

                    state._fsp--;

                    dbg.location(70,10);
                    match(input,39,FOLLOW_39_in_array_initialization266); 
                    dbg.location(70,14);
                    pushFollow(FOLLOW_array_initialization_in_array_initialization268);
                    array_initialization();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:71:5: elem
                    {
                    dbg.location(71,5);
                    pushFollow(FOLLOW_elem_in_array_initialization276);
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
        dbg.location(72, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:74:1: elem : NUM ;
    public final void elem() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "elem");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(74, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:75:2: ( NUM )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:75:4: NUM
            {
            dbg.location(75,4);
            match(input,NUM,FOLLOW_NUM_in_elem287); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(76, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:80:1: statements : ( statement )+ ;
    public final void statements() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "statements");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(80, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:81:2: ( ( statement )+ )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:81:4: ( statement )+
            {
            dbg.location(81,4);
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:81:4: ( statement )+
            int cnt7=0;
            try { dbg.enterSubRule(7);

            loop7:
            do {
                int alt7=2;
                try { dbg.enterDecision(7);

                int LA7_0 = input.LA(1);

                if ( (LA7_0==IDENT||(LA7_0>=FORWARD && LA7_0<=PEN)||(LA7_0>=GOTO && LA7_0<=WHERE)||(LA7_0>=SAY && LA7_0<=WHILE)) ) {
                    alt7=1;
                }


                } finally {dbg.exitDecision(7);}

                switch (alt7) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:81:4: statement
            	    {
            	    dbg.location(81,4);
            	    pushFollow(FOLLOW_statement_in_statements300);
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
        dbg.location(82, 12);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:84:1: statement : ( turtle_commands | assignment | conditional_statement | iterative_statement );
    public final void statement() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "statement");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(84, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:85:2: ( turtle_commands | assignment | conditional_statement | iterative_statement )
            int alt8=4;
            try { dbg.enterDecision(8);

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

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:85:4: turtle_commands
                    {
                    dbg.location(85,4);
                    pushFollow(FOLLOW_turtle_commands_in_statement333);
                    turtle_commands();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:86:5: assignment
                    {
                    dbg.location(86,5);
                    pushFollow(FOLLOW_assignment_in_statement339);
                    assignment();

                    state._fsp--;


                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:87:5: conditional_statement
                    {
                    dbg.location(87,5);
                    pushFollow(FOLLOW_conditional_statement_in_statement345);
                    conditional_statement();

                    state._fsp--;


                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:88:5: iterative_statement
                    {
                    dbg.location(88,5);
                    pushFollow(FOLLOW_iterative_statement_in_statement351);
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
        dbg.location(89, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:92:1: turtle_commands : ( step | rotate | mode | dialogue | location );
    public final void turtle_commands() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "turtle_commands");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(92, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:93:2: ( step | rotate | mode | dialogue | location )
            int alt9=5;
            try { dbg.enterDecision(9);

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

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:93:4: step
                    {
                    dbg.location(93,4);
                    pushFollow(FOLLOW_step_in_turtle_commands364);
                    step();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:94:4: rotate
                    {
                    dbg.location(94,4);
                    pushFollow(FOLLOW_rotate_in_turtle_commands369);
                    rotate();

                    state._fsp--;


                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:95:4: mode
                    {
                    dbg.location(95,4);
                    pushFollow(FOLLOW_mode_in_turtle_commands374);
                    mode();

                    state._fsp--;


                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:96:4: dialogue
                    {
                    dbg.location(96,4);
                    pushFollow(FOLLOW_dialogue_in_turtle_commands379);
                    dialogue();

                    state._fsp--;


                    }
                    break;
                case 5 :
                    dbg.enterAlt(5);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:97:4: location
                    {
                    dbg.location(97,4);
                    pushFollow(FOLLOW_location_in_turtle_commands384);
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
        dbg.location(98, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:100:1: step : ( FORWARD expression | BACKWARD expression );
    public final void step() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "step");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(100, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:101:2: ( FORWARD expression | BACKWARD expression )
            int alt10=2;
            try { dbg.enterDecision(10);

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

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:101:4: FORWARD expression
                    {
                    dbg.location(101,4);
                    match(input,FORWARD,FOLLOW_FORWARD_in_step397); 
                    dbg.location(101,13);
                    pushFollow(FOLLOW_expression_in_step400);
                    expression();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:102:8: BACKWARD expression
                    {
                    dbg.location(102,8);
                    match(input,BACKWARD,FOLLOW_BACKWARD_in_step409); 
                    dbg.location(102,18);
                    pushFollow(FOLLOW_expression_in_step412);
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
        dbg.location(103, 6);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:105:1: rotate : ( RRIGHT | RLEFT );
    public final void rotate() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "rotate");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(105, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:105:8: ( RRIGHT | RLEFT )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(105,8);
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
        dbg.location(107, 8);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:109:1: mode : PEN likeaboss ;
    public final void mode() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "mode");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(109, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:109:7: ( PEN likeaboss )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:109:9: PEN likeaboss
            {
            dbg.location(109,9);
            match(input,PEN,FOLLOW_PEN_in_mode468); 
            dbg.location(109,14);
            pushFollow(FOLLOW_likeaboss_in_mode471);
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
        dbg.location(110, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:112:1: likeaboss : ( UPS | DOWNS ) ;
    public final void likeaboss() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "likeaboss");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(112, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:113:2: ( ( UPS | DOWNS ) )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:113:4: ( UPS | DOWNS )
            {
            dbg.location(113,4);
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
        dbg.location(114, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:116:1: dialogue : ( say_statement | ask_statement );
    public final void dialogue() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "dialogue");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(116, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:116:11: ( say_statement | ask_statement )
            int alt11=2;
            try { dbg.enterDecision(11);

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

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:116:13: say_statement
                    {
                    dbg.location(116,13);
                    pushFollow(FOLLOW_say_statement_in_dialogue498);
                    say_statement();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:117:12: ask_statement
                    {
                    dbg.location(117,12);
                    pushFollow(FOLLOW_ask_statement_in_dialogue511);
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
        dbg.location(118, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:120:1: location : ( GOTO NUM ',' NUM | WHERE '?' );
    public final void location() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "location");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(120, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:120:10: ( GOTO NUM ',' NUM | WHERE '?' )
            int alt12=2;
            try { dbg.enterDecision(12);

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

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:120:12: GOTO NUM ',' NUM
                    {
                    dbg.location(120,12);
                    match(input,GOTO,FOLLOW_GOTO_in_location521); 
                    dbg.location(120,18);
                    match(input,NUM,FOLLOW_NUM_in_location524); 
                    dbg.location(120,23);
                    match(input,39,FOLLOW_39_in_location527); 
                    dbg.location(120,28);
                    match(input,NUM,FOLLOW_NUM_in_location530); 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:121:5: WHERE '?'
                    {
                    dbg.location(121,5);
                    match(input,WHERE,FOLLOW_WHERE_in_location536); 
                    dbg.location(121,11);
                    match(input,43,FOLLOW_43_in_location538); 

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
        dbg.location(122, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:125:1: assignment : variable '=' expression ;
    public final void assignment() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "assignment");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(125, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:126:2: ( variable '=' expression )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:126:4: variable '=' expression
            {
            dbg.location(126,4);
            pushFollow(FOLLOW_variable_in_assignment560);
            variable();

            state._fsp--;

            dbg.location(126,14);
            match(input,40,FOLLOW_40_in_assignment563); 
            dbg.location(126,19);
            pushFollow(FOLLOW_expression_in_assignment566);
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
        dbg.location(127, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:129:1: variable : IDENT ( array_acess )? ;
    public final void variable() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "variable");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(129, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:130:2: ( IDENT ( array_acess )? )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:130:4: IDENT ( array_acess )?
            {
            dbg.location(130,4);
            match(input,IDENT,FOLLOW_IDENT_in_variable577); 
            dbg.location(130,11);
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:130:11: ( array_acess )?
            int alt13=2;
            try { dbg.enterSubRule(13);
            try { dbg.enterDecision(13);

            int LA13_0 = input.LA(1);

            if ( (LA13_0==41) ) {
                alt13=1;
            }
            } finally {dbg.exitDecision(13);}

            switch (alt13) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:130:12: array_acess
                    {
                    dbg.location(130,12);
                    pushFollow(FOLLOW_array_acess_in_variable581);
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
        dbg.location(131, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:133:1: array_acess : '[' single_expression ']' ;
    public final void array_acess() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "array_acess");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(133, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:134:2: ( '[' single_expression ']' )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:134:4: '[' single_expression ']'
            {
            dbg.location(134,4);
            match(input,41,FOLLOW_41_in_array_acess594); 
            dbg.location(134,9);
            pushFollow(FOLLOW_single_expression_in_array_acess597);
            single_expression();

            state._fsp--;

            dbg.location(134,28);
            match(input,42,FOLLOW_42_in_array_acess600); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(135, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:138:1: expression options {k=2; } : single_expression ( rel_op expression )? ;
    public final void expression() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "expression");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(138, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:140:2: ( single_expression ( rel_op expression )? )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:140:4: single_expression ( rel_op expression )?
            {
            dbg.location(140,4);
            pushFollow(FOLLOW_single_expression_in_expression619);
            single_expression();

            state._fsp--;

            dbg.location(140,22);
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:140:22: ( rel_op expression )?
            int alt14=2;
            try { dbg.enterSubRule(14);
            try { dbg.enterDecision(14);

            int LA14_0 = input.LA(1);

            if ( ((LA14_0>=54 && LA14_0<=60)) ) {
                alt14=1;
            }
            } finally {dbg.exitDecision(14);}

            switch (alt14) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:140:23: rel_op expression
                    {
                    dbg.location(140,23);
                    pushFollow(FOLLOW_rel_op_in_expression622);
                    rel_op();

                    state._fsp--;

                    dbg.location(140,31);
                    pushFollow(FOLLOW_expression_in_expression625);
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
        dbg.location(141, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:144:1: single_expression : term ( add_op single_expression )? ;
    public final void single_expression() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "single_expression");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(144, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:145:2: ( term ( add_op single_expression )? )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:145:4: term ( add_op single_expression )?
            {
            dbg.location(145,4);
            pushFollow(FOLLOW_term_in_single_expression639);
            term();

            state._fsp--;

            dbg.location(145,9);
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:145:9: ( add_op single_expression )?
            int alt15=2;
            try { dbg.enterSubRule(15);
            try { dbg.enterDecision(15);

            int LA15_0 = input.LA(1);

            if ( ((LA15_0>=44 && LA15_0<=45)||LA15_0==49) ) {
                alt15=1;
            }
            } finally {dbg.exitDecision(15);}

            switch (alt15) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:145:10: add_op single_expression
                    {
                    dbg.location(145,10);
                    pushFollow(FOLLOW_add_op_in_single_expression642);
                    add_op();

                    state._fsp--;

                    dbg.location(145,17);
                    pushFollow(FOLLOW_single_expression_in_single_expression644);
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
        dbg.location(146, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:149:1: term : factor ( mul_op term )? ;
    public final void term() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "term");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(149, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:150:2: ( factor ( mul_op term )? )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:150:4: factor ( mul_op term )?
            {
            dbg.location(150,4);
            pushFollow(FOLLOW_factor_in_term658);
            factor();

            state._fsp--;

            dbg.location(150,11);
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:150:11: ( mul_op term )?
            int alt16=2;
            try { dbg.enterSubRule(16);
            try { dbg.enterDecision(16);

            int LA16_0 = input.LA(1);

            if ( ((LA16_0>=50 && LA16_0<=53)) ) {
                alt16=1;
            }
            } finally {dbg.exitDecision(16);}

            switch (alt16) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:150:12: mul_op term
                    {
                    dbg.location(150,12);
                    pushFollow(FOLLOW_mul_op_in_term661);
                    mul_op();

                    state._fsp--;

                    dbg.location(150,19);
                    pushFollow(FOLLOW_term_in_term663);
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
        dbg.location(151, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:154:1: factor options {k=3; } : ( constant | variable | succorpred | ( '+' | '-' | '!' )? '(' expression ')' );
    public final void factor() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "factor");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(154, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:156:2: ( constant | variable | succorpred | ( '+' | '-' | '!' )? '(' expression ')' )
            int alt18=4;
            try { dbg.enterDecision(18);

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

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:156:4: constant
                    {
                    dbg.location(156,4);
                    pushFollow(FOLLOW_constant_in_factor685);
                    constant();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:157:4: variable
                    {
                    dbg.location(157,4);
                    pushFollow(FOLLOW_variable_in_factor690);
                    variable();

                    state._fsp--;


                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:158:4: succorpred
                    {
                    dbg.location(158,4);
                    pushFollow(FOLLOW_succorpred_in_factor695);
                    succorpred();

                    state._fsp--;


                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:159:4: ( '+' | '-' | '!' )? '(' expression ')'
                    {
                    dbg.location(159,4);
                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:159:4: ( '+' | '-' | '!' )?
                    int alt17=2;
                    try { dbg.enterSubRule(17);
                    try { dbg.enterDecision(17);

                    int LA17_0 = input.LA(1);

                    if ( ((LA17_0>=44 && LA17_0<=46)) ) {
                        alt17=1;
                    }
                    } finally {dbg.exitDecision(17);}

                    switch (alt17) {
                        case 1 :
                            dbg.enterAlt(1);

                            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
                            {
                            dbg.location(159,4);
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

                    dbg.location(159,19);
                    match(input,47,FOLLOW_47_in_factor709); 
                    dbg.location(159,23);
                    pushFollow(FOLLOW_expression_in_factor711);
                    expression();

                    state._fsp--;

                    dbg.location(159,34);
                    match(input,48,FOLLOW_48_in_factor713); 

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
        dbg.location(160, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:163:1: add_op : ( '+' | '-' | '||' );
    public final void add_op() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "add_op");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(163, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:164:2: ( '+' | '-' | '||' )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(164,2);
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
        dbg.location(167, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:169:1: mul_op : ( '*' | '/' | '&&' | '**' );
    public final void mul_op() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "mul_op");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(169, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:170:2: ( '*' | '/' | '&&' | '**' )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(170,2);
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
        dbg.location(174, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:176:1: rel_op : ( '==' | '!=' | '<' | '>' | '<=' | '>=' | 'in' );
    public final void rel_op() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "rel_op");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(176, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:177:2: ( '==' | '!=' | '<' | '>' | '<=' | '>=' | 'in' )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(177,2);
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
        dbg.location(184, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:187:1: succorpred : succpred IDENT ;
    public final void succorpred() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "succorpred");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(187, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:188:2: ( succpred IDENT )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:188:5: succpred IDENT
            {
            dbg.location(188,5);
            pushFollow(FOLLOW_succpred_in_succorpred903);
            succpred();

            state._fsp--;

            dbg.location(188,15);
            match(input,IDENT,FOLLOW_IDENT_in_succorpred906); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(189, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:191:1: succpred : ( SUCC | PRED );
    public final void succpred() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "succpred");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(191, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:192:2: ( SUCC | PRED )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:
            {
            dbg.location(192,2);
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
        dbg.location(194, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:197:1: say_statement : SAY '(' expression ')' ;
    public final void say_statement() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "say_statement");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(197, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:198:2: ( SAY '(' expression ')' )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:198:4: SAY '(' expression ')'
            {
            dbg.location(198,4);
            match(input,SAY,FOLLOW_SAY_in_say_statement942); 
            dbg.location(198,9);
            match(input,47,FOLLOW_47_in_say_statement945); 
            dbg.location(198,14);
            pushFollow(FOLLOW_expression_in_say_statement948);
            expression();

            state._fsp--;

            dbg.location(198,26);
            match(input,48,FOLLOW_48_in_say_statement951); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(199, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:201:1: ask_statement : ASK '(' STRING ',' variable ')' ;
    public final void ask_statement() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "ask_statement");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(201, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:202:2: ( ASK '(' STRING ',' variable ')' )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:202:4: ASK '(' STRING ',' variable ')'
            {
            dbg.location(202,4);
            match(input,ASK,FOLLOW_ASK_in_ask_statement962); 
            dbg.location(202,9);
            match(input,47,FOLLOW_47_in_ask_statement965); 
            dbg.location(202,14);
            match(input,STRING,FOLLOW_STRING_in_ask_statement968); 
            dbg.location(202,22);
            match(input,39,FOLLOW_39_in_ask_statement971); 
            dbg.location(202,27);
            pushFollow(FOLLOW_variable_in_ask_statement974);
            variable();

            state._fsp--;

            dbg.location(202,37);
            match(input,48,FOLLOW_48_in_ask_statement977); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(203, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:206:1: conditional_statement : ifthenelse_stat ;
    public final void conditional_statement() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "conditional_statement");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(206, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:207:2: ( ifthenelse_stat )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:207:4: ifthenelse_stat
            {
            dbg.location(207,4);
            pushFollow(FOLLOW_ifthenelse_stat_in_conditional_statement989);
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
        dbg.location(208, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:210:1: iterative_statement : while_stat ;
    public final void iterative_statement() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "iterative_statement");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(210, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:211:2: ( while_stat )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:211:4: while_stat
            {
            dbg.location(211,4);
            pushFollow(FOLLOW_while_stat_in_iterative_statement1000);
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
        dbg.location(212, 2);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:215:1: ifthenelse_stat : ( IF expression | THEN '{' statements '}' | else_expression );
    public final void ifthenelse_stat() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "ifthenelse_stat");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(215, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:216:3: ( IF expression | THEN '{' statements '}' | else_expression )
            int alt19=3;
            try { dbg.enterDecision(19);

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

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:216:5: IF expression
                    {
                    dbg.location(216,5);
                    match(input,IF,FOLLOW_IF_in_ifthenelse_stat1015); 
                    dbg.location(216,8);
                    pushFollow(FOLLOW_expression_in_ifthenelse_stat1017);
                    expression();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:217:19: THEN '{' statements '}'
                    {
                    dbg.location(217,19);
                    match(input,THEN,FOLLOW_THEN_in_ifthenelse_stat1037); 
                    dbg.location(217,24);
                    match(input,35,FOLLOW_35_in_ifthenelse_stat1039); 
                    dbg.location(217,29);
                    pushFollow(FOLLOW_statements_in_ifthenelse_stat1042);
                    statements();

                    state._fsp--;

                    dbg.location(217,41);
                    match(input,36,FOLLOW_36_in_ifthenelse_stat1045); 

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:218:18: else_expression
                    {
                    dbg.location(218,18);
                    pushFollow(FOLLOW_else_expression_in_ifthenelse_stat1064);
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
        dbg.location(219, 16);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:221:1: else_expression : ELSE '{' statements '}' ;
    public final void else_expression() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "else_expression");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(221, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:221:17: ( ELSE '{' statements '}' )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:221:20: ELSE '{' statements '}'
            {
            dbg.location(221,20);
            match(input,ELSE,FOLLOW_ELSE_in_else_expression1089); 
            dbg.location(221,25);
            match(input,35,FOLLOW_35_in_else_expression1091); 
            dbg.location(221,30);
            pushFollow(FOLLOW_statements_in_else_expression1094);
            statements();

            state._fsp--;

            dbg.location(221,42);
            match(input,36,FOLLOW_36_in_else_expression1097); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(222, 3);

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
    // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:225:1: while_stat : WHILE '(' expression ')' '{' statements '}' ;
    public final void while_stat() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "while_stat");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(225, 1);

        try {
            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:226:3: ( WHILE '(' expression ')' '{' statements '}' )
            dbg.enterAlt(1);

            // /home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/logoliss.g:226:5: WHILE '(' expression ')' '{' statements '}'
            {
            dbg.location(226,5);
            match(input,WHILE,FOLLOW_WHILE_in_while_stat1111); 
            dbg.location(226,11);
            match(input,47,FOLLOW_47_in_while_stat1113); 
            dbg.location(226,16);
            pushFollow(FOLLOW_expression_in_while_stat1116);
            expression();

            state._fsp--;

            dbg.location(226,28);
            match(input,48,FOLLOW_48_in_while_stat1119); 
            dbg.location(226,33);
            match(input,35,FOLLOW_35_in_while_stat1122); 
            dbg.location(226,38);
            pushFollow(FOLLOW_statements_in_while_stat1125);
            statements();

            state._fsp--;

            dbg.location(226,50);
            match(input,36,FOLLOW_36_in_while_stat1128); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(227, 3);

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


 

    public static final BitSet FOLLOW_PROGRAM_in_logoliss31 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_IDENT_in_logoliss33 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_35_in_logoliss36 = new BitSet(new long[]{0x0000000000000100L});
    public static final BitSet FOLLOW_body_in_logoliss38 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_36_in_logoliss40 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_DECLARATIONS_in_body53 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_declarations_in_body56 = new BitSet(new long[]{0x0000000000000200L});
    public static final BitSet FOLLOW_STATEMENTS_in_body60 = new BitSet(new long[]{0x00000001F99F0080L});
    public static final BitSet FOLLOW_statements_in_body63 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_declaration_in_declarations77 = new BitSet(new long[]{0x0000000000000082L});
    public static final BitSet FOLLOW_declarations_in_declarations80 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_variable_declaration_in_declaration93 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_vars_in_variable_declaration108 = new BitSet(new long[]{0x0000002000000000L});
    public static final BitSet FOLLOW_37_in_variable_declaration110 = new BitSet(new long[]{0x0000000000001C00L});
    public static final BitSet FOLLOW_type_in_variable_declaration112 = new BitSet(new long[]{0x0000004000000000L});
    public static final BitSet FOLLOW_38_in_variable_declaration114 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_var_in_vars125 = new BitSet(new long[]{0x0000008000000002L});
    public static final BitSet FOLLOW_39_in_vars128 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_vars_in_vars130 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IDENT_in_var142 = new BitSet(new long[]{0x0000010000000000L});
    public static final BitSet FOLLOW_value_var_in_var144 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_40_in_value_var157 = new BitSet(new long[]{0x000002000000C030L});
    public static final BitSet FOLLOW_inic_var_in_value_var160 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INTEGER_in_type173 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_BOOLEAN_in_type178 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ARRAY_in_type183 = new BitSet(new long[]{0x0000000000002000L});
    public static final BitSet FOLLOW_SIZE_in_type185 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_NUM_in_type187 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_constant_in_inic_var199 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_array_definition_in_inic_var204 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_constant0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_41_in_array_definition247 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_array_initialization_in_array_definition249 = new BitSet(new long[]{0x0000040000000000L});
    public static final BitSet FOLLOW_42_in_array_definition251 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_elem_in_array_initialization263 = new BitSet(new long[]{0x0000008000000000L});
    public static final BitSet FOLLOW_39_in_array_initialization266 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_array_initialization_in_array_initialization268 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_elem_in_array_initialization276 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUM_in_elem287 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_statements300 = new BitSet(new long[]{0x00000001F99F0082L});
    public static final BitSet FOLLOW_turtle_commands_in_statement333 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_assignment_in_statement339 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_conditional_statement_in_statement345 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_iterative_statement_in_statement351 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_step_in_turtle_commands364 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rotate_in_turtle_commands369 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_mode_in_turtle_commands374 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_dialogue_in_turtle_commands379 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_location_in_turtle_commands384 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_FORWARD_in_step397 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_step400 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_BACKWARD_in_step409 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_step412 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_rotate0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_PEN_in_mode468 = new BitSet(new long[]{0x0000000000600000L});
    public static final BitSet FOLLOW_likeaboss_in_mode471 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_likeaboss482 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_say_statement_in_dialogue498 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ask_statement_in_dialogue511 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_GOTO_in_location521 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_NUM_in_location524 = new BitSet(new long[]{0x0000008000000000L});
    public static final BitSet FOLLOW_39_in_location527 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_NUM_in_location530 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_WHERE_in_location536 = new BitSet(new long[]{0x0000080000000000L});
    public static final BitSet FOLLOW_43_in_location538 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_variable_in_assignment560 = new BitSet(new long[]{0x0000010000000000L});
    public static final BitSet FOLLOW_40_in_assignment563 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_assignment566 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IDENT_in_variable577 = new BitSet(new long[]{0x0000020000000002L});
    public static final BitSet FOLLOW_array_acess_in_variable581 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_41_in_array_acess594 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_single_expression_in_array_acess597 = new BitSet(new long[]{0x0000040000000000L});
    public static final BitSet FOLLOW_42_in_array_acess600 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_single_expression_in_expression619 = new BitSet(new long[]{0x1FC0000000000002L});
    public static final BitSet FOLLOW_rel_op_in_expression622 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_expression625 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_term_in_single_expression639 = new BitSet(new long[]{0x0002300000000002L});
    public static final BitSet FOLLOW_add_op_in_single_expression642 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_single_expression_in_single_expression644 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_factor_in_term658 = new BitSet(new long[]{0x003C000000000002L});
    public static final BitSet FOLLOW_mul_op_in_term661 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_term_in_term663 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_constant_in_factor685 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_variable_in_factor690 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_succorpred_in_factor695 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_factor700 = new BitSet(new long[]{0x0000800000000000L});
    public static final BitSet FOLLOW_47_in_factor709 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_factor711 = new BitSet(new long[]{0x0001000000000000L});
    public static final BitSet FOLLOW_48_in_factor713 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_add_op0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_mul_op0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_rel_op0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_succpred_in_succorpred903 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_IDENT_in_succorpred906 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_succpred0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_SAY_in_say_statement942 = new BitSet(new long[]{0x0000800000000000L});
    public static final BitSet FOLLOW_47_in_say_statement945 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_say_statement948 = new BitSet(new long[]{0x0001000000000000L});
    public static final BitSet FOLLOW_48_in_say_statement951 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ASK_in_ask_statement962 = new BitSet(new long[]{0x0000800000000000L});
    public static final BitSet FOLLOW_47_in_ask_statement965 = new BitSet(new long[]{0x0000000000008000L});
    public static final BitSet FOLLOW_STRING_in_ask_statement968 = new BitSet(new long[]{0x0000008000000000L});
    public static final BitSet FOLLOW_39_in_ask_statement971 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_variable_in_ask_statement974 = new BitSet(new long[]{0x0001000000000000L});
    public static final BitSet FOLLOW_48_in_ask_statement977 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ifthenelse_stat_in_conditional_statement989 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_while_stat_in_iterative_statement1000 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IF_in_ifthenelse_stat1015 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_ifthenelse_stat1017 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_THEN_in_ifthenelse_stat1037 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_35_in_ifthenelse_stat1039 = new BitSet(new long[]{0x00000001F99F0080L});
    public static final BitSet FOLLOW_statements_in_ifthenelse_stat1042 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_36_in_ifthenelse_stat1045 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_else_expression_in_ifthenelse_stat1064 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ELSE_in_else_expression1089 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_35_in_else_expression1091 = new BitSet(new long[]{0x00000001F99F0080L});
    public static final BitSet FOLLOW_statements_in_else_expression1094 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_36_in_else_expression1097 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_WHILE_in_while_stat1111 = new BitSet(new long[]{0x0000800000000000L});
    public static final BitSet FOLLOW_47_in_while_stat1113 = new BitSet(new long[]{0x0000F0000600C0B0L});
    public static final BitSet FOLLOW_expression_in_while_stat1116 = new BitSet(new long[]{0x0001000000000000L});
    public static final BitSet FOLLOW_48_in_while_stat1119 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_35_in_while_stat1122 = new BitSet(new long[]{0x00000001F99F0080L});
    public static final BitSet FOLLOW_statements_in_while_stat1125 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_36_in_while_stat1128 = new BitSet(new long[]{0x0000000000000002L});

}