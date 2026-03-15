00000000000008bc <func0>:
 8bc:	715d                	add	sp,sp,-80
 8be:	e486                	sd	ra,72(sp)
 8c0:	e0a2                	sd	s0,64(sp)
 8c2:	fc26                	sd	s1,56(sp)
 8c4:	f84a                	sd	s2,48(sp)
 8c6:	f44e                	sd	s3,40(sp)
 8c8:	f052                	sd	s4,32(sp)
 8ca:	ec56                	sd	s5,24(sp)
 8cc:	e85a                	sd	s6,16(sp)
 8ce:	e45e                	sd	s7,8(sp)
 8d0:	00054483          	lbu	s1,0(a0)
 8d4:	892e                	mv	s2,a1
 8d6:	c0d1                	beqz	s1,95a <func0+0x9e>
 8d8:	8baa                	mv	s7,a0
 8da:	df7ff0ef          	jal	6d0 <__ctype_b_loc@plt>
 8de:	89aa                	mv	s3,a0
 8e0:	4a01                	li	s4,0
 8e2:	02c00a93          	li	s5,44
 8e6:	00001b17          	auipc	s6,0x1
 8ea:	786b0b13          	add	s6,s6,1926 # 206c <func0.out>
 8ee:	0009b503          	ld	a0,0(s3)
 8f2:	845e                	mv	s0,s7
 8f4:	0ff4f593          	zext.b	a1,s1
 8f8:	00159613          	sll	a2,a1,0x1
 8fc:	962a                	add	a2,a2,a0
 8fe:	00164603          	lbu	a2,1(a2)
 902:	1672                	sll	a2,a2,0x3c
 904:	927d                	srl	a2,a2,0x3f
 906:	fd358593          	add	a1,a1,-45
 90a:	0015b593          	seqz	a1,a1
 90e:	8dd1                	or	a1,a1,a2
 910:	e591                	bnez	a1,91c <func0+0x60>
 912:	00144483          	lbu	s1,1(s0)
 916:	0405                	add	s0,s0,1
 918:	fcf1                	bnez	s1,8f4 <func0+0x38>
 91a:	a089                	j	95c <func0+0xa0>
 91c:	858a                	mv	a1,sp
 91e:	4629                	li	a2,10
 920:	8522                	mv	a0,s0
 922:	d7fff0ef          	jal	6a0 <strtol@plt>
 926:	6b82                	ld	s7,0(sp)
 928:	03740163          	beq	s0,s7,94a <func0+0x8e>
 92c:	000bc583          	lbu	a1,0(s7)
 930:	01558363          	beq	a1,s5,936 <func0+0x7a>
 934:	e999                	bnez	a1,94a <func0+0x8e>
 936:	002a1593          	sll	a1,s4,0x2
 93a:	95da                	add	a1,a1,s6
 93c:	c188                	sw	a0,0(a1)
 93e:	000bc483          	lbu	s1,0(s7)
 942:	2a05                	addw	s4,s4,1
 944:	f4cd                	bnez	s1,8ee <func0+0x32>
 946:	a819                	j	95c <func0+0xa0>
 948:	0b85                	add	s7,s7,1
 94a:	000bc483          	lbu	s1,0(s7)
 94e:	c099                	beqz	s1,954 <func0+0x98>
 950:	ff549ce3          	bne	s1,s5,948 <func0+0x8c>
 954:	e05e                	sd	s7,0(sp)
 956:	fcc1                	bnez	s1,8ee <func0+0x32>
 958:	a011                	j	95c <func0+0xa0>
 95a:	4a01                	li	s4,0
 95c:	00001517          	auipc	a0,0x1
 960:	71050513          	add	a0,a0,1808 # 206c <func0.out>
 964:	01492023          	sw	s4,0(s2)
 968:	60a6                	ld	ra,72(sp)
 96a:	6406                	ld	s0,64(sp)
 96c:	74e2                	ld	s1,56(sp)
 96e:	7942                	ld	s2,48(sp)
 970:	79a2                	ld	s3,40(sp)
 972:	7a02                	ld	s4,32(sp)
 974:	6ae2                	ld	s5,24(sp)
 976:	6b42                	ld	s6,16(sp)
 978:	6ba2                	ld	s7,8(sp)
 97a:	6161                	add	sp,sp,80
 97c:	8082                	ret
