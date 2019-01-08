%{
#include<stdio.h>
extern int yyval;
%}
%%
[0-9]+ { yyval=a to i(yytext);
         return num;
       }
\t;
\n return 0;
{
return yytext[0];
}
%%

