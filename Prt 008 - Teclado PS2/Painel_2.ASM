	ORG	00h
	AJMP	INICIO
	ORG	03h
	AJMP	INT_0
	ORG	0Bh
	AJMP	TIM_0
	ORG	13h
	AJMP	INT_1
	ORG	1Bh
	AJMP	TIM_1
	ORG	23h
	AJMP	SERIAL
;********************************************************************************
	SAIDA	EQU	P2
	CNT	EQU	P1
	FLAG	EQU	00h
;********************************************************************************
INICIO:	MOV	SP,#02Fh
	MOV	IE,#097h
	MOV	IP,#012h
	MOV	SCON,#050h
	MOV	TH1,#0E6h
	MOV	PCON,#00h
	MOV	TMOD,#21h
	SETB	IT0
	SETB	IT1
	MOV	TH0,#03Ch
	MOV	TL0,#0B0h
	MOV	R3,#'A'
	MOV	R4,#00
	MOV	R5,#10
	ACALL	SELEC
	CLR	FLAG
;********************************************************************************
MAIN:	MOV	SAIDA,#0FFh
	ACALL	CNTRL
	ACALL	DADO
	ACALL	DELAY
	AJMP	MAIN
;********************************************************************************
INT_0:	JNB	FLAG,PNT1
	CLR	FLAG
	CLR	TR0
	AJMP	FIIIM
PNT1:	SETB	FLAG
	SETB	TR0
FIIIM:	RETI
;********************************************************************************
TIM_0:	DJNZ	R5,SAI
	MOV	R5,#2
	DEC	R4
SAI:	MOV	TH0,#03Ch
	MOV	TL0,#0B0h
	RETI
;********************************************************************************
INT_1:
	RETI
;********************************************************************************
TIM_1:
	RETI
;********************************************************************************
SERIAL:	MOV	R3,SBUF
	CLR	RI
	RETI
;********************************************************************************
CNTRL:	MOV	CNT,R4
	INC	R4
	CJNE	R4,#08h,NZ
	MOV	R4,#00
NZ:	RET
;********************************************************************************
DADO:	MOV	A,#00h
	MOVC	A,@A+DPTR
	JZ	FIM
	MOV	SAIDA,A
	INC	DPTR
	RET
FIM:	ACALL	SELEC
	RET
;********************************************************************************
DELAY:	MOV	R0,#010h
VOLTA:	MOV	R1,#010h
	DJNZ	R1,$
	DJNZ	R0,VOLTA
	RET
;********************************************************************************
SELEC:	CJNE	R3,#'A',PT_B
	MOV	DPTR,#TAB_A
	RET
PT_B:	CJNE	R3,#'B',PT_C
	MOV	DPTR,#TAB_B
	RET
PT_C:	CJNE	R3,#'C',PT_D
	MOV	DPTR,#TAB_C
	RET
PT_D:	CJNE	R3,#'D',PT_E
	MOV	DPTR,#TAB_D
	RET
PT_E:	CJNE	R3,#'E',PT_F
	MOV	DPTR,#TAB_E
	RET
PT_F:	CJNE	R3,#'F',PT_G
	MOV	DPTR,#TAB_F
	RET
PT_G:	CJNE	R3,#'G',PT_H
	MOV	DPTR,#TAB_G
	RET
PT_H:	CJNE	R3,#'H',PT_I
	MOV	DPTR,#TAB_H
	RET
PT_I:	CJNE	R3,#'I',PT_J
	MOV	DPTR,#TAB_I
	RET
PT_J:	CJNE	R3,#'J',PT_K
	MOV	DPTR,#TAB_J
	RET
PT_K:	CJNE	R3,#'K',PT_L
	MOV	DPTR,#TAB_K
	RET
PT_L:	CJNE	R3,#'L',PT_M
	MOV	DPTR,#TAB_L
	RET
PT_M:	CJNE	R3,#'M',PT_N
	MOV	DPTR,#TAB_M
	RET
PT_N:	CJNE	R3,#'N',PT_O
	MOV	DPTR,#TAB_N
	RET
PT_O:	CJNE	R3,#'O',PT_P
	MOV	DPTR,#TAB_O
	RET
PT_P:	CJNE	R3,#'P',PT_Q
	MOV	DPTR,#TAB_P
	RET
PT_Q:	CJNE	R3,#'Q',PT_R
	MOV	DPTR,#TAB_Q
	RET
PT_R:	CJNE	R3,#'R',PT_S
	MOV	DPTR,#TAB_R
	RET
