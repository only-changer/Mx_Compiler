grammar Mx;

//parser

allin   :   (defs )* EOF ;

defs : defun | defvars | defclass;

varname :   ID;

defvars :   defvar ';' ;

defvar  :   type  varname ('='  expr)? ;

typename:   ID;

type    :   (basetype | typename)  ('[' ']')* ;

basetype:   ('int' | 'bool' | 'void' | 'string') ;

classname
        :   ID
        ;

defclass:   'class' classname '{'
        (    fun = ID  '(' ')' block
            | defun
            | defvars
            )* '}';

funname :   ID;

defun   :   type funname '(' params ')' block ;

params  :   (param  (',' param)*)? ;

param   :   defvar ;

block   :   '{' stmt* '}' ;

stmt    :   block
        |   op = 'if' '(' expr ')' stmt ( 'else' stmt)?
        |   opf = 'for' '(' expr? ';' expr? ';' expr? ')' stmt
        |   opw = 'while' '(' expr? ')' stmt
        |   opr = 'return' expr? ';'
        |   'break' ';'
        |   'continue' ';'
        |   defvars
        |   ';'
        |   expr ';'    ;


exprs   :   expr(',' expr)* ;



expr    :   funname '(' exprs? ')'
        |   'new' news
        |   expr (opcom = '[' expr ']')+
        |   expr op = '.' expr
        |   op = ('++' | '--') expr
        |   opf = ('-' | '!' | '~') expr
        |   expr op =('++'  | '--')
        |   expr op = ('*' | '/' | '%') expr
        |   expr op=('+' |'-' ) expr
        |   expr ('>>' | '<<') expr
        |   expr op = '&' expr
        |   expr op = '^' expr
        |   expr op = '|' expr
        |   expr  op1 = ('>' | '<' | '>=' | '<=' | '==' | '!=') expr
        |   expr  op = '&&' expr
        |   expr  op ='||' expr
        |   expr '?' expr ':' expr
        |   varname
        |   NUM
        |   STR
        |   ( 'null')
        |   ('TRUE' | 'true' | 'FALSE' | 'false')
        |   opc = '(' expr ')'
        |   <assoc=right> expr opd = '=' expr;

news     :   classname '(' exprs? ')'
        |   (classname |name =  'int' |name =  'string'|name = 'bool') ('[' expr ']')+ ('[' ']')*('[' expr ']')?
        |   (classname |name =  'int' |name =  'string'|name = 'bool') ('[' ']')*   ;

//lexxer

STR  : '"' ('\\"' | '\\\\'|.)*? '"' ;

ID
    :	[a-zA-Z_] [a-zA-Z_0-9]*
    ;

NUM :  [1-9] [0-9]* | '0' ;

WS : ( ' ' | '\t' | '\n' | '\r' ) + -> skip;

LINE_COMMENT
    : '//' ~[\r\n]* -> skip
    ;


