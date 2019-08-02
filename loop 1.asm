 .model small
.stack 100h
.data

.code
main proc

      mov cx,256
        mov dx,1
        mov ax,0
        inc cx
   loo: add ax,dx
           inc dx
           cmp dx,cx
           jne loo
           

   add ax,30h
    mov dx,ax
    mov ah,2
    int 21h  
  
    
    MOV AH,4CH
    INT 21H
   
   
   main endp
end main
       