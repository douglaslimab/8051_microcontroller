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
;---------------------------------------------------------
INICIO:		MOV		SP,#03Fh

		MOV		IE,#08Fh
		MOV		IP,#00Ah

		MOV		TMOD,#022h
		MOV		TL0,#056
		MOV		TL1,#245

		SETB		TR0
		CLR		TR1

		CLR		IT0
		CLR		IT1

		MOV		R2,#100
		MOV		R3,#072
		MOV		R4,#072
;---------------------------------------------------------
MAIN:		
		AJMP		MAIN
;---------------------------------------------------------
EXT_0:		INC		R4
		ACALL		DELAY
		CJNE		R4,#100,SAI_0
		MOV		R4,#99
SAI_0:		RETI
;---------------------------------------------------------
EXT_1:		DEC		R4
		ACALL		DELAY
		CJNE		R4,#47,SAI_1
		MOV		R4,#48
SAI_1:		RETI
;---------------------------------------------------------
TIM_0:		DJNZ		R2,FIM_0
		SETB		P2.0
		MOV		R2,#100
		SETB		TR1
		MOV		TL1,#245
FIM_0:		MOV		TL0,#056
		RETI
;---------------------------------------------------------
TIM_1:		DJNZ		R3,FIM_1
		CLR		P2.0
		MOV		A,R4		
		MOV		R3,A
		CLR		TR1
FIM_1:		MOV		TL1,#245
		RETI
;---------------------------------------------------------
DELAY:		MOV		R0,#0FFh
VOLTA:		MOV		R1,#040h
		DJNZ		R1,$
		DJNZ		R0,VOLTA
		RET
;---------------------------------------------------------
		END