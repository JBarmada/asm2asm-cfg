	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	sub	sp, sp, #4016
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w27, -40
	.cfi_offset w28, -48
	mov	x19, x0
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-40]
	add	x20, sp, #8
	add	x0, sp, #8
	mov	w1, #4000                       ; =0xfa0
	bl	_bzero
	mov	w8, #1                          ; =0x1
	str	w8, [sp, #12]
	cmp	w19, #2
	b.lt	LBB0_3
; %bb.1:
	add	w9, w19, #1
	add	x8, x20, #8
	sub	x9, x9, #2
	mov	w10, #1                         ; =0x1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w11, [x8, #-8]
	add	w10, w11, w10
	str	w10, [x8], #4
	subs	x9, x9, #1
	b.ne	LBB0_2
LBB0_3:
	ldr	w0, [x20, w19, sxtw #2]
	ldur	x8, [x29, #-40]
Lloh3:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh4:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh5:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_5
; %bb.4:
	add	sp, sp, #4016
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #48             ; 16-byte Folded Reload
	ret
LBB0_5:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh3, Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
