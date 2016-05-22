%{
#include "y.tab.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
%}

white           [ \t]+
digit           [0-9]
integer         {digit}+
%option noyywrap

%%

{white}         { /* Ignoramos espacios en blanco */ }
"exit"|"quit"|"bye"	{printf("Terminando programa\n");exit(0);}
{digit}	{
                  yylval.dval=atoi(yytext);
                  return(NUMBER);
                }

"+"           return(PLUS);
"-"           return(MINUS);
"*"           return(TIMES);
"/"           return(DIVIDE);
"^"           return(POWER);
"\n"  return(END);

%%
