	 .ORIG x3005
         LEA R2, DATA
         LDR R4, R2, #0
LOOP     ADD R4, R4, #-3
         BRzp LOOP
         TRAP x25
DATA     .FILL x000B
 	 .END 