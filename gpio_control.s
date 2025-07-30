.section .text
.global gpio_control

gpio_control:
	ADD r1, r0, #8
	LDR r2, [r1]
	BIC r2, r2, #(0x7 << 18)
	ORR r2, r2, #(0x1 << 18)
	STR r2, [r1]

	ADD r1,r0, #0x1C
	LDR r2, = (1 << 26)
	STR r2, [r1]

	BX LR
