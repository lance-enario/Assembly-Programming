; Filename: FINAL.ASM
; Grocery Inventory System with Update and Delete Functions

.model small
.stack 100h
.data

p1              db 'Grocery Inventory System', 13, 10
                db 'Programmer: Enario, Lance Joseph Lorenz S.', 13, 10
                db 'Date: 11/21/2024', 13, 10, 10, '$'

loginPrompt     db 'Login to use the system:', 13, 10, '$'
userPrompt      db 'Username: $'
idPrompt        db 'Employee ID: $'

itemctr         dw 1                     ; Item counter (starts at 1)

user            db 50 dup('$')           ; Placeholder for username input
id              db 50 dup('$')           ; Placeholder for ID input
inventory       db 10 dup(50 dup('$'))   ; Array for 10 items, 50 bytes each

menu            db '1. Add new item into inventory', 13, 10
                db '2. View inventory', 13, 10
                db '3. Update item details within inventory', 13, 10
                db '4. Delete item from inventory', 13, 10
                db '5. Exit inventory manager', 13, 10
                db 'Enter your choice:  $'
           
choice          db 0                     ; Placeholder for menu choice
newline         db '', 13, 10, '$'

createPrompt    db 'Please enter the item to be added:', 13, 10, '$'
readPrompt      db 'Current Inventory List:', 13, 10, '$'
updatePrompt    db 'Enter item number to update:', 13, 10, '$'
deletePrompt    db 'Enter item number to delete:', 13, 10, '$'
invalidChoice   db 'Invalid choice. Please try again.', 13, 10, '$'

pressEnter      db 'Press Enter to continue...', 13, 10, '$'

itemInput       db 50 dup('$')           ; Input buffer for items

itemSuccess     db 'Item added successfully.$'
inventoryFullPrompt db 'Inventory is full! Unable to add more items.$'
inventoryEmptyPrompt db 'Inventory is empty.$'
enterItemDetails db 'Enter new details for the item:$'
itemUpdatedPrompt db 'Item updated successfully.$'
itemDeletedPrompt db 'Item deleted successfully.$'
invalidItemPrompt db 'Invalid item number.$'

.code
    
main: 
    mov ax, @data
    mov ds, ax

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
    ; Display menu
    lea dx, p1
    call print

    lea dx, menu
    call print

    ; Get user choice
    lea dx, choice
    call scan_char

    cmp al, '1'
    je showCreate
    cmp al, '2'
    je showRead
    cmp al, '3'
    je showUpdate
    cmp al, '4'
    je showDelete
    cmp al, '5'
    je showExit

    ; Invalid choice, go back to menu
    lea dx, invalidChoice
    call print
    call enterBuffer
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

    ; Check if inventory is full
    mov ax, itemctr
    cmp ax, 11             ; Max items = 10 (itemctr starts at 1)
    je inventory_full

    ; Get new item input
    lea dx, itemInput
    call scan

    ; Store item in inventory
    mov si, offset inventory
    dec ax                 ; Convert itemctr to 0-based index
    shl ax, 6              ; Multiply by 50 (2^6 = 64 bytes)
    add si, ax             ; Calculate offset

    ; Clear the 50-byte slot first
    mov di, si
    mov cx, 50
    mov al, '$'            ; Fill with '$' (null terminator for strings)
    rep stosb

    ; Copy input into inventory
    lea si, itemInput      ; Load address of input buffer into SI
    mov di, si             ; DI points to target slot in `inventory`
    mov cx, 49             ; Copy up to 49 characters
    rep movsb

    ; Ensure string is null-terminated
    mov byte ptr [di], '$' ; Add '$' as the terminator

    ; Increment item counter
    inc word ptr itemctr

    lea dx, itemSuccess 
    call print
    call enterBuffer
    ret

inventory_full:
    lea dx, inventoryFullPrompt
    call print
    call enterBuffer
    ret

read:
    lea dx, readPrompt
    call print

    ; Check if inventory is empty
    cmp word ptr itemctr, 1 ; If itemctr = 1, inventory is empty
    je inventory_empty

    ; Display all items
    mov cx, word ptr itemctr
    dec cx                  ; Item count (0-based for loop)
    mov si, offset inventory
read_loop:
    push cx                 ; Preserve CX for the loop
    lea dx, [si]            ; Load address of current item into DX
    call print              ; Print the item
    add si, 50              ; Move to the next item in inventory
    pop cx                  ; Restore CX
    loop read_loop

    call enterBuffer
    ret

inventory_empty:
    lea dx, inventoryEmptyPrompt
    call print
    call enterBuffer
    ret

update:
    lea dx, updatePrompt
    call print

    ; Get item number to update
    call scan_char
    sub al, '0'             ; Convert ASCII to number
    mov ah, 0
    mov bx, ax              ; BX = item number
    cmp bx, 0
    jl invalid_index
    cmp bx, word ptr itemctr
    jge invalid_index

    ; Get new item details
    lea dx, enterItemDetails
    call print
    lea dx, itemInput
    call scan

    ; Update item
    mov si, offset inventory
    dec bx                  ; Convert to 0-based index
    shl bx, 6               ; Multiply by 50
    add si, bx
    lea di, itemInput
    mov cx, 50
    rep movsb

    lea dx, itemUpdatedPrompt
    call print
    call enterBuffer
    ret

invalid_index:
    lea dx, invalidItemPrompt
    call print
    call enterBuffer
    ret

delete:
    lea dx, deletePrompt
    call print

    ; Get item number to delete
    call scan_char
    sub al, '0'             ; Convert ASCII to number
    mov ah, 0
    mov bx, ax              ; BX = item number
    cmp bx, 0
    jl invalid_index
    cmp bx, word ptr itemctr
    jge invalid_index

    ; Delete item
    mov si, offset inventory
    dec bx                  ; Convert to 0-based index
    shl bx, 6               ; Multiply by 50
    add si, bx
delete_loop:
    mov di, si              ; Copy SI to DI
    add si, 50              ; Move SI to the next item
    mov cx, 50              ; Shift 50 bytes
    rep movsb               ; Shift items up in memory
    dec word ptr itemctr    ; Decrement item counter

    lea dx, itemDeletedPrompt
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
    lea dx, pressEnter
    call print

    ; Wait for Enter key
    mov ah, 00h
    int 16h
    ret

end main
