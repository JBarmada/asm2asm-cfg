0000000000000908 <func0>:
 908:	7139                	add	sp,sp,-64
 90a:	fc06                	sd	ra,56(sp)
 90c:	f822                	sd	s0,48(sp)
 90e:	f426                	sd	s1,40(sp)
 910:	f04a                	sd	s2,32(sp)
 912:	ec4e                	sd	s3,24(sp)
 914:	e852                	sd	s4,16(sp)
 916:	e456                	sd	s5,8(sp)
 918:	e05a                	sd	s6,0(sp)
 91a:	893a                	mv	s2,a4
 91c:	8a36                	mv	s4,a3
 91e:	89b2                	mv	s3,a2
 920:	8b2e                	mv	s6,a1
 922:	8aaa                	mv	s5,a0
 924:	00259513          	sll	a0,a1,0x2
 928:	d39ff0ef          	jal	660 <malloc@plt>
 92c:	0b605363          	blez	s6,9d2 <func0+0xca>
 930:	4601                	li	a2,0
 932:	4681                	li	a3,0
 934:	020a1593          	sll	a1,s4,0x20
 938:	0205d813          	srl	a6,a1,0x20
 93c:	a809                	j	94e <func0+0x46>
 93e:	00269593          	sll	a1,a3,0x2
 942:	2685                	addw	a3,a3,1
 944:	95aa                	add	a1,a1,a0
 946:	c198                	sw	a4,0(a1)
 948:	0605                	add	a2,a2,1
 94a:	03660f63          	beq	a2,s6,988 <func0+0x80>
 94e:	00261713          	sll	a4,a2,0x2
 952:	00d05d63          	blez	a3,96c <func0+0x64>
 956:	00ea85b3          	add	a1,s5,a4
 95a:	419c                	lw	a5,0(a1)
 95c:	85b6                	mv	a1,a3
 95e:	84aa                	mv	s1,a0
 960:	4080                	lw	s0,0(s1)
 962:	fef403e3          	beq	s0,a5,948 <func0+0x40>
 966:	15fd                	add	a1,a1,-1
 968:	0491                	add	s1,s1,4
 96a:	f9fd                	bnez	a1,960 <func0+0x58>
 96c:	fd405ee3          	blez	s4,948 <func0+0x40>
 970:	00ea85b3          	add	a1,s5,a4
 974:	4198                	lw	a4,0(a1)
 976:	87c2                	mv	a5,a6
 978:	85ce                	mv	a1,s3
 97a:	4184                	lw	s1,0(a1)
 97c:	fc9701e3          	beq	a4,s1,93e <func0+0x36>
 980:	17fd                	add	a5,a5,-1
 982:	0591                	add	a1,a1,4
 984:	fbfd                	bnez	a5,97a <func0+0x72>
 986:	b7c9                	j	948 <func0+0x40>
 988:	4589                	li	a1,2
 98a:	04b6c563          	blt	a3,a1,9d4 <func0+0xcc>
 98e:	4601                	li	a2,0
 990:	fff6889b          	addw	a7,a3,-1
 994:	00450813          	add	a6,a0,4
 998:	87c6                	mv	a5,a7
 99a:	a029                	j	9a4 <func0+0x9c>
 99c:	2605                	addw	a2,a2,1
 99e:	37fd                	addw	a5,a5,-1
 9a0:	03165a63          	bge	a2,a7,9d4 <func0+0xcc>
 9a4:	fff64593          	not	a1,a2
 9a8:	9db5                	addw	a1,a1,a3
 9aa:	feb059e3          	blez	a1,99c <func0+0x94>
 9ae:	410c                	lw	a1,0(a0)
 9b0:	02079713          	sll	a4,a5,0x20
 9b4:	02075493          	srl	s1,a4,0x20
 9b8:	8742                	mv	a4,a6
 9ba:	a039                	j	9c8 <func0+0xc0>
 9bc:	fe872e23          	sw	s0,-4(a4)
 9c0:	c30c                	sw	a1,0(a4)
 9c2:	14fd                	add	s1,s1,-1
 9c4:	0711                	add	a4,a4,4
 9c6:	d8f9                	beqz	s1,99c <func0+0x94>
 9c8:	4300                	lw	s0,0(a4)
 9ca:	feb449e3          	blt	s0,a1,9bc <func0+0xb4>
 9ce:	85a2                	mv	a1,s0
 9d0:	bfcd                	j	9c2 <func0+0xba>
 9d2:	4681                	li	a3,0
 9d4:	00d92023          	sw	a3,0(s2)
 9d8:	70e2                	ld	ra,56(sp)
 9da:	7442                	ld	s0,48(sp)
 9dc:	74a2                	ld	s1,40(sp)
 9de:	7902                	ld	s2,32(sp)
 9e0:	69e2                	ld	s3,24(sp)
 9e2:	6a42                	ld	s4,16(sp)
 9e4:	6aa2                	ld	s5,8(sp)
 9e6:	6b02                	ld	s6,0(sp)
 9e8:	6121                	add	sp,sp,64
 9ea:	8082                	ret
