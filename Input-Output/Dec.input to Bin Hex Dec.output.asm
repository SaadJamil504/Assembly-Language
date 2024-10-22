.model small
.stack 100h
.data
	str1 db 10,13, 'Enter number in decimal: $'
	str2 db 10,13,'The number in Binary is $'
	str3 db 10,13,'The number in Decimal is $'
	str4 db 10,13,'The number in Hexadecimal is $'
	
.code
	main proc
		MOV Ax,@data
		MOV Ds,Ax
		
		;decimal input
		LEA Dx ,str1
		MOV Ah,09h
		INT 21h
		
		CALL dec_input
		PUSH Ax
		PUSH Ax
		PUSH Ax
		
		;binary output
		LEA Dx ,str2
		MOV Ah,09h
		INT 21h
		
		POP Ax
		MOV Bx,2
		CALL dec_output
		
		;decimal output
		LEA Dx ,str3
		MOV Ah,09h
		INT 21h
		
		POP Ax
		MOV Bx,10
		CALL dec_output
		
		;hexadecimal output
		LEA Dx ,str4
		MOV Ah,09h
		INT 21h
		
		POP Ax
		MOV Bx,16
		CALL dec_output
	
		MOV Ah,4ch
		INT 21h
	main endp
	
	;procedure of input in decimal
	dec_input proc		
		MOV Bx,0
	again:MOV Ah,01h
		INT 21h
		CMP Al,13
		JE exit
		SUB Al,48
		MOV Cl,Al
		MOV Ch,0
		MOV Ax,Bx
		MOV Bx,10
		MUL Bx
		ADD Ax,Cx
		MOV Bx,ax
		JMP again
	exit:MOV Ax,Bx
		RET
	dec_input endp
	
	;procedure of output in binary, decimal and hexadecimal
	dec_output proc
		PUSH Ax
		PUSH Bx
		PUSH Cx
		PUSH Dx
		MOV Cx,0
	again1:CMP Ax,0
		JE print
		MOV Dx,0
		DIV Bx
		PUSH Dx
		INC Cx
		JMP again1
	print:POP Dx
		CMP Dl,9
		JBE digit
		ADD Dl,7
	digit:ADD Dl,48
		MOV Ah,02h
		INT 21h
		DEC Cx
		JNZ print
		POP Ax
		POP Bx
		POP Cx
		POP Dx
		RET
	dec_output endp
end main