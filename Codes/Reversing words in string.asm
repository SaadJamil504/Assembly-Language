.model small
.stack 100h
.data
	str1 db 100 dup("$")
.code
    main proc
	mov ax,@data
	mov ds,ax

	mov si,offset str1
aa:	mov ah,01h
	int 21h
	
	cmp al,13
	je exit
	
	cmp al," "
	je print
	
	push ax
	jmp aa

print: pop dx
	mov [si],dl
	inc si
	cmp sp,0100h
	jne print
	mov dl," "
	mov [si],dl
	inc si
	jmp aa

exit:
	pop dx
	mov [si],dl
	inc si
	cmp sp,0100h
	jne exit
	lea dx,str1
	mov ah,09h
	int 21h


	MOV AH,4Ch
	int 21h
    main endp

end main
