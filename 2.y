%{
	#include<stdio.h>
	int count=0,n;
%}
%token A
%token B
%%
S: X B {if(count<n || count>n)
		yyerror();return 1;
	}
X: X T|T  
T: A{count++;}
;
%%

void main()
{
	printf("Enter the value of n:\n");
	scanf("%d",&n);
	printf("Enter the string\n");
	yyparse();
	printf("Valid string");
}

int yyerror()
{
	printf("Invalid string\n");
	exit(0);
}
