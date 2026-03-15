00000000000008fc <func0>:
 8fc:	715d                	add	sp,sp,-80
 8fe:	e486                	sd	ra,72(sp)
 900:	e0a2                	sd	s0,64(sp)
 902:	fc26                	sd	s1,56(sp)
 904:	f84a                	sd	s2,48(sp)
 906:	f44e                	sd	s3,40(sp)
 908:	f052                	sd	s4,32(sp)
 90a:	ec56                	sd	s5,24(sp)
 90c:	e85a                	sd	s6,16(sp)
 90e:	e45e                	sd	s7,8(sp)
 910:	8932                	mv	s2,a2
 912:	8bae                	mv	s7,a1
 914:	8b2a                	mv	s6,a0
 916:	00259513          	sll	a0,a1,0x2
 91a:	d87ff0ef          	jal	6a0 <malloc@plt>
 91e:	89aa                	mv	s3,a0
 920:	4591                	li	a1,4
 922:	855e                	mv	a0,s7
 924:	d9dff0ef          	jal	6c0 <calloc@plt>
 928:	8a2a                	mv	s4,a0
 92a:	4591                	li	a1,4
 92c:	855e                	mv	a0,s7
 92e:	d93ff0ef          	jal	6c0 <calloc@plt>
 932:	8aaa                	mv	s5,a0
 934:	4581                	li	a1,0
 936:	0b705063          	blez	s7,9d6 <func0+0xda>
 93a:	4481                	li	s1,0
 93c:	4501                	li	a0,0
 93e:	a829                	j	958 <func0+0x5c>
 940:	0014861b          	addw	a2,s1,1
 944:	8726                	mv	a4,s1
 946:	87d2                	mv	a5,s4
 948:	84b2                	mv	s1,a2
 94a:	00271613          	sll	a2,a4,0x2
 94e:	963e                	add	a2,a2,a5
 950:	c214                	sw	a3,0(a2)
 952:	0585                	add	a1,a1,1
 954:	05758163          	beq	a1,s7,996 <func0+0x9a>
 958:	00259693          	sll	a3,a1,0x2
 95c:	96da                	add	a3,a3,s6
 95e:	4294                	lw	a3,0(a3)
 960:	00a05a63          	blez	a0,974 <func0+0x78>
 964:	872a                	mv	a4,a0
 966:	87d6                	mv	a5,s5
 968:	4380                	lw	s0,0(a5)
 96a:	fed404e3          	beq	s0,a3,952 <func0+0x56>
 96e:	177d                	add	a4,a4,-1
 970:	0791                	add	a5,a5,4
 972:	fb7d                	bnez	a4,968 <func0+0x6c>
 974:	fc9056e3          	blez	s1,940 <func0+0x44>
 978:	8726                	mv	a4,s1
 97a:	87d2                	mv	a5,s4
 97c:	4380                	lw	s0,0(a5)
 97e:	00d40663          	beq	s0,a3,98a <func0+0x8e>
 982:	177d                	add	a4,a4,-1
 984:	0791                	add	a5,a5,4
 986:	fb7d                	bnez	a4,97c <func0+0x80>
 988:	bf65                	j	940 <func0+0x44>
 98a:	0015041b          	addw	s0,a0,1
 98e:	872a                	mv	a4,a0
 990:	87d6                	mv	a5,s5
 992:	8522                	mv	a0,s0
 994:	bf5d                	j	94a <func0+0x4e>
 996:	03705f63          	blez	s7,9d4 <func0+0xd8>
 99a:	4601                	li	a2,0
 99c:	4581                	li	a1,0
 99e:	02051693          	sll	a3,a0,0x20
 9a2:	9281                	srl	a3,a3,0x20
 9a4:	a809                	j	9b6 <func0+0xba>
 9a6:	00259793          	sll	a5,a1,0x2
 9aa:	2585                	addw	a1,a1,1
 9ac:	97ce                	add	a5,a5,s3
 9ae:	c398                	sw	a4,0(a5)
 9b0:	0605                	add	a2,a2,1
 9b2:	03760263          	beq	a2,s7,9d6 <func0+0xda>
 9b6:	00261713          	sll	a4,a2,0x2
 9ba:	975a                	add	a4,a4,s6
 9bc:	4318                	lw	a4,0(a4)
 9be:	87b6                	mv	a5,a3
 9c0:	8456                	mv	s0,s5
 9c2:	fea052e3          	blez	a0,9a6 <func0+0xaa>
 9c6:	4004                	lw	s1,0(s0)
 9c8:	fee484e3          	beq	s1,a4,9b0 <func0+0xb4>
 9cc:	17fd                	add	a5,a5,-1
 9ce:	0411                	add	s0,s0,4
 9d0:	fbfd                	bnez	a5,9c6 <func0+0xca>
 9d2:	bfd1                	j	9a6 <func0+0xaa>
 9d4:	4581                	li	a1,0
 9d6:	00b92023          	sw	a1,0(s2)
 9da:	8552                	mv	a0,s4
 9dc:	cf5ff0ef          	jal	6d0 <free@plt>
 9e0:	8556                	mv	a0,s5
 9e2:	cefff0ef          	jal	6d0 <free@plt>
 9e6:	854e                	mv	a0,s3
 9e8:	60a6                	ld	ra,72(sp)
 9ea:	6406                	ld	s0,64(sp)
 9ec:	74e2                	ld	s1,56(sp)
 9ee:	7942                	ld	s2,48(sp)
 9f0:	79a2                	ld	s3,40(sp)
 9f2:	7a02                	ld	s4,32(sp)
 9f4:	6ae2                	ld	s5,24(sp)
 9f6:	6b42                	ld	s6,16(sp)
 9f8:	6ba2                	ld	s7,8(sp)
 9fa:	6161                	add	sp,sp,80
 9fc:	8082                	ret
