	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x21, x1
	mov	x19, x0
	sbfiz	x0, x21, #3, #32
	bl	_malloc
	mov	x20, x0
	cmp	w21, #1
	b.lt	LBB0_7
; %bb.1:
	mov	x22, #0                         ; =0x0
	mov	w23, w21
Lloh0:
	adrp	x21, l_.str@PAGE
Lloh1:
	add	x21, x21, l_.str@PAGEOFF
	b	LBB0_4
LBB0_2:                                 ;   in Loop: Header=BB0_4 Depth=1
	mov	w24, #0                         ; =0x0
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	mov	w0, #100                        ; =0x64
	bl	_malloc
	str	x0, [x20, x22, lsl #3]
	stp	x24, x24, [sp, #8]
	str	x24, [sp]
	mov	w1, #0                          ; =0x0
	mov	w2, #100                        ; =0x64
	mov	x3, x21
	bl	___sprintf_chk
	add	x22, x22, #1
	cmp	x22, x23
	b.eq	LBB0_7
LBB0_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_6 Depth 2
	ldr	x9, [x19, x22, lsl #3]
	ldrb	w8, [x9]
	cbz	w8, LBB0_2
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	w24, #0                         ; =0x0
	add	x9, x9, #1
LBB0_6:                                 ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	w10, w8, #48
	cmp	w10, #10
	cset	w10, lo
	and	w8, w10, w8
	add	w24, w24, w8
	ldrb	w8, [x9], #1
	cbnz	w8, LBB0_6
	b	LBB0_3
LBB0_7:
	mov	x0, x20
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"the number of odd elements %d in the string %d of the %d input."

.subsections_via_symbols
