.model small
.stack 100h
.data
	str1 db "Enter a character:$"
.code
    main proc
	mov ax,@data
	mov ds,ax
	
	mov dx,offset str1
	mov ah,09h
	int 21h

	mov ah,01h
	int 21h
	
	
    mov bl , al 
	
	mov cx,8	
    mov dl,10
	mov ah,2
	int 21h
	mov dl,13
	mov ah,2
	int 21h        
    
	
	         
aa: shl bl,1         
    jc one          
    mov dl,'0'      
    mov ah,2
    int 21h
    jmp bb
one: mov dl,'1'     
    mov ah,2
    int 21h
	
bb: dec cx          
    jnz aa
  

	mov dl,cl
	mov ah,02h
	int 21h


	MOV AH,4Ch
	int 21h
    main endp

end main