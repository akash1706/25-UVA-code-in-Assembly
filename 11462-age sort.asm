INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
     X Dw ?
     Y DB 0
     ARRAY Dw 11 DUB(?)
     
     .code 
     main proc
        mov  bx,0
        mov dx ,20
        mov x,dx 
      input:
          call scan_num
          mov array[bx],cx
          call pthis
db 13, 10, '',0
          mov cx,0
          inc bx
          inc bx
          mov dx,x
          
          cmp bx,dx
          je sort
          jmp input
          
        sort:mov ax,0
        mov bx,0 
        mov si,0
        
        sort1:mov dx, array[bx]
         cmp array[si],dx
              jg sort2
              inc bx
              inc bx 
              mov dx,x
              cmp bx,dx
             
              jne sort1
              mov bx,0
               jmp inc_si
              
              sort2:mov cx,array[bx]
              mov dx,array[si]
              mov array[bx],dx
              mov array[si],cx
              inc bx
              inc bx
              mov dx ,x 
              cmp bx,dx
               jne sort1
               mov bx,0
              jmp inc_si
             
              
              
              
              inc_si:mov dx,x
               cmp si,dx
              je print
              inc si
              inc si
                       ;call pthis
;db 13, 10, '',0
              jmp sort1
              
              print:mov si,0
              
              print1:  mov dx,x
              cmp si,dx
              je exit
              mov ax,array[si]
              call print_num
              call pthis
db 13, 10, '',0
              inc si
              inc si
      
              jmp print1
              
              exit:
              mov ah,4ch
INT 21h  
              
              
              
           
 
 
 
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; required for print_num.
DEFINE_PTHIS

END 
