INCLUDE 'emu8086.inc'  ; include library function
.MODEL SMALL
.STACK 100H
.DATA             ; data section
       a dw ?
       b dw ?
       c dw ?
       x dw ?
       y dw ?
       z dw ?
       ab dw ?
       bc dw ?
       ca dw ?
       flag1 db 0
       flag2 db 0
       flag3 db 0    
    
.CODE             ; code section
MAIN PROC         ; main proc start
    MOV AX, @DATA ; import data
    MOV DS, AX

while:            ;scanf("%d%d%d",&a,&b,&c)
   call scan_num
   mov a, cx
   printn
   call scan_num
   mov b, cx
   printn
   call scan_num
   mov c, cx
   printn
   
   mov ax, a
   cmp ax, 0
   je check_b 
   jmp into_if
check_b:
   mov ax, b
   cmp ax, 0
   je check_c
   jmp into_if 
check_c:   
   mov ax, c
   cmp ax, 0
   je else1
   
 into_if:        ;x=a*a
    mov ax, a
    mul ax
    mov x, ax
                 ;y=b*b
    mov ax, b
    mul ax
    mov y, ax
                 ;z=c*c
    mov ax, c
    mul ax
    mov z, ax
                ;ab=x+y
    mov ax, x
    add ax, y
    mov ab, ax
                ;ca=x+z
    mov ax, x
    add ax, z
    mov ca, ax
                ;bc=y+z
    mov ax, y
    add ax, z
    mov bc, ax
                ;flag1=0, flag2=0, flag3=0
    mov flag1, 0
    mov flag2, 0
    mov flag3, 0
    
if_start:
    mov ax, x    ;check x==bc
    cmp ax, bc
    je change_flag1
    jmp check_yAndca
change_flag1:
    mov flag1, 1
check_yAndca:
    mov ax, y    ;check y==ca
    cmp ax, ca
    je change_flag2
    jmp check_zAndab
change_flag2:
    mov flag2, 1
check_zAndab:
    mov ax, z
    cmp ax, ab    ;check z==ab
    je change_flag3
    jmp if2
change_flag3:      
    mov flag3, 1
if2:              ;inner if
    xor ax, ax
    mov al, flag1
    or al, flag2
    or al, flag3
    cmp al, 1
    je ifPrint1
else:             ;inner else
    printn "wrong" 
    jmp else1
ifPrint1:         ;inner if print
    printn "right"          
   
 else1:  
jmp while                      
    
    
Exit:    
    MOV AH, 4CH   ; exit
    INT 21H
    MAIN ENDP      ; main prc end
    DEFINE_PRINT_NUM_UNS
    DEFINE_SCAN_NUM
END MAIN