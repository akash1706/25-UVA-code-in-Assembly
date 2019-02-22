include 'emu8086.inc'


ORG    100h

    

CALL   scan_num       ; get number in CX.

call pthis
db 13, 10, '',0


MOV    AX, CX         ; copy the number to AX.
cmp ax,100
jg exit
LEA    SI, msg1       ; ask for the number
CALL   print_string   ;

CALL   print_num      ; print number in AX.

; print the following string:
CALL   pthis
DB   ') = 91 ', 0  
ret


   exit: mov a,ax
        sub a,10
        lea si,msg1
        call print_string
        call print_num
        mov ax,a
        CALL   pthis
         DB   ') = ', 0
         call print_num
         


RET                   ; return to operating system.

msg1   DB  'f91( ', 0
 a dw ?

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; required for print_num.
DEFINE_PTHIS

END 