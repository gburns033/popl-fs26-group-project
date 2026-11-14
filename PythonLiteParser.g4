parser grammar PythonLiteParser;

options {
    tokenVocab = PythonLiteLexer;
}

program
    : (stmt? NEWLINE)* stmt? EOF
    ;

stmt
    : assignment
    ;

assignment
    : NAME assignmentOperator expression
    ;

assignmentOperator
    : ASSIGN
    | PLUS_EQ
    | MINUS_EQ
    | STAR_EQ
    | SLASH_EQ
    ;

expression
    : additive
    ;

additive
    : multiplicative ((PLUS | MINUS) multiplicative)*
    ;

multiplicative
    : unary ((STAR | SLASH | PERCENT) unary)*
    ;

unary
    : (PLUS | MINUS) unary
    | atom
    ;

atom
    : INT
    | FLOAT
    | STRING
    | TRUE
    | FALSE
    | NAME
    | listLiteral
    | LPAREN expression RPAREN
    ;

listLiteral
    : LBRACK (expression (COMMA expression)* COMMA?)? RBRACK
    ;