.model small
.stack 100h
.data
    a dw ?
    b dw ?
.code
main proc
       mov cx,0 
           ; cx=0
           

input:
    mov ah,1
    INT 21h
    cmp al,13 ;input in al
    jne calc
    mov a,bx
    mov ah,2
mov dl,10
INT 21h
mov dl,13
INT 21h 
     mov cx,0
    jmp input1
    


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
    
input1:
    mov ah,1
    INT 21h
    cmp al,13 ;input in al
    jne calc1
    mov b,bx
    jmp exit
    


calc1:
    mov ah,0
    sub al,48
    mov bx,ax   ;input in bx
    mov ax,cx   ;ax has cx
    mov dx,10
    mul dx
    add bx,ax
    mov cx,bx   ;input is in bx
    jmp input1
    
    
    exit:
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov ax,b
    sub ax,a
    mov bx,0000h
    mov cx,10   ;cx has 10  
    mov dx,0

output:
    div cx
    cmp ax,0
    jne print
    jmp exit1
    
print:
    mov [0000h+bx],dx
    add bx,2
    mov dx,0
    jmp output

   
    
exit1:
    mov [0000h+bx],dx
    add bx,2


print1:
    sub bx,2
    mov dl,[0000h+bx]
    add dl,48
    mov ah,2
    INT 21h
    cmp bx,0
    jne print1


mov ah,4ch
INT 21h    
    
    main endp
end  main