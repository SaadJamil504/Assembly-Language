.model small
.stack 100h
.data
 str1 db 15 dup(?)       
 str2 db 15 dup(?)      

.code
main proc
 mov ax, @data
 mov ds, ax
 mov es, ax
 mov cx, 0               
 lea si, str1           
; Input loop to read characters
aa:
 mov ah, 01h              
 int 21h                 
 cmp al, 13              
 je exit                 
 cmp cx, 15              
 jae exit                
 mov [si], al           
 inc si                   
 inc cx              
 jmp aa                   

; Start reversing part of the string
exit:
 lea si, str1             
 add si, cx             
 dec si                  
 lea di, str2             

; Copy characters in reverse order
bb:
 mov al, [si]          
 mov [di], al            
 dec si                  
 inc di                   
 dec cx                   
 jnz bb                  


 mov al, "$"
 mov [di], al

; Print reversed string
 lea dx, str2            
 mov ah, 09h          
 int 21h           

; Exit program
 mov ah, 4Ch              
 int 21h
main endp
end main
