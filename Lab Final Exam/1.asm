.STACK 100H
.MODEL SMALL
.DATA
    MSG DB 'INPUT WORD : $'
    MSG1 DB 'OUTPUT IN REVERSE : $' 
.CODE

MAIN PROC                          
    
    MOV AX,@DATA
    MOV DS,AX  
    
    XOR CX,CX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
        
    MOV AH,1
    
    GET_INPUT:
        INT 21H
        CMP AL,0DH
        JE BREAK  
        INC CX
        PUSH AX
        JMP GET_INPUT   
        
    BREAK:
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H  
        
        LEA DX,MSG1 
        MOV AH,9
        INT 21H 
        
        MOV AH,2
        
        JMP REVERSE
        
    REVERSE: 
        POP DX
        INT 21H
        LOOP REVERSE    
        
    
    
    MAIN ENDP
END MAIN