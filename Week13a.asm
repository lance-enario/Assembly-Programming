;Filename: Week13a.ASM
;Programmer Name: LANCE JOSEPH LORENZ S. ENARIO
;Program Description: Using a loop, vertically display the numbers 1 to 10.
;Date Created: November 8, 2024
 
.MODEL SMALL
.STACK 100H
.DATA
    
    text1 db 'Filename: Week13a.ASM$'
    text2 db 'Programmer Name: LANCE JOSEPH LORENZ S. ENARIO$'
    text3 db 'Using a loop, vertically display the numbers 1 to 10.$'
    text4 db 'Date Created: November 8, 2024$'

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

    MOV BL, 1
   
    PRINT_LOOP:

        MOV AL, BL 
        MOV AH, 0     
        MOV BH, 10  
        DIV BH     
       

        CMP AL, 0      
        JE SINGLE_DIGIT
       
 
        PUSH AX       
        ADD AL, 30H    
        MOV DL, AL
        MOV AH, 2      
        INT 21H
        POP AX         
       
        MOV DL, AH     
        ADD DL, 30H    
        MOV AH, 2
        INT 21H
        JMP PRINT_NEWLINE
       
    SINGLE_DIGIT:

        MOV DL, AH     
        ADD DL, 30H    
        MOV AH, 2
        INT 21H
       
    PRINT_NEWLINE:

        MOV DL, 0DH   
        MOV AH, 2
        INT 21H
        MOV DL, 0AH    
        MOV AH, 2
        INT 21H
       
        INC BL
       
        CMP BL, 11
        JNE PRINT_LOOP
   
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN