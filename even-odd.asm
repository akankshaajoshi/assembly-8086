;initialize data segment
data SEGMENT
    num DB 5,9,25,20,76,0
    even DB ?
    odd DB ?
    data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
    START:                  
    
    ;initialize data segment
    MOV AX, data
    MOV DS, AX
               
    ;load the address of initial value to stack
    LEA SI, num
    
    ;set initial counter of even and odd to 0
    MOV BL, 0H
    MOV BH, 0H
                         
    ;take value of counter and point to the first number
    MOV CL, [SI]
    INC SI
    
    ;start with main procedure, rotate 1 position to right
    UP: MOV AL, [SI]
    ROR AL, 1
    ;on carry = 1, go to xx                                             
    JC XX                  
    
    INC BL ;carry = 0, increment for even
    JMP NEXT
    
    XX: INC BH
    
    ;increment stack pointer, decrement counter, repeat
    NEXT: INC SI
    DEC CL
    JNZ UP
    
    ;place values in data segment
    MOV even, BL
    MOV odd, BH
    
    ;terminate the program
    MOV AH, 4CH
    INT 21H
    
    code ENDS

END START
    
    