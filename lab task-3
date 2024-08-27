1)

org 100h
num1 db 24h
num2 db 21h
start:
mov al,num1
sub al,num2
mov bl,al
mov ah,al
and ah,0f0h
shr ah,4
add ah,30h
cmp ah,39h
jle print_first_digit
add ah,7
print_first_digit:
mov dl,ah
mov ah,02h
int 21h
mov ah,bl
and ah,0Fh
add ah,30h
cmp ah,39h
jle print_second_digit
add ah,7
print_second_digit:
mov dl,ah
mov ah,02h
int 21h
mov ah,4Ch
int 21h



2)
org 100h
num1 dw 5678h
num2 dw 2024h
start:
mov ax, num1
sub ax, num2

mov bx, ax
mov ah, bh
shr ah, 4
add ah, 30h
cmp ah, 39h
jle print_high_nibble
add ah, 7
print_high_nibble:
mov dl, ah
mov ah, 02h
int 21h

mov ah, bh
and ah, 0fh
add ah, 30h
cmp ah, 39h
jle print_low_nibble
add ah, 7
print_low_nibble:
mov dl, ah
mov ah, 02h
int 21h

mov ah, bl
shr ah, 4
add ah, 30h
cmp ah, 39h
jle print_high_nibble2
add ah, 7
print_high_nibble2:
mov dl, ah
mov ah, 02h
int 21h

mov ah, bl
and ah, 0fh
add ah, 30h
cmp ah, 39h
jle print_low_nibble2
add ah, 7
print_low_nibble2:

mov dl, ah
mov ah, 02h
int 21h
mov ah, 4ch
int 21h
