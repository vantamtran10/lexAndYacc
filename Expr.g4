grammar Expr;
r  : expr 					{System.out.println($expr.val);}
;
expr returns [int val]: 
	term '+' expr 			 {$val = $term.val + $expr.val;} 
	| term '-' expr 		 {$val = $term.val - $expr.val;}
	| term 					 {$val = $term.val;} 
;
term returns [int val]:
	factor '*' term 		 {$val = $factor.val * $term.val;} 
	| factor '/' term 		 {$val = $factor.val / $term.val;}
	| factor				 {$val = $factor.val;}
	| '-' factor 			 {$val = -$factor.val;}
;
factor returns [int val]:
	NUM 					 {$val = Integer.parseInt($NUM.text);}
	| '(' expr ')' 			 {$val = $expr.val;}
;
NUM : [0-9]+ ;
WS : [ \t\r\n]+ -> skip ;