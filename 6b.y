%{
	#include<stdio.h>
	int id=0,op=0,key=0,dig=0;
%}

%token DIGIT ID KEY OP

%%
input: DIGIT input{dig++;}
       |ID input{id++;}
       |KEY input{key++;}
       |OP input{op++;}
       |DIGIT {dig++;}
       |ID {id++;}
       |KEY {key++;}
       |OP {op++;}
;
%%

#include<stdio.h>
extern FILE *yyin;

main(int argc, char ** argv)
{
	FILE *myfile=fopen(argv[1],"r");
	if(!myfile)
	{
		printf("I can't open");
		return -1;
	}
	yyin=myfile;
	yyparse();
	printf("Keywords=%d\nIdentifiers=%d\nOperators=%d\n",key,id,op);
	
}

void yyerror()
{
	printf("not valid");
}
