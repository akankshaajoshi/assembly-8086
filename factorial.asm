code SEGMENT
    ASSUME CS:code
    START:
    
    MOV AH, 01H; USER INPUT NUMBER
    INT 21H
    
    SUB AL, 30H
    MOV CL, AL
    MOV CH, 00H
    MOV AX, 0001H
    MOV DX, 0000H
    MOV BX, 0001H
    
    YY: MUL BX
    DEC CX
    CMP CX, 00
    JE XX
    
    INC BX
    JMP YY
    
    XX:MOV CS:[0050H], AX
    MOV CS:[0052H], DX
    
    MOV AH, 4CH
    INT 21H
    
    code ENDS

END START