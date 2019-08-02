.model small
.stack 100h
.data
    a dw ?
    b dw ?
    c dw ?
    
 .code
  main proc
    mov cx,0
    
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
     mov ah,2
mov dl,10
INT 21h
mov dl,13
INT 21h 
     mov cx,0
    jmp input2
    


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
    
    
    input2:
    mov ah,1
    INT 21h
    cmp al,13 ;input in al
    jne calc2
    mov c,bx
    jmp exit
    


calc2:
    mov ah,0
    sub al,48
    mov bx,ax   ;input in bx
    mov ax,cx   ;ax has cx
    mov dx,10
    mul dx
    add bx,ax
    mov cx,bx   ;input is in bx
    jmp input2   
    
    
     exit:
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov ax,a
    mov bx,b
    cmp ax,bx
    jg exit1
    
   
    
    exit1:
    
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
     mov ax,a
     mov bx,c
     cmp ax,bx
     jg exit2
     jmp exit3
     
   
    exit3:
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov ax,c
    mov bx,b
    cmp ax,bx
    jg exit4
    jmp exit6
 
   
    
    exit4:
    
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
     mov ax,c
     mov bx,a
     cmp ax,bx
     jg exit5
              
     exit6:
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov ax,b
    mov bx,c
    cmp ax,bx
    jg exit7
 
   
    
    exit7:
    
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
     mov ax,b
     mov bx,a
     cmp ax,bx
     jg exit8         
    
    
     exit2:
     mov  ax,a
    mov bx,0000h
    mov cx,10   ;cx has 10  
    mov dx,0 
    jmp output 
   
    exit5:
     mov  ax,c
    mov bx,0000h
    mov cx,10   ;cx has 10  
    mov dx,0 
    jmp output  
    
    exit8:
     mov  ax,b
    mov bx,0000h
    mov cx,10   ;cx has 10  
    mov dx,0 
    jmp output 
    
    
    output:
    div cx
    cmp ax,0
    jne print
    jmp exitx
    
print:
    mov [0000h+bx],dx
    add bx,2
    mov dx,0
    jmp output

   
    
exitx:
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