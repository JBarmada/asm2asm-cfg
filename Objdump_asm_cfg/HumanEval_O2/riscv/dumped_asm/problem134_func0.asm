00000000000009b4 <func0>:
 9b4:	4601                	li	a2,0
 9b6:	00b05c63          	blez	a1,9ce <func0+0x1a>
 9ba:	00052007          	flw	ft0,0(a0)
 9be:	c00036d3          	fcvt.w.s	a3,ft0,rup
 9c2:	02d686bb          	mulw	a3,a3,a3
 9c6:	9e35                	addw	a2,a2,a3
 9c8:	15fd                	add	a1,a1,-1
 9ca:	0511                	add	a0,a0,4
 9cc:	f5fd                	bnez	a1,9ba <func0+0x6>
 9ce:	8532                	mv	a0,a2
 9d0:	8082                	ret
