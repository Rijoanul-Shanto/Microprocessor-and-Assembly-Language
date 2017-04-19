.STACK 100H
.MODEL SMALL
.DATA      
    MSG DB 'INPUT : $'
    MSG1 DB 'SPACE DETECTED. TERMINATING..... $'
.CODE

MAIN PROC                          
    
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,1
    
    CONTINUE:
        INT 21H
        CMP AL,' '
        JE EXIT
        JMP CONTINUE
        
    EXIT: 
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
    
        MOV AH,9
        LEA DX,MSG1
        INT 21H
    
    MAIN ENDP
END MAIN