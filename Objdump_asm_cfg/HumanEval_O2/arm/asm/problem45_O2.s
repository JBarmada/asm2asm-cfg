	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	cmp	w0, #1
	b.lt	LBB0_6
; %bb.1:
	mov	x12, #0                         ; =0x0
	mov	w10, #1                         ; =0x1
	add	x8, sp, #7
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	mov	x9, x10
	sdiv	w11, w0, w1
	msub	w10, w11, w1, w0
	add	w10, w10, #48
	strb	w10, [x8, x12]
	add	x12, x12, #1
	add	w10, w9, #1
	mov	x0, x11
	cmp	w11, #0
	b.gt	LBB0_2
; %bb.3:
	cmp	w12, #1
	b.lt	LBB0_6
; %bb.4:
	and	x8, x12, #0x7fffffff
	cmp	x8, #8
	b.hs	LBB0_7
; %bb.5:
	mov	x11, #0                         ; =0x0
	mov	x10, x8
	b	LBB0_16
LBB0_6:
	mov	x8, #0                          ; =0x0
	b	LBB0_18
LBB0_7:
	cmp	x8, #64
	b.hs	LBB0_9
; %bb.8:
	mov	x11, #0                         ; =0x0
	b	LBB0_13
LBB0_9:
	and	x10, x12, #0x3f
	sub	x11, x8, x10
	mov	x13, x9
	and	x15, x13, #0x7fffffff
	and	x13, x13, #0x3f
	sub	x13, x15, x13
	add	x14, x2, #32
	add	x16, sp, #7
	add	x15, x16, x15
	sub	x15, x15, #32
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	ldp	q1, q0, [x15]
	rev64.16b	v0, v0
	ext.16b	v0, v0, v0, #8
	rev64.16b	v1, v1
	ext.16b	v1, v1, v1, #8
	ldp	q3, q2, [x15, #-32]
	rev64.16b	v2, v2
	ext.16b	v2, v2, v2, #8
	rev64.16b	v3, v3
	ext.16b	v3, v3, v3, #8
	stp	q0, q1, [x14, #-32]
	stp	q2, q3, [x14], #64
	sub	x15, x15, #64
	sub	x13, x13, #64
	cbnz	x13, LBB0_10
; %bb.11:
	cbz	x10, LBB0_18
; %bb.12:
	cmp	x10, #7
	b.ls	LBB0_16
LBB0_13:
	mov	x14, x11
	and	x10, x12, #0x7
	add	x12, x2, x11
	sub	x11, x8, x10
	add	x13, sp, #7
	mov	x15, x9
	and	x16, x15, #0x7fffffff
	sub	x13, x13, x14
	add	x13, x13, x16
	sub	x13, x13, #8
	and	x15, x15, #0x7
	add	x14, x14, x15
	sub	x14, x14, x16
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x13], #-8
	rev64.8b	v0, v0
	str	d0, [x12], #8
	adds	x14, x14, #8
	b.ne	LBB0_14
; %bb.15:
	cbz	x10, LBB0_18
LBB0_16:
	add	x12, sp, #7
	add	x10, x10, x12
	sub	x10, x10, #1
	add	x12, x2, x11
	and	x9, x9, #0x7fffffff
	sub	x9, x9, x11
LBB0_17:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w11, [x10], #-1
	strb	w11, [x12], #1
	subs	x9, x9, #1
	b.ne	LBB0_17
LBB0_18:
	strb	wzr, [x2, x8]
	ldur	x8, [x29, #-8]
Lloh3:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh4:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh5:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_20
; %bb.19:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB0_20:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh3, Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
