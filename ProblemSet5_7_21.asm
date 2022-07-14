;Problem Chapter 7 - 7.21 in textbook
;What does the program do (in no more than 20 words)?
;Use dtaset pschap7_5_5_21.hex
;
                 .ORIG x3000

                 AND R0, R0, #0        ;Clear and Initialize to 0

                 ADD R2, R0, #10       ;R2 <-- 10  Initialize Loop counter to 10

                 LD R1, MASK           ;R1 <-- MASK = 8000 (1000 0000 0000 0000)

                 LD R3, PTR1           ;Setup dataset pointer PTR1 to R3

LOOP             LDR R4, R3, #0        ;Load the value in memory address in R3 + Offset #0 to R4

                 AND R4, R4, R1        ;AND logical operation to the value in R4 with the MASK in R1,the result in R4
                                       ;Think about what the AND operation with MASK to check the NEGATIVE or POSITIVE integer

                 BRz NEXT              ;If Z - ZERO was flag set, then Branch to label NEXT and skip the following instruction

                 ADD R0, R0, #1        ;Else increase the value in R0 by 1

NEXT             ADD R3, R3, #1        ;Move Dataset pointer R3 to next number

                 ADD R2, R2, #-1       ;Decrease Loop counter

                 BRp LOOP              ;If the p flag set back to the label LOOP 

                 STI R0, PTR2          ;Else Store value in R0 to memory address PTR2

                 HALT                  ;STOP

MASK            .FILL x8000            ;MASK x8000

PTR1            .FILL x4000            ;Dataset at memory address x4000 location

PTR2            .FILL x5000            ;Memory address x5000 location for the answer in R0

               .END 

