.STACK 100H
.MODEL SMALL
.DATA 
    MSG DB 'INPUT CHARACTER : $' 
    MSG1 DB 'CHARACTER IN LOWERCASE IS : $'
    MSG2 DB 'OPTION : $'
.CODE

MAIN PROC                          
    
    MOV AX,@DATA
    MOV DS,AX   
    
    CONTINUE:
        MOV AH,9
        LEA DX,MSG
        INT 21H
        
        MOV AH,1
        INT 21H
        
        MOV BL,AL
        
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH 
        INT 21H 
        
        MOV AH,9
        LEA DX,MSG2
        INT 21H
        
        MOV AH,1
        INT 21H 
        
        CMP AL,'U'
        JE EXIT
        
        CMP BL,'a'
        JL CONVERT
        CMP BL,'z'
        JG CONVERT
        
        JMP PRINT
    
    CONVERT:
        ADD BL,32
        JMP PRINT
        
    PRINT:
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH 
        INT 21H 
    
        MOV AH,9
        LEA DX,MSG1
        INT 21H
    
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