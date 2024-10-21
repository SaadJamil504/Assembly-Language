.model small
.stack 100h
.386
.data
	var1 db "Enter binary:$"
	var2 db 10,13,"hex is:$"
.code
	main proc
		MOV Ax,@data
		MOV Ds,Ax
		
		lea dx,var1
		mov ah,09h
		int 21h
		MOV Cx,16
		XOR Bx,Bx 

	xx:	MOV AH,01h 
		INT 21H
		
		CMP AL,13 
		JE xy
		
		AND AL,0fh 
		SHL Bx,1 
		OR Bl,Al
		dec Cx
		JNZ xx
		
	xy:	MOV Cx,4
		
	aa:	ROL Bx,4
		MOV Dl,Bl
		AND Dl,0fh
		CMP Dl,9
		JBE bb
		ADD Dl,7
	bb:	ADD Dl,48
		
	cc:
		MOV Ah,02h
		INT 21h
		DEC Cx
		JNZ aa
		
	MOV Ah,4Ch
	INT 21h
	
	main endp
end main