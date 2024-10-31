.model small
.stack 100h
.data
	str1 db 10,13,"Too many right brackets$"
	str2 db 10,13,"Too many left brackets$"
	str3 db 10,13,"Expression is correct$"
	str4 db 10,13,"To Restart press N$"
.code
    main proc
	mov ax,@data
	mov ds,ax
sss:
aa:	mov ah,01h
	int 21h
	CMP Al,13
	JE ee
	cmp al,'('
	je ap
	cmp al,")"
	je bb
	jmp aa
		
		
ap:	push Ax
	jmp aa

bb:	cmp SP,0100h
	je err
	
	pop dx
	jmp aa
		
err:
	mov Dx,offset str1		;error message for too many right
	mov Ah,09
	int 21h
	jmp exit

ee:	cmp SP,0100h
	jne err2
	mov dx,offset str3			;correct message
	mov ah,09h
	int 21h
	je exit
err2:	
	mov dx,offset str2			;error message for too many left
	mov ah,09h
	int 21h

exit:mov dx,offset str4			;error message for too many left
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	cmp al,"N"
	je sss

mov AH,4Ch
int 21h
		
		main endp

end main