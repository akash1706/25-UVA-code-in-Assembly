.model small
.data
     str db 1000 dup(?)
      n dw ?
      msg db 10,13,"underflow$"
      msg1 db 10,13,"40320$"
      msg2 db 10,13,"362880$" 
       msg3 db 10,13,"3628800$" 
       msg4 db 10,13,"39916800$"
       msg5 db 10,13,"479001600$"
       msg6 db 10,13,"6227020800$"
       msg7 db 10,13,"overflow$"
       
  .code
  main proc
    mov cx,0
    
    input:
    mov ah,1
    int 21h
    cmp al,13
    jne calc
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov n,bx
    jmp if
    
    calc:mov ah,0
       sub al,48
    mov bx,ax   ;input in bx
    mov ax,cx   ;ax has cx
    mov dx,10
    mul dx
    add bx,ax
    mov cx,bx   ;input is in bx
    jmp input
    
    if:cmp n,0
      jg if1
    if1:cmp n,7
    jg if2
    jng if11
   if11: mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,msg
    int 21h
    ret
    
    if2:cmp n,8
    je if22
    jne if3
   if22: mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,msg1
    int 21h
    ret
    
    if3:cmp n,9
    je if33
    jne if4
   if33: mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,msg2
    int 21h
    ret
    
    if4:cmp n,10
    je if44
    jne if5
   if44: mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,msg3
    int 21h
    ret 
    
     if5:cmp n,11
    je if55
    jne if6
   if55: mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,msg4
    int 21h
    ret  
    
    if6:cmp n,12
    je if66
    jne if7
   if66: mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,msg5
    int 21h
    ret
    
    if7:cmp n,13
    je if77
    jne if8
   if77: mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,msg6
    int 21h
    ret
    
    if8:mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,msg7
    int 21h
    ret  
    
    
    
     
   
   
     
  exit:mov ah,4ch
       int 21h
       main endp
  end main
   
    
    
    
    



