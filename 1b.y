%{
	#include<stdio.h>
	int valid=1;
%}
%token num
%left '+' '-'
%left '*' '/'

%%
stmt:expr { if(valid)
		{
			printf("Result=%d\n",$$);
		}
}
expr: expr '+' expr{$$=$1+$3;}
      |expr '-' expr{$$=$1-$3;}
      |expr '*' expr{$$=$1*$3;}
      |expr '/' expr{if($3==0)
			valid=0;
		     else
			$$=$1/$3;
		    }
      |'(' expr ')' {$$=$2;}
      |num {$$=$1;}
      ;
%%

main()
{
	printf("Enter arithmetic expression:\n");
	yyparse();
	if(valid==1)
		printf("Expression is valid\n");


}

int yyerror()
{
	printf("Invalid expression\n");
	exit(0);
}
