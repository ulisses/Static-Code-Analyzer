import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.debug.DebugEventSocketProxy;


public class __Test__ {

    public static void main(String args[]) throws Exception {
        logolissLexer lex = new logolissLexer(new ANTLRFileStream("/home/oitenta/ELPI/Static-Code-Analyzer/AulasEG/LogoLISS/output/__Test___input.txt"));
        CommonTokenStream tokens = new CommonTokenStream(lex);

        logolissParser g = new logolissParser(tokens, 49100, null);
        try {
            g.logoliss();
        } catch (RecognitionException e) {
            e.printStackTrace();
        }
    }
}