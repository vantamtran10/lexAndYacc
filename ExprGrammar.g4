grammar Expr;
r  : expr 
;
expr: 
	term '+' expr 			 
	| term '-' expr 		 
	| term 					
;
term:
	factor '*' term 		 
	| factor '/' term 		 
	| factor				 
	| '-' factor 			 
;
factor:
	NUM 					 
	| '(' expr ')' 			
;
NUM : [0-9]+ ;
WS : [ \t\r\n]+ -> skip ;