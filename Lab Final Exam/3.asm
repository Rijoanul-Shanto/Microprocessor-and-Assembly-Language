.STACK 100H
.MODEL SMALL
.DATA 
    MSG DB 'ENTER SIZE OF TRIANGLE : $'
    MSG1 DB 'OUTPUT : $'   
    N DB ?
.CODE

MAIN PROC                          
    
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    SUB BL,48
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV DX,1
    MOV AH,2
    INT 21H 
    
    MOV CX,DX
    
    PRINT:
        MOV AH,2
        MOV DL,'*'
        INT 21H
        LOOP PRINT
    
    INC DX
    MOV AH,2
    INT 21H
    MOV CX,DX
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    CMP DX,BX
    
    JLE PRINT 
    
    MAIN ENDP
END MAIN