0000000000000874 <func0>:
 874:	1101                	add	sp,sp,-32
 876:	ec06                	sd	ra,24(sp)
 878:	e822                	sd	s0,16(sp)
 87a:	e426                	sd	s1,8(sp)
 87c:	84aa                	mv	s1,a0
 87e:	db3ff0ef          	jal	630 <strlen@plt>
 882:	458d                	li	a1,3
 884:	00b57463          	bgeu	a0,a1,88c <func0+0x18>
 888:	4501                	li	a0,0
 88a:	a089                	j	8cc <func0+0x58>
 88c:	0014c683          	lbu	a3,1(s1)
 890:	0024c603          	lbu	a2,2(s1)
 894:	4585                	li	a1,1
 896:	02d60963          	beq	a2,a3,8c8 <func0+0x54>
 89a:	4681                	li	a3,0
 89c:	ffd50813          	add	a6,a0,-3
 8a0:	4585                	li	a1,1
 8a2:	00d48733          	add	a4,s1,a3
 8a6:	00074403          	lbu	s0,0(a4)
 8aa:	0ff67793          	zext.b	a5,a2
 8ae:	00878d63          	beq	a5,s0,8c8 <func0+0x54>
 8b2:	00368593          	add	a1,a3,3
 8b6:	00a5b5b3          	sltu	a1,a1,a0
 8ba:	00d80763          	beq	a6,a3,8c8 <func0+0x54>
 8be:	00374603          	lbu	a2,3(a4)
 8c2:	0685                	add	a3,a3,1
 8c4:	fcf61fe3          	bne	a2,a5,8a2 <func0+0x2e>
 8c8:	0015c513          	xor	a0,a1,1
 8cc:	8905                	and	a0,a0,1
 8ce:	60e2                	ld	ra,24(sp)
 8d0:	6442                	ld	s0,16(sp)
 8d2:	64a2                	ld	s1,8(sp)
 8d4:	6105                	add	sp,sp,32
 8d6:	8082                	ret
