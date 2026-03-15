0000000100000894 <_func0>:
100000894: a9be4ff4    	stp	x20, x19, [sp, #-0x20]!
100000898: a9017bfd    	stp	x29, x30, [sp, #0x10]
10000089c: 910043fd    	add	x29, sp, #0x10
1000008a0: aa0103f3    	mov	x19, x1
1000008a4: aa0003f4    	mov	x20, x0
1000008a8: 937e7e80    	sbfiz	x0, x20, #2, #32
1000008ac: 94000088    	bl	0x100000acc <_malloc+0x100000acc>
1000008b0: b900027f    	str	wzr, [x19]
1000008b4: 71000e9f    	cmp	w20, #0x3
1000008b8: 5400030b    	b.lt	0x100000918 <_func0+0x84>
1000008bc: 52800008    	mov	w8, #0x0                ; =0
1000008c0: 52800049    	mov	w9, #0x2                ; =2
1000008c4: 14000007    	b	0x1000008e0 <_func0+0x4c>
1000008c8: b828d809    	str	w9, [x0, w8, sxtw #2]
1000008cc: 11000508    	add	w8, w8, #0x1
1000008d0: b9000268    	str	w8, [x19]
1000008d4: 11000529    	add	w9, w9, #0x1
1000008d8: 6b14013f    	cmp	w9, w20
1000008dc: 540001e0    	b.eq	0x100000918 <_func0+0x84>
1000008e0: 7100051f    	cmp	w8, #0x1
1000008e4: 54ffff2b    	b.lt	0x1000008c8 <_func0+0x34>
1000008e8: 2a0803ea    	mov	w10, w8
1000008ec: aa0003eb    	mov	x11, x0
1000008f0: b840456c    	ldr	w12, [x11], #0x4
1000008f4: 1b0c7d8d    	mul	w13, w12, w12
1000008f8: 6b0901bf    	cmp	w13, w9
1000008fc: 54fffe68    	b.hi	0x1000008c8 <_func0+0x34>
100000900: 1acc0d2d    	sdiv	w13, w9, w12
100000904: 1b0ca5ac    	msub	w12, w13, w12, w9
100000908: 34fffe6c    	cbz	w12, 0x1000008d4 <_func0+0x40>
10000090c: f100054a    	subs	x10, x10, #0x1
100000910: 54ffff01    	b.ne	0x1000008f0 <_func0+0x5c>
100000914: 17ffffed    	b	0x1000008c8 <_func0+0x34>
100000918: a9417bfd    	ldp	x29, x30, [sp, #0x10]
10000091c: a8c24ff4    	ldp	x20, x19, [sp], #0x20
100000920: d65f03c0    	ret

