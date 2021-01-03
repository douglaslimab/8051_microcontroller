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
;----------------------------------------------------
INICIO:		MOV		SP,#03Fh

		MOV		IE,#08Fh
		MOV		IP,#00Ah

		MOV		TMOD,#011h

		MOV		TH0,#03Ch
		MOV		TL0,#0B0h

		MOV		TH1,#0
		MOV		TL1,#0

		CLR		TR0
		CLR		TR1

		SETB		IT0
		SETB		IT1

FORA:		MOV		DPTR,#PASSO
;----------------------------------------------------
MAIN:		MOV		A,#01
		MOVC		A,@A+DPTR
		JZ		FORA
		MOV		P2,A
		AJMP		MAIN
;----------------------------------------------------
EXT_0:		INC		DPTR
		ACALL		DELAY
		RETI
;----------------------------------------------------
EXT_1:		CPL		TR0
		RETI
;----------------------------------------------------
TIM_0:		INC		DPTR
		MOV		TH0,#03Ch
		MOV		TL0,#0B0h
		RETI
;----------------------------------------------------
TIM_1:
		RETI
;----------------------------------------------------
DELAY:		MOV		R0,#0FFh
VOLTA:		MOV		R1,#00Ah
		DJNZ		R1,$
		DJNZ		R0,VOLTA
		RET
;----------------------------------------------------
PASSO:	DB	0, 001h, 003h, 002h, 006h, 004h, 00Ch, 008h, 009h, 0
;----------------------------------------------------
		END