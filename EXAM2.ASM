; Filename: EXER23.ASM
; Programmer Name: ENARIO, LANCE JOSEPH LORENZ S.
; Date: September 20, 2024
; Description:  Create an Automated Teller Machine (ATM) main menu screen. Ask the
; user to input a number corresponding to an item in the main menu.
; Print back the number input by user and the corresponding
; transaction.
 
.model small
.stack 100h
.data
    menu    db 'THE CALCULATOR', 13,10
            db 'Created by: LANCE JOSEPH LORENZ S. ENARIO',13,10
            db 'Date: 09/26/2024',13,10,10
            db 'Main Menu',13,10
            db 'a - Addition',13,10
            db 's - Subtraction',13,10
            db 'm - Multiplication',13,10
            db 'd - Division',13,10
            db 'e - Exit',13,10
            db 'Enter your choice: ', '$'
 
    choice  db ?
    newline1 db '', 0ah, '$'

    addition       db 13,10,10,'Addition', 13,10, '$'
    subtraction    db 13,10,10,'Subtraction', 13,10, '$'
    multiplication db 13,10,10,'Multiplication', 13,10, '$'
    division       db 13,10,10,'Division', 13,10, '$'
    exit           db 13,10,10,'Exit Program', 13,10,10,'$'

    input1 db ?
    input2 db ?

    ;addition
    additionPrompt1 db 'Enter first addend: $'
    additionPrompt2 db 'Enter second addend: $'
    additionOutput1 db 'First addend is: $'
    additionOutput2 db 'Second addend is: $'

    ;subtraction
    subtractionPrompt1 db 'Enter first minuend: $'
    subtractionPrompt2 db 'Enter second subtrahend: $'
    subtractionOutput1 db 'Minuend is: $'
    subtractionOutput2 db 'Subtrahend is: $'

    ;multiplication
    multiplicationPrompt1 db 'Enter multiplicand: $'
    multiplicationPrompt2 db 'Enter multiplier: $'
    multiplicationOutput1 db 'Multiplicand is: $'
    multiplicationOutput2 db 'Multiplier is: $'

    ;division
    divisionPrompt1 db 'Enter dividend: $'
    divisionPrompt2 db 'Enter divisor: $'
    divisionOutput1 db 'Dividend is: $'
    divisionOutput2 db 'Divisor is: $'

    invalidChoice db '', 13,10,10,'INVALID CHOICE!', 13, 10, 10, '$'

    endMessage  db 'Thank you.', '$'
.code

main:                 
    mov ax, @data
    mov ds, ax
 
    mov ax, 3
    int 10h

    xor al, al

    mov ah, 06h
    mov ch, 5 ; row start
    mov cl, 0 ; col start
    mov dh, 5  ; row end
    mov dl, 11  ; col end
    mov bh, 60h ; grey bg with black text
    int 10h

    mov ah, 06h
    mov ch, 6 ; row start
    mov cl, 0 ; col start
    mov dh, 6  ; row end
    mov dl, 14  ; col end
    mov bh, 20h ; grey bg with black text
    int 10h

    mov ah, 06h
    mov ch, 7 ; row start
    mov cl, 0 ; col start
    mov dh, 7  ; row end
    mov dl, 17  ; col end
    mov bh, 10h ; grey bg with black text
    int 10h

    mov ah, 06h
    mov ch, 8 ; row start
    mov cl, 0 ; col start
    mov dh, 8  ; row end
    mov dl, 11  ; col end
    mov bh, 50h ; grey bg with black text
    int 10h

    mov ah, 06h
    mov ch, 8 ; row start
    mov cl, 0 ; col start
    mov dh, 8  ; row end
    mov dl, 11  ; col end
    mov bh, 70h ; grey bg with black text
    int 10h

    mov ah, 09h
    lea dx, menu
    int 21h

; Ask for choice 
    mov ah, 1               
    int 21h                     
    mov choice, al               

; switch case (?) for choice
    cmp choice, 'a'
    je  displayAddition
    cmp choice, 's'
    je  displaySubtraction
    cmp choice, 'm'
    je  displayMultiplication
    cmp choice, 'd'
    je  displayDivision
    cmp choice, 'e'
    je  displayExit

; If invalid choice
    mov dx, offset invalidChoice
    mov ah, 09h
    int 21h
    jmp exitProgram

displayAddition:
    call showAddition
    jmp exitProgram

displaySubtraction:    
    
    call showSubtraction
    jmp exitProgram

displayMultiplication:       
    call showMultiplication
    jmp exitProgram

displayDivision:      
    call showDivision
    jmp exitProgram

displayExit:          
    lea dx, exit
    jmp exitProgram

exitProgram:          
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
    
    mov ah, 09h
    lea dx, endMessage
    int 21h

    mov ah, 4Ch
    int 21h

showAddition:
    lea dx, addition
    mov ah, 09h
    int 21h
    
    lea dx, additionPrompt1
    mov ah, 9
    int 21h

    mov ah, 01h ; reads char
    int 21h 
    mov input1, al

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, additionPrompt2
    mov ah, 9
    int 21h

    mov ah, 01h ; reads char
    int 21h 
    mov input2, al

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, additionOutput1
    mov ah, 9
    int 21h

    mov dl, input1
    mov ah, 02h
    int 21h

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, additionOutput2
    mov ah, 9
    int 21h

    mov dl, input2
    mov ah, 02h
    int 21h

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    ret

showSubtraction:
    
    
    lea dx, subtraction
    mov ah, 09h
    int 21h

    lea dx, subtractionPrompt1
    mov ah, 9
    int 21h

    mov ah, 01h ; reads char
    int 21h 
    mov input1, al

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, subtractionPrompt2
    mov ah, 9
    int 21h

    mov ah, 01h ; reads char
    int 21h 
    mov input2, al

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, subtractionOutput1
    mov ah, 9
    int 21h

    mov dl, input1
    mov ah, 02h
    int 21h

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, subtractionOutput2
    mov ah, 9
    int 21h

    mov dl, input2
    mov ah, 02h
    int 21h

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

ret

showMultiplication:
    lea dx, multiplication
    mov ah, 09h
    int 21h

    lea dx, multiplicationPrompt1
    mov ah, 9
    int 21h

    mov ah, 01h ; reads char
    int 21h 
    mov input1, al

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, multiplicationPrompt2
    mov ah, 9
    int 21h

    mov ah, 01h ; reads char
    int 21h 
    mov input2, al

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, multiplicationOutput1
    mov ah, 9
    int 21h

    mov dl, input1
    mov ah, 02h
    int 21h

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, multiplicationOutput2
    mov ah, 9
    int 21h

    mov dl, input2
    mov ah, 02h
    int 21h

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

ret

showDivision:
lea dx, division
    mov ah, 09h
    int 21h

    lea dx, divisionPrompt1
    mov ah, 9
    int 21h

    mov ah, 01h ; reads char
    int 21h 
    mov input1, al

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, divisionPrompt2
    mov ah, 9
    int 21h

    mov ah, 01h ; reads char
    int 21h 
    mov input2, al

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, divisionOutput1
    mov ah, 9
    int 21h

    mov dl, input1
    mov ah, 02h
    int 21h

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

    lea dx, divisionOutput2
    mov ah, 9
    int 21h

    mov dl, input2
    mov ah, 02h
    int 21h

    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h

ret

end main