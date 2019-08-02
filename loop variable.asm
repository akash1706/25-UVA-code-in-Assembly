.model small
.stack 100h
.data

.code
main proc
 mov ax,0
 mov dx,3
 mov cx,dx
 
 back: add ax,cx
    loop back
   add ax,30h
    mov dx,ax
    mov ah,2
    int 21h
    
    MOV AH,2
    MOV CX,256
    MOV DX,0
    LOO:INT 21H
    INC DX
   ; DEC CX
   CMP DX,CX
    JNE LOO
     
    
    MOV AH,4CH
    INT 21H
   
   
   main endp
end main
    