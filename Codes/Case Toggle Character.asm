.model small
.stack 100h
.data

.code
    main proc
	mov ax,@data
	mov ds,ax
	
	mov ah,01h
	int 21h
	
	xor al,20h
	
	mov dl,al
	mov ah,02h
	int 21h



	MOV AH,4Ch
	int 21h
    main endp

end main