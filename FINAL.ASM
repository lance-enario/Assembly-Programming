; Filename: MIDTERM.ASM
; CS243 Lab Hands-on Midterm Exam
; First Semester SY 2024-2025
; Student Name: LANCE JOSEPH LORENZ S. ENARIO
; Date Finished: 10/10/2024

.model small
.stack 100h
.data

    p1              db 'Grocery Items Inventory System', 13, 10,
                    db 'Programmer: Lance Joseph Lorenz S. Enario', 13, 10,
                    db 'Date: 10/10/2024', 13, 10, 10, '$'

    loginPrompt     db 'Login to use the system:', 13, 10, '$'
    userPrompt      db 'Username: $'
    idPrompt        db 'Employee ID: $'

    itemctr         db 1

    user            db 50 dup('$')
    id              db 50 dup('$')

    menu            db  ' 1. Add new item into inventory', 13, 10,
                    db  '2. View inventory', 13, 10,
                    db  '3. Update item details within inventory', 13, 10,
                    db  '4. Delete item from inventory', 13, 10,
                    db  '5. Exit inventory manager', 13, 10,
                    db  'Enter your choice:  $'
           
    choice          db 1 dup('$')
    newline         db '', 13, 10, '$'

    createPrompt    db  '', 13, 10, 10, 'Please enter item to be added', 13, 10, '$'
    readPrompt      db  '', 13, 10, 10, 'Current Inventory List', 13, 10, '$'
    updatePrompt    db  '', 13, 10, 10, 'Enter item no. to update', 13, 10, '$'
    deletePrompt    db  '', 13, 10, 10, 'Enter item no. to delete', 13, 10, '$'

    pressEnter      db 'Press Enter to continue...', 13, 10, '$'

    item1 db '1. $'
    item2 db 13, 10, '2. $'
    item3 db 13, 10, '3. $'
    item4 db 13, 10, '4. $'
    item5 db 13, 10, '5. $'

    itemInput1 db 50 dup('$')
    itemInput2 db 50 dup('$')
    itemInput3 db 50 dup('$')
    itemInput4 db 50 dup('$')
    itemInput5 db 50 dup('$')
 
.code
    
main: 
    mov ax, @data
    mov ds, ax
    
    mov ax, 3
    int 10h

    xor al, al

    ; HEADER

    lea dx, p1
    call print

    lea dx, loginPrompt
    call print

    lea dx, userPrompt
    call print
    lea dx, user
    call scan

    call nwln

    lea dx, idPrompt
    call print
    lea dx, id
    call scan

    call nwln

menu_loop:
    mov ax, 3
    int 10h

    xor al, al

    lea dx, p1
    call print

    ; MENU
    lea dx, menu
    call print

    ; Ask for choice 
    lea dx, choice
    call scan_char
    mov choice, al           

    ; switch case for choice
    cmp choice, '1'
    je showCreate
    cmp choice, '2'
    je showRead
    cmp choice, '3'
    je showUpdate
    cmp choice, '4'
    je showDelete
    cmp choice, '5'
    je showExit

    jmp menu_loop

showCreate:
    call create
    jmp menu_loop

showRead:
    call read
    jmp menu_loop

showUpdate:
    call update
    jmp menu_loop

showDelete:
    call delete 
    jmp menu_loop

showExit:
    call exit
    ret

create:
    lea dx, createPrompt
    call print









    call enterBuffer   
    ret

read:
    lea dx, readPrompt
    call print










    call enterBuffer   
    ret

update:
    lea dx, updatePrompt
    call print








    call enterBuffer   
    ret

delete:
    lea dx, deletePrompt
    call print








    call enterBuffer   
    ret

exit:
    mov ax, 4C00h
    int 21h
    ret
 
print:
    mov ah, 09h
    int 21h
    ret
    
scan:
    mov ah, 0Ah
    int 21h
    ret

scan_char:
    mov ah, 01h
    int 21h
    ret

nwln:
    lea dx, newline
    call print
    ret

enterBuffer:
    ; Display "Press Enter to continue..."
    lea dx, pressEnter
    call print

    ; Wait for Enter key
    mov ah, 00h
    int 16h

    ; Clear screen below current line
    mov ah, 06h
    mov al, 0
    mov cx, 0
    mov dh, 15
    int 10h
    ret

end main
