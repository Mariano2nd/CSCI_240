	.ORIG x3000
        AND R0, R0, #0
        ADD R2, R0, #10
        LD R1, MASK
        LD R3, PTR1
LOOP    LDR R4, R3, #0
        AND R4, R4, R1
        BRz NEXT
        ADD R0, R0, #1
NEXT    ADD R3, R3, #1
        ADD R2, R2, #-1
        BRp LOOP
        STI R0, PTR2
        HALT
MASK    .FILL x8000
PTR1    .FILL x4000
PTR2    .FILL x5000
        .END 