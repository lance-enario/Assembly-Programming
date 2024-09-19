; Filename: EXER14.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ
; Date: 09/19/2024
; Description: This assembly language program will get character input and 
; display back character input.

.model small
.stack 200h
.data 
    inputChar db ?
    inputMsg db 'Enter a character: $'
    outputMsg db 'You entered: $'

.code

Main:
    ; initialize data segment
    mov ax, @data
    mov ds, ax

    ; display the input prompt message
    mov dx, OFFSET inputMsg
    mov ah, 09h
    int 21h

    ; read a character from the keyboard 
    mov ah, 01h ; reads char
    int 21h     ; DOS interrupt
    mov inputChar, al   ; Store the character in inputChar;

    ; display the output message
    mov dx, OFFSET outputMsg
    mov ah, 09h
    int 21h

    ; display the character back
    mov dl, inputChar
    mov ah, 02h
    int 21h

    mov ax, 4C00h
    int 21h
end Main