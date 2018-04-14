.STACK 100H
.MODEL SMALL
.DATA  
    MSG DB 'INPUT A CHARACTER : $'
    MSG1 DB 'THE CHARACTER IS : $'
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
    
    MOV AH,2
    MOV DL,BL
    INT 21H      
    
    MAIN ENDP
END MAIN