//1.(a) Write a program in assembly language to print the numbers from 0 to 9.

CODE:

ORG 100h
MOV CX, 10
MOV AL, 0
print_loop:
ADD AL, '0'
MOV DL, AL
MOV AH, 02h
INT 21h
SUB AL, '0'
INC AL
LOOP print_loop
MOV AH, 4Ch
INT 21h
END

1.(b) Write an assembly language program to print the characters from A to Z in reverse order.

CODE:

ORG 100h
MOV CX, 26
MOV AL, 'Z'
print_loop:
MOV DL, AL
MOV AH, 02h
INT 21h
DEC AL
LOOP print_loop
MOV AH, 4Ch
INT 21h
END

2.(a) Write a program in assembly language to print the numbers from 0 to 9 in reverse order.

CODE:

ORG 100H
MOV CX, 10
MOV DL, '9'
PRINT_LOOP:
MOV AH, 2
INT 21H
DEC DL
LOOP PRINT_LOOP
MOV AH, 4CH
INT 21H


