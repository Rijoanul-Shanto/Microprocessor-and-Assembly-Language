.STACK 100H
.MODEL SMALL
.DATA       
    MSG DB 'Australia $'
    MSG1 DB 'Bangladesh $'
    MSG2 DB 'China $'
    MSG3 DB 'Denmark $'  
    MSG4 DB 'INPUT : $'
.CODE

MAIN PROC                          
    
    MOV AX,@DATA
    MOV DS,AX      
    
    MOV AH,9
    LEA DX,MSG4
    INT 21H  
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH 
    INT 21H
    
    CMP BL,'A'
    JE A
    CMP BL,'B'
    JE B
    CMP BL,'C'
    JE C
    CMP BL,'D'
    JE D      
    
    JMP END_CASE
    
    A:  
        MOV AH,9
        LEA DX,MSG
        INT 21H 
        
        JMP END_CASE  
    B:  
        MOV AH,9
        LEA DX,MSG1
        INT 21H
        
        JMP END_CASE 
    C:  
        MOV AH,9
        LEA DX,MSG2
        INT 21H     
        
        JMP END_CASE
    D:  
        MOV AH,9
        LEA DX,MSG3
        INT 21H  
        
    END_CASE:
    
    MAIN ENDP
END MAIN