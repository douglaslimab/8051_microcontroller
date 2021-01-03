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
;-----------------------------------------------------
INICIO:		MOV		SP,#03Fh

		MOV		IE,#08Fh
		MOV		IP,#00Ah

		MOV		TMOD,#022h

;		MOV		TH0,#0FCh
		MOV		TL0,#056		;#018h

;		MOV		TH1,#0FEh
		MOV		TL1,#156		;00Ch

		SETB		TR0
		SETB		TR1

		CLR		IT0
		CLR		IT1

		MOV		R2,#200
		MOV		R3,#100
		MOV		R4,#100
;-----------------------------------------------------
MAIN:		
		AJMP		MAIN
;-----------------------------------------------------
EXT_0:		INC		R4
		ACALL		DELAY
		CJNE		R4,#199,SAI_0
		MOV		R4,#198
SAI_0:		RETI
;-----------------------------------------------------
EXT_1:		DEC		R4
		ACALL		DELAY
		CJNE		R4,#001,SAI_1
		MOV		R4,#002
SAI_1:		RETI
;-----------------------------------------------------
TIM_0:		DJNZ		R2,FIM_0
		SETB		P2.0
		MOV		R2,#0200
		SETB		TR1
FIM_0:		RETI
;-----------------------------------------------------
TIM_1:		DJNZ		R3,FIM_1
		CLR		P2.0
		MOV		A,R4
		MOV		R3,A
		CLR		TR1
FIM_1:		RETI
;-----------------------------------------------------
DELAY:		MOV		R0,#0FFh
VOLTA:		MOV		R1,#010h
		DJNZ		R1,$
		DJNZ		R0,VOLTA
		RET
;-----------------------------------------------------
		END