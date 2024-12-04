; Filename: Prog34.ASM
; Programmer Name: LANCE JOSEPH LORENZ S. ENARIO
; Program Description: To print the binary equivalent of ASCII character code.
; Date Created: November 8, 2024

; TITLE     Binary equivalent of characters     BINCHAR.ASM
; COMMENT |
;            Objective: To print the binary equivalent of
;                       ASCII character code.
;                Input: Requests a character from keyboard.
;               Output: Prints the ASCII code of the
; |                     input character in binary.

.MODEL SMALL
.STACK 100H
.DATA

        text1 db 'Filename: Prog34.ASM$'
        text2 db 'Programmer Name: LANCE JOSEPH LORENZ S. ENARIO$'
        text3 db 'To print the binary equivalent of ASCII character code.$'
        text4 db 'Date Created: November 8, 2024$'

        char_prompt     DB  'Please input a character: ',0
        out_msg1        DB  'The ASCII code of ''',0
        out_msg2        DB  ''' in binary is ',0
        query_msg       DB  'Do you want to quit (Y/N): ',0

.CODE
INCLUDE io.mac
main    PROC
        .STARTUP

        mov ah, 9
	mov dx,offset text1
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text2
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text3
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text4
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h 

read_char:
        PutStr  char_prompt     ; request a char. input
        GetCh   AL              ; read input character
        nwln    
        PutStr  out_msg1
        PutCh   AL
        PutStr  out_msg2
        mov     AH,80H          ; mask byte = 80H
        mov     CX,8            ; loop count to print 8 bits
print_bit:
        test    AL, AH          ; test does not modify AL
        jz      print_0         ; if tested bit is 0, print it
        PutCh   '1'             ; otherwise, print 1
        jmp     skip1
print_0:
        PutCh   '0'             ; print 0
skip1:
        shr     AH, 1           ; right shift mask bit to test
                                ; next bit of the ASCII code
        loop    print_bit
        nwln    
        PutStr  query_msg       ; query user whether to terminate
        GetCh   AL              ; read response
        nwln    
        cmp     AL,'Y'          ; if response is not 'Y'
        jne     read_char       ; read another character
done:                           ; otherwise, terminate program
   
main    ENDP
        END main