; Filename: EXER16.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ S.
; Date: DATE TODAY
; Description: This assembly language program will get character input and 
; and determine if input is 'y' or 'Y' to display good morning message
; else display good afternoon message.

.model small
.stack 100h
.data
    TimePrompt db 'Is it after 12 noon (Y/N)?$'
    GoodMorningMessage LABEL BYTE
        db 13, 10, 'Good morning, world!', 13, 10, '$'
    GoodAfternoonMessage LABEL BYTE
        db 13, 10, 'Good afternoon, world!', 13, 10, '$'
.code
ProgramStart:
    mov ax, @data
    mov ds, ax
    mov dx, OFFSET TimePrompt
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h

    cmp al, 'y'
    jz IsAfternoon
    cmp al, 'Y'
    jz IsMorning

IsAfternoon:
    mov dx, OFFSET GoodAfternoonMessage ;
    jmp DisplayGreeting

IsMorning:
    mov dx, OFFSET GoodMorningMessage 

DisplayGreeting:
    mov ah, 9
    int 21h

    mov ah, 4ch
    int 21h

end ProgramStart