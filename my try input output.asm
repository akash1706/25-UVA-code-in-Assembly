.model small                                                        .model small

.stack 100
.data 
   a dw ?
   b dw ?
.code
 main proc 
   mov cx,0
   
   input: mov ah,1
   int 21h
   cmp al,13
   jne calc
   jmp exit
   
   calc:mov ah,0
   sub al,48
   mov bx,ax ;mov ax into bx
   mov ax,cx ;cxer man axe raklam
   mov dx,10 ;dx  ar loge ax  ghun kore bx erloge jog korbo
   mul dx
   add bx,ax 
   mov cx,bx ;notun bx cx e joma rakbo
   jmp input
   
   
   exit:
       mov  ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
       
       mov ax,bx
       mov bx,0000h
       mov cx,10
       mov dx,0
       
       
    output:div cx
    cmp ax,0
    jne print
    jmp exit1
    
    
    print:mov [0000h+bx],dx
    add bx,2
    mov dx,0 
    jmp output
    
    exit1:mov [0000h+bx],dx
        add bx,2
        
     print1:sub bx,2
           mov dl,[0000h+bx]
      add dl,48
      mov ah,2
      INT 21h
      cmp bx,0
      jne print1
    
  mov ah,4ch
INT 21h    
    
main endp
end main 