.ORIG x3000
AND R5, R5, #0       ; set R5 to 0
ADD R5, R5, #1       ; R5 will act as a mask to mask out the unneeded bit
AND R1, R1, #0        ; zero out the result register
AND R2, R2, #0        ; R2 will act as a counter
LD R3, NegSixt
MskLoop AND R4, R0, R5    ; mask off the bit
   BRz Next
   ADD R2, R2, #1
ADD R1, R1, #1       ;Add code here
Next    ADD R5, R5, R5   ; shift left R5 by one bit
   ADD R3,R3, #1   ; increment R3 by 1.
   BRnp MskLoop   ; exit the loop when R3 is 0
   ADD R1,R1,R2   ; Store the result into R1
HALT
NegSixt .FILL #-16
.END