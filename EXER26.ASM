; Filename: EXER26.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ S.
; Date: September 26, 2024
; Description:  Make a program to input two integers, subtract the second 
; integer from the first integer, and display the difference
; of the two integers.

.model small
.stack 100h
.data

    additionPrompt1 db 'Enter first addend: $'
    additionPrompt2 db 'Enter second addend: $'
    resultText db 'Result: $'
    newline1 db '', 0ah, '$'

    input1 db ?      ; Store first input (ASCII char)
    input2 db ?      ; Store second input (ASCII char)

.code

main:
    mov ax, @data
    mov ds, ax

    ; Input first addend
    lea dx, additionPrompt1
    mov ah, 9
    int 21h

    mov ah, 01h      ; Read first addend (as char)
    int 21h 
    sub al, '0'      ; Convert char to number
    mov bl, al       ; Store first number in BL

    ; Display newline
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    ; Input second addend
    lea dx, additionPrompt2
    mov ah, 9
    int 21h

    mov ah, 01h      ; Read second addend (as char)
    int 21h 
    sub al, '0'      ; Convert char to number
    add bl, al       ; Add second number to BL

    ; Show "Result: "
    lea dx, resultText
    mov ah, 9
    int 21h

    ; Check if result is greater than 9 (i.e., multi-digit)
    cmp bl, 9
    jg multi_digit   ; Jump to multi-digit result handling if result > 9

    ; Single-digit result
    add bl, '0'      ; Convert single digit to ASCII
    mov dl, bl
    mov ah, 02h
    int 21h          ; Print single-digit result
    jmp done         ; Skip multi-digit handling

multi_digit:
    ; Multi-digit result (handle both tens and ones digits)
    mov al, bl       ; Move result into AL
    xor ah, ah       ; Clear AH to prepare for division
    mov cx, 10       ; Dividing by 10
    div cx           ; AL = quotient (tens), AH = remainder (ones)

    mov al


    ; Display tens digit
    mov dl, al
    add al, '0'      ; Convert tens digit to ASCII
    mov ah, 02h
    int 21h          ; Print tens digit

    ; Display ones digit
    mov dl, ah
    add ah, '0'      ; Convert ones digit to ASCII
    mov ah, 02h
    int 21h          ; Print ones digit

done:
    ; Display newline
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    
end main
