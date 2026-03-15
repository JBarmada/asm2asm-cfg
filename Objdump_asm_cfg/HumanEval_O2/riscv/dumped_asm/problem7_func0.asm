00000000000008ac <func0>:
 8ac:	7139                	add	sp,sp,-64
 8ae:	fc06                	sd	ra,56(sp)
 8b0:	f822                	sd	s0,48(sp)
 8b2:	f426                	sd	s1,40(sp)
 8b4:	f04a                	sd	s2,32(sp)
 8b6:	ec4e                	sd	s3,24(sp)
 8b8:	e852                	sd	s4,16(sp)
 8ba:	e456                	sd	s5,8(sp)
 8bc:	e05a                	sd	s6,0(sp)
 8be:	892e                	mv	s2,a1
 8c0:	84aa                	mv	s1,a0
 8c2:	4601                	li	a2,0
 8c4:	4b01                	li	s6,0
 8c6:	4981                	li	s3,0
 8c8:	4501                	li	a0,0
 8ca:	02800a93          	li	s5,40
 8ce:	02900a13          	li	s4,41
 8d2:	a031                	j	8de <func0+0x32>
 8d4:	fff6059b          	addw	a1,a2,-1
 8d8:	c195                	beqz	a1,8fc <func0+0x50>
 8da:	0485                	add	s1,s1,1
 8dc:	862e                	mv	a2,a1
 8de:	0004c583          	lbu	a1,0(s1)
 8e2:	01558763          	beq	a1,s5,8f0 <func0+0x44>
 8e6:	ff4587e3          	beq	a1,s4,8d4 <func0+0x28>
 8ea:	c985                	beqz	a1,91a <func0+0x6e>
 8ec:	85b2                	mv	a1,a2
 8ee:	b7f5                	j	8da <func0+0x2e>
 8f0:	0016059b          	addw	a1,a2,1
 8f4:	ff6643e3          	blt	a2,s6,8da <func0+0x2e>
 8f8:	8b2e                	mv	s6,a1
 8fa:	b7c5                	j	8da <func0+0x2e>
 8fc:	0019841b          	addw	s0,s3,1
 900:	00241593          	sll	a1,s0,0x2
 904:	d7dff0ef          	jal	680 <realloc@plt>
 908:	4581                	li	a1,0
 90a:	00299613          	sll	a2,s3,0x2
 90e:	962a                	add	a2,a2,a0
 910:	01662023          	sw	s6,0(a2)
 914:	89a2                	mv	s3,s0
 916:	4b01                	li	s6,0
 918:	b7c9                	j	8da <func0+0x2e>
 91a:	01392023          	sw	s3,0(s2)
 91e:	70e2                	ld	ra,56(sp)
 920:	7442                	ld	s0,48(sp)
 922:	74a2                	ld	s1,40(sp)
 924:	7902                	ld	s2,32(sp)
 926:	69e2                	ld	s3,24(sp)
 928:	6a42                	ld	s4,16(sp)
 92a:	6aa2                	ld	s5,8(sp)
 92c:	6b02                	ld	s6,0(sp)
 92e:	6121                	add	sp,sp,64
 930:	8082                	ret
