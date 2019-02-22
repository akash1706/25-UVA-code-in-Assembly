
.model small
.stack 100h
.data
   str db 100 dup(?)
   char db ?
   a db 13,10,"Hajj-e-Akbar $"
   b db 13,10, "Hajj-e-Asghar $"
.code 
main proc

       
while:
    mov bx, 0
 input:  
    mov ah, 1      ; input char
    int 21h
    mov char, al   ; char=al
    cmp al, 42    ; if * then exit
    je exit
    mov al, char   ; char=newline then exit Input
    cmp al, 13
    je exit_input
    mov al, char
    mov str[bx], al ; str[bx]=char
    inc bx        ; bx++
    jmp input
exit_input:   
  
    mov si, 0     ;si=0
    cmp str[si], 48H  ;48H='H'
    je akbar
    
    mov Ax,@data
    mov ds, ax
    mov ah,9
    lea dx,b
    int 21h
    
    jmp after
akbar:
   
     mov Ax,@data
    mov ds, ax
    mov ah,9
    lea dx,a
    int 21h        

after:             ; jump while
jmp while    
    
 exit:
    mov ah, 4ch
    int 21h   
    main endp
end main