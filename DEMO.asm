; Filename: Demo.asm
; Displaying single chraracters, numbers, & symbols
; LANCE JOSEPH LORENZ S ENARIO
; Date: August 29, 2024

.model small
.code
.stack 100
start:
	
	mov ah, 09h
	mov bl, 3Eh ;( 3 - aqua, E - light yellow)
	mov cx, 5 ;(no of characters that will change color)
	int 10h;

	mov ah, 02h
	mov cl, 48h	; H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 45h	; E
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Ch	; L
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Ch	; L
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Fh	; O
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h	; space
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 57h	; W
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Fh	; O
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 52h	; R
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Ch	; L
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 44h	; D
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 21h	; !
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 0Ah	; new line
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 54h	; T
	mov dl, cl
	int 21h
	
	mov ah, 02h
	mov cl, 48h	; H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 41h	; A
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Eh	; N
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Bh	; K
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h	; SPACE
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 59h	; Y
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Fh	; O
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 55h	; U
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 21h	; !
	mov dl, cl
	int 21h

	mov ah, 09h
	mov bl, 84h
	mov cx, 1
	int 10h

	mov ah, 2
	mov dl, 03h
	int 21h

int 27h ; terminate
end start ; end program
