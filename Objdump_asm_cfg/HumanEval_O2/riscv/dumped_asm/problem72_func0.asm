0000000000000a9c <func0>:
 a9c:	1141                	add	sp,sp,-16
 a9e:	e406                	sd	ra,8(sp)
 aa0:	a022                	fsd	fs0,0(sp)
 aa2:	00b57053          	fadd.s	ft0,fa0,fa1
 aa6:	a0c00553          	fle.s	a0,ft0,fa2
 aaa:	00c570d3          	fadd.s	ft1,fa0,fa2
 aae:	a0b085d3          	fle.s	a1,ft1,fa1
 ab2:	8d4d                	or	a0,a0,a1
 ab4:	00c5f0d3          	fadd.s	ft1,fa1,fa2
 ab8:	a0a085d3          	fle.s	a1,ft1,fa0
 abc:	8d4d                	or	a0,a0,a1
 abe:	e929                	bnez	a0,b10 <func0+0x74>
 ac0:	00001517          	auipc	a0,0x1
 ac4:	60450513          	add	a0,a0,1540 # 20c4 <__SDATA_BEGIN__+0x64>
 ac8:	00052087          	flw	ft1,0(a0)
 acc:	00c07053          	fadd.s	ft0,ft0,fa2
 ad0:	10107053          	fmul.s	ft0,ft0,ft1
 ad4:	08a070d3          	fsub.s	ft1,ft0,fa0
 ad8:	101070d3          	fmul.s	ft1,ft0,ft1
 adc:	08b07153          	fsub.s	ft2,ft0,fa1
 ae0:	101170d3          	fmul.s	ft1,ft2,ft1
 ae4:	08c07053          	fsub.s	ft0,ft0,fa2
 ae8:	10107053          	fmul.s	ft0,ft0,ft1
 aec:	58007553          	fsqrt.s	fa0,ft0
 af0:	a0a52553          	feq.s	a0,fa0,fa0
 af4:	c905                	beqz	a0,b24 <func0+0x88>
 af6:	00001517          	auipc	a0,0x1
 afa:	5d250513          	add	a0,a0,1490 # 20c8 <__SDATA_BEGIN__+0x68>
 afe:	00052407          	flw	fs0,0(a0)
 b02:	10857553          	fmul.s	fa0,fa0,fs0
 b06:	b9bff0ef          	jal	6a0 <roundf@plt>
 b0a:	18857553          	fdiv.s	fa0,fa0,fs0
 b0e:	a039                	j	b1c <func0+0x80>
 b10:	00001517          	auipc	a0,0x1
 b14:	5b050513          	add	a0,a0,1456 # 20c0 <__SDATA_BEGIN__+0x60>
 b18:	00052507          	flw	fa0,0(a0)
 b1c:	60a2                	ld	ra,8(sp)
 b1e:	2402                	fld	fs0,0(sp)
 b20:	0141                	add	sp,sp,16
 b22:	8082                	ret
 b24:	20000553          	fmv.s	fa0,ft0
 b28:	b89ff0ef          	jal	6b0 <sqrtf@plt>
 b2c:	b7e9                	j	af6 <func0+0x5a>
