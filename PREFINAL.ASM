; Filename: PREFINAL.ASM
; CS243 Lab Hands-on Pre-Final Exam 
; First Semester SY 2024-2025
; Student Name: LANCE JOSEPH LORENZ S. ENARIO
; Date Finished: 11/14/2024
 
.model small
.stack 100h
.data
    header  db 'Cebu Institute of Technology - University', 13,10
            db 'Automatic Teller Machine',13,10
            db 'Programmer: LANCE JOSEPH LORENZ S. ENARIO',13,10
            db 'Copyright 2024',13,10,10, '$'
    
    menu    db 'Main Menu',13,10
            db '1. Balance Inquiry',13,10
            db '2. Deposit',13,10
            db '3. Withdrawal',13,10
            db '4. Exit',13,10
            db 'Enter number of your choice: ', '$'
 
    choice  db ?

    balanceInquiry  db 13,10,10,'Balance Inquiry', 13,10, 
                    db 'Your current balance: P$'

    depositPrompt   db 13,10,'Enter deposit amount: P$'
    depositMessage  db 'You deposited P$', 13, 10, '$'

    withdrawalPrompt   db 13,10,'Enter withdrawal amount: P$'
    withdrawalMessage  db 'You withdrew P$', 13, 10, '$'

    withdrawal     db 13,10,10,'Withdrawal', 13,10,10, '$'
    deposit        db 13,10,10,'Deposit', 13,10,10, '$'
    exit           db 13,10,10,'Exit', 13,10,10,'$'

    temp dw 0
    balance dw 0

    error db 'ERROR! Insufficient balance!$'
    pressEnter DB '', 13, 10,'Press Enter to continue...', 13, 10, '$'

    endMessage  db 'Thank you for banking with us!',13,10
                db 'Copyright 2024',13,10
                db 'Programmer: LANCE JOSEPH LORENZ S. ENARIO', '$'
.code

main:    

while_loop:
    mov ax, @data
    mov ds, ax

    mov ax, 3
    int 10h

    ;color orange
    xor al, al
    MOV AH, 06h
    MOV CH, 0
    MOV CL, 0
    MOV DH, 3
    MOV DL, 40  
    MOV BH, 6Fh
    INT 10h

    MOV AH, 06h
    MOV CH, 5
    MOV CL, 0
    MOV DH, 10
    MOV DL, 40  
    MOV BH, 1Fh
    INT 10h

    mov ah, 09h
    lea dx, header
    int 21h

    mov ah, 09h
    lea dx, menu
    int 21h

    xor al, al
    xor ah, ah
    xor ax, ax

; Ask for choice 
    mov ah, 01h                  
    int 21h                      
    sub al, '0'                  
    mov choice, al               

; switch case (?) for choice
    cmp choice, 1
    je  displayBalanceInquiry
    cmp choice, 2
    je  displayDeposit
    cmp choice, 3
    je  displayWithdrawal
    cmp choice, 4
    je  displayExit

; If invalid choice
    mov dx, offset error
    mov ah, 09h
    int 21h
    jmp while_loop

displayBalanceInquiry:
    lea dx, balanceInquiry
    call printOutput

    call showBalanceInquiry
    call waitForEnterAndClear
    call while_loop
displayDeposit:    
    lea dx, deposit
    call printOutput

    call showDeposit
    call waitForEnterAndClear
    call while_loop
displayWithdrawal:       
    lea dx, withdrawal
    call printOutput

    call showWithdrawal
    call waitForEnterAndClear
    call while_loop
displayExit:          
    lea dx, exit
    call printOutput
    call exitProgram

printOutput:          
    mov ah, 09h
    int 21h
    ret

; Subroutine to read a number from input
ReadNumber PROC
    XOR AX, AX          ; Clear AX (to store result)
    XOR BX, BX          ; BX will hold the result
ReadLoop:
    MOV AH, 01h         ; Function to read a character from input
    INT 21h             ; Read character
    CMP AL, 0Dh         ; Check if Enter (0Dh is Enter)
    JE DoneReading      ; If Enter is pressed, finish reading
    SUB AL, '0'         ; Convert ASCII to digit
    MOV CL, AL          ; Store the digit in CL
    MOV AX, BX          ; Move current result into AX
    MOV DX, 10          ; Prepare for multiplication by 10
    MUL DX              ; AX = AX * 10 (shift left by one decimal place)
    ADD AX, CX          ; Add the new digit to AX
    MOV BX, AX          ; Store the result back in BX
    JMP ReadLoop        ; Continue reading next digit
DoneReading:
    MOV AX, BX          ; Return the result in AX
    RET
ReadNumber ENDP

; Subroutine to print a number
PrintNumber PROC
    XOR CX, CX          ; Clear CX (to store digit count)
    MOV BX, 10          ; Divider for base 10
    MOV DX, 0           ; Clear DX
PrintLoop:
    XOR DX, DX          ; Clear DX before DIV
    DIV BX              ; Divide AX by 10
    PUSH DX             ; Push remainder (digit) to stack
    INC CX              ; Increment digit count
    TEST AX, AX         ; Check if AX is 0
    JNZ PrintLoop       ; If not, continue loop
PrintDigits:
    POP DX              ; Get digit from stack
    ADD DL, '0'         ; Convert to ASCII
    MOV AH, 02h         ; Function to print character
    INT 21h             ; Print the digit
    LOOP PrintDigits    ; Repeat for all digits

    RET
PrintNumber ENDP

waitForEnterAndClear:
    ; Display "Press Enter to continue..."
    LEA DX, pressEnter
    MOV AH, 09h
    INT 21h

    ; Wait for Enter key
    MOV AH, 00h
    INT 16h

    mov ah, 06h
    mov al, 0 
    mov cx,0
    mov dh,15
    int 10h
    ret

showBalanceInquiry:
    MOV ax, balance
    CALL PrintNumber
    ret

showDeposit:
    ; Print prompt1 (Enter first number)
    LEA DX, depositPrompt
    call printOutput

    ; Read first number from input
    CALL ReadNumber
    MOV temp, AX  ; Store first number in num1

    ; Perform addition
    MOV AX, temp
    ADD AX, balance
    MOV balance, AX

    ; Print result message
    LEA DX, depositMessage
    call printOutput

    ; Convert result to ASCII and print
    MOV AX, balance
    CALL PrintNumber

    ret
showWithdrawal:
    ; Print prompt1 (Enter first number)
    LEA DX, withdrawalPrompt
    call printOutput

    ; Read first number from input
    CALL ReadNumber
    MOV temp, AX  ; Store first number in num1

    ; Perform addition
    MOV AX, balance
    SUB AX, temp
    MOV balance, AX

    ; Print result message
    LEA DX, withdrawalMessage
    call printOutput

    ; Convert result to ASCII and print
    MOV AX, temp
    CALL PrintNumber

    ret

exitProgram:          
    mov ah, 09h
    lea dx, endMessage
    int 21h

    mov ah, 4Ch
    int 21h
    ret
end main
