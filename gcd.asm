data SEGMENT
    n1 DW 104
    n2 DW 12
    gcd DW ?
data ENDS


code SEGMENT
    ASSUME CS:code, DS:data
        
    ;initialize DS register  
    START: MOV AX, data
    MOV DS, AX            
    
    ;set values of AX and BX
    MOV AX, n1
    MOV BX, n2
    
    UP: CMP AX, BX ;compare both the register values
    JE EXIT
    JB EXCG
    
                       
    ;process, divide and compare if remainder is 0                   
    UP1: MOV DX, 0H
    DIV BX
    CMP DX, 0
    JE EXIT
    
    MOV AX, DX
    JMP UP
    
    ;if ax<bx, exchange
    EXCG: XCHG AX, BX
    JMP UP1
                      
                      
    ;if numbers equal or remainder 0
    EXIT: MOV gcd, BX
    
    ;exit the program    
    MOV AH, 4CH
    INT 21H
    
    code ENDS

END START