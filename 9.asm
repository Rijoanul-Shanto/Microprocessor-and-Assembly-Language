.STACK 100H
.MODEL SMALL
.DATA              
    MSG DB 'INPUT NUMBER : $'
    MSG1 DB 'NUMBER IS EVEN $'
    MSG2 DB 'NUMBER IS ODD $'
.CODE

MAIN PROC                          
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9
    LEA DX,MSG
    INT 21H  
    
    MOV AH,1
    INT 21H
    
    SUB AX,30H

    MOV BX,2
    
    DIV BX
    
    CMP DX,0
    JE EVEN
    
    JMP ODD
    
    EVEN:
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH 
        INT 21H 
        
        MOV AH,9
        LEA DX,MSG1
        INT 21H 
        
        JMP EXIT
    
    ODD:
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH 
        INT 21H 
        
        MOV AH,9
        LEA DX,MSG2
        INT 21H 
        
    EXIT:       
        
    
    MAIN ENDP
END MAIN