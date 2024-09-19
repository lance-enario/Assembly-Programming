;Filename: PRELIM.ASM
;CS243 Lab Prelim Exam First Semester SY 2024-2025
;Student Name: ENARIO, LANCE JOSEPH LORENZ S.
;Date Finished: 09/12/2024

.model small
.stack 100
.data
    borderNL db '  ', 0Ah, '$'
    border db '  $'
    str1 db '                 Cebu Institute of Technology - University                 $'
    str2 db '                     VEHICLE STICKER APPLICATION FORM                      $'
    str3 db '                        Please fill out form below.                        $'
    str14 db '               Copyright 2024 LANCE JOSEPH LORENZ S. ENARIO                $'
   thanks db '                                  Thank you!                                 $'
 between db '                                                                           $'
submitGray1 db '                                  $'
submitGray2 db '                                 $'
    submit db '  SUBMIT  $'
    graybox db '         $'
    button db ' \/ $'
    
    str4 db 'Personnel Type:          $' 
    str6 db 'Name of Applicant/Driver:$' 
    str8 db 'Mobile Number:           $'
   str10 db 'Vehicle Make(s)/Brand:   $'
   str12 db 'Vehicle Color:           $'
    
    str5 db 'Vehicle Sticker Type: $' 
    str7 db 'ID Number:            $'
    str9 db 'Address:              $'
   str11 db 'Plate Number:         $'
   str13 db 'Vehicle Type:         $'



.code

start:

	mov ax, @data
	mov ds, ax

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 04Fh
mov cx, 75                              
int 10h

    mov ah, 09h
    lea dx, str1
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 04Fh
mov cx, 75                               
int 10h

    mov ah, 09h
    lea dx, str2
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 0CEh 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, str3
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 0FFh 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, between
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h


mov ah, 09h
mov bl, 070h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, str4
	int 21h


mov ah, 09h
mov bl, 000h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, graybox
	int 21h

mov ah, 09h
mov bl, 04Fh 
mov cx, 4                          
int 10h

	mov ah, 09h
    lea dx, button
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 070h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, str5
	int 21h


mov ah, 09h
mov bl, 000h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, graybox
	int 21h

mov ah, 09h
mov bl, 04Fh 
mov cx, 4                          
int 10h

	mov ah, 09h
    lea dx, button
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 0FFh 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, between
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h



mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 070h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, str6
	int 21h


mov ah, 09h
mov bl, 000h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, graybox
	int 21h

mov ah, 09h
mov bl, 000h 
mov cx, 4                          
int 10h

	mov ah, 09h
    lea dx, button
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 070h 
mov cx, 30                          
int 10h

	mov ah, 09h
    lea dx, str7
	int 21h


mov ah, 09h
mov bl, 000h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, graybox
	int 21h

mov ah, 09h
mov bl, 000h 
mov cx, 4                          
int 10h

	mov ah, 09h
    lea dx, button
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 0FFh 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, between
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h



mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 070h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, str8
	int 21h


mov ah, 09h
mov bl, 000h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, graybox
	int 21h

mov ah, 09h
mov bl, 000h 
mov cx, 4                          
int 10h

	mov ah, 09h
    lea dx, button
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 070h 
mov cx, 30                          
int 10h

	mov ah, 09h
    lea dx, str9
	int 21h

mov ah, 09h
mov bl, 000h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, graybox
	int 21h

mov ah, 09h
mov bl, 000h 
mov cx, 4                          
int 10h

	mov ah, 09h
    lea dx, button
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 0FFh 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, between
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 070h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, str10
	int 21h


mov ah, 09h
mov bl, 000h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, graybox
	int 21h

mov ah, 09h
mov bl, 000h 
mov cx, 4                          
int 10h

	mov ah, 09h
    lea dx, button
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 070h 
mov cx, 30                          
int 10h

	mov ah, 09h
    lea dx, str11
	int 21h

mov ah, 09h
mov bl, 000h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, graybox
	int 21h

mov ah, 09h
mov bl, 000h 
mov cx, 4                          
int 10h

	mov ah, 09h
    lea dx, button
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 0FFh 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, between
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h



mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 070h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, str12
	int 21h


mov ah, 09h
mov bl, 000h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, graybox
	int 21h

mov ah, 09h
mov bl, 04Fh 
mov cx, 4                          
int 10h

	mov ah, 09h
    lea dx, button
	int 21h

mov ah, 09h
mov bl, 077h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 070h 
mov cx, 30                          
int 10h

	mov ah, 09h
    lea dx, str13
	int 21h

mov ah, 09h
mov bl, 000h 
mov cx, 75                          
int 10h

	mov ah, 09h
    lea dx, graybox
	int 21h

mov ah, 09h
mov bl, 04Fh 
mov cx, 4                          
int 10h

	mov ah, 09h
    lea dx, button
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 75                              
int 10h

    mov ah, 09h
    lea dx, between
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 40                               
int 10h

    mov ah, 09h
    lea dx, submitGray1
	int 21h

mov ah, 09h
mov bl, 044h
mov cx, 10                            
int 10h

    mov ah, 09h
    lea dx, submit
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 33                              
int 10h

    mov ah, 09h
    lea dx, submitGray2
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 40                               
int 10h

    mov ah, 09h
    lea dx, submitGray1
	int 21h

mov ah, 09h
mov bl, 04Eh
mov cx, 10                            
int 10h

    mov ah, 09h
    lea dx, submit
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 33                              
int 10h

    mov ah, 09h
    lea dx, submitGray2
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 40                               
int 10h

    mov ah, 09h
    lea dx, submitGray1
	int 21h

mov ah, 09h
mov bl, 044h
mov cx, 10                            
int 10h

    mov ah, 09h
    lea dx, submit
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 33                              
int 10h

    mov ah, 09h
    lea dx, submitGray2
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 75                              
int 10h

    mov ah, 09h
    lea dx, between
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 070h
mov cx, 75                              
int 10h

    mov ah, 09h
    lea dx, str14
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, border
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 75                              
int 10h

    mov ah, 09h
    lea dx, between
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 000h
mov cx, 2                               
int 10h

    mov ah, 09h
    lea dx, borderNL
	int 21h

mov ah, 09h
mov bl, 08Eh
mov cx, 75                              
int 10h

    mov ah, 09h
    lea dx, thanks
	int 21h


int 27h
end start