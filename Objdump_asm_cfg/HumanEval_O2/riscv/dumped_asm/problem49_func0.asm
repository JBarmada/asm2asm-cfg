0000000000000848 <func0>:
 848:	1141                	add	sp,sp,-16
 84a:	e406                	sd	ra,8(sp)
 84c:	e022                	sd	s0,0(sp)
 84e:	842a                	mv	s0,a0
 850:	de1ff0ef          	jal	630 <strlen@plt>
 854:	0005061b          	sext.w	a2,a0
 858:	4689                	li	a3,2
 85a:	4585                	li	a1,1
 85c:	04d64b63          	blt	a2,a3,8b2 <func0+0x6a>
 860:	00044583          	lbu	a1,0(s0)
 864:	fff5061b          	addw	a2,a0,-1
 868:	9622                	add	a2,a2,s0
 86a:	00064603          	lbu	a2,0(a2)
 86e:	04c59163          	bne	a1,a2,8b0 <func0+0x68>
 872:	56fd                	li	a3,-1
 874:	02069813          	sll	a6,a3,0x20
 878:	0015559b          	srlw	a1,a0,0x1
 87c:	1502                	sll	a0,a0,0x20
 87e:	1686                	sll	a3,a3,0x21
 880:	9536                	add	a0,a0,a3
 882:	4705                	li	a4,1
 884:	86ba                	mv	a3,a4
 886:	02e58063          	beq	a1,a4,8a6 <func0+0x5e>
 88a:	00d40733          	add	a4,s0,a3
 88e:	00074783          	lbu	a5,0(a4)
 892:	42055713          	sra	a4,a0,0x20
 896:	9722                	add	a4,a4,s0
 898:	00074603          	lbu	a2,0(a4)
 89c:	9542                	add	a0,a0,a6
 89e:	00168713          	add	a4,a3,1
 8a2:	fec781e3          	beq	a5,a2,884 <func0+0x3c>
 8a6:	00b6b533          	sltu	a0,a3,a1
 8aa:	00154593          	xor	a1,a0,1
 8ae:	a011                	j	8b2 <func0+0x6a>
 8b0:	4581                	li	a1,0
 8b2:	852e                	mv	a0,a1
 8b4:	60a2                	ld	ra,8(sp)
 8b6:	6402                	ld	s0,0(sp)
 8b8:	0141                	add	sp,sp,16
 8ba:	8082                	ret
