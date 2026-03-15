00000000000007e0 <func0>:
 7e0:	04b05363          	blez	a1,826 <func0+0x46>
 7e4:	f00000d3          	fmv.w.x	ft1,zero
 7e8:	862e                	mv	a2,a1
 7ea:	86aa                	mv	a3,a0
 7ec:	0006a007          	flw	ft0,0(a3)
 7f0:	0000f0d3          	fadd.s	ft1,ft1,ft0
 7f4:	167d                	add	a2,a2,-1
 7f6:	0691                	add	a3,a3,4
 7f8:	fa75                	bnez	a2,7ec <func0+0xc>
 7fa:	d005f053          	fcvt.s.w	ft0,a1
 7fe:	02b05663          	blez	a1,82a <func0+0x4a>
 802:	1800f153          	fdiv.s	ft2,ft1,ft0
 806:	f00000d3          	fmv.w.x	ft1,zero
 80a:	00052187          	flw	ft3,0(a0)
 80e:	0821f1d3          	fsub.s	ft3,ft3,ft2
 812:	2031a1d3          	fabs.s	ft3,ft3
 816:	0030f0d3          	fadd.s	ft1,ft1,ft3
 81a:	15fd                	add	a1,a1,-1
 81c:	0511                	add	a0,a0,4
 81e:	f5f5                	bnez	a1,80a <func0+0x2a>
 820:	1800f553          	fdiv.s	fa0,ft1,ft0
 824:	8082                	ret
 826:	d005f053          	fcvt.s.w	ft0,a1
 82a:	f00000d3          	fmv.w.x	ft1,zero
 82e:	1800f553          	fdiv.s	fa0,ft1,ft0
 832:	8082                	ret
