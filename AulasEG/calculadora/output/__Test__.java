import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.debug.DebugEventSocketProxy;


public class __Test__ {

    public static void main(String args[]) throws Exception {
        calc_betterLexer lex = new calc_betterLexer(new ANTLRFileStream("/Users/Pedro/Dropbox/MEI/EL/PI/Static-Code-Analyzer/AulasEG/calculadora/output/__Test___input.txt", "UTF8"));
        CommonTokenStream tokens = new CommonTokenStream(lex);

        calc_betterParser g = new calc_betterParser(tokens, 49100, null);
        try {
            g.language();
        } catch (RecognitionException e) {
            e.printStackTrace();
        }
    }
}