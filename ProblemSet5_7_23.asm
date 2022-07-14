; Fill up instructions, (a), (b), (c), (d) and (e)
;                                         
                .ORIG x3000

                LD R0, PTR

                ADD R1, R0, #0

AGAIN           LDR R2, R1, #0

;Uncomment for (a)               BRz CONT

                ADD R1, R1, #1

                BRnzp AGAIN

;Uncomment CONT           --------------(a)

LOOP            LDR R3, R0, #0

;Uncomment                --------------(b)

                NOT R4, R4

                ADD R4, R4, #1

                ADD R3, R3, R4

                BRnp NO

;Uncomment                --------------(c)

;Uncomment                --------------(d)

                NOT R2, R0

                ADD R2, R2, #1

                ADD R2, R1, R2

                BRnz YES

;Uncomment               --------------(e)

YES             AND R5, R5, #0

                ADD R5, R5, #1

                BRnzp DONE

NO              AND R5, R5, #0

DONE            HALT

PTR            .FILL x4000
 
               .END 

 