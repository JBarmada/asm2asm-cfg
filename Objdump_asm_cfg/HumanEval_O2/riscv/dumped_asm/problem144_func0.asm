0000000000000920 <func0>:
 920:	715d                	add	sp,sp,-80
 922:	e486                	sd	ra,72(sp)
 924:	e0a2                	sd	s0,64(sp)
 926:	fc26                	sd	s1,56(sp)
 928:	f84a                	sd	s2,48(sp)
 92a:	f44e                	sd	s3,40(sp)
 92c:	f052                	sd	s4,32(sp)
 92e:	ec56                	sd	s5,24(sp)
 930:	e85a                	sd	s6,16(sp)
 932:	e45e                	sd	s7,8(sp)
 934:	892e                	mv	s2,a1
 936:	8a2a                	mv	s4,a0
 938:	4401                	li	s0,0
 93a:	4481                	li	s1,0
 93c:	4981                	li	s3,0
 93e:	02000a93          	li	s5,32
 942:	4b09                	li	s6,2
 944:	4b91                	li	s7,4
 946:	a819                	j	95c <func0+0x3c>
 948:	01390533          	add	a0,s2,s3
 94c:	8d85                	sub	a1,a1,s1
 94e:	8626                	mv	a2,s1
 950:	d11ff0ef          	jal	660 <memcpy@plt>
 954:	009989bb          	addw	s3,s3,s1
 958:	4481                	li	s1,0
 95a:	0405                	add	s0,s0,1
 95c:	008a05b3          	add	a1,s4,s0
 960:	0005c503          	lbu	a0,0(a1)
 964:	01550663          	beq	a0,s5,970 <func0+0x50>
 968:	c90d                	beqz	a0,99a <func0+0x7a>
 96a:	2485                	addw	s1,s1,1
 96c:	0405                	add	s0,s0,1
 96e:	b7fd                	j	95c <func0+0x3c>
 970:	ff64c4e3          	blt	s1,s6,958 <func0+0x38>
 974:	0174eb63          	bltu	s1,s7,98a <func0+0x6a>
 978:	4509                	li	a0,2
 97a:	02a4e63b          	remw	a2,s1,a0
 97e:	de69                	beqz	a2,958 <func0+0x38>
 980:	2505                	addw	a0,a0,1
 982:	02a5063b          	mulw	a2,a0,a0
 986:	fec4dae3          	bge	s1,a2,97a <func0+0x5a>
 98a:	fb305fe3          	blez	s3,948 <func0+0x28>
 98e:	01390533          	add	a0,s2,s3
 992:	2985                	addw	s3,s3,1
 994:	01550023          	sb	s5,0(a0)
 998:	bf45                	j	948 <func0+0x28>
 99a:	4509                	li	a0,2
 99c:	02a4cf63          	blt	s1,a0,9da <func0+0xba>
 9a0:	4511                	li	a0,4
 9a2:	00a4eb63          	bltu	s1,a0,9b8 <func0+0x98>
 9a6:	4509                	li	a0,2
 9a8:	02a4e63b          	remw	a2,s1,a0
 9ac:	c61d                	beqz	a2,9da <func0+0xba>
 9ae:	2505                	addw	a0,a0,1
 9b0:	02a5063b          	mulw	a2,a0,a0
 9b4:	fec4dae3          	bge	s1,a2,9a8 <func0+0x88>
 9b8:	01305963          	blez	s3,9ca <func0+0xaa>
 9bc:	01390533          	add	a0,s2,s3
 9c0:	2985                	addw	s3,s3,1
 9c2:	02000613          	li	a2,32
 9c6:	00c50023          	sb	a2,0(a0)
 9ca:	01390533          	add	a0,s2,s3
 9ce:	8d85                	sub	a1,a1,s1
 9d0:	8626                	mv	a2,s1
 9d2:	c8fff0ef          	jal	660 <memcpy@plt>
 9d6:	009989bb          	addw	s3,s3,s1
 9da:	01390533          	add	a0,s2,s3
 9de:	00050023          	sb	zero,0(a0)
 9e2:	60a6                	ld	ra,72(sp)
 9e4:	6406                	ld	s0,64(sp)
 9e6:	74e2                	ld	s1,56(sp)
 9e8:	7942                	ld	s2,48(sp)
 9ea:	79a2                	ld	s3,40(sp)
 9ec:	7a02                	ld	s4,32(sp)
 9ee:	6ae2                	ld	s5,24(sp)
 9f0:	6b42                	ld	s6,16(sp)
 9f2:	6ba2                	ld	s7,8(sp)
 9f4:	6161                	add	sp,sp,80
 9f6:	8082                	ret
