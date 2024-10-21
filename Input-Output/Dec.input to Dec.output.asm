.model small
.stack 100h
.data
	str1 db "Input decimal number:$"
	str2 db "The decimal number is:$"
.code
    main proc
	mov ax,@data
	mov ds,ax
	lea dx,str1
	mov ah,09h
	int 21h
	call f1
	lea dx,str2
	mov ah,09h
	int 21h
	call f2

	MOV AH,4Ch
	int 21h
    main endp
f1 proc
again:
	mov ah,01
	int 21h
	cmp al,13
	je exit
	sub al,48
	mov cl,al
	mov ch,0
	mov ax,bx
	mov bx,10
	mul bx
	add ax,cx
	mov bx,ax
	jmp again
	
exit:
	ret
f1 endp
f2 proc
    mov ax, bx      
    
    mov cx, 0       
aa: 
    cmp ax, 0       
    je print        
    mov bx, 10      
    mov dx,0      
    div bx          
    push dx         
    inc cx          
    jmp aa          

print:
    pop dx          
    add dl, 48      
    mov ah, 02      
    int 21h         
    dec cx          
    jnz print       

    ret
f2 endp

end main
