/ C library -- stty

/ error = stty(filep, ttyvec);

/ filep is descriptor of open tty
/ ttyvec[0, 1, 2] correspond to args of stty

.globl	_stty, retrn, cerror

_stty:
	mov	r5,-(sp)
	mov	sp,r5
	mov	4(r5),r0
	mov	6(r5),0f
	sys	0; 9f
	bec	1f
	jmp	cerror
1:
	clr	r0
	jmp	retrn
.data
9:
	sys	stty; 0:..
