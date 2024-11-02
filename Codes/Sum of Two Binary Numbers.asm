.model small
.stack 100h
.data
    str1 db "Enter binary 1:$"
    str2 db "Enter binary 2:$"
    str3 db "Sum of 2 binary:$"
    newline db 13, 10, '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Input first binary number
    lea dx, str1
    mov ah, 09h
    int 21h

    mov cx, 8
    xor bx, bx
input1:
    mov ah, 01h
    int 21h

    cmp al, 13
    je end_input1

    and al, 0Fh
    shl bl, 1
    or bl, al
    loop input1

end_input1:
    lea dx, newline
    mov ah, 09h
    int 21h

    ; Input second binary number
    lea dx, str2
    mov ah, 09h
    int 21h

    mov cx, 8
    xor bh, bh
input2:
    mov ah, 01h
    int 21h

    cmp al, 13
    je end_input2

    and al, 0Fh
    shl bh, 1
    or bh, al
    loop input2

end_input2:
    lea dx, newline
    mov ah, 09h
    int 21h

    ; Add the two binary numbers
    lea dx, str3
    mov ah, 09h
    int 21h

    mov cx, 8
    add bl, bh
    clc ; Clear carry flag

print_sum:
    rcl bl, 1
    jc print_1
    mov dl, '0'
    jmp print_digit

print_1:
    mov dl, '1'

print_digit:
    mov ah, 02h
    int 21h
    loop print_sum

    lea dx, newline
    mov ah, 09h
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main