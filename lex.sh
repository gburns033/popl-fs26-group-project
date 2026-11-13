#!/bin/sh
# usage: ./lex.sh file.py  (needs antlr jar in ANTLR_JAR)
JAR=${ANTLR_JAR:-antlr-4.13.2-complete.jar}
mkdir -p out
java -jar "$JAR" -o out PythonLiteLexer.g4
javac -cp "$JAR" -d out out/*.java
java -cp "$JAR:out" org.antlr.v4.gui.TestRig PythonLiteLexer tokens -tokens "$1"
