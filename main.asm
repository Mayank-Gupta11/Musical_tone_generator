// -- DO NOT CHANGE ANYTHING UNTIL THE **** LINE--//
ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL TAKE_INP

HERE: SJMP HERE
ORG 130H
// *****************

TAKE_INP:
// ADD YOUR CODE HERE
	//MOV TMOD, #1H
	MOV P1, #0FH
START:
	//MOV P1, #0FH ; UNCOMMENT THIS IF NOT WORKING ON BOARD
	CLR P0.7
NEXT:
	MOV A, P1

SA:
	CJNE A, #1B, RE
	CPL P0.7
	//MOV TH0, #0F0H
	//MOV TL0, #0AFH
	MOV R0, #0FCH
	MOV R1, #0F6H
	LCALL DELAYS
SJMP NEXT

RE:
	CJNE A, #11B, GA
	CPL P0.7
	//MOV TH0, #0F2H
	//MOV TL0, #8FH
	MOV R0, #0FDH
	MOV R1, #55H
	LCALL DELAYS
SJMP NEXT

GA:
	CJNE A, #111B, MA
	CPL P0.7
	//MOV TH0, #0F4H
	//MOV TL0, #0FH
	MOV R0, #0FDH
	MOV R1, #0A0H
	LCALL DELAYS
SJMP NEXT

MA:
	CJNE A, #1111B, START
	CPL P0.7
	//MOV TH0, #0F4H
	//MOV TL0, #0CFH
	MOV R0, #0FDH
	MOV R1, #0C7H
	LCALL DELAYS
SJMP NEXT

	
DELAYS:
	CJNE R0, #0, CHECKS
	RET
CHECKS:
	CJNE R1, #0FFH, STARTS
	INC R0
	INC R1
	SJMP DELAYS
	
STARTS:
	INC R1
	SJMP CHECKS

//JUST TRYING OUT HARDWARE DELAY
DELAYH:
	SETB TR0
CHECKH:
	JNB TF0, CHECKH
	CLR TR0
	CLR TF0
	RET
END