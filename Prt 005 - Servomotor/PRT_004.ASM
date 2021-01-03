;---------------------------------------------------
INICIO:		MOV		SP,#03Fh
		MOV		A,#0
		MOV		DPTR,#TABELA
MAIN:		MOVC		A,@+DPTR
		MOV		P2,A
		ACALL		TEMPO
		INC		A
		CJNE		A,#0,FIM
		MOV		A,#0
FIM:		AJMP		MAIN
;---------------------------------------------------
TEMPO:		MOV		R0,#0FFh
VOLTA:		MOV		R1,#0FFh
		DJNZ		R1,$
		DJNZ		R0,VOLTA
		RET
;---------------------------------------------------
TABELA:	DB	001h, 002h, 004h, 008h
;---------------------------------------------------
		END