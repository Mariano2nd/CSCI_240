	.ORIG x3000
        AND R2, R2, #0
        ADD R2, R2, #4
LOOP    BRz DONE
        ADD R3, R3, R3
        ADD R2, R2, #-1
        BR LOOP
DONE    HALT
        .END