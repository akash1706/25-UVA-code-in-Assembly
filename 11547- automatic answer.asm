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
     mov ax,bx
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
   
   
   exit: mov cx,567
         mul cx
         mov bx,9
         div bx
         add ax,7492
         mov cx,235
         mul cx
         mov bx,47
         div bx
         sub ax,498
         mov cx,10
         mul cx 
         mov bx,10
        div bx 
        mov ax,dx
        
   
   
   MOV CX,0 
	;MOV AX,n     					;Prepear for sum printing             
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
      