; Filename: EXER28.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ S.
; Date: 09/29/2024
; Description: Make a program to input two integers, multiply the two
; integers, and display the product of the two integers.


.MODEL SMALL
.STACK 100h

.DATA
    prompt1 DB 'Enter multiplicand: $'
    prompt2 DB 'Enter multiplier: $'

    mulOutput1 db 'Multiplicand is: $'
    mulOutput2 DB 'Multiplier is: $'

    resultMsg DB 'Product: $'
    num1 DW 0
    num2 DW 0
    result DW 0
    newline DB 0Dh, 0Ah, '$'    ; Newline for printing

.CODE
MAIN PROC
    ; Initialize DS register
    MOV AX, @DATA
    MOV DS, AX

    ; Print prompt1 (Enter first number)
    LEA DX, prompt1
    MOV AH, 09h
    INT 21h

    ; Read first number from input
    CALL ReadNumber
    MOV num1, AX  ; Store first number in num1

    ; Print prompt2 (Enter second number)
    LEA DX, prompt2
    MOV AH, 09h
    INT 21h

    ; Read second number from input
    CALL ReadNumber
    MOV num2, AX  ; Store second number in num2

    LEA DX, mulOutput1
    MOV AH, 09h
    INT 21h

    MOV AX, num1
    call PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    LEA DX, mulOutput2
    MOV AH, 09h
    INT 21h

    MOV AX, num2
    call PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Perform multiplication
    MOV AX, num1
    MOV DX, num2
    MUL DX
    MOV result, AX

    ; Print result message
    LEA DX, resultMsg
    MOV AH, 09h
    INT 21h

    ; Convert result to ASCII and print
    MOV AX, result
    CALL PrintNumber

    ; Exit program
    MOV AX, 4C00h
    INT 21h
MAIN ENDP

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

END MAIN
