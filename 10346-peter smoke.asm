include 'emu8086.inc'


ORG    100h

    

CALL   scan_num       ; get number in CX.
 call pthis
db 13, 10, '',0


  MOV  AX, CX 
   mov n,ax        ; copy the number to AX.
   CALL   scan_num       ; get number in CX.
 call pthis
db 13, 10, '',0


  MOV  AX, CX 
   mov k,ax  
     
  mov ax,n
  mov bx,0
  mov a,ax  
  mov cx,k
  while:cmp ax,cx
  div cx
  add a,ax
  add ax,dx
  jng while
  
    
     

CALL   print_num      ; print number in AX.



RET                   ; return to operating system.


 a dw ?
 n dw ?
 k dw ?

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; required for print_num.
DEFINE_PTHIS

END 


