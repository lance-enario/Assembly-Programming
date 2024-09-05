; Filename: Demo.asm
; Displaying single chraracters, numbers, & symbols
; LANCE JOSEPH LORENZ S ENARIO
; Date: August 29, 2024

.model small
.code
.stack 100

start:
	; LANCE
    mov ah, 02h
	mov cl, 76d	
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 97d
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 110d	
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 99d	
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 101d	
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 32d	; space
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 83d ; W
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 101d	; O
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 108d	; R
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 103d ; L
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 97d	; D
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 115d; !
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 32d ; new line
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 69d	; T
	mov dl, cl
	int 21h
	
	mov ah, 02h
	mov cl, 110d	; H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 97d	; A
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 114d	; N
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 105d 
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 111d	
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 0Ah	; NEW LINE
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 66d; O
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 97d	; U
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 99d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 104d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 101d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 108d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 111d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 114d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 111d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 102d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 83d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 99d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 105d ; space
	mov dl, cl  
	int 21h

    mov ah, 02h
	mov cl, 101d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 110d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 99d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 101d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	; SPACE
	mov dl, cl
	int 21h
    
    ; IN
    mov ah, 02h
	mov cl, 105d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 110d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	; SPACE NEXT WORD
	mov dl, cl
	int 21h

    ; Computer
    mov ah, 02h
	mov cl, 67d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 111d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 109d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 112d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 117d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 116d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 101d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 114d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d
	mov dl, cl
	int 21h

    ; Science

    mov ah, 02h
	mov cl, 83d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 99d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 105d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 101d
	mov dl, cl
	int 21h
    
    mov ah, 02h
	mov cl, 110d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 99d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 101d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d
	mov dl, cl
	int 21h

    ;2nd

    mov ah, 02h
	mov cl, 50d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 110d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 100d ; space
	mov dl, cl
	int 21h
    
    mov ah, 02h
	mov cl, 32d
	mov dl, cl
	int 21h

    ;Year

    mov ah, 02h
	mov cl, 89d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 101d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 97d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 114d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NEW LINE
	mov dl, cl
	int 21h

    ;College

    mov ah, 02h
	mov cl, 67d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 111d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 108d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 108d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 101d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 103d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 101d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d
	mov dl, cl
	int 21h

    ; of

    mov ah, 02h
	mov cl, 111d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 102d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d
	mov dl, cl
	int 21h

    ;Computer

    ; Computer
    mov ah, 02h
	mov cl, 67d	; !
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 111d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 109d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 112d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 117d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 116d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 101d
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 114d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d
	mov dl, cl
	int 21h

    ; Studies

    mov ah, 02h
	mov cl, 83d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 116d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 117d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 100d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 105d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 101d ; space
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 115d ; space
	mov dl, cl
	int 21h




int 27h ; terminate
end start ; end program
