; Filename: EXER14.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ
; Date: 09/19/2024
; Description: Create a program that asks the user to input 3 characters. 
; Then display each character on its own line.


.model small
.stack 200h
.data 
    firstChar db ?
    secondChar db ?
    thirdChar db ?

    newline db '', 0ah, 0ah, '$'
    dot db '.$'

    firstMsg db 'Enter first character: $'
    secondMsg db 'Enter first character: $'
    thirdMsg db 'Enter first character: $'

    outputMsg1 db 'The first character is $'
    outputMsg2 db 'The second character is $'
    outputMsg3 db 'The third character is $'

.code

Main:
    ; initialize data segment
    mov ax, @data
    mov ds, ax

    ; display the input prompt message
    mov dx, OFFSET firstMsg
    mov ah, 09h
    int 21h

    ; read a character from the keyboard 
    mov ah, 01h ; reads char
    int 21h     ; DOS interrupt
    mov firstChar, al   ; Store the character in inputChar;

    mov dx, OFFSET newline
    mov ah, 09h
    int 21h

    ; display the input prompt message
    mov dx, OFFSET secondMsg
    mov ah, 09h
    int 21h

    ; read a character from the keyboard 
    mov ah, 01h ; reads char
    int 21h     ; DOS interrupt
    mov secondChar, al   ; Store the character in inputChar;

    mov dx, OFFSET newline
    mov ah, 09h
    int 21h

    ; display the input prompt message
    mov dx, OFFSET thirdMsg
    mov ah, 09h
    int 21h

    ; read a character from the keyboard 
    mov ah, 01h ; reads char
    int 21h     ; DOS interrupt
    mov thirdChar, al   ; Store the character in inputChar;

    mov dx, OFFSET newline
    mov ah, 09h
    int 21h


; first

    ; display the output message
    mov dx, OFFSET outputMsg1
    mov ah, 09h
    int 21h

    ; display the character back
    mov dl, firstChar
    mov ah, 02h
    int 21h

    mov dx, OFFSET dot
    mov ah, 09h
    int 21h

    mov dx, OFFSET newline
    mov ah, 09h
    int 21h

;second

    ; display the output message
    mov dx, OFFSET outputMsg2
    mov ah, 09h
    int 21h

    ; display the character back
    mov dl, secondChar
    mov ah, 02h
    int 21h

    mov dx, OFFSET dot
    mov ah, 09h
    int 21h
 
    mov dx, OFFSET newline
    mov ah, 09h
    int 21h

;third

    ; display the output message
    mov dx, OFFSET outputMsg3
    mov ah, 09h
    int 21h

    ; display the character back
    mov dl, thirdChar
    mov ah, 02h
    int 21h

    mov dx, OFFSET dot
    mov ah, 09h
    int 21h

    mov dx, OFFSET newline
    mov ah, 09h
    int 21h

    mov ax, 4C00h
    int 21h
end Main