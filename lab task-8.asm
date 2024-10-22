1. Write a program in assembly language to display a two-digit number on the screen. The two-digits number is required to be taken in the program itself. 

code:-

ORG 100h

; Two-digit number to be displayed (let's say 57)
MOV AL, 58d    ; Load the two-digit number into AL

; Split the number into tens and units
MOV BL, 10        ; Set divisor to 10 to separate tens and units
DIV BL            ; Divide AL by 10, AL = quotient (tens), AH = remainder (units)

; Store the quotient (tens) and remainder (units)
MOV BH, AL        ; Store the tens digit in BH
MOV BL, AH        ; Store the units digit in BL

MOV DX, OFFSET msg_1 
MOV AH, 09h       
INT 21h  

; Convert tens digit to ASCII
ADD BH, '0'       ; Convert the tens digit to ASCII
MOV DL, BH        ; Move the ASCII tens digit to DL for printing
MOV AH, 02h       ; DOS interrupt to print a character
INT 21h           ; Print the tens digit

; Convert units digit to ASCII
ADD BL, '0'       ; Convert the units digit to ASCII
MOV DL, BL        ; Move the ASCII units digit to DL for printing
MOV AH, 02h       ; DOS interrupt to print a character
INT 21h           ; Print the units digit

; Terminate the program
MOV AH, 4Ch       ; DOS interrupt to exit the program
INT 21h

msg_1  DB 'The two digit no is : $'

END





2. Write an assembly language program to take two single-digit integers from the user and print the result of addition on the screen.

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

; Perform addition
ADD BL, CL         ; Add the two digits, result in BL

; Convert the result back to ASCII
ADD BL, '0'        ; Convert the sum to ASCII

; Display the message "The result of addition is: "
MOV DX, OFFSET msg_output  
MOV AH, 09h       
INT 21h            

; Print the result
MOV DL, BL        
MOV AH, 02h       
INT 21h            

; Print a new line (CRLF)
MOV DL, 0Dh        
MOV AH, 02h
INT 21h           
MOV DL, 0Ah        
INT 21h            

; Terminate the program
MOV AH, 4Ch        
INT 21h          

; Data section with messages
msg_input1  DB 'Enter the first digit: $'
msg_input2  DB 0Dh, 0Ah, 'Enter the second digit: $'
msg_output  DB 0Dh, 0Ah, 'The result of addition is: $'

END


