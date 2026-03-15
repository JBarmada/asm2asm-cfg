0000000100000868 <_func0>:
100000868: d10243ff    	sub	sp, sp, #0x90
10000086c: 6d0223e9    	stp	d9, d8, [sp, #0x20]
100000870: a9036ffc    	stp	x28, x27, [sp, #0x30]
100000874: a90467fa    	stp	x26, x25, [sp, #0x40]
100000878: a9055ff8    	stp	x24, x23, [sp, #0x50]
10000087c: a90657f6    	stp	x22, x21, [sp, #0x60]
100000880: a9074ff4    	stp	x20, x19, [sp, #0x70]
100000884: a9087bfd    	stp	x29, x30, [sp, #0x80]
100000888: 910203fd    	add	x29, sp, #0x80
10000088c: aa0103f4    	mov	x20, x1
100000890: aa0003f3    	mov	x19, x0
100000894: 90000028    	adrp	x8, 0x100004000 <_strlen+0x100004000>
100000898: f9400d08    	ldr	x8, [x8, #0x18]
10000089c: f9400108    	ldr	x8, [x8]
1000008a0: f9000fe8    	str	x8, [sp, #0x18]
1000008a4: 937e7e80    	sbfiz	x0, x20, #2, #32
1000008a8: 94000111    	bl	0x100000cec <_strlen+0x100000cec>
1000008ac: aa0003f5    	mov	x21, x0
1000008b0: 7100069f    	cmp	w20, #0x1
1000008b4: 540017ab    	b.lt	0x100000ba8 <_func0+0x340>
1000008b8: d2800018    	mov	x24, #0x0               ; =0
1000008bc: 2a1403f7    	mov	w23, w20
1000008c0: 910033f9    	add	x25, sp, #0xc
1000008c4: 9100873a    	add	x26, x25, #0x21
1000008c8: 9100073b    	add	x27, x25, #0x1
1000008cc: 90000016    	adrp	x22, 0x100000000 <_strlen+0x100000000>
1000008d0: 913ae6d6    	add	x22, x22, #0xeb9
1000008d4: 1400000d    	b	0x100000908 <_func0+0xa0>
1000008d8: b8787a68    	ldr	w8, [x19, x24, lsl #2]
1000008dc: 39c033e9    	ldrsb	w9, [sp, #0xc]
1000008e0: 0b09016a    	add	w10, w11, w9
1000008e4: 5100c14a    	sub	w10, w10, #0x30
1000008e8: 4b090169    	sub	w9, w11, w9
1000008ec: 1100c129    	add	w9, w9, #0x30
1000008f0: 7100011f    	cmp	w8, #0x0
1000008f4: 1a89c148    	csel	w8, w10, w9, gt
1000008f8: b8387aa8    	str	w8, [x21, x24, lsl #2]
1000008fc: 91000718    	add	x24, x24, #0x1
100000900: eb17031f    	cmp	x24, x23
100000904: 540011c0    	b.eq	0x100000b3c <_func0+0x2d4>
100000908: b8787a68    	ldr	w8, [x19, x24, lsl #2]
10000090c: 7100011f    	cmp	w8, #0x0
100000910: 5a885508    	cneg	w8, w8, mi
100000914: f90003e8    	str	x8, [sp]
100000918: 910033e0    	add	x0, sp, #0xc
10000091c: 52800001    	mov	w1, #0x0                ; =0
100000920: 52800182    	mov	w2, #0xc                ; =12
100000924: aa1603e3    	mov	x3, x22
100000928: 940000e8    	bl	0x100000cc8 <_strlen+0x100000cc8>
10000092c: 910033e0    	add	x0, sp, #0xc
100000930: 940000f5    	bl	0x100000d04 <_strlen+0x100000d04>
100000934: 6f0105e8    	mvni.4s	v8, #0x2f
100000938: 5280000b    	mov	w11, #0x0               ; =0
10000093c: 7100081f    	cmp	w0, #0x2
100000940: 54fffccb    	b.lt	0x1000008d8 <_func0+0x70>
100000944: 92407808    	and	x8, x0, #0x7fffffff
100000948: d1000509    	sub	x9, x8, #0x1
10000094c: f100213f    	cmp	x9, #0x8
100000950: 54000082    	b.hs	0x100000960 <_func0+0xf8>
100000954: 5280000b    	mov	w11, #0x0               ; =0
100000958: 5280002c    	mov	w12, #0x1               ; =1
10000095c: 14000070    	b	0x100000b1c <_func0+0x2b4>
100000960: f101013f    	cmp	x9, #0x40
100000964: 54000082    	b.hs	0x100000974 <_func0+0x10c>
100000968: 5280000b    	mov	w11, #0x0               ; =0
10000096c: d280000a    	mov	x10, #0x0               ; =0
100000970: 14000055    	b	0x100000ac4 <_func0+0x25c>
100000974: 6f00e400    	movi.2d	v0, #0000000000000000
100000978: 927ae52a    	and	x10, x9, #0xffffffffffffffc0
10000097c: 6f00e403    	movi.2d	v3, #0000000000000000
100000980: aa0a03eb    	mov	x11, x10
100000984: 6f00e401    	movi.2d	v1, #0000000000000000
100000988: aa1a03ec    	mov	x12, x26
10000098c: 6f00e402    	movi.2d	v2, #0000000000000000
100000990: 6f00e412    	movi.2d	v18, #0000000000000000
100000994: 6f00e414    	movi.2d	v20, #0000000000000000
100000998: 6f00e404    	movi.2d	v4, #0000000000000000
10000099c: 6f00e407    	movi.2d	v7, #0000000000000000
1000009a0: 6f00e415    	movi.2d	v21, #0000000000000000
1000009a4: 6f00e410    	movi.2d	v16, #0000000000000000
1000009a8: 6f00e413    	movi.2d	v19, #0000000000000000
1000009ac: 6f00e405    	movi.2d	v5, #0000000000000000
1000009b0: 6f00e417    	movi.2d	v23, #0000000000000000
1000009b4: 6f00e416    	movi.2d	v22, #0000000000000000
1000009b8: 6f00e406    	movi.2d	v6, #0000000000000000
1000009bc: 6f00e411    	movi.2d	v17, #0000000000000000
1000009c0: ad7f6598    	ldp	q24, q25, [x12, #-0x20]
1000009c4: 4f08a71a    	sshll2.8h	v26, v24, #0x0
1000009c8: 0f08a718    	sshll.8h	v24, v24, #0x0
1000009cc: 4f08a73b    	sshll2.8h	v27, v25, #0x0
1000009d0: 0f08a739    	sshll.8h	v25, v25, #0x0
1000009d4: acc2759c    	ldp	q28, q29, [x12], #0x40
1000009d8: 4f08a79e    	sshll2.8h	v30, v28, #0x0
1000009dc: 0f08a79c    	sshll.8h	v28, v28, #0x0
1000009e0: 4f08a7bf    	sshll2.8h	v31, v29, #0x0
1000009e4: 0f08a7bd    	sshll.8h	v29, v29, #0x0
1000009e8: 0e781000    	saddw.4s	v0, v0, v24
1000009ec: 4e781063    	saddw2.4s	v3, v3, v24
1000009f0: 0e7a1021    	saddw.4s	v1, v1, v26
1000009f4: 4e7a1042    	saddw2.4s	v2, v2, v26
1000009f8: 0e791252    	saddw.4s	v18, v18, v25
1000009fc: 4e791294    	saddw2.4s	v20, v20, v25
100000a00: 0e7b1084    	saddw.4s	v4, v4, v27
100000a04: 4e7b10e7    	saddw2.4s	v7, v7, v27
100000a08: 0e7c12b5    	saddw.4s	v21, v21, v28
100000a0c: 4e7c1210    	saddw2.4s	v16, v16, v28
100000a10: 0e7e1273    	saddw.4s	v19, v19, v30
100000a14: 4e7e10a5    	saddw2.4s	v5, v5, v30
100000a18: 0e7d12f7    	saddw.4s	v23, v23, v29
100000a1c: 4e7d12d6    	saddw2.4s	v22, v22, v29
100000a20: 0e7f10c6    	saddw.4s	v6, v6, v31
100000a24: 4e7f1231    	saddw2.4s	v17, v17, v31
100000a28: 4ea88442    	add.4s	v2, v2, v8
100000a2c: 4ea88421    	add.4s	v1, v1, v8
100000a30: 4ea88463    	add.4s	v3, v3, v8
100000a34: 4ea88400    	add.4s	v0, v0, v8
100000a38: 4ea884e7    	add.4s	v7, v7, v8
100000a3c: 4ea88484    	add.4s	v4, v4, v8
100000a40: 4ea88694    	add.4s	v20, v20, v8
100000a44: 4ea88652    	add.4s	v18, v18, v8
100000a48: 4ea884a5    	add.4s	v5, v5, v8
100000a4c: 4ea88673    	add.4s	v19, v19, v8
100000a50: 4ea88610    	add.4s	v16, v16, v8
100000a54: 4ea886b5    	add.4s	v21, v21, v8
100000a58: 4ea88631    	add.4s	v17, v17, v8
100000a5c: 4ea884c6    	add.4s	v6, v6, v8
100000a60: 4ea886d6    	add.4s	v22, v22, v8
100000a64: 4ea886f7    	add.4s	v23, v23, v8
100000a68: f101016b    	subs	x11, x11, #0x40
100000a6c: 54fffaa1    	b.ne	0x1000009c0 <_func0+0x158>
100000a70: 4ea38683    	add.4s	v3, v20, v3
100000a74: 4ea284e2    	add.4s	v2, v7, v2
100000a78: 4ea08640    	add.4s	v0, v18, v0
100000a7c: 4ea18481    	add.4s	v1, v4, v1
100000a80: 4ea18661    	add.4s	v1, v19, v1
100000a84: 4ea086a0    	add.4s	v0, v21, v0
100000a88: 4ea284a2    	add.4s	v2, v5, v2
100000a8c: 4ea38603    	add.4s	v3, v16, v3
100000a90: 4ea386c3    	add.4s	v3, v22, v3
100000a94: 4ea28622    	add.4s	v2, v17, v2
100000a98: 4ea086e0    	add.4s	v0, v23, v0
100000a9c: 4ea184c1    	add.4s	v1, v6, v1
100000aa0: 4ea18400    	add.4s	v0, v0, v1
100000aa4: 4ea28461    	add.4s	v1, v3, v2
100000aa8: 4ea18400    	add.4s	v0, v0, v1
100000aac: 4eb1b800    	addv.4s	s0, v0
100000ab0: 1e26000b    	fmov	w11, s0
100000ab4: eb0a013f    	cmp	x9, x10
100000ab8: 54fff100    	b.eq	0x1000008d8 <_func0+0x70>
100000abc: f27d093f    	tst	x9, #0x38
100000ac0: 540002c0    	b.eq	0x100000b18 <_func0+0x2b0>
100000ac4: 927df12d    	and	x13, x9, #0xfffffffffffffff8
100000ac8: b24001ac    	orr	x12, x13, #0x1
100000acc: 6f00e400    	movi.2d	v0, #0000000000000000
100000ad0: 6f00e401    	movi.2d	v1, #0000000000000000
100000ad4: 4e041d61    	mov.s	v1[0], w11
100000ad8: 8b0a036b    	add	x11, x27, x10
100000adc: cb0d014a    	sub	x10, x10, x13
100000ae0: fc408562    	ldr	d2, [x11], #0x8
100000ae4: 0f08a442    	sshll.8h	v2, v2, #0x0
100000ae8: 0e621021    	saddw.4s	v1, v1, v2
100000aec: 4e621000    	saddw2.4s	v0, v0, v2
100000af0: 4ea88400    	add.4s	v0, v0, v8
100000af4: 4ea88421    	add.4s	v1, v1, v8
100000af8: b100214a    	adds	x10, x10, #0x8
100000afc: 54ffff21    	b.ne	0x100000ae0 <_func0+0x278>
100000b00: 4ea08420    	add.4s	v0, v1, v0
100000b04: 4eb1b800    	addv.4s	s0, v0
100000b08: 1e26000b    	fmov	w11, s0
100000b0c: eb0d013f    	cmp	x9, x13
100000b10: 54ffee40    	b.eq	0x1000008d8 <_func0+0x70>
100000b14: 14000002    	b	0x100000b1c <_func0+0x2b4>
100000b18: b240014c    	orr	x12, x10, #0x1
100000b1c: 8b0c0329    	add	x9, x25, x12
100000b20: cb0c0108    	sub	x8, x8, x12
100000b24: 38c0152a    	ldrsb	w10, [x9], #0x1
100000b28: 0b0a016a    	add	w10, w11, w10
100000b2c: 5100c14b    	sub	w11, w10, #0x30
100000b30: f1000508    	subs	x8, x8, #0x1
100000b34: 54ffff81    	b.ne	0x100000b24 <_func0+0x2bc>
100000b38: 17ffff68    	b	0x1000008d8 <_func0+0x70>
100000b3c: 52800008    	mov	w8, #0x0                ; =0
100000b40: 910012a9    	add	x9, x21, #0x4
100000b44: d10006ea    	sub	x10, x23, #0x1
100000b48: 14000004    	b	0x100000b58 <_func0+0x2f0>
100000b4c: 11000508    	add	w8, w8, #0x1
100000b50: 6b14011f    	cmp	w8, w20
100000b54: 540002a0    	b.eq	0x100000ba8 <_func0+0x340>
100000b58: 7100069f    	cmp	w20, #0x1
100000b5c: 54ffff80    	b.eq	0x100000b4c <_func0+0x2e4>
100000b60: b94002ab    	ldr	w11, [x21]
100000b64: aa0a03ec    	mov	x12, x10
100000b68: aa1303ed    	mov	x13, x19
100000b6c: aa0903ee    	mov	x14, x9
100000b70: 14000009    	b	0x100000b94 <_func0+0x32c>
100000b74: 293fadcf    	stp	w15, w11, [x14, #-0x4]
100000b78: fd4001a0    	ldr	d0, [x13]
100000b7c: 0ea00800    	rev64.2s	v0, v0
100000b80: fd0001a0    	str	d0, [x13]
100000b84: 910011ce    	add	x14, x14, #0x4
100000b88: 910011ad    	add	x13, x13, #0x4
100000b8c: f100058c    	subs	x12, x12, #0x1
100000b90: 54fffde0    	b.eq	0x100000b4c <_func0+0x2e4>
100000b94: b94001cf    	ldr	w15, [x14]
100000b98: 6b0f017f    	cmp	w11, w15
100000b9c: 54fffecc    	b.gt	0x100000b74 <_func0+0x30c>
100000ba0: aa0f03eb    	mov	x11, x15
100000ba4: 17fffff8    	b	0x100000b84 <_func0+0x31c>
100000ba8: aa1503e0    	mov	x0, x21
100000bac: 9400004d    	bl	0x100000ce0 <_strlen+0x100000ce0>
100000bb0: f9400fe8    	ldr	x8, [sp, #0x18]
100000bb4: 90000029    	adrp	x9, 0x100004000 <_strlen+0x100004000>
100000bb8: f9400d29    	ldr	x9, [x9, #0x18]
100000bbc: f9400129    	ldr	x9, [x9]
100000bc0: eb08013f    	cmp	x9, x8
100000bc4: 54000161    	b.ne	0x100000bf0 <_func0+0x388>
100000bc8: aa1303e0    	mov	x0, x19
100000bcc: a9487bfd    	ldp	x29, x30, [sp, #0x80]
100000bd0: a9474ff4    	ldp	x20, x19, [sp, #0x70]
100000bd4: a94657f6    	ldp	x22, x21, [sp, #0x60]
100000bd8: a9455ff8    	ldp	x24, x23, [sp, #0x50]
100000bdc: a94467fa    	ldp	x26, x25, [sp, #0x40]
100000be0: a9436ffc    	ldp	x28, x27, [sp, #0x30]
100000be4: 6d4223e9    	ldp	d9, d8, [sp, #0x20]
100000be8: 910243ff    	add	sp, sp, #0x90
100000bec: d65f03c0    	ret
100000bf0: 94000039    	bl	0x100000cd4 <_strlen+0x100000cd4>

