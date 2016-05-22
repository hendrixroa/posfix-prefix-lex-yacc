%{
#include <stdio.h>
#include <math.h>
%}

%union{
        int dval;
}

%%

%%
int yyerror(char *s) {
  printf("%s\n",s);
}

int main(void) {
  yyparse();
}
