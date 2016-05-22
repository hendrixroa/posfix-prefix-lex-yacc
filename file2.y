%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
%}

%union{
        int dval;
}

%token  <dval> NUMBER 
%token  PLUS    MINUS   TIMES   DIVIDE  POWER
%token  END


%left   PLUS    MINUS
%left   TIMES   DIVIDE
%left   NEG
%right  POWER

%type  <dval> Expression 
%start Input

%%

Input:	Line
	| Input Line
        ;



Line:	END
        | Expression END                { printf("\n%d\n",$1); }
        ;


Expression:	NUMBER                        { $$=$1; printf("%d",$1); }

        | PLUS Expression Expression    { $$ = $2+$3; printf("+");}
        | MINUS Expression Expression   { $$ = $2-$3; printf("-");}
        | TIMES Expression Expression   { $$ = $2*$3; printf("*");}
        | DIVIDE Expression Expression  { $$ = $2/$3; printf("/");}
        | POWER Expression Expression   { $$ = pow($2,$3); printf("^");}
        | MINUS Expression %prec NEG    { $$ = -$2;}
        ;

%%
int yyerror(char *s) {
  printf("%s\n",s);
}

int main(void) {
  yyparse();
}
