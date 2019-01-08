%{
	#include "y.tab.h"
%}

%%
int|char|float|void|for|if|while|main|else { 
	printf("Keyword is: %s\n",yytext);
	return KEY;
	}
[+|-|==|=|*|/|<|>] {
	printf("Operator is %s\n",yytext);
	return OP;
	}

[a-zA-Z]+[a-zA-Z0-9]* {
	printf("Identifier is %s\n",yytext);
	return ID;
	}

[0-9]+ {
	printf("The integer is %s\n",yytext);
	return DIGIT;
	}
.	;
%%

