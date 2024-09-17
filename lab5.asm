1. Write an assembly language program to perform division of 8-bit data.

org 100h

start:
    
    mov ax, cs
    mov ds, ax

    ; Initialize dividend and divisor
    mov al, [dividend]  
    mov bl, [divisor]   

    xor ah, ah          

    div bl              

    mov [quotient], al  
    mov [remainder], ah 

    ; Print message for quotient
    mov dx, offset msg_quotient
    mov ah, 09h         
    int 21h             

    ; Print quotient
    mov al, [quotient]
    add al, 30h         
    mov dl, al
    mov ah, 02h         
    int 21h             

    ; Print new line
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    ; Print message for remainder
    mov dx, offset msg_remainder
    mov ah, 09h         
    int 21h             

    ; Print remainder
    mov al, [remainder]
    add al, 30h         
    mov dl, al
    mov ah, 02h         
    int 21h             

    ; Exit program
    mov ah, 4Ch
    int 21h

; Data Section
dividend  db 12         
divisor   db 04          
quotient  db 0          
remainder db 0

; Messages
msg_quotient db "Quotient: $"
msg_remainder db "Remainder: $"



2.Write a program in assembly language to perform division of 16-bit data.

org 100h
num1 db 18h     ; Dividend
num2 db 04h     ; Divisor
start:
    mov al, num1      ; Load num1 into AL (dividend)
    mov bl, num2      ; Load num2 into BL (divisor)
    xor ah, ah        ; Clear AH to prepare for division (AL / BL)
    div bl            ; Divide AL by BL, result: AL = quotient, AH = remain
    ; Store quotient and remainder in BH and BL for later
    mov bh, al        ; Store quotient in BH
    mov bl, ah        ; Store remainder in BL

    ; Display quotient
    ; Convert upper nibble of quotient to character
    mov ah, bh
    and ah, 0F0h      ; Mask the lower nibble
    shr ah, 4         ; Shift right to get the upper nibble
    call mahi

    ; Convert lower nibble of quotient to character
    mov ah, bh
    and ah, 0Fh       ; Mask the upper nibble
    call mahi

    ; Display remainder
   ; Convert upper nibble of remainder to character
    mov ah, bl
    and ah, 0F0h      ; Mask the lower nibble
    shr ah, 4         ; Shift right to get the upper nibble
    call mahi

    ; Convert lower nibble of remainder to character
    mov ah, bl
    and ah, 0Fh       ; Mask the upper nibble
    call mahi

    ; End the program
    mov ah, 4Ch       ; Terminate the program
    int 21h

mahi:
    add ah, 30h       ; Convert to ASCII digits (0-9)
    cmp ah, 39h
    jle print_now
    add ah, 7         ; Convert to ASCII letters (A-F)

print_now:
    mov dl, ah        ; Move the character to DL for printing
    mov ah, 02h       ; BIOS interrupt to display character
    int 21h
    ret               ; Return from the function
