.syntax unified
.cpu cortex-m4
//.fpu softvfp
.thumb

// Global memory locations.
.global vtable
.global __hard_reset__
.global __stack_start

.extern lab1  //linking the lab1

/*
 * vector table
 */
.type vtable, %object
.type __hard_reset__, %function
vtable:
    .word __stack_start
    .word __hard_reset__+1
    .size vtable, .-vtable
__hard_reset__:
    LDR SP, =__stack_start  //initializing stack
    bl lab1
_loop:
    b _loop
    .size __hard_reset__, .-__hard_reset__
