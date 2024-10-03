; Filename: EXER20.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ S.
; Date: DATE TODAY
; Description: This assembly language program will get character input and 
; and determine if input is 'y' or 'Y' to display good morning message
; else display good afternoon message.

.model small
.stack 100h
.data
    inputChar db ?
    dot db '.$'
    inputMsg db 'Enter a character: $'
    aMessage LABEL BYTE
        db 13, 10, 'Yes, you have entered letter A.', 13, 10, '$'
    notAMessage LABEL BYTE
        db 13, 10, 'No, you have not entered letter A. You entered character $'
.code
ProgramStart:
    mov ax, @data
    mov ds, ax

    mov dx, OFFSET inputMsg
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h

    cmp al, 'A'
    mov inputChar,al
    jz IsA

    CALL IsNotA
    jmp Done

IsA:
    mov dx, OFFSET aMessage
    mov ah, 9
    int 21h
    jmp Done

IsNotA:
    mov dx, OFFSET notAMessage 
    mov ah, 9
    int 21h

    mov dl, inputChar
    mov ah, 02h
    int 21h

    mov dx, OFFSET dot
    mov ah, 9
    int 21h

Done:
    mov ax, 4C00h
    int 21h;

end ProgramStart