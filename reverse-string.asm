data SEGMENT
    STR1 DB "Hello"
    LEN EQU $-STR1
    STR2 DB 20 DUP(0)
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data, ES:data
    START: MOV AX, DATA
    MOV DS, AX
    MOV ES, AX
    
    MOV SI, OFFSET STR1
    MOV DI, OFFSET STR2+(LEN-1)
    MOV CX, LEN

UP: CLD ;clear direction flag; autoincrement SI
LODSB
STD
STOSB
LOOP UP

MOV AH, 4CH
INT 21H
code ENDS

END START

