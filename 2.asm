.STACK 100H
.MODEL SMALL
.DATA    
    MSG DB 'INPUT HEXADECIMAL VALUE : $'
    MSG1 DB 'OUTPUT IN DECIMAL IS : $' 
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
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
        
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    CMP BL,'1'
    JL END_CASE 
    CMP BL,'9'
    JLE PRINT1
    
    CMP BL,'A'
    JL END_CASE
    CMP BL,'F'
    JG END_CASE
    
    JMP PRINT2
    
    PRINT1:  
        MOV AH,2      
        MOV DL,BL 
        INT 21H
        
        JMP END_CASE 
        
    PRINT2:
        SUB BL,65 
        ADD BL,48
        
        MOV AH,2
        MOV DL,'1'
        INT 21H
        
        MOV DL,BL
        INT 21H        
    
    END_CASE:
    
    MAIN ENDP
END MAIN