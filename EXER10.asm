.model small
.stack 100
.data

box             db "-----------------------" ,0Ah
                db "|                     |" ,0Ah
                db "-----------------------$"

fullName        db "Name: ", 0Ah, "$"
space           db "          $"

.code

start:

mov ax, @data
mov ds, ax

    lea dx, fullName
    mov ah, 09h
    int 21h

    lea dx, box
	mov ah, 09
	int 21h


int 27h
end start;

