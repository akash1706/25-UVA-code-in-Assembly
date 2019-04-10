include 'emu8086.inc'

ORG    100h

CALL   scan_num       ; get number in CX.
 call pthis
db 13, 10, '',0

  MOV  AX, CX 
   mov A,ax        ; copy the number to AX.
      mov bx,2
     div bx 
     mov cx,a
     add ax,cx
      
        ;

CALL   print_num      ; print number in AX.



RET                   ; return to operating system.


 a dw ?

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; required for print_num.
DEFINE_PTHIS

END 


