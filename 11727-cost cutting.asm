include 'emu8086.inc'


ORG    100h

    

CALL   scan_num       ; get number in CX.
mov a,cx
 call pthis
db 13, 10, '',0 

CALL   scan_num       ; get number in CX.
mov b,cx
 call pthis
db 13, 10, '',0

CALL   scan_num       ; get number in CX.
mov c,cx
 call pthis
db 13, 10, '',0


 a1:mov dx,b
 cmp a,dx
 jg a2
 
 a2: mov dx,c
 cmp a,dx
 mov ax,a
 jng print
 
  a3:mov dx,b
 cmp a,dx
 jng a4
 
 a4: mov dx,c
 cmp a,dx
 mov ax,a
 jg print
 
 
 b1:mov dx,a
 cmp b,dx
 jg b2
 
 b2: mov dx,c
 cmp b,dx
 mov ax,b
 jng print
 
  b3:mov dx,a
 cmp b,dx
 jng b4
 
 b4: mov dx,c
 cmp b,dx
 mov ax,b
 jg print
 
 
  c1:mov dx,a
 cmp c,dx
 jg c2
 
 c2: mov dx,b
 cmp c,dx
 mov ax,c
 jng print
 
  c3:mov dx,a
 cmp c,dx
 jng c4
 
 c4: mov dx,b
 cmp c,dx
 mov ax,c
 jg print


print: 
  call pthis
db 13, 10, 'case  : ',0
CALL   print_num      ; print number in AX.



RET                   ; return to operating system.


 a dw ?
 b dw ?
 c dw ?

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; required for print_num.
DEFINE_PTHIS

END 


        