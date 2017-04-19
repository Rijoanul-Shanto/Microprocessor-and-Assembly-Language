.STACK 100H
.MODEL SMALL
.DATA    
    MSG DB 'HELLO WORLD! $'
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
    JG PRINT1
    
    CMP BL,'5'
    JL PRINT2
    
    PRINT1:
        MOV CX,5     
        
        FOR1:
            MOV AH,9   
            LEA DX,MSG
            INT 21H   
            
            MOV AH,2
            MOV DL,0AH
            INT 21H
            MOV DL,0DH 
            INT 21H 
            
            LOOP FOR1   
            JMP EXIT
        
    PRINT2:
        MOV CX,3
        
        FOR2:     
            MOV AH,9   
            LEA DX,MSG
            INT 21H   
            
            MOV AH,2
            MOV DL,0AH
            INT 21H
            MOV DL,0DH 
            INT 21H 
            
            LOOP FOR2   
            JMP EXIT
    
    EXIT:
        
    MAIN ENDP
END MAIN