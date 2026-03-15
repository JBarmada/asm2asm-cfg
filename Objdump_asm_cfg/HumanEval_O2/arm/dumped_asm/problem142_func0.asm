00000001000008e4 <_func0>:
1000008e4: 6db933ed    	stp	d13, d12, [sp, #-0x70]!
1000008e8: 6d012beb    	stp	d11, d10, [sp, #0x10]
1000008ec: 6d0223e9    	stp	d9, d8, [sp, #0x20]
1000008f0: a9035ff8    	stp	x24, x23, [sp, #0x30]
1000008f4: a90457f6    	stp	x22, x21, [sp, #0x40]
1000008f8: a9054ff4    	stp	x20, x19, [sp, #0x50]
1000008fc: a9067bfd    	stp	x29, x30, [sp, #0x60]
100000900: 910183fd    	add	x29, sp, #0x60
100000904: aa0003f3    	mov	x19, x0
100000908: 940001e3    	bl	0x100001094 <_strlen+0x100001094>
10000090c: 7100141f    	cmp	w0, #0x5
100000910: 5400008b    	b.lt	0x100000920 <_func0+0x3c>
100000914: 39c00268    	ldrsb	w8, [x19]
100000918: 7101051f    	cmp	w8, #0x41
10000091c: 5400016a    	b.ge	0x100000948 <_func0+0x64>
100000920: b0000000    	adrp	x0, 0x100001000 <_main.cold.23+0x24>
100000924: 9119b400    	add	x0, x0, #0x66d
100000928: a9467bfd    	ldp	x29, x30, [sp, #0x60]
10000092c: a9454ff4    	ldp	x20, x19, [sp, #0x50]
100000930: a94457f6    	ldp	x22, x21, [sp, #0x40]
100000934: a9435ff8    	ldp	x24, x23, [sp, #0x30]
100000938: 6d4223e9    	ldp	d9, d8, [sp, #0x20]
10000093c: 6d412beb    	ldp	d11, d10, [sp, #0x10]
100000940: 6cc733ed    	ldp	d13, d12, [sp], #0x70
100000944: d65f03c0    	ret
100000948: aa0003f6    	mov	x22, x0
10000094c: 12001d08    	and	w8, w8, #0xff
100000950: 51016d09    	sub	w9, w8, #0x5b
100000954: b0000000    	adrp	x0, 0x100001000 <_main.cold.23+0x24>
100000958: 9119b400    	add	x0, x0, #0x66d
10000095c: 7101e91f    	cmp	w8, #0x7a
100000960: 7a469920    	ccmp	w9, #0x6, #0x0, ls
100000964: 54fffe23    	b.lo	0x100000928 <_func0+0x44>
100000968: aa0003f7    	mov	x23, x0
10000096c: 92407ad5    	and	x21, x22, #0x7fffffff
100000970: 8b150268    	add	x8, x19, x21
100000974: d1001114    	sub	x20, x8, #0x4
100000978: b0000001    	adrp	x1, 0x100001000 <_main.cold.23+0x24>
10000097c: 91189421    	add	x1, x1, #0x625
100000980: aa1403e0    	mov	x0, x20
100000984: 940001c1    	bl	0x100001088 <_strlen+0x100001088>
100000988: 34000160    	cbz	w0, 0x1000009b4 <_func0+0xd0>
10000098c: b0000001    	adrp	x1, 0x100001000 <_main.cold.23+0x24>
100000990: 9119c021    	add	x1, x1, #0x670
100000994: aa1403e0    	mov	x0, x20
100000998: 940001bc    	bl	0x100001088 <_strlen+0x100001088>
10000099c: 340000c0    	cbz	w0, 0x1000009b4 <_func0+0xd0>
1000009a0: b0000001    	adrp	x1, 0x100001000 <_main.cold.23+0x24>
1000009a4: 9119d421    	add	x1, x1, #0x675
1000009a8: aa1403e0    	mov	x0, x20
1000009ac: 940001b7    	bl	0x100001088 <_strlen+0x100001088>
1000009b0: 35fffb80    	cbnz	w0, 0x100000920 <_func0+0x3c>
1000009b4: f10012bf    	cmp	x21, #0x4
1000009b8: 540000c2    	b.hs	0x1000009d0 <_func0+0xec>
1000009bc: d2800008    	mov	x8, #0x0                ; =0
1000009c0: 5280000a    	mov	w10, #0x0               ; =0
1000009c4: 5280000b    	mov	w11, #0x0               ; =0
1000009c8: aa1703e0    	mov	x0, x23
1000009cc: 14000098    	b	0x100000c2c <_func0+0x348>
1000009d0: f10082bf    	cmp	x21, #0x20
1000009d4: aa1703e0    	mov	x0, x23
1000009d8: 540000a2    	b.hs	0x1000009ec <_func0+0x108>
1000009dc: 5280000a    	mov	w10, #0x0               ; =0
1000009e0: 5280000b    	mov	w11, #0x0               ; =0
1000009e4: d2800008    	mov	x8, #0x0                ; =0
1000009e8: 14000070    	b	0x100000ba8 <_func0+0x2c4>
1000009ec: 6f00e400    	movi.2d	v0, #0000000000000000
1000009f0: 924012c9    	and	x9, x22, #0x1f
1000009f4: 4f06e601    	movi.16b	v1, #0xd0
1000009f8: cb0902a8    	sub	x8, x21, x9
1000009fc: 4f00e542    	movi.16b	v2, #0xa
100000a00: 9100426a    	add	x10, x19, #0x10
100000a04: 4f000425    	movi.4s	v5, #0x1
100000a08: 4f01e5c6    	movi.16b	v6, #0x2e
100000a0c: aa0803eb    	mov	x11, x8
100000a10: 6f00e413    	movi.2d	v19, #0000000000000000
100000a14: 6f00e407    	movi.2d	v7, #0000000000000000
100000a18: 6f00e415    	movi.2d	v21, #0000000000000000
100000a1c: 6f00e416    	movi.2d	v22, #0000000000000000
100000a20: 6f00e41a    	movi.2d	v26, #0000000000000000
100000a24: 6f00e417    	movi.2d	v23, #0000000000000000
100000a28: 6f00e41b    	movi.2d	v27, #0000000000000000
100000a2c: 6f00e403    	movi.2d	v3, #0000000000000000
100000a30: 6f00e410    	movi.2d	v16, #0000000000000000
100000a34: 6f00e404    	movi.2d	v4, #0000000000000000
100000a38: 6f00e411    	movi.2d	v17, #0000000000000000
100000a3c: 6f00e412    	movi.2d	v18, #0000000000000000
100000a40: 6f00e418    	movi.2d	v24, #0000000000000000
100000a44: 6f00e414    	movi.2d	v20, #0000000000000000
100000a48: 6f00e419    	movi.2d	v25, #0000000000000000
100000a4c: ad7ff55c    	ldp	q28, q29, [x10, #-0x10]
100000a50: 4e21879e    	add.16b	v30, v28, v1
100000a54: 4e2187bf    	add.16b	v31, v29, v1
100000a58: 6e3e345e    	cmhi.16b	v30, v2, v30
100000a5c: 2f08a7c8    	ushll.8h	v8, v30, #0x0
100000a60: 2f10a509    	ushll.4s	v9, v8, #0x0
100000a64: 4e251d29    	and.16b	v9, v9, v5
100000a68: 6f10a508    	ushll2.4s	v8, v8, #0x0
100000a6c: 4e251d08    	and.16b	v8, v8, v5
100000a70: 6f08a7de    	ushll2.8h	v30, v30, #0x0
100000a74: 2f10a7ca    	ushll.4s	v10, v30, #0x0
100000a78: 4e251d4a    	and.16b	v10, v10, v5
100000a7c: 6f10a7de    	ushll2.4s	v30, v30, #0x0
100000a80: 4e251fde    	and.16b	v30, v30, v5
100000a84: 6e3f345f    	cmhi.16b	v31, v2, v31
100000a88: 2f08a7eb    	ushll.8h	v11, v31, #0x0
100000a8c: 2f10a56c    	ushll.4s	v12, v11, #0x0
100000a90: 4e251d8c    	and.16b	v12, v12, v5
100000a94: 6f10a56b    	ushll2.4s	v11, v11, #0x0
100000a98: 4e251d6b    	and.16b	v11, v11, v5
100000a9c: 6f08a7ff    	ushll2.8h	v31, v31, #0x0
100000aa0: 2f10a7ed    	ushll.4s	v13, v31, #0x0
100000aa4: 4e251dad    	and.16b	v13, v13, v5
100000aa8: 6f10a7ff    	ushll2.4s	v31, v31, #0x0
100000aac: 4e251fff    	and.16b	v31, v31, v5
100000ab0: 4ebe86b5    	add.4s	v21, v21, v30
100000ab4: 4eaa84e7    	add.4s	v7, v7, v10
100000ab8: 4ea88673    	add.4s	v19, v19, v8
100000abc: 4ea98400    	add.4s	v0, v0, v9
100000ac0: 4ebf877b    	add.4s	v27, v27, v31
100000ac4: 4ead86f7    	add.4s	v23, v23, v13
100000ac8: 4eab875a    	add.4s	v26, v26, v11
100000acc: 4eac86d6    	add.4s	v22, v22, v12
100000ad0: 6e268f9c    	cmeq.16b	v28, v28, v6
100000ad4: 2f08a79e    	ushll.8h	v30, v28, #0x0
100000ad8: 2f10a7df    	ushll.4s	v31, v30, #0x0
100000adc: 4e251fff    	and.16b	v31, v31, v5
100000ae0: 6f10a7de    	ushll2.4s	v30, v30, #0x0
100000ae4: 4e251fde    	and.16b	v30, v30, v5
100000ae8: 6f08a79c    	ushll2.8h	v28, v28, #0x0
100000aec: 2f10a788    	ushll.4s	v8, v28, #0x0
100000af0: 4e251d08    	and.16b	v8, v8, v5
100000af4: 6f10a79c    	ushll2.4s	v28, v28, #0x0
100000af8: 4e251f9c    	and.16b	v28, v28, v5
100000afc: 6e268fbd    	cmeq.16b	v29, v29, v6
100000b00: 2f08a7a9    	ushll.8h	v9, v29, #0x0
100000b04: 2f10a52a    	ushll.4s	v10, v9, #0x0
100000b08: 4e251d4a    	and.16b	v10, v10, v5
100000b0c: 6f10a529    	ushll2.4s	v9, v9, #0x0
100000b10: 4e251d29    	and.16b	v9, v9, v5
100000b14: 6f08a7bd    	ushll2.8h	v29, v29, #0x0
100000b18: 2f10a7ab    	ushll.4s	v11, v29, #0x0
100000b1c: 4e251d6b    	and.16b	v11, v11, v5
100000b20: 6f10a7bd    	ushll2.4s	v29, v29, #0x0
100000b24: 4e251fbd    	and.16b	v29, v29, v5
100000b28: 4ebc8631    	add.4s	v17, v17, v28
100000b2c: 4ea88484    	add.4s	v4, v4, v8
100000b30: 4ebe8610    	add.4s	v16, v16, v30
100000b34: 4ebf8463    	add.4s	v3, v3, v31
100000b38: 4ebd8739    	add.4s	v25, v25, v29
100000b3c: 4eab8694    	add.4s	v20, v20, v11
100000b40: 4ea98718    	add.4s	v24, v24, v9
100000b44: 9100814a    	add	x10, x10, #0x20
100000b48: 4eaa8652    	add.4s	v18, v18, v10
100000b4c: f100816b    	subs	x11, x11, #0x20
100000b50: 54fff7e1    	b.ne	0x100000a4c <_func0+0x168>
100000b54: 4eb38741    	add.4s	v1, v26, v19
100000b58: 4eb58762    	add.4s	v2, v27, v21
100000b5c: 4ea086c0    	add.4s	v0, v22, v0
100000b60: 4ea786e5    	add.4s	v5, v23, v7
100000b64: 4ea58400    	add.4s	v0, v0, v5
100000b68: 4ea28421    	add.4s	v1, v1, v2
100000b6c: 4ea18400    	add.4s	v0, v0, v1
100000b70: 4eb1b800    	addv.4s	s0, v0
100000b74: 1e26000a    	fmov	w10, s0
100000b78: 4eb08700    	add.4s	v0, v24, v16
100000b7c: 4eb18721    	add.4s	v1, v25, v17
100000b80: 4ea38642    	add.4s	v2, v18, v3
100000b84: 4ea48683    	add.4s	v3, v20, v4
100000b88: 4ea38442    	add.4s	v2, v2, v3
100000b8c: 4ea18400    	add.4s	v0, v0, v1
100000b90: 4ea08440    	add.4s	v0, v2, v0
100000b94: 4eb1b800    	addv.4s	s0, v0
100000b98: 1e26000b    	fmov	w11, s0
100000b9c: b40005c9    	cbz	x9, 0x100000c54 <_func0+0x370>
100000ba0: f1000d3f    	cmp	x9, #0x3
100000ba4: 54000449    	b.ls	0x100000c2c <_func0+0x348>
100000ba8: aa0803ed    	mov	x13, x8
100000bac: 924006c9    	and	x9, x22, #0x3
100000bb0: 8b08026c    	add	x12, x19, x8
100000bb4: cb0902a8    	sub	x8, x21, x9
100000bb8: 6f00e400    	movi.2d	v0, #0000000000000000
100000bbc: 6f00e401    	movi.2d	v1, #0000000000000000
100000bc0: 4e041d41    	mov.s	v1[0], w10
100000bc4: 4e041d60    	mov.s	v0[0], w11
100000bc8: 8b0901aa    	add	x10, x13, x9
100000bcc: cb15014a    	sub	x10, x10, x21
100000bd0: 0f068602    	movi.4h	v2, #0xd0
100000bd4: 0f008543    	movi.4h	v3, #0xa
100000bd8: 4f000424    	movi.4s	v4, #0x1
100000bdc: 0f0185c5    	movi.4h	v5, #0x2e
100000be0: bc404586    	ldr	s6, [x12], #0x4
100000be4: 2f08a4c7    	ushll.8h	v7, v6, #0x0
100000be8: 2e261046    	uaddw.8h	v6, v2, v6
100000bec: 2f00b426    	bic.4h	v6, #0x1, lsl #8
100000bf0: 2e663466    	cmhi.4h	v6, v3, v6
100000bf4: 2f10a4c6    	ushll.4s	v6, v6, #0x0
100000bf8: 4e241cc6    	and.16b	v6, v6, v4
100000bfc: 4ea68421    	add.4s	v1, v1, v6
100000c00: 2e658ce6    	cmeq.4h	v6, v7, v5
100000c04: 2f10a4c6    	ushll.4s	v6, v6, #0x0
100000c08: 4e241cc6    	and.16b	v6, v6, v4
100000c0c: 4ea68400    	add.4s	v0, v0, v6
100000c10: b100114a    	adds	x10, x10, #0x4
100000c14: 54fffe61    	b.ne	0x100000be0 <_func0+0x2fc>
100000c18: 4eb1b821    	addv.4s	s1, v1
100000c1c: 1e26002a    	fmov	w10, s1
100000c20: 4eb1b800    	addv.4s	s0, v0
100000c24: 1e26000b    	fmov	w11, s0
100000c28: b4000169    	cbz	x9, 0x100000c54 <_func0+0x370>
100000c2c: 8b080269    	add	x9, x19, x8
100000c30: cb0802a8    	sub	x8, x21, x8
100000c34: 3840152c    	ldrb	w12, [x9], #0x1
100000c38: 5100c18d    	sub	w13, w12, #0x30
100000c3c: 710029bf    	cmp	w13, #0xa
100000c40: 1a8a254a    	cinc	w10, w10, lo
100000c44: 7100b99f    	cmp	w12, #0x2e
100000c48: 1a8b156b    	cinc	w11, w11, eq
100000c4c: f1000508    	subs	x8, x8, #0x1
100000c50: 54ffff21    	b.ne	0x100000c34 <_func0+0x350>
100000c54: 7100057f    	cmp	w11, #0x1
100000c58: 7a430942    	ccmp	w10, #0x3, #0x2, eq
100000c5c: b0000008    	adrp	x8, 0x100001000 <_main.cold.23+0x24>
100000c60: 9102b108    	add	x8, x8, #0xac
100000c64: 9a888000    	csel	x0, x0, x8, hi
100000c68: 17ffff30    	b	0x100000928 <_func0+0x44>

