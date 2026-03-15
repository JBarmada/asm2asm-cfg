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
	mov	x19, x1
	mov	x20, x0
	bl	_strlen
	mov	x21, x0
	mov	x0, x19
	bl	_strlen
	cmp	w21, #1
	b.lt	LBB0_13
; %bb.1:
	cmp	w0, #1
	b.lt	LBB0_12
; %bb.2:
	mov	x10, #0                         ; =0x0
	and	x8, x21, #0x7fffffff
	and	x9, x0, #0x7fffffff
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_4 Depth 2
	ldrb	w11, [x20, x10]
	mov	x12, x9
	mov	x13, x19
LBB0_4:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w14, [x13], #1
	cmp	w11, w14
	b.eq	LBB0_6
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=2
	subs	x12, x12, #1
	b.ne	LBB0_4
	b	LBB0_12
LBB0_6:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x10, x10, #1
	cmp	x10, x8
	b.ne	LBB0_3
; %bb.7:
	mov	x10, #0                         ; =0x0
LBB0_8:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_9 Depth 2
	ldrb	w11, [x19, x10]
	mov	x12, x8
	mov	x13, x20
LBB0_9:                                 ;   Parent Loop BB0_8 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w14, [x13], #1
	cmp	w11, w14
	b.eq	LBB0_11
; %bb.10:                               ;   in Loop: Header=BB0_9 Depth=2
	mov	w0, #0                          ; =0x0
	subs	x12, x12, #1
	b.ne	LBB0_9
	b	LBB0_14
LBB0_11:                                ;   in Loop: Header=BB0_8 Depth=1
	add	x10, x10, #1
	mov	w0, #1                          ; =0x1
	cmp	x10, x9
	b.ne	LBB0_8
	b	LBB0_14
LBB0_12:
	mov	w0, #0                          ; =0x0
	b	LBB0_14
LBB0_13:
	cmp	w0, #1
	cset	w0, lt
LBB0_14:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
