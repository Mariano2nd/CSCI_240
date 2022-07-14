.ORIG x3000
	LEA R0, MSG  ; load address of string
	PUTS         ; output string to console
	LEA R0, MSG2 ; load address of string
	PUTS	     ; output string to console
	HALT         ; end program
	
MSG  .STRINGZ " Hello World! \n"
MSG2 .STRINGZ " How are you? "
	.END