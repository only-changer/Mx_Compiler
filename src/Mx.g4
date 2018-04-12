grammar Mx;

//parser

allin   :   (defs )* EOF ;

defs : defun | defvars | defclass;

varname :   ID;

defvars :   type  varname ('='  expr)? ';' ;

typename:   ID;

type    :   (basetype | typename)  ('[]')* ;

basetype:   ('int' | 'bool' | 'void' | 'string') ;

classname
        :   ID
        ;

defclass:   'class' classname '{' (defun | defvars)* '}';

funname :   ID;

defun   :   type funname '(' params ')' block ;

params  :   (param  (',' param)*)? ;

param   :   type ID ;

block   :   '{' stmt* '}' ;

stmt    :   block
        |   'if' '(' expr ')' stmt ('else' stmt)?
        |   'for' '(' expr? ';' expr? ';' expr? ')' stmt
        |   'while' '(' expr? ')' stmt
        |   'return' expr? ';'
        |   'break' ';'
        |   'continue' ';'
        |   defvars
        |   ';'
        |   expr ';'    ;

exprs   :   expr(',' expr)* ;

numname : basetype | typename;

combine :   numname ('[' expr ']')+;

expr    :   funname '(' exprs? ')'
        |   'new' news
        |   combine
        |   expr '.' expr
        |   ('++' | '--') expr
        |   ('-' | '!' | '~') expr
        |   expr ('++'  | '--')
        |   expr ('*' | '/' | '%') expr
        |   expr ('+' |'-' ) expr
        |   expr ('>>' | '<<') expr
        |   expr '&' expr
        |   expr '^' expr
        |   expr '|' expr
        |   expr ('>' | '<' | '>=' | '<=' | '==' | '!=') expr
        |   expr '&&' expr
        |   expr '||' expr
        |   expr '?' expr ':' expr
        |   varname
        |   NUM
        |   STR
        |   ('NULL' | 'null')
        |   ('TRUE' | 'true' | 'FALSE' | 'false')
        |   '(' expr ')'
        |   <assoc=right> expr '=' expr     ;

news     :   varname '(' exprs ')'
        |   (classname | 'int' | 'string') ('[' expr ']')+ ('[]')*
        |   (classname | 'int' | 'string') ('[]')+  ;

//lexxer

STR : '"' ('\\"' | ~'"')* '"';

ID
    :	[a-zA-Z_] [a-zA-Z_0-9]*
    ;

NUM :  [1-9] [0-9]* | '0' ;

WS : ( ' ' | '\t' | '\n' | '\r' ) + -> skip;

LINE_COMMENT
    : '//' ~[\r\n]* -> skip
    ;


