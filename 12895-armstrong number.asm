INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
     X DW ?
     Y DB 0
     LENGTH DW 0
     NUMBER DW 0
     SUM DW 0
     TIME DW 0
     TEMP DW 0
     
.CODE  
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX 
    CALL INPUT_TAKEN
    PRINTN ""
    MOV TIME,AX
    LOOPING: 
    AND AX,0
    MOV SUM,AX
    MOV NUMBER,AX            
    CALL INPUT_TAKEN
    MOV NUMBER,AX  ;NUMBER<--AX 

    CYCLE:
    AND BX,0
    MOV BX,10       
    DIV BX ;NUMBER/10
    MOV TEMP,AX ;TEMP<--N/10
    AND CX,0
    MOV CX,SI ;CX<--LENGTH
   
    MOV AX,1 ;AX<--1 
    AND BX,0           
    MOV BX,DX ;BX<--REMEINDER 
    WHILE:    
    MUL BX
    LOOP WHILE
    ADD AX,SUM ;SUM+POW(D,K) 
    MOV SUM,AX ;SUM=SUM+POW(D,K)
    AND AX,0
    MOV AX,TEMP 
    CMP AX,0
    JNE CYCLE
    PRINT:   
    PRINTN ""
    AND AX,0
    MOV AX,NUMBER
    CMP AX,SUM
    JE C1
    PRINTN "Not Armstrong"
    JMP COUNTING
    C1:
    PRINTN "Armstrong"
    COUNTING:
    AND AX,0
    DEC TIME  ;TIME-- 
    
    CMP TIME,AX 
    JNE LOOPING  ;IF TIME!=0
    FINISH:
    MOV AH,4CH
    INT 21H
MAIN ENDP     
INPUT_TAKEN PROC  
      MOV BX,0
      AND SI,0000H 
   
      INPUT:
           MOV AH,1
           INT 21H
           CMP AL,13
           JNE NUM 
           MOV AX,BX
           JMP END_TAKEN_INPUT
      NUM: 
            INC SI
            SUB AL,48
            MOV AH,0
            MOV X,AX  ;inserted digit
            MOV AX,BX
            MOV CL,10
            MOV CH,0
            MUL CX 
    
            MOV DH,0   
            ADD AX,X   ;adding with prev
            MOV BX,AX
            JMP INPUT 
     
              
      END_TAKEN_INPUT: 
                    RET  
                            
INPUT_TAKEN ENDP