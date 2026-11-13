lexer grammar PythonLiteLexer;

// keywords before NAME
TRUE  : 'True';
FALSE : 'False';

// compound ops before single-char ops
PLUS_EQ  : '+=';
MINUS_EQ : '-=';
STAR_EQ  : '*=';
SLASH_EQ : '/=';

ASSIGN  : '=';
PLUS    : '+';
MINUS   : '-';
STAR    : '*';
SLASH   : '/';
PERCENT : '%';

LPAREN : '(';
RPAREN : ')';
LBRACK : '[';
RBRACK : ']';
COMMA  : ',';

FLOAT  : [0-9]+ '.' [0-9]* | '.' [0-9]+;
INT    : [0-9]+;
// allows \" and \' escapes
STRING : '"' (~["\\\r\n] | '\\' .)* '"' | '\'' (~['\\\r\n] | '\\' .)* '\'';
NAME   : [a-zA-Z_] [a-zA-Z_0-9]*;

NEWLINE : '\r'? '\n';
COMMENT : '#' ~[\r\n]* -> skip;
WS      : [ \t]+ -> skip;
