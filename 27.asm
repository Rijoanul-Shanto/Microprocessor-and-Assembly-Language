.STACK 100H
.MODEL SMALL
.DATA
.CODE

MAIN PROC                          
    
    MOV AX,@DATA
    MOV DS,AX  
    
    CONTINUE:
        MOV AH,1
        INT 21H
        MOV BL,AL
        
        CMP BL,'0'
        JL CONTINUE
        CMP BL,'9'
        JG CONTINUE
        
        JMP END_IF
    
    END_IF:  
 
    MAIN ENDP
END MAIN