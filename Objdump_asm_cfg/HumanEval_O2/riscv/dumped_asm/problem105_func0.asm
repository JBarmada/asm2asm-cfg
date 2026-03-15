0000000000000914 <func0>:
 914:	7139                	add	sp,sp,-64
 916:	fc06                	sd	ra,56(sp)
 918:	f822                	sd	s0,48(sp)
 91a:	f426                	sd	s1,40(sp)
 91c:	f04a                	sd	s2,32(sp)
 91e:	ec4e                	sd	s3,24(sp)
 920:	e852                	sd	s4,16(sp)
 922:	e456                	sd	s5,8(sp)
 924:	8936                	mv	s2,a3
 926:	89b2                	mv	s3,a2
 928:	8aae                	mv	s5,a1
 92a:	8a2a                	mv	s4,a0
 92c:	00259513          	sll	a0,a1,0x2
 930:	d31ff0ef          	jal	660 <malloc@plt>
 934:	00a9b023          	sd	a0,0(s3)
 938:	00092023          	sw	zero,0(s2)
 93c:	0b505a63          	blez	s5,9f0 <func0+0xdc>
 940:	4281                	li	t0,0
 942:	4601                	li	a2,0
 944:	ccccd6b7          	lui	a3,0xccccd
 948:	ccd6869b          	addw	a3,a3,-819 # ffffffffcccccccd <__global_pointer$+0xffffffffcccca4cd>
 94c:	1682                	sll	a3,a3,0x20
 94e:	a021                	j	956 <func0+0x42>
 950:	0605                	add	a2,a2,1
 952:	05560963          	beq	a2,s5,9a4 <func0+0x90>
 956:	00261713          	sll	a4,a2,0x2
 95a:	9752                	add	a4,a4,s4
 95c:	4300                	lw	s0,0(a4)
 95e:	00143793          	seqz	a5,s0
 962:	02805663          	blez	s0,98e <func0+0x7a>
 966:	8722                	mv	a4,s0
 968:	00177493          	and	s1,a4,1
 96c:	0014b493          	seqz	s1,s1
 970:	8fc5                	or	a5,a5,s1
 972:	02071493          	sll	s1,a4,0x20
 976:	02d4b4b3          	mulhu	s1,s1,a3
 97a:	00a73713          	sltiu	a4,a4,10
 97e:	908d                	srl	s1,s1,0x23
 980:	00174713          	xor	a4,a4,1
 984:	0017c593          	xor	a1,a5,1
 988:	8df9                	and	a1,a1,a4
 98a:	8726                	mv	a4,s1
 98c:	fdf1                	bnez	a1,968 <func0+0x54>
 98e:	0017f593          	and	a1,a5,1
 992:	fddd                	bnez	a1,950 <func0+0x3c>
 994:	00229593          	sll	a1,t0,0x2
 998:	95aa                	add	a1,a1,a0
 99a:	c180                	sw	s0,0(a1)
 99c:	2285                	addw	t0,t0,1
 99e:	00592023          	sw	t0,0(s2)
 9a2:	b77d                	j	950 <func0+0x3c>
 9a4:	4609                	li	a2,2
 9a6:	04c2c563          	blt	t0,a2,9f0 <func0+0xdc>
 9aa:	4601                	li	a2,0
 9ac:	fff2889b          	addw	a7,t0,-1
 9b0:	00450813          	add	a6,a0,4
 9b4:	87c6                	mv	a5,a7
 9b6:	a029                	j	9c0 <func0+0xac>
 9b8:	2605                	addw	a2,a2,1
 9ba:	37fd                	addw	a5,a5,-1
 9bc:	03165a63          	bge	a2,a7,9f0 <func0+0xdc>
 9c0:	fff64593          	not	a1,a2
 9c4:	00b285bb          	addw	a1,t0,a1
 9c8:	feb058e3          	blez	a1,9b8 <func0+0xa4>
 9cc:	4114                	lw	a3,0(a0)
 9ce:	02079593          	sll	a1,a5,0x20
 9d2:	0205d493          	srl	s1,a1,0x20
 9d6:	8742                	mv	a4,a6
 9d8:	a039                	j	9e6 <func0+0xd2>
 9da:	fe872e23          	sw	s0,-4(a4)
 9de:	c314                	sw	a3,0(a4)
 9e0:	14fd                	add	s1,s1,-1
 9e2:	0711                	add	a4,a4,4
 9e4:	d8f1                	beqz	s1,9b8 <func0+0xa4>
 9e6:	4300                	lw	s0,0(a4)
 9e8:	fed449e3          	blt	s0,a3,9da <func0+0xc6>
 9ec:	86a2                	mv	a3,s0
 9ee:	bfcd                	j	9e0 <func0+0xcc>
 9f0:	70e2                	ld	ra,56(sp)
 9f2:	7442                	ld	s0,48(sp)
 9f4:	74a2                	ld	s1,40(sp)
 9f6:	7902                	ld	s2,32(sp)
 9f8:	69e2                	ld	s3,24(sp)
 9fa:	6a42                	ld	s4,16(sp)
 9fc:	6aa2                	ld	s5,8(sp)
 9fe:	6121                	add	sp,sp,64
 a00:	8082                	ret
