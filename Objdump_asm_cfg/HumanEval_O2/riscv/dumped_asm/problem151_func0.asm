00000000000008c4 <func0>:
 8c4:	8832                	mv	a6,a2
 8c6:	00252693          	slti	a3,a0,2
 8ca:	4791                	li	a5,4
 8cc:	0016c713          	xor	a4,a3,1
 8d0:	00f55763          	bge	a0,a5,8de <func0+0x1a>
 8d4:	87ba                	mv	a5,a4
 8d6:	c391                	beqz	a5,8da <func0+0x16>
 8d8:	882e                	mv	a6,a1
 8da:	8542                	mv	a0,a6
 8dc:	8082                	ret
 8de:	4689                	li	a3,2
 8e0:	a039                	j	8ee <func0+0x2a>
 8e2:	2685                	addw	a3,a3,1
 8e4:	02d6863b          	mulw	a2,a3,a3
 8e8:	873e                	mv	a4,a5
 8ea:	fec546e3          	blt	a0,a2,8d6 <func0+0x12>
 8ee:	02d5663b          	remw	a2,a0,a3
 8f2:	4781                	li	a5,0
 8f4:	d67d                	beqz	a2,8e2 <func0+0x1e>
 8f6:	87ba                	mv	a5,a4
 8f8:	b7ed                	j	8e2 <func0+0x1e>
