00000000000007d4 <func0>:
 7d4:	00002517          	auipc	a0,0x2
 7d8:	8b450513          	add	a0,a0,-1868 # 2088 <__SDATA_BEGIN__+0x38>
 7dc:	00052007          	flw	ft0,0(a0)
 7e0:	10b570d3          	fmul.s	ft1,fa0,fa1
 7e4:	1000f553          	fmul.s	fa0,ft1,ft0
 7e8:	8082                	ret
