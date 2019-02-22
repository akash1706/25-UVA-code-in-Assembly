include 'emu8086.inc'

ORG    100h
   
CALL   scan_num       ; get number in CX.

call pthis
db 13, 10, '',0

MOV    AX, CX 
mov bx,0        ; copy the number to AX.
while:
    call scan_num
    mov ax,cx    ; print number in AX.
    mov b,ax 
    call pthis
db 13, 10, '',0
     call scan_num
    mov ax,cx    ; print number in AX.
    mov c,ax 
    call pthis
db 13, 10, '',0
     call scan_num
    mov ax,cx    ; print number in AX.
    mov d,ax 
    call pthis
db 13, 10, '',0
    
   
    call pthis
    db 13, 10,'case',0
    mov ax,bx
    call print_num
    mov cx,20
    
    for1:cmp a,cx
    jg exit
    
    for2:cmp b,cx
    jg exit
    
     for3:cmp c,cx
    jg exit
    jng print
    
    print:call pthis
db 13,10, ' : good',0
  jmp exit1

exit: call pthis
db  13,10, '  : bad',0 
 call pthis
db 13, 10, '',0


exit1:inc bx
  cmp bx,a
  jne while

RET                   ; return to operating system.


 a dw ? 
 b dw ?
 c dw ?
 d dw  ?

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; required for print_num.
DEFINE_PTHIS

END 