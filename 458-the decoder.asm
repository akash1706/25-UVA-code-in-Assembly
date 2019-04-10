.model small
.data
     str db 1000 dup(?)
     char db ?
  .code
  main proc
    mov bx,0
    
    input:
    mov ah,1
    int 21h
    
    mov str[bx],al
    sub str[bx],7
    inc bx
    cmp al,13
    jne input
    mov ah,2
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    mov cx,bx
    mov bx,0 
    jmp print
   
   print:
         
   mov ah,2 
     mov dl, str[bx]
     int 21h
     cmp bx,cx
     je exit
     inc bx
     jmp print
     
  exit:mov ah,4ch
       int 21h
       main endp
  end main
   
    
    
    
    



