1 (a) Write a program in assembly language to print single character on screen.

code:-
 
ORG 100h          ; Origin, to specify that the program starts at 100h (COM file format)
; Print "Enter the input: "
MOV AH, 09h       ; DOS function 09h: print string
MOV DX, OFFSET msg_enter_input ; Load address of the string
INT 21h           ; Call DOS interrupt to print the string
; Read a single character from user
MOV AH, 01h       ; DOS function 01h: read single character
INT 21h           ; Call DOS interrupt to get the character
MOV BL, AL        ; Store the input character in BL register
; Print "The entered input is: "
MOV AH, 09h       ; DOS function 09h: print string
MOV DX, OFFSET msg_entered_input ; Load address of the second string
INT 21h           ; Call DOS interrupt to print the string
; Print the character stored in BL register
MOV DL, BL        ; Move character from BL to DL for printing
MOV AH, 02h       ; DOS function 02h: print single character
INT 21h           ; Call DOS interrupt to print the character
; Terminate the program
MOV AH, 4Ch       ; DOS function 4Ch: terminate program
INT 21h           ; Call DOS interrupt to exit
; Data section
msg_enter_input DB 'Enter the input: $'          ; Prompt message
msg_entered_input DB 0Dh, 0Ah, 'The entered input is: $' ; Newline and display message
END         ; End of program


(b) Write an assembly language program to convert an upper-case letter to the
corresponding lower-case letter.

code:- 
 
ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)

; Display message "Enter an uppercase letter: "
MOV DX, OFFSET msg_input  ; Load the address of the message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Read a single character from the user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
MOV DL, AL         ; Store the input character in AL

; Check if the character is an uppercase letter (A-Z)
CMP AL, 'A'        ; Compare AL with 'A'
JL NotUpperCase    ; If the input is less than 'A', it is not uppercase
CMP AL, 'Z'        ; Compare AL with 'Z'
JG NotUpperCase    ; If the input is greater than 'Z', it is not uppercase

; Convert the uppercase letter to lowercase
ADD AL, 20h        ; Add 32 (20h) to convert uppercase to lowercase
MOV BL,AL

; Print the message "The lowercase letter is: "
MOV DX, OFFSET msg_output  ; Load the address of the output message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the output message
MOV AL,BL

 ; Print the converted lowercase letter
MOV DL, AL         ; Move the lowercase letter to DL
MOV AH, 02h        ; Function 02h of INT 21h is used to print a single character
INT 21h            ; Call DOS interrupt to print the character
JMP EndProgram     ; Jump to the end of the program

NotUpperCase:
; If the input is not an uppercase letter, display an error message
MOV DX, OFFSET msg_error  ; Load the address of the error message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the error message

EndProgram:
; Terminate the program
MOV AH, 4Ch        ; Function 4Ch of INT 21h terminates the program
INT 21h            ; Call DOS interrupt to exit
msg_input  DB 'Enter an uppercase letter: $'
msg_output DB 0Dh, 0Ah, 'The lowercase letter is: $'  ; Output message
msg_error  DB 0Dh, 0Ah, 'Error: Not an uppercase letter! $'  ; Error message

END                ; End of program

2. (a) Write a program in assembly language to print multiple characters on screen.

ORG 100h          ; Origin, to specify that the program starts at 100h (COM file format)

; Print "Enter the input: "
MOV AH, 09h       ; DOS function 09h: print string
MOV DX, OFFSET msg_enter_input ; Load address of the string
INT 21h           ; Call DOS interrupt to print the string

; Read multiple characters from user
MOV AH, 0Ah       ; DOS function 0Ah: buffered input
MOV DX, OFFSET input_buffer  ; Load address of the input buffer
INT 21h           ; Call DOS interrupt to read the string

; Add a `$` at the end of the entered string for printing
MOV AL, '$'            ; Store `$` in AL
LEA DI, input_buffer+2 ; DI points to the actual input string
MOV CL, [input_buffer+1] ; Get the count of characters entered
ADD DI, CX             ; Move DI to the end of the entered string
MOV [DI], AL           ; Insert `$` at the end of the string

; Print "The entered input is: "
MOV AH, 09h       ; DOS function 09h: print string
MOV DX, OFFSET msg_entered_input ; Load address of the second string
INT 21h           ; Call DOS interrupt to print the string

; Print the entered string
LEA DX, input_buffer+2  ; Load address of the actual input (skip buffer size and count)
MOV AH, 09h             ; DOS function 09h: print string
INT 21h                 ; Call DOS interrupt to print the input string

; Terminate the program
MOV AH, 4Ch       ; DOS function 4Ch: terminate program
INT 21h           ; Call DOS interrupt to exit

; Data section
msg_enter_input DB 'Enter the input: $'          ; Prompt message
msg_entered_input DB 0Dh, 0Ah, 'The entered input is: $' ; Newline and display message
input_buffer DB 10, 0   ; Buffer to store input: 10 max chars, initial count 0
                       ; The actual characters will be stored starting here
                       ; Followed by a terminator (CR)
END         ; End of program


(b) Write an assembly language program to convert a lower-case letter to the
corresponding upper-case letter.

ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)

; Display message "Enter a lowercase letter: "
MOV DX, OFFSET msg_input  ; Load the address of the message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Read a single character from the user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
MOV DL, AL         ; Store the input character in AL

; Check if the character is a lowercase letter (a-z)
CMP AL, 'a'        ; Compare AL with 'a'
JL NotLowerCase    ; If the input is less than 'a', it is not lowercase
CMP AL, 'z'        ; Compare AL with 'z'
JG NotLowerCase    ; If the input is greater than 'z', it is not lowercase

; Convert the lowercase letter to uppercase
SUB AL, 20h        ; Subtract 32 (20h) to convert lowercase to uppercase
MOV BL,AL

; Print the message "The uppercase letter is: "
MOV DX, OFFSET msg_output  ; Load the address of the output message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the output message
MOV AL, BL

; Print the converted uppercase letter
MOV DL, AL         ; Move the uppercase letter to DL
MOV AH, 02h        ; Function 02h of INT 21h is used to print a single character
INT 21h            ; Call DOS interrupt to print the character
JMP EndProgram     ; Jump to the end of the program

NotLowerCase:
; If the input is not a lowercase letter, display an error message
MOV DX, OFFSET msg_error  ; Load the address of the error message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the error message

EndProgram:
; Terminate the program
MOV AH, 4Ch        ; Function 4Ch of INT 21h terminates the program
INT 21h            ; Call DOS interrupt to exit

msg_input  DB 'Enter a lowercase letter: $'
msg_output DB 0Dh, 0Ah, 'The uppercase letter is: $'  ; Output message
msg_error  DB 0Dh, 0Ah, 'Error: Not a lowercase letter! $'  ; Error message

END                ; End of program
