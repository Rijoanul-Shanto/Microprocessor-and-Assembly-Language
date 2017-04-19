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
        
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH 
        INT 21H 
        
        MOV AH,1
        INT 21H
        
        CMP AL,'E'
        JE EXIT 
        
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH 
        INT 21H 
        
        INC BL 
        
        MOV AH,2
        MOV DL,BL
        INT 21H
        
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH 
        INT 21H 
        
        JMP CONTINUE
       
    EXIT:
    
    MAIN ENDP
END MAIN