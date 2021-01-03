;--------------------------------------------------------------------------------------------------
;MECATRONICA INDUSTRIAL		MICROCONTROLADORES
;DOUGLAS LIMA BENEVIDES
;PRATICA - 02 			SEMAFORO
;21/02/2010			21/02/2010	
;--------------------------------------------------------------------------------------------------
SEM		EQU		P1
SAIDA		EQU		P2
CHAVE		EQU		P3.2
;--------------------------------------------------------------------------------------------------
INICIO:		MOV		SEM,#023h
		JB		CHAVE,$
		MOV		A,#010h
		ACALL		MUL_DLY
		MOV		SEM,#025h
		MOV		A,#020h
		ACALL		MUL_DLY
		MOV		SEM,#016h
		ACALL		CONTA
		MOV		SEM,#026h
		MOV		A,#020h
		ACALL		MUL_DLY
		AJMP		INICIO
;--------------------------------------------------------------------------------------------------
CONTA:		MOV		DPTR,#TABELA
		MOV		R7,#10
LOOP0:		MOV		A,R7
		MOVC		A,@A+DPTR
		CJNE		A,#0,LOOP1
		MOV		SAIDA,#0FFh
		RET
LOOP1:		MOV		SAIDA,A
		dec		R7
		MOV		A,#00Ah
		ACALL		MUL_DLY
		AJMP		LOOP0
;--------------------------------------------------------------------------------------------------
MUL_DLY:	MOV		R2,A
AQUI:		ACALL		DELAY
		DJNZ		R2,AQUI
		RET
;--------------------------------------------------------------------------------------------------
DELAY:		MOV		R0,#0FFh
VOLTA:		MOV		R1,#0193
		DJNZ		R1,$
		DJNZ		R0,VOLTA
		RET
;--------------------------------------------------------------------------------------------------
TABELA:		DB		0, 003h, 09Fh, 025h, 00Dh, 099h, 049h, 041h, 01Fh, 001h, 009h, 0
;--------------------------------------------------------------------------------------------------
		END