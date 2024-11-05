1.Write a program in assembly language to take two single-digit numbers as input and display whether they are equal or not.
code:-

ORG 100h        
; Display the message "Enter the first digit: "
MOV DX, OFFSET msg_input1
MOV AH, 09h      
INT 21h            
; Read the first digit from the user
MOV AH, 01h      
INT 21h            
SUB AL, '0'        ; Convert ASCII to integer
MOV BL, AL         ; Store the first digit in BL
; Display the message "Enter the second digit: "
MOV DX, OFFSET msg_input2
MOV AH, 09h        
INT 21h          
; Read the second digit from the user
MOV AH, 01h        
INT 21h          
SUB AL, '0'        ; Convert ASCII to integer
MOV CL, AL         ; Store the second digit in CL
; Compare the two digits
CMP BL, CL         ; Compare the two digits
JE digits_equal     ; Jump if equal
 
; Display message for not equal
MOV DX, OFFSET msg_not_equal  
MOV AH, 09h      
INT 21h                                        
JMP end_program
digits_equal:
; Display message for equal
MOV DX, OFFSET msg_equal  
MOV AH, 09h      
INT 21h      
end_program:
; Terminate the program
MOV AH, 4Ch        
INT 21h          
; Data section with messages
msg_input1  DB 'Enter the first digit: $'
msg_input2  DB 0Dh, 0Ah, 'Enter the second digit: $'
msg_equal   DB 0Dh, 0Ah, 'The digits are equal.$'
msg_not_equal DB 0Dh, 0Ah, 'The digits are not equal.$'
END

2.) Write a program in assembly language to check whether a single-digit number is odd or even.
ORG 100h
; Display the message "Enter a single-digit number: "
MOV DX, OFFSET msg_input
MOV AH, 09h
INT 21h
; Read the digit from the user
MOV AH, 01h
INT 21h
SUB AL, '0'         ; Convert ASCII to integer
; Check if the digit is between 0 and 9
CMP AL, 0          ; Check if less than 0
JB  invalid_input   ; If below 0, jump to invalid input
CMP AL, 9          ; Check if greater than 9
JA  invalid_input   ; If above 9, jump to invalid input
; Check if the number is odd or even
AND AL, 1          ; AND with 1 to check the least significant bit
JZ  even_number     ; If result is 0, it's even
; Display message for odd
MOV DX, OFFSET msg_odd  
MOV AH, 09h
INT 21h  
JMP end_program
even_number:
; Display message for even
MOV DX, OFFSET msg_even 
MOV AH, 09h
INT 21h
JMP end_program
invalid_input:
; Display invalid input message
MOV DX, OFFSET msg_invalid
MOV AH, 09h
INT 21h