PT_S:	CJNE	R3,#'S',PT_T
	MOV	DPTR,#TAB_S
	RET
PT_T:	CJNE	R3,#'T',PT_U
	MOV	DPTR,#TAB_T
	RET
PT_U:	CJNE	R3,#'U',PT_V
	MOV	DPTR,#TAB_U
	RET
PT_V:	CJNE	R3,#'V',PT_W
	MOV	DPTR,#TAB_V
	RET
PT_W:	CJNE	R3,#'W',PT_X
	MOV	DPTR,#TAB_W
	RET
PT_X:	CJNE	R3,#'X',PT_Y
	MOV	DPTR,#TAB_X
	RET
PT_Y:	CJNE	R3,#'Y',PT_Z
	MOV	DPTR,#TAB_Y
	RET
PT_Z:	CJNE	R3,#'Z',FIIM
	MOV	DPTR,#TAB_Z
FIIM:	RET
;********************************************************************************
TAB_A:	DB	0FFh, 081h, 0F6h, 0F6h, 0F6h, 081h, 0FFh, 0
TAB_B:	DB	0FFh, 080h, 0B6h, 0B6h, 0B6h, 0C9h, 0FFh, 0
TAB_C:	DB	0FFh, 0C1h, 0BEh, 0BEh, 0BEh, 0DDh, 0FFh, 0
TAB_D:	DB	0FFh, 080h, 0BEh, 0BEh, 0BEh, 0C1h, 0FFh, 0
TAB_E:	DB	0FFh, 080h, 0B6h, 0B6h, 0B6h, 0BEh, 0FFh, 0
TAB_F:	DB	0FFh, 080h, 0B6h, 0B6h, 0B6h, 0BEh, 0FFh, 0
TAB_G:	DB	0FFh, 0C1h, 0BEh, 0BEh, 0AEh, 0CDh, 0FFh, 0
TAB_H:	DB	0FFh, 080h, 0F7h, 0F7h, 0F7h, 080h, 0FFh, 0
TAB_I:	DB	0FFh, 0BEh, 0BEh, 080h, 0BEh, 0BEh, 0FFh, 0
TAB_J:	DB	0FFh, 0BFh, 0BEh, 0BEh, 0BEh, 0C0h, 0FFh, 0
TAB_K:	DB	0FFh, 080h, 0F7h, 0EBh, 0DDh, 0BEh, 0FFh, 0
TAB_L:	DB	0FFh, 080h, 0BFh, 0BFh, 0BFh, 0BFh, 0FFh, 0
TAB_M:	DB	0FFh, 080h, 0F9h, 0F7h, 0F9h, 080h, 0FFh, 0
TAB_N:	DB	0FFh, 080h, 0F9h, 0F7h, 0CFh, 080h, 0FFh, 0
TAB_O:	DB	0FFh, 0C1h, 0BEh, 0BEh, 0BEh, 0C1h, 0FFh, 0
TAB_P:	DB	0FFh, 080h, 0F6h, 0F6h, 0F6h, 0F9h, 0FFh, 0
TAB_Q:	DB	0FFh, 0C1h, 0BEh, 0BEh, 09Eh, 081h, 0FFh, 0
TAB_R:	DB	0FFh, 080h, 0F6h, 0F6h, 0F6h, 089h, 0FFh, 0
TAB_S:	DB	0FFh, 0D1h, 0B6h, 0B6h, 0B6h, 0CDh, 0FFh, 0
TAB_T:	DB	0FFh, 0FEh, 0FEh, 080h, 0FEh, 0FEh, 0FFh, 0
TAB_U:	DB	0FFh, 0C0h, 0BFh, 0BFh, 0BFh, 0C0h, 0FFh, 0
TAB_V:	DB	0FFh, 0F0h, 0CFh, 0BFh, 0CFh, 0F0h, 0FFh, 0
TAB_W:	DB	0FFh, 0E0h, 09Fh, 0E7h, 09Fh, 0E0h, 0FFh, 0
TAB_X:	DB	0FFh, 09Ch, 0EBh, 0F7h, 0EBh, 09Ch, 0FFh, 0
TAB_Y:	DB	0FFh, 0F8h, 0F7h, 08Fh, 0F7h, 0F8h, 0FFh, 0
TAB_Z:	DB	0FFh, 09Eh, 0AEh, 0B6h, 0BAh, 0BCh, 0FFh, 0
;********************************************************************************
	END