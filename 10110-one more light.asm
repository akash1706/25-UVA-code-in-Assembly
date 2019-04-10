.model small
.stack 100h
.data
yes db 'yes$'
no db 'no$'
n db ?

.code

main proc
    
    
    
    MOV AX,@DATA
    MOV DS,AX      
    
    loop1:
    
    mov n,1 
    
    mov ah,1
    int 21h    
    
    and bx,0   
    
    mov bl,al
    
    sub bl,48  
    
    cmp bl,0    
    je exit
   
   
   call newline
    
    
       loop2:
   
        and ax,0
        mov al,n  
        
        mul n   
        
        
        
        cmp al,bl
        je print_yes
        jg print_no 
        
        inc n  
   
       jmp loop2 
    
        print_yes:
        
        mov ah,9
        lea dx,yes
        int 21h
        call newline
        
        jmp loop1
    
        print_no:
        mov ah,9
        lea dx,no
        int 21h
        call newline
        
        
        
    
    jmp loop1
    
    
    
    
    Exit:
    mov ah,4ch
    int 21h
    
    main endp

        newline proc
        
      
        
        mov ah,2
        mov dl,0dh
        int 21h        
        mov dl,0ah
        int 21h
     
        ret
        newline endp
       
    



end main  
