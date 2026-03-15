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
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	str	x8, [sp, #56]
	str	xzr, [sp, #48]
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #16]
	add	x8, sp, #16
	ldrb	w9, [x0]
	cbz	w9, LBB0_18
; %bb.1:
	add	x9, x8, #16
	add	x10, x8, #32
	orr	x11, x8, #0x4
	orr	x12, x8, #0x8
	orr	x13, x8, #0xc
	add	x14, x8, #20
	add	x15, x8, #24
	add	x16, x8, #28
	add	x17, x8, #36
	mov	w1, #25971                      ; =0x6573
	movk	w1, #25974, lsl #16
	add	x2, sp, #10
	mov	w3, #25978                      ; =0x657a
	movk	w3, #28530, lsl #16
	mov	w4, #28271                      ; =0x6e6f
	movk	w4, #101, lsl #16
	mov	w5, #30580                      ; =0x7774
	movk	w5, #111, lsl #16
	mov	w6, #26740                      ; =0x6874
	movk	w6, #25970, lsl #16
	mov	w7, #101                        ; =0x65
	mov	w19, #28518                     ; =0x6f66
	movk	w19, #29301, lsl #16
	mov	w20, #26995                     ; =0x6973
	movk	w20, #120, lsl #16
	mov	w21, #110                       ; =0x6e
	mov	w22, #26981                     ; =0x6965
	movk	w22, #26727, lsl #16
	mov	w23, #116                       ; =0x74
	mov	w24, #26990                     ; =0x696e
	movk	w24, #25966, lsl #16
LBB0_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
	mov	x25, #0                         ; =0x0
LBB0_3:                                 ;   Parent Loop BB0_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w26, [x0, x25]
	orr	w27, w26, #0x20
	cmp	w27, #32
	b.eq	LBB0_5
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=2
	strb	w26, [x2, x25]
	add	x25, x25, #1
	b	LBB0_3
LBB0_5:                                 ;   in Loop: Header=BB0_2 Depth=1
	strb	wzr, [x2, x25]
	ldur	w26, [sp, #10]
	eor	w26, w26, w3
	ldrb	w27, [sp, #14]
	orr	w26, w26, w27
	cbz	w26, LBB0_15
; %bb.6:                                ;   in Loop: Header=BB0_2 Depth=1
	ldur	w27, [sp, #10]
	mov	x26, x11
	cmp	w27, w4
	b.eq	LBB0_16
; %bb.7:                                ;   in Loop: Header=BB0_2 Depth=1
	ldur	w27, [sp, #10]
	mov	x26, x12
	cmp	w27, w5
	b.eq	LBB0_16
; %bb.8:                                ;   in Loop: Header=BB0_2 Depth=1
	ldur	w26, [sp, #10]
	ldrh	w27, [sp, #14]
	cmp	w26, w6
	ccmp	w27, w7, #0, eq
	mov	x26, x13
	b.eq	LBB0_16
; %bb.9:                                ;   in Loop: Header=BB0_2 Depth=1
	ldur	w26, [sp, #10]
	eor	w27, w26, w19
	ldrb	w28, [sp, #14]
	mov	x26, x9
	orr	w27, w27, w28
	cbz	w27, LBB0_16
; %bb.10:                               ;   in Loop: Header=BB0_2 Depth=1
	ldur	w26, [sp, #10]
	add	w27, w1, #1011
	eor	w27, w26, w27
	ldrb	w28, [sp, #14]
	mov	x26, x14
	orr	w27, w27, w28
	cbz	w27, LBB0_16
; %bb.11:                               ;   in Loop: Header=BB0_2 Depth=1
	ldur	w27, [sp, #10]
	mov	x26, x15
	cmp	w27, w20
	b.eq	LBB0_16
; %bb.12:                               ;   in Loop: Header=BB0_2 Depth=1
	ldur	w26, [sp, #10]
	ldrh	w27, [sp, #14]
	cmp	w26, w1
	ccmp	w27, w21, #0, eq
	mov	x26, x16
	b.eq	LBB0_16
; %bb.13:                               ;   in Loop: Header=BB0_2 Depth=1
	ldur	w26, [sp, #10]
	ldrh	w27, [sp, #14]
	cmp	w26, w22
	ccmp	w27, w23, #0, eq
	mov	x26, x10
	b.eq	LBB0_16
; %bb.14:                               ;   in Loop: Header=BB0_2 Depth=1
	ldur	w26, [sp, #10]
	eor	w27, w26, w24
	ldrb	w28, [sp, #14]
	mov	x26, x17
	orr	w27, w27, w28
	cbnz	w27, LBB0_17
	b	LBB0_16
LBB0_15:                                ;   in Loop: Header=BB0_2 Depth=1
	add	x26, sp, #16
LBB0_16:                                ;   in Loop: Header=BB0_2 Depth=1
	ldr	w27, [x26]
	add	w27, w27, #1
	str	w27, [x26]
LBB0_17:                                ;   in Loop: Header=BB0_2 Depth=1
	add	w25, w25, #1
	add	x0, x0, x25
	ldurb	w25, [x0, #-1]
	cbnz	w25, LBB0_2
LBB0_18:
	mov	x9, #0                          ; =0x0
	mov	w16, #0                         ; =0x0
Lloh3:
	adrp	x10, l___const.func0.numto@PAGE
Lloh4:
	add	x10, x10, l___const.func0.numto@PAGEOFF
	mov	w11, #32                        ; =0x20
Lloh5:
	adrp	x0, _func0.out@PAGE
Lloh6:
	add	x0, x0, _func0.out@PAGEOFF
	b	LBB0_20
LBB0_19:                                ;   in Loop: Header=BB0_20 Depth=1
	add	x9, x9, #1
	cmp	x9, #10
	b.eq	LBB0_26
LBB0_20:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_23 Depth 2
                                        ;       Child Loop BB0_25 Depth 3
	ldr	w12, [x8, x9, lsl #2]
	cmp	w12, #1
	b.lt	LBB0_19
; %bb.21:                               ;   in Loop: Header=BB0_20 Depth=1
	mov	w13, #0                         ; =0x0
	ldr	x14, [x10, x9, lsl #3]
	add	x15, x14, #1
	mov	x17, x16
	b	LBB0_23
LBB0_22:                                ;   in Loop: Header=BB0_23 Depth=2
	add	w16, w17, #1
	strb	w11, [x0, w17, sxtw]
	add	w13, w13, #1
	mov	x17, x16
	cmp	w13, w12
	b.eq	LBB0_19
LBB0_23:                                ;   Parent Loop BB0_20 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_25 Depth 3
	ldrb	w16, [x14]
	cbz	w16, LBB0_22
; %bb.24:                               ;   in Loop: Header=BB0_23 Depth=2
	add	x1, x0, w17, sxtw
	mov	x2, x15
LBB0_25:                                ;   Parent Loop BB0_20 Depth=1
                                        ;     Parent Loop BB0_23 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	strb	w16, [x1], #1
	ldrb	w16, [x2], #1
	add	w17, w17, #1
	cbnz	w16, LBB0_25
	b	LBB0_22
LBB0_26:
	sub	w8, w16, #1
	cmp	w16, #0
	csel	x8, x8, xzr, gt
	strb	wzr, [x0, x8]
	ldr	x8, [sp, #56]
Lloh7:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh8:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh9:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_28
; %bb.27:
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
LBB0_28:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpAdd	Lloh5, Lloh6
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh7, Lloh8, Lloh9
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"zero"

l_.str.1:                               ; @.str.1
	.asciz	"one"

l_.str.2:                               ; @.str.2
	.asciz	"two"

l_.str.3:                               ; @.str.3
	.asciz	"three"

l_.str.4:                               ; @.str.4
	.asciz	"four"

l_.str.5:                               ; @.str.5
	.asciz	"five"

l_.str.6:                               ; @.str.6
	.asciz	"six"

l_.str.7:                               ; @.str.7
	.asciz	"seven"

l_.str.8:                               ; @.str.8
	.asciz	"eight"

l_.str.9:                               ; @.str.9
	.asciz	"nine"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @__const.func0.numto
l___const.func0.numto:
	.quad	l_.str
	.quad	l_.str.1
	.quad	l_.str.2
	.quad	l_.str.3
	.quad	l_.str.4
	.quad	l_.str.5
	.quad	l_.str.6
	.quad	l_.str.7
	.quad	l_.str.8
	.quad	l_.str.9

.zerofill __DATA,__bss,_func0.out,1000,0 ; @func0.out
.subsections_via_symbols
