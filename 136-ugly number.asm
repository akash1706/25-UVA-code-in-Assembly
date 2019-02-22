.model small
.stack 100h
.data
    a dw 10, "The 1500'th ugly number is 859963392.$" 
   .code
   main proc
    mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,a
    int 21h
     mov ah,4ch
     int 21h
     
     main endp
   end main