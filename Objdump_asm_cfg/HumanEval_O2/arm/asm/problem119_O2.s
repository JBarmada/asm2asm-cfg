	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x0
	bl	_strlen
	sub	w22, w0, #2
	cmp	w22, #1
	b.lt	LBB0_7
; %bb.1:
Lloh0:
	adrp	x20, l_.str@PAGE
Lloh1:
	add	x20, x20, l_.str@PAGEOFF
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	subs	x22, x22, #1
	b.le	LBB0_7
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldrsb	w21, [x19, x22]
	mov	x0, x20
	mov	x1, x21
	mov	w2, #11                         ; =0xb
	bl	_memchr
	cbz	x0, LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	add	x23, x19, x22
	ldrsb	w1, [x23, #1]
	mov	x0, x20
	mov	w2, #11                         ; =0xb
	bl	_memchr
	cbnz	x0, LBB0_2
; %bb.5:                                ;   in Loop: Header=BB0_3 Depth=1
	ldursb	w1, [x23, #-1]
	mov	x0, x20
	mov	w2, #11                         ; =0xb
	bl	_memchr
	cbnz	x0, LBB0_2
; %bb.6:
	and	w8, w21, #0xff
	b	LBB0_8
LBB0_7:
	mov	w8, #0                          ; =0x0
LBB0_8:
Lloh2:
	adrp	x0, _func0.out@PAGE
Lloh3:
	add	x0, x0, _func0.out@PAGEOFF
	strb	w8, [x0]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
.zerofill __DATA,__bss,_func0.out,2,0   ; @func0.out
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"AEIOUaeiou"

.subsections_via_symbols
