	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	d13, d12, [sp, #-112]!          ; 16-byte Folded Spill
	stp	d11, d10, [sp, #16]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset b8, -72
	.cfi_offset b9, -80
	.cfi_offset b10, -88
	.cfi_offset b11, -96
	.cfi_offset b12, -104
	.cfi_offset b13, -112
	mov	x19, x0
	bl	_strlen
	cmp	w0, #5
	b.lt	LBB0_2
; %bb.1:
	ldrsb	w8, [x19]
	cmp	w8, #65
	b.ge	LBB0_4
LBB0_2:
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
LBB0_3:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp], #112            ; 16-byte Folded Reload
	ret
LBB0_4:
	mov	x22, x0
	and	w8, w8, #0xff
	sub	w9, w8, #91
Lloh2:
	adrp	x0, l_.str@PAGE
Lloh3:
	add	x0, x0, l_.str@PAGEOFF
	cmp	w8, #122
	ccmp	w9, #6, #0, ls
	b.lo	LBB0_3
; %bb.5:
	mov	x23, x0
	and	x21, x22, #0x7fffffff
	add	x8, x19, x21
	sub	x20, x8, #4
Lloh4:
	adrp	x1, l_.str.1@PAGE
Lloh5:
	add	x1, x1, l_.str.1@PAGEOFF
	mov	x0, x20
	bl	_strcmp
	cbz	w0, LBB0_8
; %bb.6:
Lloh6:
	adrp	x1, l_.str.2@PAGE
Lloh7:
	add	x1, x1, l_.str.2@PAGEOFF
	mov	x0, x20
	bl	_strcmp
	cbz	w0, LBB0_8
; %bb.7:
Lloh8:
	adrp	x1, l_.str.3@PAGE
Lloh9:
	add	x1, x1, l_.str.3@PAGEOFF
	mov	x0, x20
	bl	_strcmp
	cbnz	w0, LBB0_2
LBB0_8:
	cmp	x21, #4
	b.hs	LBB0_10
; %bb.9:
	mov	x8, #0                          ; =0x0
	mov	w10, #0                         ; =0x0
	mov	w11, #0                         ; =0x0
	mov	x0, x23
	b	LBB0_19
LBB0_10:
	cmp	x21, #32
	mov	x0, x23
	b.hs	LBB0_12
; %bb.11:
	mov	w10, #0                         ; =0x0
	mov	w11, #0                         ; =0x0
	mov	x8, #0                          ; =0x0
	b	LBB0_16
LBB0_12:
	movi.2d	v0, #0000000000000000
	and	x9, x22, #0x1f
	movi.16b	v1, #208
	sub	x8, x21, x9
	movi.16b	v2, #10
	add	x10, x19, #16
	movi.4s	v5, #1
	movi.16b	v6, #46
	mov	x11, x8
	movi.2d	v19, #0000000000000000
	movi.2d	v7, #0000000000000000
	movi.2d	v21, #0000000000000000
	movi.2d	v22, #0000000000000000
	movi.2d	v26, #0000000000000000
	movi.2d	v23, #0000000000000000
	movi.2d	v27, #0000000000000000
	movi.2d	v3, #0000000000000000
	movi.2d	v16, #0000000000000000
	movi.2d	v4, #0000000000000000
	movi.2d	v17, #0000000000000000
	movi.2d	v18, #0000000000000000
	movi.2d	v24, #0000000000000000
	movi.2d	v20, #0000000000000000
	movi.2d	v25, #0000000000000000
LBB0_13:                                ; =>This Inner Loop Header: Depth=1
	ldp	q28, q29, [x10, #-16]
	add.16b	v30, v28, v1
	add.16b	v31, v29, v1
	cmhi.16b	v30, v2, v30
	ushll.8h	v8, v30, #0
	ushll.4s	v9, v8, #0
	and.16b	v9, v9, v5
	ushll2.4s	v8, v8, #0
	and.16b	v8, v8, v5
	ushll2.8h	v30, v30, #0
	ushll.4s	v10, v30, #0
	and.16b	v10, v10, v5
	ushll2.4s	v30, v30, #0
	and.16b	v30, v30, v5
	cmhi.16b	v31, v2, v31
	ushll.8h	v11, v31, #0
	ushll.4s	v12, v11, #0
	and.16b	v12, v12, v5
	ushll2.4s	v11, v11, #0
	and.16b	v11, v11, v5
	ushll2.8h	v31, v31, #0
	ushll.4s	v13, v31, #0
	and.16b	v13, v13, v5
	ushll2.4s	v31, v31, #0
	and.16b	v31, v31, v5
	add.4s	v21, v21, v30
	add.4s	v7, v7, v10
	add.4s	v19, v19, v8
	add.4s	v0, v0, v9
	add.4s	v27, v27, v31
	add.4s	v23, v23, v13
	add.4s	v26, v26, v11
	add.4s	v22, v22, v12
	cmeq.16b	v28, v28, v6
	ushll.8h	v30, v28, #0
	ushll.4s	v31, v30, #0
	and.16b	v31, v31, v5
	ushll2.4s	v30, v30, #0
	and.16b	v30, v30, v5
	ushll2.8h	v28, v28, #0
	ushll.4s	v8, v28, #0
	and.16b	v8, v8, v5
	ushll2.4s	v28, v28, #0
	and.16b	v28, v28, v5
	cmeq.16b	v29, v29, v6
	ushll.8h	v9, v29, #0
	ushll.4s	v10, v9, #0
	and.16b	v10, v10, v5
	ushll2.4s	v9, v9, #0
	and.16b	v9, v9, v5
	ushll2.8h	v29, v29, #0
	ushll.4s	v11, v29, #0
	and.16b	v11, v11, v5
	ushll2.4s	v29, v29, #0
	and.16b	v29, v29, v5
	add.4s	v17, v17, v28
	add.4s	v4, v4, v8
	add.4s	v16, v16, v30
	add.4s	v3, v3, v31
	add.4s	v25, v25, v29
	add.4s	v20, v20, v11
	add.4s	v24, v24, v9
	add	x10, x10, #32
	add.4s	v18, v18, v10
	subs	x11, x11, #32
	b.ne	LBB0_13
; %bb.14:
	add.4s	v1, v26, v19
	add.4s	v2, v27, v21
	add.4s	v0, v22, v0
	add.4s	v5, v23, v7
	add.4s	v0, v0, v5
	add.4s	v1, v1, v2
	add.4s	v0, v0, v1
	addv.4s	s0, v0
	fmov	w10, s0
	add.4s	v0, v24, v16
	add.4s	v1, v25, v17
	add.4s	v2, v18, v3
	add.4s	v3, v20, v4
	add.4s	v2, v2, v3
	add.4s	v0, v0, v1
	add.4s	v0, v2, v0
	addv.4s	s0, v0
	fmov	w11, s0
	cbz	x9, LBB0_21
; %bb.15:
	cmp	x9, #3
	b.ls	LBB0_19
LBB0_16:
	mov	x13, x8
	and	x9, x22, #0x3
	add	x12, x19, x8
	sub	x8, x21, x9
	movi.2d	v0, #0000000000000000
	movi.2d	v1, #0000000000000000
	mov.s	v1[0], w10
	mov.s	v0[0], w11
	add	x10, x13, x9
	sub	x10, x10, x21
	movi.4h	v2, #208
	movi.4h	v3, #10
	movi.4s	v4, #1
	movi.4h	v5, #46
LBB0_17:                                ; =>This Inner Loop Header: Depth=1
	ldr	s6, [x12], #4
	ushll.8h	v7, v6, #0
	uaddw.8h	v6, v2, v6
	bic.4h	v6, #1, lsl #8
	cmhi.4h	v6, v3, v6
	ushll.4s	v6, v6, #0
	and.16b	v6, v6, v4
	add.4s	v1, v1, v6
	cmeq.4h	v6, v7, v5
	ushll.4s	v6, v6, #0
	and.16b	v6, v6, v4
	add.4s	v0, v0, v6
	adds	x10, x10, #4
	b.ne	LBB0_17
; %bb.18:
	addv.4s	s1, v1
	fmov	w10, s1
	addv.4s	s0, v0
	fmov	w11, s0
	cbz	x9, LBB0_21
LBB0_19:
	add	x9, x19, x8
	sub	x8, x21, x8
LBB0_20:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w12, [x9], #1
	sub	w13, w12, #48
	cmp	w13, #10
	cinc	w10, w10, lo
	cmp	w12, #46
	cinc	w11, w11, eq
	subs	x8, x8, #1
	b.ne	LBB0_20
LBB0_21:
	cmp	w11, #1
	ccmp	w10, #3, #2, eq
Lloh10:
	adrp	x8, l_.str.4@PAGE
Lloh11:
	add	x8, x8, l_.str.4@PAGEOFF
	csel	x0, x0, x8, hi
	b	LBB0_3
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh10, Lloh11
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"No"

l_.str.1:                               ; @.str.1
	.asciz	".txt"

l_.str.2:                               ; @.str.2
	.asciz	".exe"

l_.str.3:                               ; @.str.3
	.asciz	".dll"

l_.str.4:                               ; @.str.4
	.asciz	"Yes"

.subsections_via_symbols
