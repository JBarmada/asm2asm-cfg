000000000000094c <func0>:
 94c:	711d                	add	sp,sp,-96
 94e:	ec86                	sd	ra,88(sp)
 950:	e8a2                	sd	s0,80(sp)
 952:	e4a6                	sd	s1,72(sp)
 954:	e0ca                	sd	s2,64(sp)
 956:	fc4e                	sd	s3,56(sp)
 958:	84ae                	mv	s1,a1
 95a:	862a                	mv	a2,a0
 95c:	00001417          	auipc	s0,0x1
 960:	71d40413          	add	s0,s0,1821 # 2079 <func0.xs>
 964:	00000597          	auipc	a1,0x0
 968:	17058593          	add	a1,a1,368 # ad4 <_IO_stdin_used+0xd4>
 96c:	8522                	mv	a0,s0
 96e:	df3ff0ef          	jal	760 <sprintf@plt>
 972:	8522                	mv	a0,s0
 974:	dbdff0ef          	jal	730 <strlen@plt>
 978:	892a                	mv	s2,a0
 97a:	2501                	sext.w	a0,a0
 97c:	02955d63          	bge	a0,s1,9b6 <func0+0x6a>
 980:	4589                	li	a1,2
 982:	06b54363          	blt	a0,a1,9e8 <func0+0x9c>
 986:	557d                	li	a0,-1
 988:	1502                	sll	a0,a0,0x20
 98a:	0019559b          	srlw	a1,s2,0x1
 98e:	02091613          	sll	a2,s2,0x20
 992:	962a                	add	a2,a2,a0
 994:	86a2                	mv	a3,s0
 996:	42065713          	sra	a4,a2,0x20
 99a:	9722                	add	a4,a4,s0
 99c:	00070783          	lb	a5,0(a4)
 9a0:	00068483          	lb	s1,0(a3)
 9a4:	00f68023          	sb	a5,0(a3)
 9a8:	00970023          	sb	s1,0(a4)
 9ac:	962a                	add	a2,a2,a0
 9ae:	15fd                	add	a1,a1,-1
 9b0:	0685                	add	a3,a3,1
 9b2:	f1f5                	bnez	a1,996 <func0+0x4a>
 9b4:	a815                	j	9e8 <func0+0x9c>
 9b6:	9522                	add	a0,a0,s0
 9b8:	409505b3          	sub	a1,a0,s1
 9bc:	00610513          	add	a0,sp,6
 9c0:	00610993          	add	s3,sp,6
 9c4:	d7dff0ef          	jal	740 <strcpy@plt>
 9c8:	00998533          	add	a0,s3,s1
 9cc:	00050023          	sb	zero,0(a0)
 9d0:	4099063b          	subw	a2,s2,s1
 9d4:	00610513          	add	a0,sp,6
 9d8:	85a2                	mv	a1,s0
 9da:	d47ff0ef          	jal	720 <strncat@plt>
 9de:	00610593          	add	a1,sp,6
 9e2:	8522                	mv	a0,s0
 9e4:	d5dff0ef          	jal	740 <strcpy@plt>
 9e8:	00001517          	auipc	a0,0x1
 9ec:	69150513          	add	a0,a0,1681 # 2079 <func0.xs>
 9f0:	60e6                	ld	ra,88(sp)
 9f2:	6446                	ld	s0,80(sp)
 9f4:	64a6                	ld	s1,72(sp)
 9f6:	6906                	ld	s2,64(sp)
 9f8:	79e2                	ld	s3,56(sp)
 9fa:	6125                	add	sp,sp,96
 9fc:	8082                	ret
