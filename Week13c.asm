;Filename: Week13c.ASM
;Programmer Name: LANCE JOSEPH LORENZ S. ENARIO
;Program Description: Ask user to input a number from 1 to 8. Display error message if number entered is less than 1 or greater than 8. 
;                       If input is correct, horizontally display the numbers, with space between each number, from 1 to the number entered by user.
;Date Created: November 8, 2024
 
.MODEL SMALL
.STACK 100H
.DATA

    text1 db 'Filename: Week13c.ASM$'
    text2 db 'Programmer Name: LANCE JOSEPH LORENZ S. ENARIO$'
    text3 db 'Ask user to input a number from 1 to 8, horizontally display the numbers 1 to the number entered by the user.$'
    text4 db 'Date Created: November 8, 2024$'

    prompt_msg  DB 'Enter a number from 1 to 8: $'
    error_msg   DB 'Error: Number out of range!$'
    newline     DB 0Dh, 0Ah, '$'
    space       DB ' $'
 
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
 
    ; Check if input is within range 1-8
    CMP AL, 1                
    JB show_error           
    CMP AL, 8                
    JA show_error            

    ;I store user input in upper bits of CX register because AL and CL will be used for printing newline
    MOV CH, AL

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h 

    MOV AL, CH
 
    MOV CL, AL               
    MOV BL, 1               
 
display_numbers:

    MOV DL, BL               
    ADD DL, '0'             
    MOV AH, 02H             
    INT 21H
 
    DEC CL                   
    JZ end_display           
    MOV DL, ' '              
    MOV AH, 02H              
    INT 21H
 
    INC BL
    JMP display_numbers     
 
end_display:

    MOV DX, OFFSET newline
    MOV AH, 09H
    INT 21H
    JMP input_loop           
 
show_error:

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h 

    MOV DX, OFFSET error_msg
    MOV AH, 09H
    INT 21H
    MOV DX, OFFSET newline
    MOV AH, 09H
    INT 21H
    JMP input_loop         
 
MAIN ENDP
END MAIN
 