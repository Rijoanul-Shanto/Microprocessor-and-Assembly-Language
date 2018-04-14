.STACK 100H
.MODEL SMALL
.DATA   
    MSG DB '1,2,3,4,5,6 $'
    MSG1 DB '0,9,8,7 $'
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
    
    CMP BL,'7'
    JE PRINT1
    
    JMP PRINT2
    
    PRINT1:
        MOV AH,9
        LEA DX,MSG
        INT 21H  
        JMP END_IF
        
    PRINT2:
        MOV AH,9
        LEA DX,MSG1
        INT 21H      
        
    END_IF:
            
    MAIN ENDP
END MAIN