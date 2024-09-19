; Filename: EXER13.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ S.
; Date: 09/19/2024
; Description: This assembly language program will display multiple string 
; variables on separate lines.

.model small
.stack 200h
.data

String1 db 'Line1', 0dh, 0ah, '$';
String2 db 'Line2', 0dh, 0ah, '$';
String3 db 'Line3', 0dh, 0ah, '$';

.code

ProgramStart:
    mov ax, @data
    mov ds, ax
    mov ah, 9
    mov dx, OFFSET String1
    int 21h

    mov dx, OFFSET String2
    int 21h

    mov dx, OFFSET String3
    int 21h

    mov ah, 4ch
    int 21h
end ProgramStart
