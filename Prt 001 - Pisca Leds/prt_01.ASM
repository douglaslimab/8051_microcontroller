LIN       EQU      P2
CH        EQU      P3.2
;-----------------------------------------------
INICIO:    MOV      LIN,#0FEh
ROT_1:     JNB      CH,$
           MOV      A,LIN
           RL       A
           ACALL    TEMPO
           MOV      LIN,A
           MOV      C,P3.7
           JNC      ROT_2
           AJMP     ROT_1

ROT_2:	   JNB      CH,$
           MOV      A,LIN
           RR       A
           ACALL    TEMPO
           MOV      LIN,A
           MOV      C,P3.0
           JNC      ROT_1
           AJMP     ROT_2

;-----------------------------------------------
TEMPO:   MOV    R0,#0FFh
VOLTA:   MOV    R1,#0FFh
         DJNZ   R1,$
         DJNZ   R0,VOLTA
         RET
;-----------------------------------------------
	END