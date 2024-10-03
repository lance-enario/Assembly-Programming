.MODEL SMALL
.STACK 100h

.DATA
    prompt1 DB 'Enter dividend: $'
    prompt2 DB 'Enter divisor: $'
    divOutput1 DB 'Dividend is: $'
    divOutput2 DB 'Divisor is: $'
    resultMsg DB 'Quotient: $'
    divideByZeroMsg DB 'Error: Division by zero!$'
    num1 DW 0
    num2 DW 0
    quotient DW 0       ; To store the quotient
    remainder DW 0      ; To store the remainder
    newline DB 0Dh, 0Ah, '$'    ; Newline for printing

.CODE
MAIN PROC
    ; Initialize DS register
    MOV AX, @DATA
    MOV DS, AX

    ; Print prompt1 (Enter dividend)
    LEA DX, prompt1
    MOV AH, 09h
    INT 21h

    ; Read first number (dividend)
    CALL ReadNumber
    MOV num1, AX  ; Store dividend in num1

    ; Print prompt2 (Enter divisor)
    LEA DX, prompt2
    MOV AH, 09h
    INT 21h

    ; Read second number (divisor)
    CALL ReadNumber
    MOV num2, AX  ; Store divisor in num2

    ; Output dividend
    LEA DX, divOutput1
    MOV AH, 09h
    INT 21h

    MOV AX, num1
    CALL PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Output divisor
    LEA DX, divOutput2
    MOV AH, 09h
    INT 21h

    MOV AX, num2
    CALL PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Check if num2 (divisor) is zero
    MOV AX, num2
    CMP AX, 0
    JE DivisionByZero      ; Jump to error message if divisor is zero

    ; Perform division
    MOV AX, num1          ; Load dividend into AX
    MOV BX, num2          ; Load divisor into BX
    XOR DX, DX            ; Clear DX (required for division)
    DIV BX                 ; AX = AX / BX (quotient in AX, remainder in DX)

    ; Store quotient and remainder
    MOV quotient, AX
    MOV remainder, DX

    ; Print result message
    LEA DX, resultMsg
    MOV AH, 09h
    INT 21h

    ; Convert quotient to ASCII and print
    MOV AX, quotient
    CALL PrintNumber

    ; Print newline after quotient
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Print remainder (if needed)
    ; You can remove this section if you do not want to display the remainder
    ; MOV AX, remainder
    ; CALL PrintNumber

    ; Exit program
    MOV AX, 4C00h
    INT 21h

DivisionByZero:
    ; Print division by zero message
    LEA DX, divideByZeroMsg
    MOV AH, 09h
    INT 21h

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
