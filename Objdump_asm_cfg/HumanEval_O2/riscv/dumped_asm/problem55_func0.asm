0000000000000880 <func0>:
 880:	7179                	add	sp,sp,-48
 882:	f406                	sd	ra,40(sp)
 884:	f022                	sd	s0,32(sp)
 886:	ec26                	sd	s1,24(sp)
 888:	e84a                	sd	s2,16(sp)
 88a:	e44e                	sd	s3,8(sp)
 88c:	e052                	sd	s4,0(sp)
 88e:	892e                	mv	s2,a1
 890:	8a2a                	mv	s4,a0
 892:	557d                	li	a0,-1
 894:	02055493          	srl	s1,a0,0x20
 898:	8552                	mv	a0,s4
 89a:	d97ff0ef          	jal	630 <strlen@plt>
 89e:	842a                	mv	s0,a0
 8a0:	0005099b          	sext.w	s3,a0
 8a4:	854a                	mv	a0,s2
 8a6:	d8bff0ef          	jal	630 <strlen@plt>
 8aa:	009578b3          	and	a7,a0,s1
 8ae:	0005029b          	sext.w	t0,a0
 8b2:	03305f63          	blez	s3,8f0 <func0+0x70>
 8b6:	4681                	li	a3,0
 8b8:	00947833          	and	a6,s0,s1
 8bc:	4605                	li	a2,1
 8be:	08505263          	blez	t0,942 <func0+0xc2>
 8c2:	00da05b3          	add	a1,s4,a3
 8c6:	0005c783          	lbu	a5,0(a1)
 8ca:	85c6                	mv	a1,a7
 8cc:	874a                	mv	a4,s2
 8ce:	00074503          	lbu	a0,0(a4)
 8d2:	00a78663          	beq	a5,a0,8de <func0+0x5e>
 8d6:	15fd                	add	a1,a1,-1
 8d8:	0705                	add	a4,a4,1
 8da:	f9f5                	bnez	a1,8ce <func0+0x4e>
 8dc:	a039                	j	8ea <func0+0x6a>
 8de:	0685                	add	a3,a3,1
 8e0:	0136a633          	slt	a2,a3,s3
 8e4:	fd069de3          	bne	a3,a6,8be <func0+0x3e>
 8e8:	a021                	j	8f0 <func0+0x70>
 8ea:	00167513          	and	a0,a2,1
 8ee:	e121                	bnez	a0,92e <func0+0xae>
 8f0:	02505c63          	blez	t0,928 <func0+0xa8>
 8f4:	4681                	li	a3,0
 8f6:	009475b3          	and	a1,s0,s1
 8fa:	4605                	li	a2,1
 8fc:	05305563          	blez	s3,946 <func0+0xc6>
 900:	00d90533          	add	a0,s2,a3
 904:	00054783          	lbu	a5,0(a0)
 908:	872e                	mv	a4,a1
 90a:	84d2                	mv	s1,s4
 90c:	0004c503          	lbu	a0,0(s1)
 910:	00a78663          	beq	a5,a0,91c <func0+0x9c>
 914:	177d                	add	a4,a4,-1
 916:	0485                	add	s1,s1,1
 918:	fb75                	bnez	a4,90c <func0+0x8c>
 91a:	a801                	j	92a <func0+0xaa>
 91c:	0685                	add	a3,a3,1
 91e:	0056a633          	slt	a2,a3,t0
 922:	fd169de3          	bne	a3,a7,8fc <func0+0x7c>
 926:	a011                	j	92a <func0+0xaa>
 928:	4601                	li	a2,0
 92a:	00164593          	xor	a1,a2,1
 92e:	0015f513          	and	a0,a1,1
 932:	70a2                	ld	ra,40(sp)
 934:	7402                	ld	s0,32(sp)
 936:	64e2                	ld	s1,24(sp)
 938:	6942                	ld	s2,16(sp)
 93a:	69a2                	ld	s3,8(sp)
 93c:	6a02                	ld	s4,0(sp)
 93e:	6145                	add	sp,sp,48
 940:	8082                	ret
 942:	4581                	li	a1,0
 944:	b7ed                	j	92e <func0+0xae>
 946:	4605                	li	a2,1
 948:	b7cd                	j	92a <func0+0xaa>
