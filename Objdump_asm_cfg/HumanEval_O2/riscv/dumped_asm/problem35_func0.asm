0000000000000850 <func0>:
 850:	7179                	add	sp,sp,-48
 852:	f406                	sd	ra,40(sp)
 854:	f022                	sd	s0,32(sp)
 856:	ec26                	sd	s1,24(sp)
 858:	e84a                	sd	s2,16(sp)
 85a:	e44e                	sd	s3,8(sp)
 85c:	8932                	mv	s2,a2
 85e:	84ae                	mv	s1,a1
 860:	89aa                	mv	s3,a0
 862:	00259513          	sll	a0,a1,0x2
 866:	e3bff0ef          	jal	6a0 <malloc@plt>
 86a:	08905263          	blez	s1,8ee <func0+0x9e>
 86e:	4601                	li	a2,0
 870:	4281                	li	t0,0
 872:	a809                	j	884 <func0+0x34>
 874:	00229593          	sll	a1,t0,0x2
 878:	2285                	addw	t0,t0,1
 87a:	95aa                	add	a1,a1,a0
 87c:	c194                	sw	a3,0(a1)
 87e:	0605                	add	a2,a2,1
 880:	02960163          	beq	a2,s1,8a2 <func0+0x52>
 884:	00261593          	sll	a1,a2,0x2
 888:	95ce                	add	a1,a1,s3
 88a:	4194                	lw	a3,0(a1)
 88c:	fe5054e3          	blez	t0,874 <func0+0x24>
 890:	8596                	mv	a1,t0
 892:	872a                	mv	a4,a0
 894:	431c                	lw	a5,0(a4)
 896:	fef684e3          	beq	a3,a5,87e <func0+0x2e>
 89a:	15fd                	add	a1,a1,-1
 89c:	0711                	add	a4,a4,4
 89e:	f9fd                	bnez	a1,894 <func0+0x44>
 8a0:	bfd1                	j	874 <func0+0x24>
 8a2:	4589                	li	a1,2
 8a4:	04b2c663          	blt	t0,a1,8f0 <func0+0xa0>
 8a8:	4881                	li	a7,0
 8aa:	fff2859b          	addw	a1,t0,-1
 8ae:	1582                	sll	a1,a1,0x20
 8b0:	0205d813          	srl	a6,a1,0x20
 8b4:	00450613          	add	a2,a0,4
 8b8:	4785                	li	a5,1
 8ba:	a029                	j	8c4 <func0+0x74>
 8bc:	0785                	add	a5,a5,1
 8be:	0611                	add	a2,a2,4
 8c0:	03088863          	beq	a7,a6,8f0 <func0+0xa0>
 8c4:	85c6                	mv	a1,a7
 8c6:	0885                	add	a7,a7,1
 8c8:	fe58fae3          	bgeu	a7,t0,8bc <func0+0x6c>
 8cc:	058a                	sll	a1,a1,0x2
 8ce:	00b504b3          	add	s1,a0,a1
 8d2:	8596                	mv	a1,t0
 8d4:	86b2                	mv	a3,a2
 8d6:	a029                	j	8e0 <func0+0x90>
 8d8:	15fd                	add	a1,a1,-1
 8da:	0691                	add	a3,a3,4
 8dc:	feb780e3          	beq	a5,a1,8bc <func0+0x6c>
 8e0:	4098                	lw	a4,0(s1)
 8e2:	4280                	lw	s0,0(a3)
 8e4:	fee45ae3          	bge	s0,a4,8d8 <func0+0x88>
 8e8:	c080                	sw	s0,0(s1)
 8ea:	c298                	sw	a4,0(a3)
 8ec:	b7f5                	j	8d8 <func0+0x88>
 8ee:	4281                	li	t0,0
 8f0:	00592023          	sw	t0,0(s2)
 8f4:	70a2                	ld	ra,40(sp)
 8f6:	7402                	ld	s0,32(sp)
 8f8:	64e2                	ld	s1,24(sp)
 8fa:	6942                	ld	s2,16(sp)
 8fc:	69a2                	ld	s3,8(sp)
 8fe:	6145                	add	sp,sp,48
 900:	8082                	ret
