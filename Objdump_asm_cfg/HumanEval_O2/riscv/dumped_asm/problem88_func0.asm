0000000000000910 <func0>:
 910:	7159                	add	sp,sp,-112
 912:	f486                	sd	ra,104(sp)
 914:	f0a2                	sd	s0,96(sp)
 916:	eca6                	sd	s1,88(sp)
 918:	e8ca                	sd	s2,80(sp)
 91a:	e4ce                	sd	s3,72(sp)
 91c:	e0d2                	sd	s4,64(sp)
 91e:	fc56                	sd	s5,56(sp)
 920:	f85a                	sd	s6,48(sp)
 922:	f45e                	sd	s7,40(sp)
 924:	f062                	sd	s8,32(sp)
 926:	ec66                	sd	s9,24(sp)
 928:	e86a                	sd	s10,16(sp)
 92a:	e46e                	sd	s11,8(sp)
 92c:	893a                	mv	s2,a4
 92e:	8bb6                	mv	s7,a3
 930:	89b2                	mv	s3,a2
 932:	8a2e                	mv	s4,a1
 934:	8aaa                	mv	s5,a0
 936:	32000513          	li	a0,800
 93a:	d27ff0ef          	jal	660 <malloc@plt>
 93e:	8b2a                	mv	s6,a0
 940:	05405e63          	blez	s4,99c <func0+0x8c>
 944:	4c81                	li	s9,0
 946:	4d81                	li	s11,0
 948:	4c05                	li	s8,1
 94a:	a021                	j	952 <func0+0x42>
 94c:	0c85                	add	s9,s9,1
 94e:	054c8863          	beq	s9,s4,99e <func0+0x8e>
 952:	002c9513          	sll	a0,s9,0x2
 956:	954e                	add	a0,a0,s3
 958:	4104                	lw	s1,0(a0)
 95a:	fe9059e3          	blez	s1,94c <func0+0x3c>
 95e:	003c9513          	sll	a0,s9,0x3
 962:	9556                	add	a0,a0,s5
 964:	00053d03          	ld	s10,0(a0)
 968:	00148413          	add	s0,s1,1
 96c:	a021                	j	974 <func0+0x64>
 96e:	147d                	add	s0,s0,-1
 970:	fc8c5ee3          	bge	s8,s0,94c <func0+0x3c>
 974:	34fd                	addw	s1,s1,-1
 976:	02049513          	sll	a0,s1,0x20
 97a:	8179                	srl	a0,a0,0x1e
 97c:	956a                	add	a0,a0,s10
 97e:	4108                	lw	a0,0(a0)
 980:	ff7517e3          	bne	a0,s7,96e <func0+0x5e>
 984:	4521                	li	a0,8
 986:	cdbff0ef          	jal	660 <malloc@plt>
 98a:	003d9593          	sll	a1,s11,0x3
 98e:	95da                	add	a1,a1,s6
 990:	e188                	sd	a0,0(a1)
 992:	01952023          	sw	s9,0(a0)
 996:	c144                	sw	s1,4(a0)
 998:	2d85                	addw	s11,s11,1
 99a:	bfd1                	j	96e <func0+0x5e>
 99c:	4d81                	li	s11,0
 99e:	01b92023          	sw	s11,0(s2)
 9a2:	855a                	mv	a0,s6
 9a4:	70a6                	ld	ra,104(sp)
 9a6:	7406                	ld	s0,96(sp)
 9a8:	64e6                	ld	s1,88(sp)
 9aa:	6946                	ld	s2,80(sp)
 9ac:	69a6                	ld	s3,72(sp)
 9ae:	6a06                	ld	s4,64(sp)
 9b0:	7ae2                	ld	s5,56(sp)
 9b2:	7b42                	ld	s6,48(sp)
 9b4:	7ba2                	ld	s7,40(sp)
 9b6:	7c02                	ld	s8,32(sp)
 9b8:	6ce2                	ld	s9,24(sp)
 9ba:	6d42                	ld	s10,16(sp)
 9bc:	6da2                	ld	s11,8(sp)
 9be:	6165                	add	sp,sp,112
 9c0:	8082                	ret
