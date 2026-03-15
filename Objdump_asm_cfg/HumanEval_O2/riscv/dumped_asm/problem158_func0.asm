00000000000009bc <func0>:
 9bc:	10b5f053          	fmul.s	ft0,fa1,fa1
 9c0:	00a570c3          	fmadd.s	ft1,fa0,fa0,ft0
 9c4:	00001517          	auipc	a0,0x1
 9c8:	6d450513          	add	a0,a0,1748 # 2098 <__SDATA_BEGIN__+0x48>
 9cc:	00053007          	fld	ft0,0(a0)
 9d0:	08c670cb          	fnmsub.s	ft1,fa2,fa2,ft1
 9d4:	2010a0d3          	fabs.s	ft1,ft1
 9d8:	420080d3          	fcvt.d.s	ft1,ft1
 9dc:	a20095d3          	flt.d	a1,ft1,ft0
 9e0:	4505                	li	a0,1
 9e2:	e995                	bnez	a1,a16 <func0+0x5a>
 9e4:	10c670d3          	fmul.s	ft1,fa2,fa2
 9e8:	08a57143          	fmadd.s	ft2,fa0,fa0,ft1
 9ec:	10b5f14b          	fnmsub.s	ft2,fa1,fa1,ft2
 9f0:	20212153          	fabs.s	ft2,ft2
 9f4:	42010153          	fcvt.d.s	ft2,ft2
 9f8:	a20115d3          	flt.d	a1,ft2,ft0
 9fc:	ed89                	bnez	a1,a16 <func0+0x5a>
 9fe:	08b5f0c3          	fmadd.s	ft1,fa1,fa1,ft1
 a02:	08a570cb          	fnmsub.s	ft1,fa0,fa0,ft1
 a06:	2010a0d3          	fabs.s	ft1,ft1
 a0a:	420080d3          	fcvt.d.s	ft1,ft1
 a0e:	a20095d3          	flt.d	a1,ft1,ft0
 a12:	e191                	bnez	a1,a16 <func0+0x5a>
 a14:	4501                	li	a0,0
 a16:	8082                	ret
