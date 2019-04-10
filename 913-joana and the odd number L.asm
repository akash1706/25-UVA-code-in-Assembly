include 'emu8086.inc'
.model small
.stack 100h
.data
    n dw ?
    sum dw ?
    odd dw ?
.code
main proc
    mov ax, @data
    mov ds, ax
while:
    call scan_num    ; input the number
    printn
    mov ax, cx       ;ax=cx
    mov n, cx        ;n=cx
    add ax, 2        ;n+2
    mov cx, n         
    mul cx          ;n*(n+2)
    mov cx, 2       ;cx=2
    div cx          ;ax/cx
    mov odd, ax     ;odd=ax
    mov cx, 3       ;cx=3
    mul cx          ;ax=ax*cx
    sub ax, 6       ;ax-ax
    call print_num  ;print the number
    printn
jmp while    
    main endp       
                    ; define buid in function
define_scan_num
define_print_num
define_print_num_uns
end main
