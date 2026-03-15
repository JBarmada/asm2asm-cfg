000000010000059c <_func0>:
10000059c: a9be4ff4    	stp	x20, x19, [sp, #-0x20]!
1000005a0: a9017bfd    	stp	x29, x30, [sp, #0x10]
1000005a4: 910043fd    	add	x29, sp, #0x10
1000005a8: aa0003f3    	mov	x19, x0
1000005ac: 940000af    	bl	0x100000868 <_strlen+0x100000868>
1000005b0: b4000380    	cbz	x0, 0x100000620 <_func0+0x84>
1000005b4: 39400268    	ldrb	w8, [x19]
1000005b8: 71016d1f    	cmp	w8, #0x5b
1000005bc: 1a9f17e9    	cset	w9, eq
1000005c0: 7101751f    	cmp	w8, #0x5d
1000005c4: 1a9f17e8    	cset	w8, eq
1000005c8: 4b080128    	sub	w8, w9, w8
1000005cc: 0aa87d08    	bic	w8, w8, w8, asr #31
1000005d0: 5280002b    	mov	w11, #0x1               ; =1
1000005d4: aa0803ea    	mov	x10, x8
1000005d8: aa0b03e9    	mov	x9, x11
1000005dc: eb0b001f    	cmp	x0, x11
1000005e0: 540001c0    	b.eq	0x100000618 <_func0+0x7c>
1000005e4: 38696a6b    	ldrb	w11, [x19, x9]
1000005e8: 71016d7f    	cmp	w11, #0x5b
1000005ec: 1a8a154a    	cinc	w10, w10, eq
1000005f0: 7101757f    	cmp	w11, #0x5d
1000005f4: 1a9f17eb    	cset	w11, eq
1000005f8: 4b0b014a    	sub	w10, w10, w11
1000005fc: 0aaa7d4a    	bic	w10, w10, w10, asr #31
100000600: 6b08015f    	cmp	w10, w8
100000604: 1a88c148    	csel	w8, w10, w8, gt
100000608: 5100090c    	sub	w12, w8, #0x2
10000060c: 9100052b    	add	x11, x9, #0x1
100000610: 6b0c015f    	cmp	w10, w12
100000614: 54fffe2c    	b.gt	0x1000005d8 <_func0+0x3c>
100000618: eb09001f    	cmp	x0, x9
10000061c: 1a9f97e0    	cset	w0, hi
100000620: a9417bfd    	ldp	x29, x30, [sp, #0x10]
100000624: a8c24ff4    	ldp	x20, x19, [sp], #0x20
100000628: d65f03c0    	ret

