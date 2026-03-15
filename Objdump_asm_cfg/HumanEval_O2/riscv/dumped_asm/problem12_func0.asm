00000000000008cc <func0>:
 8cc:	1101                	add	sp,sp,-32
 8ce:	ec06                	sd	ra,24(sp)
 8d0:	e822                	sd	s0,16(sp)
 8d2:	e426                	sd	s1,8(sp)
 8d4:	e04a                	sd	s2,0(sp)
 8d6:	842e                	mv	s0,a1
 8d8:	84aa                	mv	s1,a0
 8da:	e17ff0ef          	jal	6f0 <strlen@plt>
 8de:	0005091b          	sext.w	s2,a0
 8e2:	8522                	mv	a0,s0
 8e4:	e0dff0ef          	jal	6f0 <strlen@plt>
 8e8:	2501                	sext.w	a0,a0
 8ea:	00a94363          	blt	s2,a0,8f0 <func0+0x24>
 8ee:	892a                	mv	s2,a0
 8f0:	0019051b          	addw	a0,s2,1
 8f4:	dedff0ef          	jal	6e0 <malloc@plt>
 8f8:	c90d                	beqz	a0,92a <func0+0x5e>
 8fa:	03205463          	blez	s2,922 <func0+0x56>
 8fe:	85ca                	mv	a1,s2
 900:	862a                	mv	a2,a0
 902:	0004c683          	lbu	a3,0(s1)
 906:	00044703          	lbu	a4,0(s0)
 90a:	8eb9                	xor	a3,a3,a4
 90c:	0016b693          	seqz	a3,a3
 910:	0316c693          	xor	a3,a3,49
 914:	00d60023          	sb	a3,0(a2)
 918:	0605                	add	a2,a2,1
 91a:	0405                	add	s0,s0,1
 91c:	15fd                	add	a1,a1,-1
 91e:	0485                	add	s1,s1,1
 920:	f1ed                	bnez	a1,902 <func0+0x36>
 922:	012505b3          	add	a1,a0,s2
 926:	00058023          	sb	zero,0(a1)
 92a:	60e2                	ld	ra,24(sp)
 92c:	6442                	ld	s0,16(sp)
 92e:	64a2                	ld	s1,8(sp)
 930:	6902                	ld	s2,0(sp)
 932:	6105                	add	sp,sp,32
 934:	8082                	ret
