 .model small
.data
     n dw ?
     p dw ?
     t dw ?
     sum dw ?
.stack 100h
.code
 main proc
 
 
   call input_num
   mov n,bx
   call newline
   mov ax,n
   mov bl,10
   mov  cx,9 
   mov si,0
   mov sum,si
   
   power: 
      inc si
      cmp ax,cx
      jl arm
      div bl
      
      jmp power
      
      
      arm:mov p,si
      mov ax,n
      mov bl,10
      mov cx,0
      
      arm1: cmp ax,cx
      je print
         div bl
       
         mov di,0
         mov t,ax
         mov ax,1
         mov si,p
         mov cx,si
         l1:cmp cx,di
           mul dx 
          LOOP L1
           
         add sum,ax
         jmp arm1
           
            
            
         
  print: 
   
   call output
   
   mov ah,4ch
      int 21h
      
     main endp
     
        
 
 output proc

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
    mov n,bx
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
      

