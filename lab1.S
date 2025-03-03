.section .data
.global result
result: .word 0  //This variable will store the result of the function

.global lab1
.syntax unified
#define A #20  //defining values A, B and C
#define B #30
#define C #2

.section .text
lab1:
	push {lr}
	mov r0, A             //copying value A to r0 
	mov r1, B             //copying value B to r1
	mov r2, C             //copying value C to r2
	bl calculate          //going to the function calculate
	pop {pc}
calculate:
	push {r0, r1, r2, lr} //pushing registers to the stack

	cmp r0, r1            //comparing A and B by subtracting (A-B)
	ITE GE                //if-then-else greater or equals 0
	addGE r3, r0, r1      //if greater or equal 0: r3 -> A+B
	subLT r3, r0, r1      //if less than 0: r3 -> A-B

	sdiv r0, r3, r2       //dividing r3 on the value C that stored in r2
	ldr r1, =result       //loading the address of teh result
	str r0, [r1]          //storing the result in memory
	pop {r0, r1, r2, pc}  //popping registers

