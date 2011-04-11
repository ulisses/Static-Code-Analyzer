import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.debug.DebugEventSocketProxy;


public class __Test__ {

    public static void main(String args[]) throws Exception {
        logolissLexer lex = new logolissLexer(new ANTLRFileStream("/Users/ulissesaraujocosta/ulisses/univ/msc/el/pi/Static-Code-Analyzer/AulasEG/LogoLISS/output/__Test___input.txt", "UTF8"));
        CommonTokenStream tokens = new CommonTokenStream(lex);

        logolissParser g = new logolissParser(tokens, 49100, null);
        try {
            g.logoliss();
        } catch (RecognitionException e) {
            e.printStackTrace();
        }
    }
}