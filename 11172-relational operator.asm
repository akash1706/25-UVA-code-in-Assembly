include 'emu8086.inc'


ORG    100h

    

CALL   scan_num       ; get number in CX.

call pthis
db 13, 10, '',0

  mov a,cx
   mov bx,0
  while:cmp bx,a
   je exit
   call pthis
db 13, 10, '',0
   call scan_num
   MOV    AX, CX
   mov b,ax
   call pthis
db 13, 10, '',0 
   call scan_num
   MOV    AX, CX
   mov c,ax        ; copy the number to AX.
   call pthis
db 13, 10, '',0 
    mov ax,b
    mov cx,c
    inc bx
   cmp ax,cx
   je p1
   jg p2
   jl p3

   p1:call pthis
db 13, 10, '=',0
jmp while 

   p2:call pthis
db 13, 10, '>',0
   jmp while

p3:call pthis
db 13, 10, '<',0
jmp while

 exit: ret
 

 a dw ? 
 b dw ?
 c dw ?

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; required for print_num.
DEFINE_PTHIS

END 

