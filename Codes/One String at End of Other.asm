;Append one string at the end of the second string

.model small
.stack 100h
.data
	str1 db "FGHIJ"
	str2 db "ABCDE"

.code
    main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	lea di,str2+5
	lea si,str1
	
	movsw
	movsw
	movsb	
	mov al,"$"
	stosb

	lea dx , str2
	mov ah,09h
	int 21h
	

	MOV AH,4Ch
	int 21h
    main endp

end main
