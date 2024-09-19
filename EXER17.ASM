; Filename: EXER17.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ S.
; Date: 09/19/2024
; Description: This assembly language program will get string input and
; display back string.

.model small
.stack 100h
.data

StringLength EQU 1000
StringInput db StringLength DUP (?)
InputPrompt db 'Enter text: $'

.code
ProgramStart:
    mov ax, @data
    mov ds, ax

    mov dx, OFFSET InputPrompt
    mov ah, 9 
    int 21h

    mov ah, 3fh     ; DOS read from handle function
    mov bx, 0       ; standard input handle
    mov cx, StringLength   ; read up to maximum number of characters

    mov dx, OFFSET StringInput  ; store the string here
    int 21h
    and ax, ax      ; checks if character was read
    jz Done
    mov cx, ax      ; put string length in CX to be used as a counter

    push cx        ; save the string length
    mov bx, OFFSET StringInput

    pop cx          ; get the string length
    mov ah, 40h   ; DOW write form handle function
    mov bx, 1       ; standard output handle
    mov dx, OFFSET StringInput
    int 21h         ; print the string
Done: 
    mov ah, 4ch
    int 21h
end ProgramStart;