; Filename: EXER21.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ S.
; Date: 09/19/2024
; Description: Create a program that asks for your first name, middle name, and 
; family name. Then display “Hello, FIRST NAME MIDDLE NAME FAMILY NAME!”.

.model small
.stack 100h
.data
    promptFirst db 'Enter first name: $'
    promptMiddle db 'Enter middle name: $'
    promptFamily db 'Enter family name: $'
    firstName db 50, 0, 50 dup('$')
    middleName db 50, 0, 50 dup('$')
    familyName db 50, 0, 50 dup('$')
    newline db 13, 10, '$'
    helloMsg db 'Hello, $'
    exclamation db '!$'
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Prompt for first name
    lea dx, promptFirst
    mov ah, 09h
    int 21h

    ; Read first name
    lea dx, firstName
    mov ah, 0Ah
    int 21h

    ; Move cursor to new line
    lea dx, newline
    mov ah, 09h
    int 21h

    ; Prompt for middle name
    lea dx, promptMiddle
    mov ah, 09h
    int 21h

    ; Read middle name
    lea dx, middleName
    mov ah, 0Ah
    int 21h

    ; Move cursor to new line
    lea dx, newline
    mov ah, 09h
    int 21h

    ; Prompt for family name
    lea dx, promptFamily
    mov ah, 09h
    int 21h

    ; Read family name
    lea dx, familyName
    mov ah, 0Ah
    int 21h

    ; Move cursor to new line
    lea dx, newline
    mov ah, 09h
    int 21h

    ; Print "Hello, "
    lea dx, helloMsg
    mov ah, 09h
    int 21h

    ; Print first name
    lea si, firstName + 2         ; Point to the first name data
    mov cl, [firstName + 1]       ; Get length of the first name

    ; Temporarily append a $ after the string for DOS interrupt
    mov di, si                    ; Copy si to di
    add di, cx                    ; Move di to the end of the string (si + length)
    mov byte ptr [di], '$'        ; Set the $ terminator at the end of the string
    
    lea dx, [si]                  ; Load the string address
    mov ah, 09h
    int 21h                       ; Print the first name

    ; Print a space
    mov dl, ' '
    mov ah, 02h
    int 21h

    ; Print middle name
    lea si, middleName + 2         ; Point to the middle name data
    mov cl, [middleName + 1]       ; Get length of the middle name

    ; Temporarily append a $ after the string for DOS interrupt
    mov di, si                    ; Copy si to di
    add di, cx                    ; Move di to the end of the string (si + length)
    mov byte ptr [di], '$'        ; Set the $ terminator at the end of the string
    lea dx, [si]                  ; Load the string address
    mov ah, 09h
    int 21h                       ; Print the middle name

    ; Print a space
    mov dl, ' '
    mov ah, 02h
    int 21h

    ; Print family name
    lea si, familyName + 2         ; Point to the family name data
    mov cl, [familyName + 1]       ; Get length of the family name

    ; Temporarily append a $ after the string for DOS interrupt
    mov di, si                    ; Copy si to di
    add di, cx                    ; Move di to the end of the string (si + length)
    mov byte ptr [di], '$'        ; Set the $ terminator at the end of the string
    lea dx, [si]                  ; Load the string address
    mov ah, 09h
    int 21h                       ; Print the family name

    ; Print "!"
    lea dx, exclamation
    mov ah, 09h
    int 21h

    ; Print newline
    lea dx, newline
    mov ah, 09h
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main
