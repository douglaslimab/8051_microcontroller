;---------------------------------------------------
INICIO:		MOV		SP,#03Fh
		MOV		R2,#0
		MOV		DPTR,#TABELA
MAIN:		MOV		A,R2
		MOVC		A,@A+DPTR
		INC		R2
		CJNE		A,#0,FIM
		MOV		R2,#0
		AJMP		FORA
FIM:		MOV		P2,A
		ACALL		TEMPO
FORA:		AJMP		MAIN
;---------------------------------------------------
TEMPO:		MOV		R0,#0FFh
VOLTA:		MOV		R1,#0FFh
		DJNZ		R1,$
		DJNZ		R0,VOLTA
		RET
;---------------------------------------------------
TABELA:	DB	001h, 002h, 004h, 008h, 0
;---------------------------------------------------
		END