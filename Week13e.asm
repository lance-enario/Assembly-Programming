;Filename: Week13e.ASM
;Programmer Name: LANCE JOSEPH LORENZ S. ENARIO
;Program Description: Repeatedly display an ATM main menu until the user presses “e” for Exit.
;Date Created: November 8, 2024
 
.MODEL SMALL
.STACK 100H
.DATA

    text1 db 'Filename: Week13e.ASM$'
    text2 db 'Programmer Name: LANCE JOSEPH LORENZ S. ENARIO$'
    text3 db 'Repeatedly display an ATM main menu until the user presses e for Exit.$'
    text4 db 'Date Created: November 8, 2024$'

    menu_msg        DB 'CIT-U ATM', 0Dh, 0Ah
                    DB 'a. Balance Inquiry', 0Dh, 0Ah
                    DB 'b. Deposit', 0Dh, 0Ah
                    DB 'c. Withdrawal', 0Dh, 0Ah
                    DB 'd. Bills Payment', 0Dh, 0Ah
                    DB 'e. Exit', 0Dh, 0Ah, 0Dh, 0Ah, 'Enter choice: $'
    balance_msg     DB 0Dh, 0Ah, 'Balance Inquiry', 0Dh, 0Ah, '$'
    deposit_msg     DB 0Dh, 0Ah, 'Deposit', 0Dh, 0Ah, '$'
    withdraw_msg    DB 0Dh, 0Ah, 'Withdrawal', 0Dh, 0Ah, '$'
    bills_msg       DB 0Dh, 0Ah, 'Bills Payment', 0Dh, 0Ah, '$'
    exit_msg        DB 0Dh, 0Ah, 'Exit. Thank you!$', 0Dh, 0Ah
 
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
 
menu_loop:

    MOV DX, OFFSET menu_msg
    MOV AH, 09H             
    INT 21H

    MOV AH, 01H              
    INT 21H
    MOV CH, AL              

    mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h
 
    CMP CH, 'a'
    JE balance_option
    CMP CH, 'b'
    JE deposit_option
    CMP CH, 'c'
    JE withdrawal_option
    CMP CH, 'd'
    JE bills_payment_option
    CMP CH, 'e'
    JE exit_program

    JMP menu_loop      
 
balance_option:
    MOV DX, OFFSET balance_msg
    MOV AH, 09H
    INT 21H

    mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    JMP menu_loop
 
deposit_option:
    MOV DX, OFFSET deposit_msg
    MOV AH, 09H
    INT 21H

    mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    JMP menu_loop
 
withdrawal_option:
    MOV DX, OFFSET withdraw_msg
    MOV AH, 09H
    INT 21H

    mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    JMP menu_loop
 
bills_payment_option:
    MOV DX, OFFSET bills_msg
    MOV AH, 09H
    INT 21H

    mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    JMP menu_loop
 
exit_program:

    MOV DX, OFFSET exit_msg
    MOV AH, 09H
    INT 21H
    MOV AH, 4CH         
    INT 21H
 
MAIN ENDP
END MAIN
 