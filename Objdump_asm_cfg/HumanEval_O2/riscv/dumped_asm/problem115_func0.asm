0000000000000990 <func0>:
 990:	6114                	ld	a3,0(a0)
 992:	4609                	li	a2,2
 994:	02c5c963          	blt	a1,a2,9c6 <func0+0x36>
 998:	00850613          	add	a2,a0,8
 99c:	15fd                	add	a1,a1,-1
 99e:	8736                	mv	a4,a3
 9a0:	a029                	j	9aa <func0+0x1a>
 9a2:	15fd                	add	a1,a1,-1
 9a4:	0621                	add	a2,a2,8
 9a6:	86aa                	mv	a3,a0
 9a8:	c185                	beqz	a1,9c8 <func0+0x38>
 9aa:	6208                	ld	a0,0(a2)
 9ac:	00074763          	bltz	a4,9ba <func0+0x2a>
 9b0:	872a                	mv	a4,a0
 9b2:	853a                	mv	a0,a4
 9b4:	fed747e3          	blt	a4,a3,9a2 <func0+0x12>
 9b8:	a029                	j	9c2 <func0+0x32>
 9ba:	972a                	add	a4,a4,a0
 9bc:	853a                	mv	a0,a4
 9be:	fed742e3          	blt	a4,a3,9a2 <func0+0x12>
 9c2:	8536                	mv	a0,a3
 9c4:	bff9                	j	9a2 <func0+0x12>
 9c6:	8536                	mv	a0,a3
 9c8:	8082                	ret
