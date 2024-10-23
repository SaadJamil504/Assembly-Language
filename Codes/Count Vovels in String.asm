.model small
.stack 100h
.data

	str1 db 50 dup(?)
	str2 db "Enter the String:$"

.code
    main proc
	mov ax,@data
	mov ds,ax
	mov es , ax
	mov dx,offset str2
	mov ah,09h
	int 21h
	mov cx,0
	lea si,str1
aa:	mov ah,01h
	int 21h
	cmp al ,13
	je exit
	mov [si],al
	inc si
	cmp al , "a"
	je ii
	cmp al , "e"
	je ii
	cmp al , "i"
	je ii
	cmp al , "o"
	je ii
	cmp al , "u"
	je ii
	cmp al , "A"
	je ii
	cmp al , "E"
	je ii
	cmp al , "I"
	je ii
	cmp al , "O"
	je ii
	cmp al , "U"
	je ii
	jmp aa
ii:	

	inc cx
	jmp aa	


exit:
	add cx,48
	mov dl,cl
	mov ah , 02h
	int 21h

	MOV AH,4Ch
	int 21h
    main endp

end main