 include 'emu8086.inc'

ORG    100h

.model small
.stack 100h
.data
    a dw ?
    b dw ?
    m dw ?
    t dw ?
    count db 0
    sum dw ?
    
.code
main proc 
    
    call scan_num 
      mov ax,cx
    mov a,ax
    
  call pthis
db 13, 10, '',0
    
    call Scan_num
    mov ax,cx
    mov b,ax
    and ax,0
    and bx,0
    
      call pthis
db 13, 10, '',0

    mov bx,b
    
    cmp a,bx
    jg fl
    jl ll
    je eq
    
    fl:
     mov ax,a
    sub ax,b
   ; mov bx,a
    
    mov sum,ax
    
    jmp sum1
    
    
    ll:
     mov bx,b
    sub bx,a
    
    mov sum,bx
    
    jmp sum1
    
    
    eq:
    
    mov sum,0
    
    jmp sum1  
    
    
    sum1:
    
    
     cmp sum,50
     
     jg big 
     
     jmp print1
     
    big:
    
    mov bx,100
    sub bx,sum
    
    mov sum,bx
    
    jmp print1 
     
    
    
    
     
    print1:
    
      mov ax,sum
      
    call print_num
    
       call pthis
db 13, 10, '',0
    
   
   
   exit1: 
    mov ah,4ch
    int 21h
    main endp  
    ret 
    
    
    
    DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; required for print_num.
DEFINE_PTHIS

END 

       
        
 
          
