	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function func0
lCPI0_0:
	.long	0                               ; 0x0
	.long	0                               ; 0x0
	.long	2                               ; 0x2
	.long	0                               ; 0x0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #448
	stp	x28, x27, [sp, #416]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #432]            ; 16-byte Folded Spill
	add	x29, sp, #432
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
Lloh3:
	adrp	x8, lCPI0_0@PAGE
Lloh4:
	ldr	q0, [x8, lCPI0_0@PAGEOFF]
	str	q0, [sp]
	cmp	w0, #4
	b.lt	LBB0_3
; %bb.1:
	mov	w11, #0                         ; =0x0
	mov	w8, #0                          ; =0x0
	add	w10, w0, #1
	mov	x9, sp
	orr	x9, x9, #0x8
	sub	x10, x10, #4
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x9]
	add	w8, w8, w11
	add	w8, w12, w8
	ldur	w11, [x9, #-8]
	add	w8, w8, w11
	str	w8, [x9, #8]
	add	x9, x9, #4
	mov	x11, x12
	subs	x10, x10, #1
	b.ne	LBB0_2
LBB0_3:
	mov	x8, sp
	ldr	w0, [x8, w0, sxtw #2]
	ldur	x8, [x29, #-24]
Lloh5:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh6:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh7:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_5
; %bb.4:
	ldp	x29, x30, [sp, #432]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #416]            ; 16-byte Folded Reload
	add	sp, sp, #448
	ret
LBB0_5:
	bl	___stack_chk_fail
	.loh AdrpLdr	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh5, Lloh6, Lloh7
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
