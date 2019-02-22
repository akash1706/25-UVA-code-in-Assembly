.model small
.stack 100h
.data
    a dw ?
    b dw ?
.code
main proc
       mov cx,0 
           ; cx=0
           

input:
    mov ah,1
    INT 21h
    cmp al,13 ;input in al
    jne calc
    mov a,bx
    mov ah,2
mov dl,10
INT 21h
mov dl,13
INT 21h 
     mov cx,0
    jmp input1
    


calc:
    mov ah,0
    sub al,48
    mov bx,ax   ;input in bx
    mov ax,cx   ;ax has cx
    mov dx,10
    mul dx
    add bx,ax
    mov cx,bx   ;input is in bx
    jmp input
    
input1:
    mov ah,1
    INT 21h
    cmp al,13 ;input in al
    jne calc1
    mov b,bx
     mov ah,2
mov dl,10
INT 21h
mov dl,13
INT 21h 
    jmp exit
    


calc1:
    mov ah,0
    sub al,48
    mov bx,ax   ;input in bx
    mov ax,cx   ;ax has cx
    mov dx,10
    mul dx
    add bx,ax
    mov cx,bx   ;input is in bx
    jmp input1
    
    exit:
    mov ax,a
    mov bx,b
    mul bx
    sub ax,1
    MOV CX,0 
     					;Prepear for sum printing             
	MOV BX,10
	
	STOR_SUM:
		MOV DX,0                   
		DIV BX                     
		PUSH DX     				;Stor each digit in stack  
		INC CX
		CMP AX,0
		JNE STOR_SUM 

	PRINT_SUM:
		MOV AH,2
		POP DX                 		;print each digit from stack      
		ADD DL,48
		INT 21H
		LOOP PRINT_SUM     	

	MOV AH,4CH
	INT 21H
  main endp
end  main