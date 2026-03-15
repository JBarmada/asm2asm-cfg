	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x2
	mov	x21, x1
	mov	x20, x0
	lsl	w8, w1, #1
	sub	w8, w8, #1
	cmp	w1, #0
	csel	w8, w8, wzr, gt
	str	w8, [x3]
	sbfiz	x0, x8, #2, #32
	bl	_malloc
	cmp	w21, #1
	b.lt	LBB0_16
; %bb.1:
	ldr	w8, [x20]
	str	w8, [x0]
	b.eq	LBB0_16
; %bb.2:
	mov	w8, w21
	cmp	w21, #5
	b.hs	LBB0_4
; %bb.3:
	mov	w11, #1                         ; =0x1
	mov	w12, #1                         ; =0x1
	b	LBB0_14
LBB0_4:
	sub	x9, x8, #1
	dup.4s	v0, w19
	cmp	w21, #17
	b.hs	LBB0_6
; %bb.5:
	mov	x10, #0                         ; =0x0
	b	LBB0_10
LBB0_6:
	and	x10, x9, #0xfffffffffffffff0
	add	x13, x0, #68
	add	x11, x20, #36
	mov	x12, x10
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q3, q5, [x11, #-32]
	ldp	q7, q1, [x11], #64
	sub	x14, x13, #64
	sub	x15, x13, #32
	mov.16b	v2, v0
	st2.4s	{ v2, v3 }, [x14]
	mov.16b	v6, v0
	mov.16b	v4, v0
	st2.4s	{ v4, v5 }, [x15]
	add	x14, x13, #128
	st2.4s	{ v6, v7 }, [x13], #32
	st2.4s	{ v0, v1 }, [x13]
	mov	x13, x14
	subs	x12, x12, #16
	b.ne	LBB0_7
; %bb.8:
	cmp	x9, x10
	b.eq	LBB0_16
; %bb.9:
	tst	x9, #0xc
	b.eq	LBB0_13
LBB0_10:
	and	x13, x9, #0xfffffffffffffffc
	lsr	x14, x13, #2
	orr	x11, x13, #0x1
	mov	w12, #1                         ; =0x1
	bfi	x12, x14, #3, #61
	add	x14, x0, x10, lsl #3
	add	x14, x14, #4
	add	x15, x20, x10, lsl #2
	add	x15, x15, #4
	sub	x10, x10, x13
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	q3, [x15], #16
	mov.16b	v2, v0
	st2.4s	{ v2, v3 }, [x14], #32
	adds	x10, x10, #4
	b.ne	LBB0_11
; %bb.12:
	cmp	x9, x13
	b.ne	LBB0_14
	b	LBB0_16
LBB0_13:
	mov	w9, #1                          ; =0x1
	orr	x12, x9, x10, lsl #1
	orr	x11, x10, #0x1
LBB0_14:
	add	x9, x20, x11, lsl #2
	sub	x8, x8, x11
	add	x10, x0, x12, lsl #2
	add	x10, x10, #4
LBB0_15:                                ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x9], #4
	stp	w19, w11, [x10, #-4]
	add	x10, x10, #8
	subs	x8, x8, #1
	b.ne	LBB0_15
LBB0_16:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
