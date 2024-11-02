.model small
.stack 100h
.data
	str1 db "Enter Both Numbers:$"
	str2 db "Enter the operators:$"
	str3 db "The sum is:$ "
	str4 db "The difference is:$"
	str5 db "Error! sum is greater than 9$"
.code
    main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset str1
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov cl,al
	

	mov ah,01h
	int 21h
	mov ch,al
		
	mov dl,10
	mov ah,2
	int 21h
	mov dl,13
	mov ah,2
	int 21h

	mov dx,offset str2
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov bl,al

	mov dl,10
	mov ah,2
	int 21h
	mov dl,13
	mov ah,2
	int 21h

	cmp bl,'-'
	je aa


	add ch,cl
	sub ch,48

	cmp ch,'9'
	jg bb
	mov dx,offset str3
	mov ah,09h
	int 21h
	mov dl,ch
	mov ah,02h
	int 21h
	jmp exit
	
bb:	mov dx,offset str5
	mov ah,09h
	int 21h
	jmp exit
	
	

aa:	mov dx,offset str4
	mov ah,09h
	int 21h
	sub cl,ch
	add cl,48
	mov dl,cl
	mov ah,02h
	int 21h
	



exit:	MOV AH,4Ch
	int 21h
    main endp

end main