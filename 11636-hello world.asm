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
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov n,bx
    mov ax,1
    mov bx,0
    mov dx,2
    mov  cx,n
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
    
    
exit: cmp ax,cx
     je print
      mul dx
      inc bx
      jmp exit
      
      
      print:mov ax,bx
      mov cx,0
      mov bx,10
     
     print1:mov dx,0
     div bx
     push dx
     inc cx
     cmp ax,0
     jne print1
     
     print2:mov ah,2
     pop dx
     add dl,30h
     int 21h
     loop print2
     
     mov ah,4ch
     int 21h
     
     main endp
 end main