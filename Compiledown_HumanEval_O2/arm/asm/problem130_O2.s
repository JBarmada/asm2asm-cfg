	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function func0
lCPI0_0:
	.quad	2                               ; 0x2
	.quad	3                               ; 0x3
lCPI0_1:
	.quad	0                               ; 0x0
	.quad	1                               ; 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x2
	cmp	w1, #0
	b.le	LBB0_13
; %bb.1:
	mov	x10, #0                         ; =0x0
	mov	w11, w1
                                        ; implicit-def: $w8
                                        ; implicit-def: $w9
LBB0_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
	mov	x12, #0                         ; =0x0
	ldr	x13, [x0, x10, lsl #3]
LBB0_3:                                 ;   Parent Loop BB0_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w14, [x13, x12, lsl #2]
	cmp	w14, #1
	csel	w9, w10, w9, eq
	csel	w8, w12, w8, eq
	add	x12, x12, #1
	cmp	x11, x12
	b.ne	LBB0_3
; %bb.4:                                ;   in Loop: Header=BB0_2 Depth=1
	add	x10, x10, #1
	cmp	x10, x11
	b.ne	LBB0_2
; %bb.5:
	mul	w20, w1, w1
	cmp	w9, #1
	b.lt	LBB0_7
; %bb.6:
	add	x10, x0, w9, uxtw #3
	ldur	x10, [x10, #-8]
	ldr	w10, [x10, w8, sxtw #2]
	cmp	w10, w20
	csel	w20, w10, w20, lt
LBB0_7:
	sub	w10, w1, #1
	cmp	w9, w10
	b.ge	LBB0_9
; %bb.8:
	add	x11, x0, w9, sxtw #3
	ldr	x11, [x11, #8]
	ldr	w11, [x11, w8, sxtw #2]
	cmp	w11, w20
	csel	w20, w11, w20, lt
LBB0_9:
	cmp	w8, #1
	b.lt	LBB0_11
; %bb.10:
	ldr	x11, [x0, w9, sxtw #3]
	add	x11, x11, w8, uxtw #2
	ldur	w11, [x11, #-4]
	cmp	w11, w20
	csel	w20, w11, w20, lt
LBB0_11:
	cmp	w8, w10
	b.ge	LBB0_14
; %bb.12:
	ldr	x9, [x0, w9, sxtw #3]
	add	x8, x9, w8, sxtw #2
	ldr	w8, [x8, #4]
	cmp	w8, w20
	csel	w20, w8, w20, lt
	b	LBB0_14
LBB0_13:
	mul	w20, w1, w1
LBB0_14:
	str	w19, [x3]
	sbfiz	x0, x19, #2, #32
	bl	_malloc
	cmp	w19, #1
	b.lt	LBB0_27
; %bb.15:
	mov	w8, w19
	cmp	w19, #4
	b.hs	LBB0_17
; %bb.16:
	mov	x9, #0                          ; =0x0
	b	LBB0_26
LBB0_17:
	adrp	x11, lCPI0_0@PAGE
	adrp	x10, lCPI0_1@PAGE
	dup.4s	v0, w20
	cmp	w19, #16
	b.hs	LBB0_19
; %bb.18:
	mov	x9, #0                          ; =0x0
	b	LBB0_23
LBB0_19:
	and	x9, x8, #0x7ffffff0
	ldr	q1, [x11, lCPI0_0@PAGEOFF]
	ldr	q2, [x10, lCPI0_1@PAGEOFF]
	add	x12, x0, #32
	mov	w13, #1                         ; =0x1
	dup.2d	v3, x13
	mov	w13, #16                        ; =0x10
	dup.2d	v4, x13
	mov	x13, x9
LBB0_20:                                ; =>This Inner Loop Header: Depth=1
	and.16b	v5, v2, v3
	and.16b	v6, v1, v3
	cmeq.2d	v6, v6, #0
	cmeq.2d	v5, v5, #0
	uzp1.4s	v5, v5, v6
	bic.16b	v6, v0, v5
	sub.4s	v5, v6, v5
	stp	q5, q5, [x12, #-32]
	stp	q5, q5, [x12], #64
	add.2d	v1, v1, v4
	add.2d	v2, v2, v4
	subs	x13, x13, #16
	b.ne	LBB0_20
; %bb.21:
	cmp	x9, x8
	b.eq	LBB0_27
; %bb.22:
	tst	x8, #0xc
	b.eq	LBB0_26
LBB0_23:
	mov	x12, x9
	and	x9, x8, #0x7ffffffc
	dup.2d	v2, x12
	ldr	q1, [x11, lCPI0_0@PAGEOFF]
	orr.16b	v1, v2, v1
	ldr	q3, [x10, lCPI0_1@PAGEOFF]
	orr.16b	v2, v2, v3
	add	x10, x0, x12, lsl #2
	sub	x11, x12, x9
	mov	w12, #1                         ; =0x1
	dup.2d	v3, x12
	mov	w12, #4                         ; =0x4
	dup.2d	v4, x12
LBB0_24:                                ; =>This Inner Loop Header: Depth=1
	and.16b	v5, v2, v3
	and.16b	v6, v1, v3
	cmeq.2d	v6, v6, #0
	cmeq.2d	v5, v5, #0
	uzp1.4s	v5, v5, v6
	bic.16b	v6, v0, v5
	sub.4s	v5, v6, v5
	str	q5, [x10], #16
	add.2d	v1, v1, v4
	add.2d	v2, v2, v4
	adds	x11, x11, #4
	b.ne	LBB0_24
; %bb.25:
	cmp	x9, x8
	b.eq	LBB0_27
LBB0_26:                                ; =>This Inner Loop Header: Depth=1
	tst	x9, #0x1
	csinc	w10, w20, wzr, ne
	str	w10, [x0, x9, lsl #2]
	add	x9, x9, #1
	cmp	x8, x9
	b.ne	LBB0_26
LBB0_27:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
