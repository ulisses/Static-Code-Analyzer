// $ANTLR 3.3 Nov 30, 2010 12:45:30 /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g 2011-03-21 23:43:45

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class calc_betterLexer extends Lexer {
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

    public calc_betterLexer() {;} 
    public calc_betterLexer(CharStream input) {
        this(input, new RecognizerSharedState());
    }
    public calc_betterLexer(CharStream input, RecognizerSharedState state) {
        super(input,state);

    }
    public String getGrammarFileName() { return "/Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g"; }

    // $ANTLR start "T__12"
    public final void mT__12() throws RecognitionException {
        try {
            int _type = T__12;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:3:7: ( ';' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:3:9: ';'
            {
            match(';'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__12"

    // $ANTLR start "T__13"
    public final void mT__13() throws RecognitionException {
        try {
            int _type = T__13;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:4:7: ( '=' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:4:9: '='
            {
            match('='); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__13"

    // $ANTLR start "T__14"
    public final void mT__14() throws RecognitionException {
        try {
            int _type = T__14;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:5:7: ( '?' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:5:9: '?'
            {
            match('?'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__14"

    // $ANTLR start "T__15"
    public final void mT__15() throws RecognitionException {
        try {
            int _type = T__15;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:6:7: ( '!' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:6:9: '!'
            {
            match('!'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__15"

    // $ANTLR start "T__16"
    public final void mT__16() throws RecognitionException {
        try {
            int _type = T__16;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:7:7: ( '(' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:7:9: '('
            {
            match('('); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__16"

    // $ANTLR start "T__17"
    public final void mT__17() throws RecognitionException {
        try {
            int _type = T__17;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:8:7: ( ')' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:8:9: ')'
            {
            match(')'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__17"

    // $ANTLR start "T__18"
    public final void mT__18() throws RecognitionException {
        try {
            int _type = T__18;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:9:7: ( '+' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:9:9: '+'
            {
            match('+'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__18"

    // $ANTLR start "T__19"
    public final void mT__19() throws RecognitionException {
        try {
            int _type = T__19;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:10:7: ( '-' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:10:9: '-'
            {
            match('-'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__19"

    // $ANTLR start "T__20"
    public final void mT__20() throws RecognitionException {
        try {
            int _type = T__20;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:11:7: ( '*' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:11:9: '*'
            {
            match('*'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__20"

    // $ANTLR start "T__21"
    public final void mT__21() throws RecognitionException {
        try {
            int _type = T__21;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:12:7: ( 'div' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:12:9: 'div'
            {
            match("div"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__21"

    // $ANTLR start "Type_Int"
    public final void mType_Int() throws RecognitionException {
        try {
            int _type = Type_Int;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:139:9: ( 'int' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:139:12: 'int'
            {
            match("int"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "Type_Int"

    // $ANTLR start "Type_Real"
    public final void mType_Real() throws RecognitionException {
        try {
            int _type = Type_Real;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:143:2: ( 'real' )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:143:4: 'real'
            {
            match("real"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "Type_Real"

    // $ANTLR start "ID"
    public final void mID() throws RecognitionException {
        try {
            int _type = ID;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:147:5: ( ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )* )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:147:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
            {
            if ( (input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:147:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( ((LA1_0>='0' && LA1_0<='9')||(LA1_0>='A' && LA1_0<='Z')||LA1_0=='_'||(LA1_0>='a' && LA1_0<='z')) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:
            	    {
            	    if ( (input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "ID"

    // $ANTLR start "INT"
    public final void mINT() throws RecognitionException {
        try {
            int _type = INT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:150:5: ( ( '0' .. '9' )+ )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:150:7: ( '0' .. '9' )+
            {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:150:7: ( '0' .. '9' )+
            int cnt2=0;
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);

                if ( ((LA2_0>='0' && LA2_0<='9')) ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:150:7: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

            	    }
            	    break;

            	default :
            	    if ( cnt2 >= 1 ) break loop2;
                        EarlyExitException eee =
                            new EarlyExitException(2, input);
                        throw eee;
                }
                cnt2++;
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "INT"

    // $ANTLR start "FLOAT"
    public final void mFLOAT() throws RecognitionException {
        try {
            int _type = FLOAT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:154:5: ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT )
            int alt9=3;
            alt9 = dfa9.predict(input);
            switch (alt9) {
                case 1 :
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:154:9: ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
                    {
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:154:9: ( '0' .. '9' )+
                    int cnt3=0;
                    loop3:
                    do {
                        int alt3=2;
                        int LA3_0 = input.LA(1);

                        if ( ((LA3_0>='0' && LA3_0<='9')) ) {
                            alt3=1;
                        }


                        switch (alt3) {
                    	case 1 :
                    	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:154:10: '0' .. '9'
                    	    {
                    	    matchRange('0','9'); 

                    	    }
                    	    break;

                    	default :
                    	    if ( cnt3 >= 1 ) break loop3;
                                EarlyExitException eee =
                                    new EarlyExitException(3, input);
                                throw eee;
                        }
                        cnt3++;
                    } while (true);

                    match('.'); 
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:154:25: ( '0' .. '9' )*
                    loop4:
                    do {
                        int alt4=2;
                        int LA4_0 = input.LA(1);

                        if ( ((LA4_0>='0' && LA4_0<='9')) ) {
                            alt4=1;
                        }


                        switch (alt4) {
                    	case 1 :
                    	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:154:26: '0' .. '9'
                    	    {
                    	    matchRange('0','9'); 

                    	    }
                    	    break;

                    	default :
                    	    break loop4;
                        }
                    } while (true);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:154:37: ( EXPONENT )?
                    int alt5=2;
                    int LA5_0 = input.LA(1);

                    if ( (LA5_0=='E'||LA5_0=='e') ) {
                        alt5=1;
                    }
                    switch (alt5) {
                        case 1 :
                            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:154:37: EXPONENT
                            {
                            mEXPONENT(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:155:9: '.' ( '0' .. '9' )+ ( EXPONENT )?
                    {
                    match('.'); 
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:155:13: ( '0' .. '9' )+
                    int cnt6=0;
                    loop6:
                    do {
                        int alt6=2;
                        int LA6_0 = input.LA(1);

                        if ( ((LA6_0>='0' && LA6_0<='9')) ) {
                            alt6=1;
                        }


                        switch (alt6) {
                    	case 1 :
                    	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:155:14: '0' .. '9'
                    	    {
                    	    matchRange('0','9'); 

                    	    }
                    	    break;

                    	default :
                    	    if ( cnt6 >= 1 ) break loop6;
                                EarlyExitException eee =
                                    new EarlyExitException(6, input);
                                throw eee;
                        }
                        cnt6++;
                    } while (true);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:155:25: ( EXPONENT )?
                    int alt7=2;
                    int LA7_0 = input.LA(1);

                    if ( (LA7_0=='E'||LA7_0=='e') ) {
                        alt7=1;
                    }
                    switch (alt7) {
                        case 1 :
                            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:155:25: EXPONENT
                            {
                            mEXPONENT(); 

                            }
                            break;

                    }


                    }
                    break;
                case 3 :
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:156:9: ( '0' .. '9' )+ EXPONENT
                    {
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:156:9: ( '0' .. '9' )+
                    int cnt8=0;
                    loop8:
                    do {
                        int alt8=2;
                        int LA8_0 = input.LA(1);

                        if ( ((LA8_0>='0' && LA8_0<='9')) ) {
                            alt8=1;
                        }


                        switch (alt8) {
                    	case 1 :
                    	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:156:10: '0' .. '9'
                    	    {
                    	    matchRange('0','9'); 

                    	    }
                    	    break;

                    	default :
                    	    if ( cnt8 >= 1 ) break loop8;
                                EarlyExitException eee =
                                    new EarlyExitException(8, input);
                                throw eee;
                        }
                        cnt8++;
                    } while (true);

                    mEXPONENT(); 

                    }
                    break;

            }
            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "FLOAT"

    // $ANTLR start "COMMENT"
    public final void mCOMMENT() throws RecognitionException {
        try {
            int _type = COMMENT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:160:5: ( '//' (~ ( '\\n' | '\\r' ) )* ( '\\r' )? '\\n' | '/*' ( options {greedy=false; } : . )* '*/' )
            int alt13=2;
            int LA13_0 = input.LA(1);

            if ( (LA13_0=='/') ) {
                int LA13_1 = input.LA(2);

                if ( (LA13_1=='/') ) {
                    alt13=1;
                }
                else if ( (LA13_1=='*') ) {
                    alt13=2;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 13, 1, input);

                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 13, 0, input);

                throw nvae;
            }
            switch (alt13) {
                case 1 :
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:160:9: '//' (~ ( '\\n' | '\\r' ) )* ( '\\r' )? '\\n'
                    {
                    match("//"); 

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:160:14: (~ ( '\\n' | '\\r' ) )*
                    loop10:
                    do {
                        int alt10=2;
                        int LA10_0 = input.LA(1);

                        if ( ((LA10_0>='\u0000' && LA10_0<='\t')||(LA10_0>='\u000B' && LA10_0<='\f')||(LA10_0>='\u000E' && LA10_0<='\uFFFF')) ) {
                            alt10=1;
                        }


                        switch (alt10) {
                    	case 1 :
                    	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:160:14: ~ ( '\\n' | '\\r' )
                    	    {
                    	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='\t')||(input.LA(1)>='\u000B' && input.LA(1)<='\f')||(input.LA(1)>='\u000E' && input.LA(1)<='\uFFFF') ) {
                    	        input.consume();

                    	    }
                    	    else {
                    	        MismatchedSetException mse = new MismatchedSetException(null,input);
                    	        recover(mse);
                    	        throw mse;}


                    	    }
                    	    break;

                    	default :
                    	    break loop10;
                        }
                    } while (true);

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:160:28: ( '\\r' )?
                    int alt11=2;
                    int LA11_0 = input.LA(1);

                    if ( (LA11_0=='\r') ) {
                        alt11=1;
                    }
                    switch (alt11) {
                        case 1 :
                            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:160:28: '\\r'
                            {
                            match('\r'); 

                            }
                            break;

                    }

                    match('\n'); 
                    _channel=HIDDEN;

                    }
                    break;
                case 2 :
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:161:9: '/*' ( options {greedy=false; } : . )* '*/'
                    {
                    match("/*"); 

                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:161:14: ( options {greedy=false; } : . )*
                    loop12:
                    do {
                        int alt12=2;
                        int LA12_0 = input.LA(1);

                        if ( (LA12_0=='*') ) {
                            int LA12_1 = input.LA(2);

                            if ( (LA12_1=='/') ) {
                                alt12=2;
                            }
                            else if ( ((LA12_1>='\u0000' && LA12_1<='.')||(LA12_1>='0' && LA12_1<='\uFFFF')) ) {
                                alt12=1;
                            }


                        }
                        else if ( ((LA12_0>='\u0000' && LA12_0<=')')||(LA12_0>='+' && LA12_0<='\uFFFF')) ) {
                            alt12=1;
                        }


                        switch (alt12) {
                    	case 1 :
                    	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:161:42: .
                    	    {
                    	    matchAny(); 

                    	    }
                    	    break;

                    	default :
                    	    break loop12;
                        }
                    } while (true);

                    match("*/"); 

                    _channel=HIDDEN;

                    }
                    break;

            }
            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "COMMENT"

    // $ANTLR start "WS"
    public final void mWS() throws RecognitionException {
        try {
            int _type = WS;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:164:5: ( ( ' ' | '\\t' | '\\r' | '\\n' ) )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:164:9: ( ' ' | '\\t' | '\\r' | '\\n' )
            {
            if ( (input.LA(1)>='\t' && input.LA(1)<='\n')||input.LA(1)=='\r'||input.LA(1)==' ' ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

            _channel=HIDDEN;

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "WS"

    // $ANTLR start "EXPONENT"
    public final void mEXPONENT() throws RecognitionException {
        try {
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:172:10: ( ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+ )
            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:172:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
            {
            if ( input.LA(1)=='E'||input.LA(1)=='e' ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:172:22: ( '+' | '-' )?
            int alt14=2;
            int LA14_0 = input.LA(1);

            if ( (LA14_0=='+'||LA14_0=='-') ) {
                alt14=1;
            }
            switch (alt14) {
                case 1 :
                    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:
                    {
                    if ( input.LA(1)=='+'||input.LA(1)=='-' ) {
                        input.consume();

                    }
                    else {
                        MismatchedSetException mse = new MismatchedSetException(null,input);
                        recover(mse);
                        throw mse;}


                    }
                    break;

            }

            // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:172:33: ( '0' .. '9' )+
            int cnt15=0;
            loop15:
            do {
                int alt15=2;
                int LA15_0 = input.LA(1);

                if ( ((LA15_0>='0' && LA15_0<='9')) ) {
                    alt15=1;
                }


                switch (alt15) {
            	case 1 :
            	    // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:172:34: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

            	    }
            	    break;

            	default :
            	    if ( cnt15 >= 1 ) break loop15;
                        EarlyExitException eee =
                            new EarlyExitException(15, input);
                        throw eee;
                }
                cnt15++;
            } while (true);


            }

        }
        finally {
        }
    }
    // $ANTLR end "EXPONENT"

    public void mTokens() throws RecognitionException {
        // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:8: ( T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | T__20 | T__21 | Type_Int | Type_Real | ID | INT | FLOAT | COMMENT | WS )
        int alt16=17;
        alt16 = dfa16.predict(input);
        switch (alt16) {
            case 1 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:10: T__12
                {
                mT__12(); 

                }
                break;
            case 2 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:16: T__13
                {
                mT__13(); 

                }
                break;
            case 3 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:22: T__14
                {
                mT__14(); 

                }
                break;
            case 4 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:28: T__15
                {
                mT__15(); 

                }
                break;
            case 5 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:34: T__16
                {
                mT__16(); 

                }
                break;
            case 6 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:40: T__17
                {
                mT__17(); 

                }
                break;
            case 7 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:46: T__18
                {
                mT__18(); 

                }
                break;
            case 8 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:52: T__19
                {
                mT__19(); 

                }
                break;
            case 9 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:58: T__20
                {
                mT__20(); 

                }
                break;
            case 10 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:64: T__21
                {
                mT__21(); 

                }
                break;
            case 11 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:70: Type_Int
                {
                mType_Int(); 

                }
                break;
            case 12 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:79: Type_Real
                {
                mType_Real(); 

                }
                break;
            case 13 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:89: ID
                {
                mID(); 

                }
                break;
            case 14 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:92: INT
                {
                mINT(); 

                }
                break;
            case 15 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:96: FLOAT
                {
                mFLOAT(); 

                }
                break;
            case 16 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:102: COMMENT
                {
                mCOMMENT(); 

                }
                break;
            case 17 :
                // /Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/calc_better.g:1:110: WS
                {
                mWS(); 

                }
                break;

        }

    }


    protected DFA9 dfa9 = new DFA9(this);
    protected DFA16 dfa16 = new DFA16(this);
    static final String DFA9_eotS =
        "\5\uffff";
    static final String DFA9_eofS =
        "\5\uffff";
    static final String DFA9_minS =
        "\2\56\3\uffff";
    static final String DFA9_maxS =
        "\1\71\1\145\3\uffff";
    static final String DFA9_acceptS =
        "\2\uffff\1\2\1\1\1\3";
    static final String DFA9_specialS =
        "\5\uffff}>";
    static final String[] DFA9_transitionS = {
            "\1\2\1\uffff\12\1",
            "\1\3\1\uffff\12\1\13\uffff\1\4\37\uffff\1\4",
            "",
            "",
            ""
    };

    static final short[] DFA9_eot = DFA.unpackEncodedString(DFA9_eotS);
    static final short[] DFA9_eof = DFA.unpackEncodedString(DFA9_eofS);
    static final char[] DFA9_min = DFA.unpackEncodedStringToUnsignedChars(DFA9_minS);
    static final char[] DFA9_max = DFA.unpackEncodedStringToUnsignedChars(DFA9_maxS);
    static final short[] DFA9_accept = DFA.unpackEncodedString(DFA9_acceptS);
    static final short[] DFA9_special = DFA.unpackEncodedString(DFA9_specialS);
    static final short[][] DFA9_transition;

    static {
        int numStates = DFA9_transitionS.length;
        DFA9_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA9_transition[i] = DFA.unpackEncodedString(DFA9_transitionS[i]);
        }
    }

    class DFA9 extends DFA {

        public DFA9(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 9;
            this.eot = DFA9_eot;
            this.eof = DFA9_eof;
            this.min = DFA9_min;
            this.max = DFA9_max;
            this.accept = DFA9_accept;
            this.special = DFA9_special;
            this.transition = DFA9_transition;
        }
        public String getDescription() {
            return "153:1: FLOAT : ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT );";
        }
    }
    static final String DFA16_eotS =
        "\12\uffff\3\15\1\uffff\1\25\3\uffff\3\15\1\uffff\1\31\1\32\1\15"+
        "\2\uffff\1\34\1\uffff";
    static final String DFA16_eofS =
        "\35\uffff";
    static final String DFA16_minS =
        "\1\11\11\uffff\1\151\1\156\1\145\1\uffff\1\56\3\uffff\1\166\1\164"+
        "\1\141\1\uffff\2\60\1\154\2\uffff\1\60\1\uffff";
    static final String DFA16_maxS =
        "\1\172\11\uffff\1\151\1\156\1\145\1\uffff\1\145\3\uffff\1\166\1"+
        "\164\1\141\1\uffff\2\172\1\154\2\uffff\1\172\1\uffff";
    static final String DFA16_acceptS =
        "\1\uffff\1\1\1\2\1\3\1\4\1\5\1\6\1\7\1\10\1\11\3\uffff\1\15\1\uffff"+
        "\1\17\1\20\1\21\3\uffff\1\16\3\uffff\1\12\1\13\1\uffff\1\14";
    static final String DFA16_specialS =
        "\35\uffff}>";
    static final String[] DFA16_transitionS = {
            "\2\21\2\uffff\1\21\22\uffff\1\21\1\4\6\uffff\1\5\1\6\1\11\1"+
            "\7\1\uffff\1\10\1\17\1\20\12\16\1\uffff\1\1\1\uffff\1\2\1\uffff"+
            "\1\3\1\uffff\32\15\4\uffff\1\15\1\uffff\3\15\1\12\4\15\1\13"+
            "\10\15\1\14\10\15",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "\1\22",
            "\1\23",
            "\1\24",
            "",
            "\1\17\1\uffff\12\16\13\uffff\1\17\37\uffff\1\17",
            "",
            "",
            "",
            "\1\26",
            "\1\27",
            "\1\30",
            "",
            "\12\15\7\uffff\32\15\4\uffff\1\15\1\uffff\32\15",
            "\12\15\7\uffff\32\15\4\uffff\1\15\1\uffff\32\15",
            "\1\33",
            "",
            "",
            "\12\15\7\uffff\32\15\4\uffff\1\15\1\uffff\32\15",
            ""
    };

    static final short[] DFA16_eot = DFA.unpackEncodedString(DFA16_eotS);
    static final short[] DFA16_eof = DFA.unpackEncodedString(DFA16_eofS);
    static final char[] DFA16_min = DFA.unpackEncodedStringToUnsignedChars(DFA16_minS);
    static final char[] DFA16_max = DFA.unpackEncodedStringToUnsignedChars(DFA16_maxS);
    static final short[] DFA16_accept = DFA.unpackEncodedString(DFA16_acceptS);
    static final short[] DFA16_special = DFA.unpackEncodedString(DFA16_specialS);
    static final short[][] DFA16_transition;

    static {
        int numStates = DFA16_transitionS.length;
        DFA16_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA16_transition[i] = DFA.unpackEncodedString(DFA16_transitionS[i]);
        }
    }

    class DFA16 extends DFA {

        public DFA16(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 16;
            this.eot = DFA16_eot;
            this.eof = DFA16_eof;
            this.min = DFA16_min;
            this.max = DFA16_max;
            this.accept = DFA16_accept;
            this.special = DFA16_special;
            this.transition = DFA16_transition;
        }
        public String getDescription() {
            return "1:1: Tokens : ( T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | T__20 | T__21 | Type_Int | Type_Real | ID | INT | FLOAT | COMMENT | WS );";
        }
    }
 

}