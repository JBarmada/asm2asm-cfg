0000000100000950 <_func0>:
100000950: a9bd57f6    	stp	x22, x21, [sp, #-0x30]!
100000954: a9014ff4    	stp	x20, x19, [sp, #0x10]
100000958: a9027bfd    	stp	x29, x30, [sp, #0x20]
10000095c: 910083fd    	add	x29, sp, #0x20
100000960: aa0203f3    	mov	x19, x2
100000964: aa0103f5    	mov	x21, x1
100000968: aa0003f4    	mov	x20, x0
10000096c: 0b417c28    	add	w8, w1, w1, lsr #31
100000970: 13017d08    	asr	w8, w8, #1
100000974: 937e7d08    	sbfiz	x8, x8, #2, #32
100000978: 91001100    	add	x0, x8, #0x4
10000097c: 9400008e    	bl	0x100000bb4 <_malloc+0x100000bb4>
100000980: 710006ab    	subs	w11, w21, #0x1
100000984: 5400092b    	b.lt	0x100000aa8 <_func0+0x158>
100000988: 53017d68    	lsr	w8, w11, #1
10000098c: 11000509    	add	w9, w8, #0x1
100000990: 710026bf    	cmp	w21, #0x9
100000994: 54000082    	b.hs	0x1000009a4 <_func0+0x54>
100000998: d280000a    	mov	x10, #0x0               ; =0
10000099c: d280000c    	mov	x12, #0x0               ; =0
1000009a0: 1400002d    	b	0x100000a54 <_func0+0x104>
1000009a4: 710086bf    	cmp	w21, #0x21
1000009a8: 54000062    	b.hs	0x1000009b4 <_func0+0x64>
1000009ac: d280000a    	mov	x10, #0x0               ; =0
1000009b0: 14000019    	b	0x100000a14 <_func0+0xc4>
1000009b4: f2400d2a    	ands	x10, x9, #0xf
1000009b8: 5280020c    	mov	w12, #0x10              ; =16
1000009bc: 9a8a018c    	csel	x12, x12, x10, eq
1000009c0: cb0c012a    	sub	x10, x9, x12
1000009c4: 9100800d    	add	x13, x0, #0x20
1000009c8: 9101028e    	add	x14, x20, #0x40
1000009cc: aa0903ef    	mov	x15, x9
1000009d0: d10101d0    	sub	x16, x14, #0x40
1000009d4: 4c408a00    	ld2.4s	{ v0, v1 }, [x16]
1000009d8: d10081d0    	sub	x16, x14, #0x20
1000009dc: 4c408a02    	ld2.4s	{ v2, v3 }, [x16]
1000009e0: aa0e03f0    	mov	x16, x14
1000009e4: 4cdf8a04    	ld2.4s	{ v4, v5 }, [x16], #32
1000009e8: 4c408a06    	ld2.4s	{ v6, v7 }, [x16]
1000009ec: ad3f09a0    	stp	q0, q2, [x13, #-0x20]
1000009f0: ac8219a4    	stp	q4, q6, [x13], #0x40
1000009f4: d10041ef    	sub	x15, x15, #0x10
1000009f8: 910201ce    	add	x14, x14, #0x80
1000009fc: eb0f019f    	cmp	x12, x15
100000a00: 54fffe81    	b.ne	0x1000009d0 <_func0+0x80>
100000a04: f100119f    	cmp	x12, #0x4
100000a08: 54000068    	b.hi	0x100000a14 <_func0+0xc4>
100000a0c: d37ff94c    	lsl	x12, x10, #1
100000a10: 14000011    	b	0x100000a54 <_func0+0x104>
100000a14: aa0a03ef    	mov	x15, x10
100000a18: f240052a    	ands	x10, x9, #0x3
100000a1c: 5280008c    	mov	w12, #0x4               ; =4
100000a20: 9a8a0190    	csel	x16, x12, x10, eq
100000a24: 8b0f0e8d    	add	x13, x20, x15, lsl #3
100000a28: 8b0f080e    	add	x14, x0, x15, lsl #2
100000a2c: cb10012a    	sub	x10, x9, x16
100000a30: d37ff94c    	lsl	x12, x10, #1
100000a34: 92800011    	mov	x17, #-0x1              ; =-1
100000a38: ca4b062b    	eor	x11, x17, x11, lsr #1
100000a3c: 8b0f020f    	add	x15, x16, x15
100000a40: 8b0f016b    	add	x11, x11, x15
100000a44: 4cdf89a0    	ld2.4s	{ v0, v1 }, [x13], #32
100000a48: 3c8105c0    	str	q0, [x14], #0x10
100000a4c: b100116b    	adds	x11, x11, #0x4
100000a50: 54ffffa1    	b.ne	0x100000a44 <_func0+0xf4>
100000a54: 8b0c0a8b    	add	x11, x20, x12, lsl #2
100000a58: bc408560    	ldr	s0, [x11], #0x8
100000a5c: bc2a7800    	str	s0, [x0, x10, lsl #2]
100000a60: 9100054c    	add	x12, x10, #0x1
100000a64: aa0c03ea    	mov	x10, x12
100000a68: eb0c013f    	cmp	x9, x12
100000a6c: 54ffff61    	b.ne	0x100000a58 <_func0+0x108>
100000a70: 71000ebf    	cmp	w21, #0x3
100000a74: 54000222    	b.hs	0x100000ab8 <_func0+0x168>
100000a78: d2800008    	mov	x8, #0x0                ; =0
100000a7c: 2a1503e9    	mov	w9, w21
100000a80: d3417d0a    	ubfx	x10, x8, #1, #31
100000a84: 8b0a080a    	add	x10, x0, x10, lsl #2
100000a88: f240011f    	tst	x8, #0x1
100000a8c: 9a94014a    	csel	x10, x10, x20, eq
100000a90: bd400140    	ldr	s0, [x10]
100000a94: bc287a60    	str	s0, [x19, x8, lsl #2]
100000a98: 91000508    	add	x8, x8, #0x1
100000a9c: 91001294    	add	x20, x20, #0x4
100000aa0: eb08013f    	cmp	x9, x8
100000aa4: 54fffee1    	b.ne	0x100000a80 <_func0+0x130>
100000aa8: a9427bfd    	ldp	x29, x30, [sp, #0x20]
100000aac: a9414ff4    	ldp	x20, x19, [sp, #0x10]
100000ab0: a8c357f6    	ldp	x22, x21, [sp], #0x30
100000ab4: 1400003d    	b	0x100000ba8 <_malloc+0x100000ba8>
100000ab8: 52800009    	mov	w9, #0x0                ; =0
100000abc: 9100100a    	add	x10, x0, #0x4
100000ac0: aa0803eb    	mov	x11, x8
100000ac4: 14000005    	b	0x100000ad8 <_func0+0x188>
100000ac8: 11000529    	add	w9, w9, #0x1
100000acc: 5100056b    	sub	w11, w11, #0x1
100000ad0: 6b08013f    	cmp	w9, w8
100000ad4: 54fffd20    	b.eq	0x100000a78 <_func0+0x128>
100000ad8: 2a0b03eb    	mov	w11, w11
100000adc: 6b08013f    	cmp	w9, w8
100000ae0: 54ffff42    	b.hs	0x100000ac8 <_func0+0x178>
100000ae4: bd400000    	ldr	s0, [x0]
100000ae8: aa0b03ec    	mov	x12, x11
100000aec: aa0a03ed    	mov	x13, x10
100000af0: 14000005    	b	0x100000b04 <_func0+0x1b4>
100000af4: 2d3f81a1    	stp	s1, s0, [x13, #-0x4]
100000af8: 910011ad    	add	x13, x13, #0x4
100000afc: f100058c    	subs	x12, x12, #0x1
100000b00: 54fffe40    	b.eq	0x100000ac8 <_func0+0x178>
100000b04: bd4001a1    	ldr	s1, [x13]
100000b08: 1e212000    	fcmp	s0, s1
100000b0c: 54ffff4c    	b.gt	0x100000af4 <_func0+0x1a4>
100000b10: 1e204020    	fmov	s0, s1
100000b14: 17fffff9    	b	0x100000af8 <_func0+0x1a8>

