.STACK 100H
.MODEL SMALL
.DATA 
    MSG DB 'HELLO WORLD! $'
.CODE

MAIN PROC                          
    
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV CX,10   
    
    PRINT:  
        MOV AH,9
        LEA DX,MSG
        INT 21H 
        
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH 
        INT 21H
        
        LOOP PRINT 
    
    MAIN ENDP
END MAIN