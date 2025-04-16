
	AREA BCS402, CODE, READONLY   
ENTRY                               

        LDR R0, =SORTED              
        LDR R1, =SIZE                 
        LDR R1, [R1]                        
        LDR R2, =SEARCHKEY                  
        
        MOV R3, #0                          
        SUB R4, R1, #1                      

BINARYLOOP
        CMP R3, R4                          
        BGT NOTFOUND                       
        
        ADD R5, R3, R4                     
        ASR R5, R5, #1                     
        
        LDR R6, [R0, R5, LSL #2]            
        CMP R6, R2                          
        BEQ FOUND                        
        BLT LOW                      
        BGT HIGH                    

LOW
        ADD R3, R5, #1                     
        B BINARYLOOP                 

HIGH
        SUB R4, R5, #1                     
        B BINARYLOOP                

FOUND
        MOV R7, R5                          
        B END                             

NOTFOUND
        MOV R7, #-1                         

END


        AREA DATASEC, DATA, READWRITE  

SORTED DCD 10, 20, 30, 40, 50, 60, 70 
SIZE    DCD 7                         
SEARCHKEY   DCD 40                         
        END
