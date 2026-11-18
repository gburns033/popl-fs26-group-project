lexer grammar PythonLiteLexer;

// keywords before NAME
TRUE  : 'True';
FALSE : 'False';
IF    : 'if';
ELIF  : 'elif';
ELSE  : 'else';
AND   : 'and';
OR    : 'or';
NOT   : 'not';

// compound ops before single-char ops
PLUS_EQ  : '+=';
MINUS_EQ : '-=';
STAR_EQ  : '*=';
SLASH_EQ : '/=';
EQ       : '==';
NOT_EQ   : '!=';
LESS_EQ  : '<=';
GREATER_EQ : '>=';

ASSIGN  : '=';
PLUS    : '+';
MINUS   : '-';
STAR    : '*';
SLASH   : '/';
PERCENT : '%';
LESS    : '<';
GREATER : '>';

LPAREN : '(';
RPAREN : ')';
LBRACK : '[';
RBRACK : ']';
COMMA  : ',';
COLON  : ':';

FLOAT  : [0-9]+ '.' [0-9]* | '.' [0-9]+;
INT    : [0-9]+;
// allows \" and \' escapes
STRING : '"' (~["\\\r\n] | '\\' .)* '"' | '\'' (~['\\\r\n] | '\\' .)* '\'';
NAME   : [a-zA-Z_] [a-zA-Z_0-9]*;

// a line break followed by a tab starts an indented line
INDENTED_NEWLINE : '\r'? '\n' [ \t]+;
NEWLINE : '\r'? '\n';
COMMENT : '#' ~[\r\n]* -> skip;
WS      : [ \t]+ -> skip;
