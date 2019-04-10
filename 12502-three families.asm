 .model small
.data
     a dw ?
     b dw ?
     c dw ?
     sum dw ?
     e dw ?
.stack 100h
.code
 main proc
 
 
   call input_num
   mov a,bx
   call newline
   call input_num
   mov b,bx
   call newline  
   call input_num
   mov c,bx
   call newline
   
   mov bx,b
   mov ax,a
   sub ax,bx
   mov cx,ax
   mov ax,a
   add ax,cx
   mov cx,c
   mul cx
   mov sum,ax
   mov bx,a
   add bx,b
   div bx          
         
  print: 
   
   call output
   
   mov ah,4ch
      int 21h
      
     main endp
     
        
 
 output proc

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
		
		ret
		output endp
 
 
  newline proc
        
         mov ah,2
         mov dl,10
         int 21h
         mov dl,13
         int 21h     
         
         ret
         
         newline endp
  
  
  input_num proc
    
  
   mov cx,0     ; cx=0

input:
    mov ah,1
    INT 21h
    cmp al,13 ;input in al
    jne calc
   ; mov n,bx
    mov ah,2
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h 
    mov cx,0
    mov ax,1

      ret


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
    
    
    ret 
    
    input_num endp
  
  
  end main
      

