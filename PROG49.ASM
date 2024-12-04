; Filename: Prog49.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Program Description: To show parameter passing via registers 
; Date Created: November 8, 2024

;TITLE Parameter passing via registers      PROCEX1.ASM 
; COMMENT |
;           Objective: To show parameter passing via registers 
;           Input: Requests two integers from the user. 
; |         Output: Outputs the sum of the input integers.

.MODEL SMALL
.STACK 100H
.DATA

    text1 db 'Filename: Prog49.ASM$'
    text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
    text3 db 'To show parameter passing via registers .$'
    text4 db 'Date Created: November 8, 2024$'

    prompt_msgl DB 'Please input the first number: ',0 
    prompt_msg2 DB 'Please input the second number: ',0 
    sum_msg DB 'The sum is ',0

.CODE
INCLUDE io.mac

main PROC
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

    PutStr prompt_msgl ; request first number 
    GetInt CX   ; CX := first number
    nwln 
    PutStr prompt_msg2 ; request second number 
    GetInt DX       ; DX := second number 
    nwln 
    call sum        ; returns sum in AX
    PutStr sum_msg ; display sum 
    PutInt AX
    nwln

done:
  
main ENDP
; -----------------------------------------------------------
; Procedure sum receives two integers in CX and DX. 
; The sum of the two integers is returned in AX. 
;-----------------------------------------------------------
sum PROC
    mov AX,CX ; sum := first number 
    add AX,DX ; sum := sum + second number 
    ret
sum ENDP
    END main