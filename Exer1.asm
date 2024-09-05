; Filename: Demo.asm
; Displaying single chraracters, numbers, & symbols
; LANCE JOSEPH LORENZ S ENARIO
; Date: August 29, 2024

.model small
.code
.stack 100

start:
	
    mov ah, 02h
	mov cl, 97d	; H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 98d	; E
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 99d	; L
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 100d	; L
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 101d	; O
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 102d	; space
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 103d ; W
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 104d	; O
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 105d	; R
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 106d ; L
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 107d	; D
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 108d; !
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 109d ; new line
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 110d	; T
	mov dl, cl
	int 21h
	
	mov ah, 02h
	mov cl, 111d	; H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 112d	; A
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 113d	; N
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 114d ; K
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 115d	; SPACE
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 116d	; Y
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 117d; O
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 118d	; U
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 119d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 120d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 121d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 122d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 65d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 66d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 67d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 68d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 69d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 70d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 71d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 72d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 73d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 74d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 75d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 76d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 77d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 78d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 79d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 80d
	mov dl, cl
	int 21h
    
    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 81d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 82d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 83d
	mov dl, cl
	int 21h


    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h
    
    mov ah, 02h
	mov cl, 84d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 85d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 86d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 87d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 88d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 89d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 90d
	mov dl, cl
	int 21h











int 27h ; terminate
end start ; end program
