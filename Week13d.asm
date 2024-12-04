;Filename: Week13d.ASM
;Programmer Name: LANCE JOSEPH LORENZ S. ENARIO
;Program Description: Repeatedly ask user to input a single digit whole number until the number entered is a zero. Display “Thank you.” When the number entered is zero.  
;Date Created: November 8, 2024
 
.MODEL SMALL
.STACK 100H
.DATA

    text1 db 'Filename: Week13d.ASM$'
    text2 db 'Programmer Name: LANCE JOSEPH LORENZ S. ENARIO$'
    text3 db 'Repeatedly ask user to input a single digit whole number until the number entered is a zero.$'
    text4 db 'Date Created: November 8, 2024$'

    prompt_msg  DB 'Enter a single digit number: $'
    thank_you_msg DB 'Thank you.$'
    newline     DB 0Dh, 0Ah, '$'
 
.CODE
MAIN PROC
    MOV AX, @DATA            
    MOV DS, AX         

    mov ah, 9
	mov dx,offset text1
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text2
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text3
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text4
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h       
 
input_loop:

    MOV DX, OFFSET prompt_msg
    MOV AH, 09H              
    INT 21H
 
    MOV AH, 01H             
    INT 21H
    SUB AL, '0'              

    CMP AL, 0               
    JE display_thank_you     
 
    MOV DL, 10              
    MOV AH, 02H
    INT 21H
    MOV DL, 13               
    MOV AH, 02H
    INT 21H
 
    JMP input_loop           
 
display_thank_you:

    MOV DL, 10             
    MOV AH, 02H
    INT 21H
    MOV DL, 13               
    MOV AH, 02H
    INT 21H
 
    MOV DX, OFFSET thank_you_msg
    MOV AH, 09H              
    INT 21H

    MOV AH, 4CH              
    INT 21H
 
MAIN ENDP
END MAIN
 