0000000000000a0c <func0>:
 a0c:	00052087          	flw	ft1,0(a0)
 a10:	4609                	li	a2,2
 a12:	02c5cf63          	blt	a1,a2,a50 <func0+0x44>
 a16:	00450613          	add	a2,a0,4
 a1a:	fff58693          	add	a3,a1,-1
 a1e:	201081d3          	fmv.s	ft3,ft1
 a22:	a801                	j	a32 <func0+0x26>
 a24:	16fd                	add	a3,a3,-1
 a26:	0611                	add	a2,a2,4
 a28:	202100d3          	fmv.s	ft1,ft2
 a2c:	200001d3          	fmv.s	ft3,ft0
 a30:	c685                	beqz	a3,a58 <func0+0x4c>
 a32:	00062107          	flw	ft2,0(a2)
 a36:	a0311753          	flt.s	a4,ft2,ft3
 a3a:	20210053          	fmv.s	ft0,ft2
 a3e:	e319                	bnez	a4,a44 <func0+0x38>
 a40:	20318053          	fmv.s	ft0,ft3
 a44:	a0209753          	flt.s	a4,ft1,ft2
 a48:	ff71                	bnez	a4,a24 <func0+0x18>
 a4a:	20108153          	fmv.s	ft2,ft1
 a4e:	bfd9                	j	a24 <func0+0x18>
 a50:	20108053          	fmv.s	ft0,ft1
 a54:	20108153          	fmv.s	ft2,ft1
 a58:	00b05f63          	blez	a1,a76 <func0+0x6a>
 a5c:	080170d3          	fsub.s	ft1,ft2,ft0
 a60:	00052107          	flw	ft2,0(a0)
 a64:	08017153          	fsub.s	ft2,ft2,ft0
 a68:	18117153          	fdiv.s	ft2,ft2,ft1
 a6c:	00252027          	fsw	ft2,0(a0)
 a70:	15fd                	add	a1,a1,-1
 a72:	0511                	add	a0,a0,4
 a74:	f5f5                	bnez	a1,a60 <func0+0x54>
 a76:	8082                	ret
