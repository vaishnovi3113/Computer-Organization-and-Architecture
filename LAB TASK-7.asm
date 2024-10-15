/*1. Write a program in assembly language to take a single-digit integer from the user
and print it on the screen.*/

code:-

ORG 100h              ; Origin for COM file format (starts at 100h)

; Display message: "Enter a single digit: "
MOV AH, 09h           ; Function 09h is used to display a string
MOV DX, OFFSET msg_input  ; Load the address of the input message into DX
INT 21h               ; DOS interrupt to display message

; Read single character input from the user
MOV AH, 01h           ; Function 01h is used to read a character from input
INT 21h               ; DOS interrupt to get the character from the user
MOV BL, AL            ; Save the input character in BL for later use

; Check if the entered character is a valid digit (between '0' and '9')
CMP AL, '0'           ; Compare with '0'
JL InvalidInput       ; If input is less than '0', it's invalid
CMP AL, '9'           ; Compare with '9'
JG InvalidInput       ; If input is greater than '9', it's invalid

; If valid digit, print the entered digit
; Display message: "The entered digit is: "
MOV AH, 09h           ; Function 09h is used to display a string
MOV DX, OFFSET msg_output ; Load the address of the output message into DX
INT 21h               ; DOS interrupt to display message

; Print the valid digit
MOV DL, BL            ; Move the valid character from BL to DL (for printing)
MOV AH, 02h           ; Function 02h is used to print a single character
INT 21h               ; DOS interrupt to print the character

JMP EndProgram        ; Jump to EndProgram to terminate successfully

InvalidInput:
; Display error message if the input is invalid (not a single-digit number)
MOV AH, 09h           ; Function 09h is used to display a string
MOV DX, OFFSET msg_error ; Load the address of the error message into DX
INT 21h               ; DOS interrupt to display error message

EndProgram:
MOV AH, 4Ch           ; Function 4Ch is used to terminate the program
INT 21h               ; DOS interrupt to exit

msg_input  DB 'Enter a single digit: $'  ; Input prompt message
msg_output DB 0Dh, 0Ah, 'The entered digit is: $'  ; Output message with newline
msg_error  DB 0Dh, 0Ah, 'Error: Invalid input! $'  ; Error message with newline

END                   ; End of program



/*2. Write a program in assembly language to take two single-digit integers from the
user and print the result of subtraction on the screen.*/

ORG 100h               ; Origin for COM file format (starts at 100h)

; Display message: "Enter the first single digit: "
MOV AH, 09h            ; Function 09h is used to display a string
MOV DX, OFFSET msg_input1 ; Load the address of the input message into DX
INT 21h                ; DOS interrupt to display message

; Read the first single digit from the user
MOV AH, 01h            ; Function 01h is used to read a character from input
INT 21h                ; DOS interrupt to get the character
SUB AL, '0'            ; Convert ASCII digit to actual number
MOV BL, AL             ; Store the first digit in BL

; Display message: "Enter the second single digit: "
MOV AH, 09h            ; Function 09h is used to display a string
MOV DX, OFFSET msg_input2 ; Load the address of the input message into DX
INT 21h                ; DOS interrupt to display message

; Read the second single digit from the user
MOV AH, 01h            ; Function 01h is used to read a character from input
INT 21h                ; DOS interrupt to get the character
SUB AL, '0'            ; Convert ASCII digit to actual number
MOV BH, AL             ; Store the second digit in BH

; Subtract the second digit from the first
SUB BL, BH             ; Subtract BH (second digit) from BL (first digit)

; Display message: "The result of subtraction is: "
MOV AH, 09h            ; Function 09h is used to display a string
MOV DX, OFFSET msg_output ; Load the address of the output message into DX
INT 21h                ; DOS interrupt to display the message

; Check if the result is negative
CMP BL, 0              ; Compare the result with 0
JGE PrintResult        ; If result is >= 0, jump to print result

; If the result is negative, print the minus sign
MOV DL, '-'            ; Load the minus sign into DL
MOV AH, 02h            ; Function 02h to print a single character
INT 21h                ; DOS interrupt to print the minus sign

; Convert the negative result to positive
NEG BL                 ; Negate the result to make it positive

PrintResult:
; Convert result to ASCII and print
ADD BL, '0'            ; Convert result back to ASCII
MOV DL, BL             ; Move result into DL for printing
MOV AH, 02h            ; Function 02h is used to print a single character
INT 21h                ; DOS interrupt to print the result

; End the program
MOV AH, 4Ch            ; Function 4Ch is used to terminate the program
INT 21h                ; DOS interrupt to exit

msg_input1  DB 'Enter the first single digit: $'   ; Input prompt for first digit
msg_input2  DB 0Dh, 0Ah, 'Enter the second single digit: $'  ; Input prompt for second digit
msg_output  DB 0Dh, 0Ah, 'The result of subtraction is: $'  ; Output message

END                    ; End of program
