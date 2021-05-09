%{
#include<stdio.h>
 int yylex(void);
 int yyerror(char *s);
%}
%token NUM
%%
S:
        S expr '\n'             {printf("syntax correct !\n");printf(" = %d\n", $2);}
        |
;
expr:
        term '+' expr           {$$ = $1 + $3;}
        | term '-' expr         {$$ = $1 - $3;}
        | term
;
term:
        factor '*' term         {$$ = $1 * $3;}
        | factor '/' term       {if ($3 == 0) yyerror("divide by zzero"); else $$ = $1 / $3;}
        | '-' factor            {$$ = -$2;}
        | factor
factor:
        '(' expr ')'            {$$ = $2;}
        | NUM
;
%%
int yyerror(char *s){
        fprintf(stderr, "%s\n", s);
        return 0;
}
int main(void){
        yyparse();
        return 0;
}
