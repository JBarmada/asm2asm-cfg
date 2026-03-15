00000001000005dc <_func0>:
1000005dc: a9be4ff4    	stp	x20, x19, [sp, #-0x20]!
1000005e0: a9017bfd    	stp	x29, x30, [sp, #0x10]
1000005e4: 910043fd    	add	x29, sp, #0x10
1000005e8: aa0103f4    	mov	x20, x1
1000005ec: aa0003f3    	mov	x19, x0
1000005f0: 94000094    	bl	0x100000840 <_time+0x100000840>
1000005f4: b4000e20    	cbz	x0, 0x1000007b8 <_func0+0x1dc>
1000005f8: 12800b68    	mov	w8, #-0x5c              ; =-92
1000005fc: 12800969    	mov	w9, #-0x4c              ; =-76
100000600: 7100029f    	cmp	w20, #0x0
100000604: 1a880128    	csel	w8, w9, w8, eq
100000608: f100201f    	cmp	x0, #0x8
10000060c: 54000062    	b.hs	0x100000618 <_func0+0x3c>
100000610: d2800009    	mov	x9, #0x0                ; =0
100000614: 14000059    	b	0x100000778 <_func0+0x19c>
100000618: 4e040d00    	dup.4s	v0, w8
10000061c: f100401f    	cmp	x0, #0x10
100000620: 540004a2    	b.hs	0x1000006b4 <_func0+0xd8>
100000624: d2800009    	mov	x9, #0x0                ; =0
100000628: aa0903eb    	mov	x11, x9
10000062c: 927df009    	and	x9, x0, #0xfffffffffffffff8
100000630: 8b0b026a    	add	x10, x19, x11
100000634: cb09016b    	sub	x11, x11, x9
100000638: 529d89ec    	mov	w12, #0xec4f            ; =60495
10000063c: 72a9d88c    	movk	w12, #0x4ec4, lsl #16
100000640: 4e040d81    	dup.4s	v1, w12
100000644: 4f000742    	movi.4s	v2, #0x1a
100000648: 9000000c    	adrp	x12, 0x100000000 <_time+0x100000000>
10000064c: 3dc22983    	ldr	q3, [x12, #0x8a0]
100000650: 0f03e424    	movi.8b	v4, #0x61
100000654: fd400145    	ldr	d5, [x10]
100000658: 0f08a4a5    	sshll.8h	v5, v5, #0x0
10000065c: 0e651006    	saddw.4s	v6, v0, v5
100000660: 4e651007    	saddw2.4s	v7, v0, v5
100000664: 4ea1c0e5    	smull2.2d	v5, v7, v1
100000668: 0ea1c0f0    	smull.2d	v16, v7, v1
10000066c: 4e855a05    	uzp2.4s	v5, v16, v5
100000670: 4f3d04b0    	sshr.4s	v16, v5, #0x3
100000674: 6f2114b0    	usra.4s	v16, v5, #0x1f
100000678: 6ea29607    	mls.4s	v7, v16, v2
10000067c: 4ea1c0c5    	smull2.2d	v5, v6, v1
100000680: 0ea1c0d0    	smull.2d	v16, v6, v1
100000684: 4e855a05    	uzp2.4s	v5, v16, v5
100000688: 4f3d04b0    	sshr.4s	v16, v5, #0x3
10000068c: 6f2114b0    	usra.4s	v16, v5, #0x1f
100000690: 6ea29606    	mls.4s	v6, v16, v2
100000694: 4e0320c5    	tbl.16b	v5, { v6, v7 }, v3
100000698: 0e2484a5    	add.8b	v5, v5, v4
10000069c: fc008545    	str	d5, [x10], #0x8
1000006a0: b100216b    	adds	x11, x11, #0x8
1000006a4: 54fffd81    	b.ne	0x100000654 <_func0+0x78>
1000006a8: eb09001f    	cmp	x0, x9
1000006ac: 54000661    	b.ne	0x100000778 <_func0+0x19c>
1000006b0: 14000042    	b	0x1000007b8 <_func0+0x1dc>
1000006b4: 927cec09    	and	x9, x0, #0xfffffffffffffff0
1000006b8: 529d89ea    	mov	w10, #0xec4f            ; =60495
1000006bc: 72a9d88a    	movk	w10, #0x4ec4, lsl #16
1000006c0: 4e040d41    	dup.4s	v1, w10
1000006c4: 4f000742    	movi.4s	v2, #0x1a
1000006c8: 9000000a    	adrp	x10, 0x100000000 <_time+0x100000000>
1000006cc: 3dc22543    	ldr	q3, [x10, #0x890]
1000006d0: 4f03e424    	movi.16b	v4, #0x61
1000006d4: aa0903ea    	mov	x10, x9
1000006d8: aa1303eb    	mov	x11, x19
1000006dc: 3dc00165    	ldr	q5, [x11]
1000006e0: 4f08a4a6    	sshll2.8h	v6, v5, #0x0
1000006e4: 0f08a4a5    	sshll.8h	v5, v5, #0x0
1000006e8: 0e651010    	saddw.4s	v16, v0, v5
1000006ec: 4e651011    	saddw2.4s	v17, v0, v5
1000006f0: 0e661012    	saddw.4s	v18, v0, v6
1000006f4: 4e661013    	saddw2.4s	v19, v0, v6
1000006f8: 4ea1c265    	smull2.2d	v5, v19, v1
1000006fc: 0ea1c266    	smull.2d	v6, v19, v1
100000700: 4e8558c5    	uzp2.4s	v5, v6, v5
100000704: 4f3d04a6    	sshr.4s	v6, v5, #0x3
100000708: 6f2114a6    	usra.4s	v6, v5, #0x1f
10000070c: 6ea294d3    	mls.4s	v19, v6, v2
100000710: 4ea1c245    	smull2.2d	v5, v18, v1
100000714: 0ea1c246    	smull.2d	v6, v18, v1
100000718: 4e8558c5    	uzp2.4s	v5, v6, v5
10000071c: 4f3d04a6    	sshr.4s	v6, v5, #0x3
100000720: 6f2114a6    	usra.4s	v6, v5, #0x1f
100000724: 6ea294d2    	mls.4s	v18, v6, v2
100000728: 4ea1c225    	smull2.2d	v5, v17, v1
10000072c: 0ea1c226    	smull.2d	v6, v17, v1
100000730: 4e8558c5    	uzp2.4s	v5, v6, v5
100000734: 4f3d04a6    	sshr.4s	v6, v5, #0x3
100000738: 6f2114a6    	usra.4s	v6, v5, #0x1f
10000073c: 6ea294d1    	mls.4s	v17, v6, v2
100000740: 4ea1c205    	smull2.2d	v5, v16, v1
100000744: 0ea1c206    	smull.2d	v6, v16, v1
100000748: 4e8558c5    	uzp2.4s	v5, v6, v5
10000074c: 4f3d04a6    	sshr.4s	v6, v5, #0x3
100000750: 6f2114a6    	usra.4s	v6, v5, #0x1f
100000754: 6ea294d0    	mls.4s	v16, v6, v2
100000758: 4e036205    	tbl.16b	v5, { v16, v17, v18, v19 }, v3
10000075c: 4e2484a5    	add.16b	v5, v5, v4
100000760: 3c810565    	str	q5, [x11], #0x10
100000764: f100414a    	subs	x10, x10, #0x10
100000768: 54fffba1    	b.ne	0x1000006dc <_func0+0x100>
10000076c: eb09001f    	cmp	x0, x9
100000770: 54000240    	b.eq	0x1000007b8 <_func0+0x1dc>
100000774: 371ff5a0    	tbnz	w0, #0x3, 0x100000628 <_func0+0x4c>
100000778: cb09000a    	sub	x10, x0, x9
10000077c: 8b090269    	add	x9, x19, x9
100000780: 529d89eb    	mov	w11, #0xec4f            ; =60495
100000784: 72a9d88b    	movk	w11, #0x4ec4, lsl #16
100000788: 5280034c    	mov	w12, #0x1a              ; =26
10000078c: 39c0012d    	ldrsb	w13, [x9]
100000790: 0b0d010d    	add	w13, w8, w13
100000794: 9b2b7dae    	smull	x14, w13, w11
100000798: d37ffdcf    	lsr	x15, x14, #63
10000079c: d363fdce    	lsr	x14, x14, #35
1000007a0: 0b0f01ce    	add	w14, w14, w15
1000007a4: 1b0cb5cd    	msub	w13, w14, w12, w13
1000007a8: 110185ad    	add	w13, w13, #0x61
1000007ac: 3800152d    	strb	w13, [x9], #0x1
1000007b0: f100054a    	subs	x10, x10, #0x1
1000007b4: 54fffec1    	b.ne	0x10000078c <_func0+0x1b0>
1000007b8: a9417bfd    	ldp	x29, x30, [sp, #0x10]
1000007bc: a8c24ff4    	ldp	x20, x19, [sp], #0x20
1000007c0: d65f03c0    	ret

