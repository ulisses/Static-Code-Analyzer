grammar Lisp1 ;

parser gParse :: Lisp { Lisp1 ; } 

function main
IO ::= args::String io1::IO
{
 production attribute isF :: IOBoolean;
 isF = isFile(args, io1);
  
 production attribute text :: IOString;
 text = readFile(args, isF.io);

 local attribute tree::Lisp ;
 tree = gParse ( text.sValue) ;

 return
   if   ! isF.bValue
   then error ("\n\nFile \"" ++ args ++ "\" not found.\n\n")
   else print (tree.output, text.io );
}

synthesized attribute canParse :: Boolean occurs on  Lisp;

aspect production program
ls::Lisp ::= se::SExp
{ ls.canParse = true ; }

