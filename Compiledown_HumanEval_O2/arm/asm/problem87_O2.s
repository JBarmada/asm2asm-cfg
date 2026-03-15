	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #160
	stp	x28, x27, [sp, #64]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x20, x0
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	str	x8, [sp, #56]
	bl	_strlen
	mov	x21, x0
	add	w8, w21, #2
	sxtw	x0, w8
	bl	_malloc
	mov	x19, x0
	tbnz	w21, #31, LBB0_17
; %bb.1:
	mov	x23, #0                         ; =0x0
	mov	w22, #0                         ; =0x0
	mov	w26, #0                         ; =0x0
	add	w21, w21, #1
	add	x24, sp, #5
	add	x25, x24, #1
	mov	w27, #32                        ; =0x20
	b	LBB0_4
LBB0_2:                                 ;   in Loop: Header=BB0_4 Depth=1
	strb	w8, [x24, w26, sxtw]
	add	w26, w26, #1
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	x23, x23, #1
	cmp	x23, x21
	b.eq	LBB0_18
LBB0_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_8 Depth 2
                                        ;       Child Loop BB0_10 Depth 3
	ldrb	w8, [x20, x23]
	orr	w9, w8, #0x20
	cmp	w9, #32
	b.ne	LBB0_2
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	subs	w8, w26, #1
	b.le	LBB0_12
; %bb.6:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x9, #0                          ; =0x0
	mov	w10, w26
	sub	x10, x10, #1
	mov	x11, x25
	b	LBB0_8
LBB0_7:                                 ;   in Loop: Header=BB0_8 Depth=2
	add	x11, x11, #1
	sub	x10, x10, #1
	cmp	x9, x8
	b.eq	LBB0_12
LBB0_8:                                 ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_10 Depth 3
	mov	x12, x9
	add	x9, x9, #1
	mov	x13, x10
	mov	x14, x11
	b	LBB0_10
LBB0_9:                                 ;   in Loop: Header=BB0_10 Depth=3
	add	x14, x14, #1
	subs	x13, x13, #1
	b.eq	LBB0_7
LBB0_10:                                ;   Parent Loop BB0_4 Depth=1
                                        ;     Parent Loop BB0_8 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldrsb	w15, [x24, x12]
	ldrsb	w16, [x14]
	cmp	w15, w16
	b.le	LBB0_9
; %bb.11:                               ;   in Loop: Header=BB0_10 Depth=3
	strb	w16, [x24, x12]
	strb	w15, [x14]
	b	LBB0_9
LBB0_12:                                ;   in Loop: Header=BB0_4 Depth=1
	cmp	w22, #1
	b.lt	LBB0_14
; %bb.13:                               ;   in Loop: Header=BB0_4 Depth=1
	strb	w27, [x19, w22, uxtw]
	add	w8, w22, #1
	mov	x22, x8
LBB0_14:                                ;   in Loop: Header=BB0_4 Depth=1
	cmp	w26, #1
	b.ge	LBB0_16
; %bb.15:                               ;   in Loop: Header=BB0_4 Depth=1
	mov	w26, #0                         ; =0x0
	b	LBB0_3
LBB0_16:                                ;   in Loop: Header=BB0_4 Depth=1
	add	x0, x19, w22, sxtw
	mov	w2, w26
	add	x1, sp, #5
	bl	_memcpy
	add	w22, w22, w26
	mov	w26, #0                         ; =0x0
	b	LBB0_3
LBB0_17:
	mov	x8, #0                          ; =0x0
	b	LBB0_19
LBB0_18:
	sxtw	x8, w22
LBB0_19:
	strb	wzr, [x19, x8]
	ldr	x8, [sp, #56]
Lloh3:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh4:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh5:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_21
; %bb.20:
	mov	x0, x19
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
LBB0_21:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh3, Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
