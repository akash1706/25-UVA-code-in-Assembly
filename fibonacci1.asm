.MODEL SMALL
.STACK 100H
.DATA
	MSG1 DB 'Enter the Length: $'
	MSG2 DB ' Fibonacci numbers  $'
	MSGC DB 'sum of fibonacci numbers is $'
	SPACE DB '   $'
	TEMP DW ?
	A DW ?
	B DW ?
	LEN DW ?
	SUM DW ?

.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	LEA DX,MSG1				 	
	MOV AH,9
	INT 21H                    
 	INPUT:
	MOV AH,1
	MOV BX,0
	INT 21H

	CMP AL,0DH	
 	JE FIBONACCI			

	INPUT1:	
		MOV AH,0				 
 		SUB AX,48					

 		MOV TEMP,AX
 		MOV AX,10
		MUL BX					;AX = AX*BX
		MOV BX,AX
 		ADD BX,TEMP

	MOV AH,1					
	INT 21H
	CMP AL,0DH
 	JNE INPUT1  			        

	LEA DX,MSG2				 	;Print 'Fibonacci series: $'
	MOV AH,9
	INT 21H 
	
	
FIBONACCI:
	MOV LEN,BX
	CMP LEN,0
	;JE LINK_UP
	JE GET_SUM                  
	
	MOV A,0                
	MOV B,1
	
	MOV DL,0					;Print fibonacci first number
	ADD DL,48     
	MOV AH,2
	INT 21H  
	
	MOV DX,0
	ADD SUM,DX 					;Sum first number 
	
	LEA DX,SPACE 				 	;Print Space
	MOV AH,9
	INT 21H  
	
	DEC LEN                      
	CMP LEN,0
	
	JE GET_SUM                  

	MOV DL,1					;Print fibonacci second number
	ADD DL,48
	MOV AH,2
	INT 21H   

	MOV DX,1
	ADD SUM,DX 					;Sum second number	
	
	LEA DX,SPACE 				 	;Print Space
	MOV AH,9
	INT 21H   
	
	DEC LEN 
	JMP NEXT_NUMBER


NEXT_NUMBER: 
	CMP LEN,0
	
	JE GET_SUM
	
	MOV AX,A               
	MOV BX,B               
	ADD AX,BX                 
	MOV DX,AX						;Fibonacci number is in DX
	MOV AX,BX                  
	MOV BX,DX   
	
	MOV A,AX              
	MOV B,BX                

	ADD SUM,DX 
	
	MOV CX,0 
	MOV AX,DX     					;Prepear for multi digit printing             
	MOV BX,10
	
	PUSH_STACK: 
		MOV DX,0                   
		DIV BX                     
		PUSH DX     				;Stor each digit in stack  
		INC CX
		CMP AX,0
		JNE PUSH_STACK  

	POP_STACK:
		MOV AH,2
		POP DX                 		;print each digit from stack      
		ADD DL,48	
		INT 21H
		LOOP POP_STACK             

	DEC LEN                      
	LEA DX,SPACE 				 	;Print Space
	MOV AH,9
	INT 21H                  
	JMP NEXT_NUMBER 

GET_SUM: 
	LEA DX,MSGC 				 	;Print is  
	MOV AH,9
	INT 21H 
	
	MOV CX,0 
	MOV AX,SUM     					;Prepear for sum printing             
	MOV BX,10
	
	STOR_SUM:
		MOV DX,0                   
		DIV BX                     
		PUSH DX     				;Stor each digit in stack  
		INC CX
		CMP AX,0
		JNE STOR_SUM 

	PRINT_SUM:
		MOV AH,2
		POP DX                 		;print each digit from stack      
		ADD DL,48
		INT 21H
		LOOP PRINT_SUM     	

	MOV AH,4CH
	INT 21H
	
MAIN ENDP
	END MAIN