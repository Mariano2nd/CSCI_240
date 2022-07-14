       .ORIG x3000
       AND R1,R1,x0 ;clear R1, to be used for the running sum. Memory Address x3000
       AND R4,R4,x0 ;clear R4, to be used as a counter                        x3001
       ADD R4,R4,xA ;load R4 with #10, the number of times to add             x3002
       ;LEA R2,x0FC ;load the starting address of the data                     x3003 PC = X3003+1, 3100=3004+x0FC, x0FC = 3100 - 3004
       LD  R2, DATAPTR   ;load the starting address of the data                     x3003 PC = X3003+1, 3100=3004+x0FC, x0FC = 3100 - 3004
LOOP   LDR R3,R2,x0 ;load the next number to be added                         x3004
       ADD R2,R2,x1 ;increment the pointer                                    x3005
       ADD R1,R1,R3 ;add the next number to the running sum                   x3006
       ADD R4,R4,x-1 ;decrement the counter                                   x3007
       BRp LOOP ;do it again if the counter is not yet zero                   x3008
       HALT
DATAPTR  .FILL x3100
      .END