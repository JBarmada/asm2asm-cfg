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
	mov	x20, x0
	mov	w0, #64                         ; =0x40
	bl	_malloc
	cbz	x0, LBB0_4
; %bb.1:
	mov	x19, x0
	strb	wzr, [x0, #63]
	cbz	w20, LBB0_5
; %bb.2:
	mov	w8, #62                         ; =0x3e
	cmp	w20, #1
	b.lt	LBB0_6
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	mov	w9, #48                         ; =0x30
	bfxil	w9, w20, #0, #1
	strb	w9, [x19, x8]
	sub	x8, x8, #1
	lsr	w9, w20, #1
	cmp	w20, #1
	mov	x20, x9
	b.hi	LBB0_3
	b	LBB0_6
LBB0_4:
	mov	x20, #0                         ; =0x0
	b	LBB0_9
LBB0_5:
	mov	w8, #48                         ; =0x30
	strb	w8, [x19, #62]
	mov	w8, #61                         ; =0x3d
LBB0_6:
	add	x21, x19, w8, sxtw
	mov	w22, #25188                     ; =0x6264
	strh	w22, [x21, #-1]!
	mov	w9, #66                         ; =0x42
	sub	w8, w9, w8
	sxtw	x0, w8
	bl	_malloc
	mov	x20, x0
	cbz	x0, LBB0_8
; %bb.7:
	mov	x0, x20
	mov	x1, x21
	bl	_strcpy
	bl	_strlen
	add	x8, x20, x0
	strh	w22, [x8]
	strb	wzr, [x8, #2]
LBB0_8:
	mov	x0, x19
	bl	_free
LBB0_9:
	mov	x0, x20
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"db"

.subsections_via_symbols
