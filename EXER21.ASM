; Filename: EXER21.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ S.
; Date: 09/19/2024
; Description: Create a program that asks for your first name, middle name, and 
; family name. Then display “Hello, FIRST NAME MIDDLE NAME FAMILY NAME!”.

.model small
.stack 100h
.data

StringLength EQU 1000

buffer db 100


firstName db StringLength DUP (?)
secondName db StringLength DUP (?)
thirdName db StringLength DUP (?)

firstPrompt db 'Enter First Name: $'
secondPrompt db 'Enter Middle Name: $'
thirdPrompt db 'Enter Family Name: $'

startMessage db 'REGISTRATION FORM$'
outputMessage db 'Hello, $'

newline db '', 0ah, 0ah, '$'

.code
ProgramStart:
    mov ax, @data
    mov ds, ax

;firstName

    mov dx, OFFSET startMessage
    mov ah, 9 
    int 21h

    mov dx, OFFSET newline
    mov ah, 9 
    int 21h

    mov dx, OFFSET firstPrompt
    mov ah, 9 
    int 21h

    mov ah, 3fh     ; DOS read from handle function
    mov bx, 0       ; standard input handle
    mov cx, StringLength   ; read up to maximum number of characters

    mov dx, OFFSET firstName  ; store the string here
    int 21h

    dec ax
    and ax, ax      ; checks if character was read
    jz Done
    mov cx, ax      ; put string length in CX to be used as a counter

    push cx        ; save the string length
    mov bx, OFFSET firstName

; secondName
    mov dx, OFFSET secondPrompt
    mov ah, 9 
    int 21h

    mov ah, 3fh     ; DOS read from handle function
    mov bx, 0       ; standard input handle
    mov cx, StringLength   ; read up to maximum number of characters

    mov dx, OFFSET secondName  ; store the string here
    int 21h

    dec ax
    and ax, ax      ; checks if character was read
    jz Done
    mov cx, ax      ; put string length in CX to be used as a counter

    push cx        ; save the string length
    mov bx, OFFSET secondName

; thirdName

    mov dx, OFFSET thirdPrompt
    mov ah, 9 
    int 21h

    mov ah, 3fh     ; DOS read from handle function
    mov bx, 0       ; standard input handle
    mov cx, StringLength   ; read up to maximum number of characters

    mov dx, OFFSET thirdName  ; store the string here
    int 21h

    dec ax
    and ax, ax      ; checks if character was read
    jz Done
    mov cx, ax      ; put string length in CX to be used as a counter

    push cx        ; save the string length
    mov bx, OFFSET thirdName

; output

    mov dx, OFFSET outputMessage
    mov ah, 9 
    int 21h

    pop cx          ; get the string length
    mov ah, 40h   ; DOW write form handle function
    mov bx, 1       ; standard output handle
    mov dx, OFFSET firstName
    int 21h         ; print the string

    pop cx          ; get the string length
    mov ah, 40h   ; DOW write form handle function
    mov bx, 1       ; standard output handle
    mov dx, OFFSET secondName
    int 21h         ; print the string

    pop cx          ; get the string length
    mov ah, 40h   ; DOW write form handle function
    mov bx, 1       ; standard output handle
    mov dx, OFFSET thirdName
    int 21h         ; print the string

Done: 
    mov ah, 4ch
    int 21h
end ProgramStart;