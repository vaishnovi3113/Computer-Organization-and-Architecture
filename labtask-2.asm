1)

num1 db 18h
num2 db 18h
start:
      mov al,num1;moving num1 to al register
      add al,num2;moving num2 to al register(i.e, num1 and num2 are in al)
      mov bl,al ;coping al value to bl,storing for the result dispaly
      mov ah,al;coping al values to ah,(converting upper nibble 4bit to get character)
      and ah,0F0h; mask the lower nibble(i.e,converting lower nibble to 0)
      shr ah,4;shifting right by 4 to get upper nibble
      add ah,30h;(converting to ascii digit)
      cmp ah,39h;compare ah value,if it is less than 39h 
      jle print_first_digit                              
      add ah,7;convert to ascii    
      
print_first_digit:
      mov dl,ah;coping ah value to dl for printing first digit
      mov ah,02h;BIOS interrupt to display character
      int 21h
;converting lowwer nibble 4bit to character 
      mov ah,bl;coping bl values to ah
      and ah,0Fh; mask the upper nibble(i.e,converting upper nibble to 0)
      add ah,30h;(converting to ascii digit)
      cmp ah,39h;compare ah value,if it is less than 39h 
      
      jle print_second_digit
      add ah,7;convert to ascii   
      
print_second_digit:
      mov dl,ah;coping ah value to dl for printing first digit
      mov ah,02h;BIOS interrupt to display character
      int 21h   
      mov ah,4Ch
      int 21h


2)

ORG 100h
NUM1 DW 1234h  ; Define first 16-bit number
NUM2 DW 5678h  ; Define second 16-bit number
START:
    MOV AX, NUM1  ; Move NUM1 to AX register
    ADD AX, NUM2  ; Add NUM2 to AX register (AX = NUM1 + NUM2)
    ; Convert result to ASCII and display
    MOV BX, AX    ; Copy result to BX for further processing
    ; Process higher byte of the result
    MOV AH, BH    ; Move higher byte of result to AH
    SHR AH, 4     ; Shift right by 4 to get upper nibble
    ADD AH, 30h   ; Convert to ASCII
    CMP AH, 39h   ; Compare if less than '9'
    JLE PRINT_HIGH_NIBBLE
    ADD AH, 7     ; Convert to ASCII letter if necessary
PRINT_HIGH_NIBBLE:
    MOV DL, AH    ; Move AH to DL for printing
    MOV AH, 02h   ; BIOS interrupt to display character
    INT 21h
    ; Process lower nibble of the higher byte
    MOV AH, BH    ; Move higher byte of result to AH
    AND AH, 0Fh   ; Mask upper nibble
    ADD AH, 30h   ; Convert to ASCII
    CMP AH, 39h   ; Compare if less than '9'
    JLE PRINT_LOW_NIBBLE
    ADD AH, 7     ; Convert to ASCII letter if necessary
PRINT_LOW_NIBBLE:
    MOV DL, AH    ; Move AH to DL for printing
    MOV AH, 02h   ; BIOS interrupt to display character
    INT 21h
    ; Process upper nibble of the lower byte
    MOV AH, BL    ; Move lower byte of result to AH
    SHR AH, 4     ; Shift right by 4 to get upper nibble
    ADD AH, 30h   ; Convert to ASCII
    CMP AH, 39h   ; Compare if less than '9'
    JLE PRINT_HIGH_NIBBLE2
    ADD AH, 7     ; Convert to ASCII letter if necessary
PRINT_HIGH_NIBBLE2:
    MOV DL, AH    ; Move AH to DL for printing
    MOV AH, 02h   ; BIOS interrupt to display character
    INT 21h
    ; Process lower nibble of the lower byte
    MOV AH, BL    ; Move lower byte of result to AH
    AND AH, 0Fh   ; Mask upper nibble
    ADD AH, 30h   ; Convert to ASCII
    CMP AH, 39h   ; Compare if less than '9'
    JLE PRINT_LOW_NIBBLE2
    ADD AH, 7     ; Convert to ASCII letter if necessary
PRINT_LOW_NIBBLE2:
    MOV DL, AH    ; Move AH to DL for printing
    MOV AH, 02h   ; BIOS interrupt to display character
    INT 21h
    MOV AH, 4Ch   ; Terminate program
    INT 21h
