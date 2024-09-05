.model small
.stack 100
.data

try db "MULTIPLICATION TABLE$"
create db "Created by: LANCE JOSEPH LORENZ ENARIO$"
date db "Date: 09/05/2024$"
row0 db "| x | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |$"
row1 db "| 1 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |$"
row2 db "| 2 | 2 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 18 | 20 |$"
row3 db "| 3 | 3 | 6 | 9 | 12 | 15 | 18 | 21 | 24 | 27 | 30 |$"
row4 db "| 4 | 4 | 8 | 12 | 16 | 20 | 24 | 28 | 32 | 36 | 40 |$"
row5 db "| 5 | 5 | 10 | 15 | 20 | 25 | 30 | 35 | 40 | 45 | 50 |$"
row6 db "| 6 | 12 | 18 | 24 | 30 | 36 | 30 | 42 | 48 | 54 | 60 |$"
row7 db "| 7 | 7 | 14 | 21 | 28 | 35 | 42 | 49 | 56 | 63 | 70 |$"
row8 db "| 8 | 8 | 16 | 24 | 32 | 40 | 48 | 56 | 64 | 72 | 80 |$"
row9 db "| 9 | 9 | 18 | 27 | 36 | 45 | 54 | 63 | 72 | 81 | 90 |$"
row10 db "| 10 | 10 | 20 | 30 | 40 | 50 | 60 | 70 | 80 | 90 | 100 |$"

.code

start:

	mov ax, @data
	mov ds, ax

	lea dx, try
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

	lea dx, create
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

	lea dx, date
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 60h
mov cx, 46                                
int 10h

	lea dx, row1
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 60h
mov cx, 5                                
int 10h

	lea dx, row2
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 60h
mov cx, 5                                
int 10h

	lea dx, row3
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 60h
mov cx, 5                                
int 10h

	lea dx, row4
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 60h
mov cx, 5                                
int 10h

	lea dx, row5
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 60h
mov cx, 5                                
int 10h

	lea dx, row6
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 60h
mov cx, 5                                
int 10h

	lea dx, row7
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 60h
mov cx, 5                                
int 10h

	lea dx, row8
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 60h
mov cx, 5                                
int 10h

	lea dx, row9
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 60h
mov cx, 5                                
int 10h

	lea dx, row10
	mov ah, 09
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NEW LINEs
	mov dl, cl
	int 21h
int 27h
end start