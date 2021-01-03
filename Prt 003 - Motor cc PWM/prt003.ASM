		ORG		000h
		AJMP		INICIO
		ORG		003h
		AJMP		EXT_0
		ORG		00Bh
		AJMP		TIM_0
		ORG		013h
		AJMP		EXT_1
		ORG		01Bh
		AJMP		TIM_1
;-----------------------------------------------------------------------------
SAIDA		EQU		P2.0
FLAG		EQU		000h
;-----------------------------------------------------------------------------
INICIO:		MOV		SP,#03Fh
		MOV		IE,#08Fh
		MOV		IP,#00Ah

		MOV		TMOD,#011h

		MOV		TH0,#0B1h
		MOV		TL0,#0E0h

		MOV		TH1,#0FCh
		MOV		TL1,#018h

		SETB		TR0
		CLR		TR1

		SETB		IT0
		SETB		IT1

		MOV		R0,#002
		MOV		R3,#010
		MOV		R4,#010
		MOV		R5,#010
		MOV		R6,#010
MAIN:		
		AJMP		MAIN
;-----------------------------------------------------------------------------
EXT_0:		INC		R5
		DEC		R6
		RETI
;-----------------------------------------------------------------------------
EXT_1:		INC		R6
		DEC		R5
		RETI
;-----------------------------------------------------------------------------
TIM_0:		JB		FLAG,NO_DUTY
DUTY:		SETB		SAIDA
		DJNZ		R3,FIM
		MOV		A,R5
		CJNE		A,#0,N_ZERA
		CLR		SAIDA
		AJMP		ZERA
N_ZERA:		MOV		R3,A
ZERA:		SETB		FLAG

NO_DUTY:	CLR		SAIDA
		DJNZ		R4,FIM
		MOV		A,R6
		CJNE		A,#020,N_SETA
		SETB		SAIDA
		AJMP		SETA		
N_SETA:		MOV		R4,A
SETA:		CLR		FLAG		

FIM:		MOV		TH0,#0FCh
		MOV		TL0,#018h
		RETI
;-----------------------------------------------------------------------------
TIM_1:
		RETI
;-----------------------------------------------------------------------------
TEMPO:		MOV		R1,#0FFh
NOVO:		MOV		R2,#005h
		DJNZ		R2,$	
		DJNZ		R1,NOVO
		RET
;-----------------------------------------------------------------------------
		END