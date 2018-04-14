.STACK 100H
.MODEL SMALL
.DATA    
    MSG DB 'INPUT : $'
    MSG1 DB 'INPUT IS A CHARACTER $'
    MSG2 DB 'INPUT IS A NUMBER $'
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
    
    CMP BL,'0'
    JL CHARACTER
    CMP BL,'9'
    JG CHARACTER
    
    JMP NUMBER
    
    CHARACTER:
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH 
        INT 21H  
        
        MOV AH,9
        LEA DX,MSG1
        INT 21H
        
        JMP END_CASE  
        
    NUMBER:
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH 
        INT 21H  
        
        MOV AH,9
        LEA DX,MSG2
        INT 21H      
        
    END_CASE:
            
    MAIN ENDP
END MAIN