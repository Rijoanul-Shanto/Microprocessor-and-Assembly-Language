.STACK 100H
.MODEL SMALL
.DATA    
    MSG DB 'Dhaka $'
    MSG1 DB 'Go Abroad! $'
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
    
    CMP BL,'5'
    JLE ABROAD
    CMP BL,'8'
    JL ABROAD
    
    JMP DHAKA
    
    ABROAD:
        MOV AH,9
        LEA DX,MSG1
        INT 21H   
        JMP EXIT
    DHAKA:
        MOV AH,9
        LEA DX,MSG
        INT 21H
    
    EXIT:        
    
    MAIN ENDP
END MAIN