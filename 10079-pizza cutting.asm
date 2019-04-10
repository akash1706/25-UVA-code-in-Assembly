.model small
.data
     n dw ?
.stack 100h
.code
 main proc
    mov cx,0     ; cx=0

input:
    mov ah,1
    INT 21h
    cmp al,13 ;input in al
    jne calc
    mov n,bx
    mov ah,2
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h 
    mov cx,0
    mov ax,1
    jmp exit
    


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
   
   
   exit: add ax,cx
   inc cx
   cmp cx,n
   jng exit
   mov n,ax
   
   MOV CX,0 
	MOV AX,n     					;Prepear for sum printing             
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
     
      mov ah,4ch
      int 21h
      
    main endp
     end main
      