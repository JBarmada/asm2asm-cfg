00000000000009c0 <func0>:
 9c0:	4689                	li	a3,2
 9c2:	02d5c163          	blt	a1,a3,9e4 <func0+0x24>
 9c6:	0511                	add	a0,a0,4
 9c8:	4685                	li	a3,1
 9ca:	00052007          	flw	ft0,0(a0)
 9ce:	d006f0d3          	fcvt.s.w	ft1,a3
 9d2:	10107053          	fmul.s	ft0,ft0,ft1
 9d6:	00062027          	fsw	ft0,0(a2)
 9da:	0685                	add	a3,a3,1
 9dc:	0511                	add	a0,a0,4
 9de:	0611                	add	a2,a2,4
 9e0:	fed595e3          	bne	a1,a3,9ca <func0+0xa>
 9e4:	8082                	ret
