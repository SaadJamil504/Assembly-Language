.model small
.stack 100h
.data
    str1 db 10, 13, 'Enter number in binary: $'
    str2 db 10, 13, 'Number in binary is: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, str1
    mov ah, 09h
    int 21h

    mov cx, 8
    xor bl, bl

input_loop:
    mov ah, 01h
    int 21h
    cmp al, 13
    je display

    sub al, 48
    shl bl, 1
    or bl, al
    loop input_loop

display:
    lea dx, str2
    mov ah, 09h
    int 21h

    mov cx, 8
output_loop:
    shl bl, 1
    jc print_one
    mov dl, '0'
    jmp print_char

print_one:
    mov dl, '1'

print_char:
    mov ah, 02h
    int 21h

    loop output_loop

    mov ah, 4Ch
    int 21h
main endp
end main
