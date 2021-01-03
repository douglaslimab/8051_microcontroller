;-------------------------------------------------------------------------------------------
;MECATRONICA INDUSTRIAL		MICROCONTROLADORES
;DOUGLAS LIMA BENEVIDES
;PRATICA - 01 			SEQUENCIA DE LEDS
;22/02/2010			22/02/2010	
;-------------------------------------------------------------------------------------------
SAIDA		EQU		P2
CH		EQU		P3.2
;-------------------------------------------------------------------------------------------
INICIO:		MOV		SP,#03Fh
		MOV		A,#0FEh

MAIN1:		JNB		CH,MAIN2
		RL		A
		MOV		SAIDA,A
		ACALL		DELAY
		AJMP		MAIN1

MAIN2:		JNB		CH,MAIN1
		RR		A
		MOV		SAIDA,A
		ACALL		DELAY
		AJMP		MAIN2
;-------------------------------------------------------------------------------------------
DELAY:		MOV		R0,#0FFh
VOLTA:		MOV		R1,#0FFh
		DJNZ		R1,$
		DJNZ		R0,VOLTA
		RET
;-------------------------------------------------------------------------------------------
		END