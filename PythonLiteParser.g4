parser grammar PythonLiteParser;

options {
    tokenVocab = PythonLiteLexer;
}

program
    : (stmt? NEWLINE)* stmt? EOF
    ;

stmt
    : assignment
    | ifStmt
    ;

ifStmt
    : IF expression COLON block (NEWLINE ELIF expression COLON block)* (NEWLINE ELSE COLON block)?
    ;

// the body of an if or elif or else
block
    : (INDENTED_NEWLINE assignment)+
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

// operators higher in the list are applied first (a < b and c parses as (a < b) and c)
expression
    : additive
    | expression (LESS | LESS_EQ | GREATER | GREATER_EQ | EQ | NOT_EQ) expression
    | NOT expression
    | expression AND expression
    | expression OR expression
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