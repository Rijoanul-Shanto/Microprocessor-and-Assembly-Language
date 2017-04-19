.STACK 100H
.MODEL SMALL
.DATA           
    MSG DB 'YES $'
    MSG1 DB 'NO $'
.CODE

MAIN PROC                          
    
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH 
    INT 21H
    
    CMP BL,'5'
    JG YES
    CMP BL,'5'
    JL NO  
    
    YES:
        MOV AH,9
        LEA DX,MSG
        INT 21H  
        
        JMP EXIT  
    NO:
        MOV AH,9
        LEA DX,MSG1
        INT 21H 
        
    EXIT:  
    
    MAIN ENDP
END MAIN