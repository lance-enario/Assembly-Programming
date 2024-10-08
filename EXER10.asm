.model small
.stack 100
.data

border          db "    ---------------------------------------------------------",0Ah, "$"

enrollmentTitle db "                    COLLEGE ENROLLMENT FORM                   ", 0Ah, 0Ah, "$"

fullName        db "    First Name: ", "                      Last Name:", 0Ah, "$"

boxName         db "    -------------------------------   -----------------------" ,0Ah
                db "    |                             |   |                     |" ,0Ah
                db "    -------------------------------   -----------------------", 0Ah, 0Ah, "$"

address         db "    Address: ", 0Ah, "$"

addressName     db "    ---------------------------------------------------------" ,0Ah
                db "    |                                                       |" ,0Ah
                db "    ---------------------------------------------------------", 0Ah, 0Ah, "$"

birthDate       db "    Birth Date: ", 0Ah, 0Ah, "$"

specificDate    db "    Month:                Day:                 Year:", 0Ah, "$"

dateBox         db "    ---------------  ---------  ------------------------" ,0Ah
                db "    |             |  |       |  |                      |" ,0Ah
                db "    ---------------  ---------  ------------------------", 0Ah, 0Ah, "$"


.code

start:

mov ax, @data
mov ds, ax

    lea dx, border
    mov ah, 09h
    int 21h

    mov ah, 09h
    mov bl, 3Eh ;8=blink, 4=red foreground
    mov cx, 62
    int 10h

    lea dx, enrollmentTitle
    mov ah, 09h
    int 21h

    lea dx, fullName
    mov ah, 09h
    int 21h

    lea dx, boxName
	mov ah, 09
	int 21h

    lea dx, address
    mov ah, 09h
    int 21h

    lea dx, addressName
	mov ah, 09
	int 21h

int 27h
end start;

