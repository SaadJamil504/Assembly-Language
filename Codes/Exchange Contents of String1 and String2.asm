;Exchange the contents of str1 and str2


.model small
.stack 100h
.data
	str1 db "FGHIJ$"
	str2 db "ABCDE$"
	str3 db 6 dup ('$') ; Initialize with all '$' to ensure termination
.code
    main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	cld	
	lea si,str2
	lea di,str3

	movsw
	movsw
	movsb	

	; Manually set the '$' at the end of str3
	mov al , "$"
	stosb
	
	cld
	lea si,str1
	lea di,str2

	movsw
	movsw
	movsb	

	; Manually set the '$' at the end of str2
	mov al , "$"
	stosb
	
	cld
	lea si,str3
	lea di,str1

	movsw
	movsw
	movsb	

	; Manually set the '$' at the end of str1
	mov al , "$"
	stosb

	mov dx,offset str1
	mov ah,09h
	int 21h
	
	mov dl,10
	mov ah,2
	int 21h
	mov dl,13
	mov ah,2
	int 21h
	
	mov dx,offset str2
	mov ah,09h
	int 21h

	MOV AH,4Ch
	int 21h
    main endp
end main
