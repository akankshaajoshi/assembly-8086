;set origin to 100h - optional (convention)
org 100h

    ;move message offset to DX
    MOV DX, OFFSET msg
    
    ;print handler by dos
    MOV AH, 9H
    INT 21H

;return control to main
ret 

;message
msg DB "Hello World! $"