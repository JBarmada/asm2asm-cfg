00000000000007b4 <func0>:
 7b4:	00002617          	auipc	a2,0x2
 7b8:	8b060613          	add	a2,a2,-1872 # 2064 <__SDATA_BEGIN__+0x14>
 7bc:	02b05263          	blez	a1,7e0 <func0+0x2c>
 7c0:	00062007          	flw	ft0,0(a2)
 7c4:	a031                	j	7d0 <func0+0x1c>
 7c6:	15fd                	add	a1,a1,-1
 7c8:	0511                	add	a0,a0,4
 7ca:	20a50053          	fmv.s	ft0,fa0
 7ce:	c999                	beqz	a1,7e4 <func0+0x30>
 7d0:	00052507          	flw	fa0,0(a0)
 7d4:	a0a01653          	flt.s	a2,ft0,fa0
 7d8:	f67d                	bnez	a2,7c6 <func0+0x12>
 7da:	20000553          	fmv.s	fa0,ft0
 7de:	b7e5                	j	7c6 <func0+0x12>
 7e0:	00062507          	flw	fa0,0(a2)
 7e4:	8082                	ret
