
.Model small
.stack 100h
 
.data
a dw 02h
b dw 08h
 
.code
MAIN PROC
mov ax,@data
mov ds,ax
 
mov ax,a
mov bx,b
 
add ax,bx
add ax,30h
 
mov ah,02
mov dx,ax
int 21h
 
main endp
end main

