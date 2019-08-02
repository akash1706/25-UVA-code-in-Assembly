.model small
.stack 100h
.data 
   a db ?
   F DB 10,"THE NUMBER IS FOUND $"
   NF DB 10, "THE NUMBER IS NOT FOUND $"
   
.code 
  main proc
    ;mov ah,1
    ;int 21h
    mov AX,11
    cmp AX,2
    JA COND2
    ;JMP  NOTFOUND
 COND2: CMP AX,10
       JB FOUND
      JMP NOTFOUND
  FOUND: MOV AX,@DATA
         MOV  DS,AX
         MOV AH,9
         LEA DX,F
         INT 21H 
         mov ah,4ch
         int 21h 
  NOTFOUND: MOV AX,@DATA
            MOV DS,AX
            MOV AH,9
            LEA DX,NF
            INT 21H
            mov ah,4ch
            int 21h 
  
    
  main endp
  end main
