grammar Lisp1;

nonterminal Lisp, SExp, SExpList;

synthesized attribute output :: String;
synthesized attribute outputOp :: String;

attribute output occurs on Lisp, SExp, SExpList;

concrete production program
ls::Lisp ::= se::SExp
{ls.output = se.output; }

concrete production symbolicExp1
se::SExp ::= pl::Pal
{se.output = "palavra "; }

concrete production symbolicExp2
se::SExp ::= nm::Num
{se.output = "numero "; }

concrete production symbolicExp3
se::SExp ::= '(' sel::SExpList ')'
{se.output = "[ " ++ sel.output  ++ "]\n"; }

concrete production symbolicExpList1
sel::SExpList ::= se::SExp tl::SExpList
{sel.output = se.output ++ " " ++ tl.output; }

concrete production symbolicExpList2
sel::SExpList ::=
{sel.output = ""; }

