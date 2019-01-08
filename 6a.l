%{
#include<stdio.h>
int count=0;
%}
%%
"//".* {count++;}
"/*".*|\n"*/" {count++;}
.|\n fprintf(yyout,"%s",yytext);
%%

void main(int argc,char **argv)
{
if(argc!=3)
{
printf(" ");

}
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("Number of comment lines=%d",count);

}
