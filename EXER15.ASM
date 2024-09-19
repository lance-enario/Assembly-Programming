; Filename: EXER15.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ S.
; Date: 09/19/2024
; Description: This assembly language program will continuously get 
; character input and display back input until Enter key is pressed.

.model small
.stack 200h
.data
.code

ProgramStart:
    Echoloop:
        mov ah, 1   ; DOS keyboard input function
        int 21h

        cmp al, 13  ; check if key pressed was Enter key
        jz EchoDone ; calls EchoDone function

        mov dl, al  ; put character into DL
        mov ah,2    ; DOS display output function
        int 21h     ; display characater

    jmp Echoloop    ; echo the next character

    EchoDone:
        mov ah, 4ch ; DOS terminate program function
        int 21h     ; terminate program
END ProgramStart