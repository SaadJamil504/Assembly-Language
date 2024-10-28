.model small
.stack 100h
.386
.data
    ipstr db 10,13,"Enter a string: $"
	opstrt db 10,13,"String is palindrome $"
	opstrf db 10,13,"String is not a palindrome $"
	str1 db 100 dup("$")
	
	

.code
	main proc
		Mov Ax,@data
		Mov Ds,Ax
		
		Mov Cx,0

		Mov SI,offset str1
;input prompt
		LEA Dx,ipstr
		Mov Ah,09h
		INT 21h
		
;input 1 char		
again:	Mov Ah,01h
		INT 21h
		CMP Al,13
		JE exit
		PUSH Ax
		Mov [SI],Al
		INC SI
		INC Ch
		JMP again
		
exit:	Mov SI,offset str1
pops:	POP Dx
		CMP [SI],Dl
		JNE next
		INC Cl
next:	INC SI
		CMP SP,0100h
		JNE pops
		
		Mov Ah,09
		CMP Ch,Cl
		JNE fls
		Mov Dx,offset opstrt
		INT 21h
		JMP ter
fls:	Mov Dx,offset opstrf
		INT 21h
ter:	Mov Ah,4Ch
		INT 21h
	main endp
end main