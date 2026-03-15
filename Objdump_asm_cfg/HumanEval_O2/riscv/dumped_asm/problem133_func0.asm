00000000000009a4 <func0>:
 9a4:	1141                	add	sp,sp,-16
 9a6:	e406                	sd	ra,8(sp)
 9a8:	e022                	sd	s0,0(sp)
 9aa:	842a                	mv	s0,a0
 9ac:	c85ff0ef          	jal	630 <strlen@plt>
 9b0:	c535                	beqz	a0,a1c <func0+0x78>
 9b2:	00044583          	lbu	a1,0(s0)
 9b6:	fa558613          	add	a2,a1,-91
 9ba:	00163613          	seqz	a2,a2
 9be:	fa358593          	add	a1,a1,-93
 9c2:	0015b593          	seqz	a1,a1
 9c6:	40b605b3          	sub	a1,a2,a1
 9ca:	00b04363          	bgtz	a1,9d0 <func0+0x2c>
 9ce:	4581                	li	a1,0
 9d0:	4705                	li	a4,1
 9d2:	86ae                	mv	a3,a1
 9d4:	a039                	j	9e2 <func0+0x3e>
 9d6:	ffe5879b          	addw	a5,a1,-2
 9da:	00160713          	add	a4,a2,1
 9de:	02d7dd63          	bge	a5,a3,a18 <func0+0x74>
 9e2:	863a                	mv	a2,a4
 9e4:	02e50a63          	beq	a0,a4,a18 <func0+0x74>
 9e8:	00c40733          	add	a4,s0,a2
 9ec:	00074703          	lbu	a4,0(a4)
 9f0:	fa570793          	add	a5,a4,-91
 9f4:	0017b793          	seqz	a5,a5
 9f8:	9ebd                	addw	a3,a3,a5
 9fa:	fa370713          	add	a4,a4,-93
 9fe:	00173713          	seqz	a4,a4
 a02:	9e99                	subw	a3,a3,a4
 a04:	00d04363          	bgtz	a3,a0a <func0+0x66>
 a08:	4681                	li	a3,0
 a0a:	0005871b          	sext.w	a4,a1
 a0e:	85b6                	mv	a1,a3
 a10:	fcd743e3          	blt	a4,a3,9d6 <func0+0x32>
 a14:	85ba                	mv	a1,a4
 a16:	b7c1                	j	9d6 <func0+0x32>
 a18:	00a63533          	sltu	a0,a2,a0
 a1c:	60a2                	ld	ra,8(sp)
 a1e:	6402                	ld	s0,0(sp)
 a20:	0141                	add	sp,sp,16
 a22:	8082                	ret
