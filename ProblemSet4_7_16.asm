                 .ORIG x3000
                 AND R4, R4, #0  ;Clear R4. Initialize to 0
                 AND R3, R3, #0  ;Clear R3. Initialize to 0
                 LD R0, NUMBERS  ;Setup dataset memory address location
LOOP             LDR R1, R0, #0  ;Load/Read first data value from memory address + offset in R2 (i.e., x4000 + 0)
                 NOT R2, R1      ;Togle -1 to 0
                 BRz DONE        ;No more data. Done
                 AND R2, R1, #1  ;AND logical operation apply to the value in R1 with 1 (i.e., 0000 0000 000 0001)
                                 ;If the result in R2 is 0, then the right most bit or the lower bit is 0, the ZERO flag is set
                 BRz L1          ;branch to label L1 to do the ADD
                 ADD R4, R4, #1  ;else add 1 to the value in R4 and save back to R4
                 BRnzp NEXT
L1               ADD R3, R3, #1  ;add 1 to the value in R3 and save back to R3
NEXT             ADD R0, R0, #1  ;Add 1 to the memory address in R0. Increase the data pointer to next number
                 BRnzp LOOP      ;Return to LOOP to Load/Read next data value from next memory address in R0
DONE             TRAP x25        ;Stop the program
NUMBERS         .FILL x4000      ; Dataset start from this memory address location

                .END