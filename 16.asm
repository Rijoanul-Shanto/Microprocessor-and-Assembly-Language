.STACK 100H
.MODEL SMALL
.DATA      
    MSG DB 'Daffodil International University $'
.CODE

MAIN PROC                          
    
    MOV AX,@DATA
    MOV DS,AX  
    
    
    MOV AH,9
    LEA DX,MSG
    INT 21H    
    
    
    MAIN ENDP
END MAIN