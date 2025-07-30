.section .text
.global _start

.equ GPIO_BASE, 0x7E200000
.equ GPFSEL, GPIO_BASE + 0x08

.equ GPIO_TO_OUTPUT, 0x40000

.equ GPIOSET, GPIO_BASE + 0x1c
.equ GPIOCLR, 0x28

.equ GPIOVAL, 0x4000000

_start:
	ldr r0, =GPFSEL
	ldr r1, [r0]
	bic r1, r1, #(0x7 << 24)
	orr r1, r1, #(0x1 << 24)
	str r1, [r0]

	ldr r0, =GPIOSET
	ldr r1, =(1 << 28)
	str r1, [r0]

1: B 1b
