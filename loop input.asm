 .model small
.stack 100h
.data
    msg db 10,"ki ase jibon e $"

.code
main proc

     mov bh,0
    mov bl,10d
    
       input:
       mov ah,1
       int 21h
       cmp ax,13d
       jne number
       jmp if
       
       number:
       sub ax,30h
       mov cx,ax
       mov al,bh
       mul bl
       add al,cl
       mov bh,al
       jmp input
       
        if: mov al,1
              cmp bh,al
              jg if2
              jmp print
         if2:mov al,100
              cmp bh,al
              jng print
              jmp  ses     
  
    
  print:
    mov ah,2
    mov dh,bh
    int 21h
    MOV AH,4CH
    INT 21H
           ses: mov ax,@data
                 mov  ds,ax
                 mov  ax,9
                 lea dx,msg
                 int 21h
                 MOV AH,4CH
                 INT 21H 
   main endp
end main
       