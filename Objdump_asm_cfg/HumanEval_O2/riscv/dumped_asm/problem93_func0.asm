00000000000009c8 <func0>:
 9c8:	7179                	add	sp,sp,-48
 9ca:	f406                	sd	ra,40(sp)
 9cc:	f022                	sd	s0,32(sp)
 9ce:	ac22                	fsd	fs0,24(sp)
 9d0:	a826                	fsd	fs1,16(sp)
 9d2:	a44a                	fsd	fs2,8(sp)
 9d4:	20c60453          	fmv.s	fs0,fa2
 9d8:	20b58953          	fmv.s	fs2,fa1
 9dc:	20a504d3          	fmv.s	fs1,fa0
 9e0:	c81ff0ef          	jal	660 <roundf@plt>
 9e4:	a0952553          	feq.s	a0,fa0,fs1
 9e8:	00154413          	xor	s0,a0,1
 9ec:	21290553          	fmv.s	fa0,fs2
 9f0:	c71ff0ef          	jal	660 <roundf@plt>
 9f4:	a1252553          	feq.s	a0,fa0,fs2
 9f8:	00154513          	xor	a0,a0,1
 9fc:	8c49                	or	s0,s0,a0
 9fe:	20840553          	fmv.s	fa0,fs0
 a02:	c5fff0ef          	jal	660 <roundf@plt>
 a06:	a0852553          	feq.s	a0,fa0,fs0
 a0a:	00154513          	xor	a0,a0,1
 a0e:	00a465b3          	or	a1,s0,a0
 a12:	4501                	li	a0,0
 a14:	ed99                	bnez	a1,a32 <func0+0x6a>
 a16:	0124f053          	fadd.s	ft0,fs1,fs2
 a1a:	a0802553          	feq.s	a0,ft0,fs0
 a1e:	0084f053          	fadd.s	ft0,fs1,fs0
 a22:	a12025d3          	feq.s	a1,ft0,fs2
 a26:	8d4d                	or	a0,a0,a1
 a28:	00897053          	fadd.s	ft0,fs2,fs0
 a2c:	a09025d3          	feq.s	a1,ft0,fs1
 a30:	8d4d                	or	a0,a0,a1
 a32:	70a2                	ld	ra,40(sp)
 a34:	7402                	ld	s0,32(sp)
 a36:	2462                	fld	fs0,24(sp)
 a38:	24c2                	fld	fs1,16(sp)
 a3a:	2922                	fld	fs2,8(sp)
 a3c:	6145                	add	sp,sp,48
 a3e:	8082                	ret
