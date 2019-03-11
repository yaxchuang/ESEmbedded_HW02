.syntax unified

.word 0x20000100
.word _start

.global _start
.type _start, %function
_start:
	nop
        
        //mov
        mov r0, #100
        mov r1, #0x11000000
        mov r2, #102
        mov r3, #103

        //push
	push {r0, r1, r2}
        pop  {r2}
        push {r2, r0, r1}
        pop  {r0}
  
label01:
	nop

	//
	//branch w/ link
	//
	bl	sleep

sleep:
	nop
	b	.
