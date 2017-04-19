.STACK 100H
.MODEL SMALL
.DATA   
    MSG DB 'INPUT 1ST NUMBER :$'
    MSG1 DB 'INPUT 2ND NUMBER :$'
    MSG2 DB 'BIGGEST IS : $'  
    MSG3 DB 'OPTION : $'
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
        LEA DX,MSG1
        INT 21H    
        
        MOV AH,1
        INT 21H
        MOV CL,AL  
        
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH 
        INT 21H 
        
        MOV AH,9
        LEA DX,MSG3
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
        
        CMP BL,CL
        JL MOVE 
        JMP PRINT
    
    MOVE:
        MOV BL,CL
    
    PRINT:
        MOV AH,9
        LEA DX,MSG2
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