0000000000000894 <func0>:
 894:	715d                	add	sp,sp,-80
 896:	e486                	sd	ra,72(sp)
 898:	e0a2                	sd	s0,64(sp)
 89a:	fc26                	sd	s1,56(sp)
 89c:	f84a                	sd	s2,48(sp)
 89e:	f44e                	sd	s3,40(sp)
 8a0:	f052                	sd	s4,32(sp)
 8a2:	ec56                	sd	s5,24(sp)
 8a4:	e85a                	sd	s6,16(sp)
 8a6:	e45e                	sd	s7,8(sp)
 8a8:	e062                	sd	s8,0(sp)
 8aa:	89aa                	mv	s3,a0
 8ac:	00054503          	lbu	a0,0(a0)
 8b0:	892e                	mv	s2,a1
 8b2:	cd41                	beqz	a0,94a <func0+0xb6>
 8b4:	4401                	li	s0,0
 8b6:	4a01                	li	s4,0
 8b8:	4481                	li	s1,0
 8ba:	02000a93          	li	s5,32
 8be:	4b05                	li	s6,1
 8c0:	4b89                	li	s7,2
 8c2:	4c0d                	li	s8,3
 8c4:	a801                	j	8d4 <func0+0x40>
 8c6:	2485                	addw	s1,s1,1
 8c8:	0405                	add	s0,s0,1
 8ca:	854e                	mv	a0,s3
 8cc:	d95ff0ef          	jal	660 <strlen@plt>
 8d0:	04a47d63          	bgeu	s0,a0,92a <func0+0x96>
 8d4:	00898533          	add	a0,s3,s0
 8d8:	00054583          	lbu	a1,0(a0)
 8dc:	ff5585e3          	beq	a1,s5,8c6 <func0+0x32>
 8e0:	01648e63          	beq	s1,s6,8fc <func0+0x68>
 8e4:	01749f63          	bne	s1,s7,902 <func0+0x6e>
 8e8:	001a061b          	addw	a2,s4,1
 8ec:	014906b3          	add	a3,s2,s4
 8f0:	05f00593          	li	a1,95
 8f4:	00b68023          	sb	a1,0(a3)
 8f8:	4489                	li	s1,2
 8fa:	a811                	j	90e <func0+0x7a>
 8fc:	05f00593          	li	a1,95
 900:	a031                	j	90c <func0+0x78>
 902:	0184cb63          	blt	s1,s8,918 <func0+0x84>
 906:	02d00593          	li	a1,45
 90a:	4485                	li	s1,1
 90c:	8652                	mv	a2,s4
 90e:	009a0a3b          	addw	s4,s4,s1
 912:	964a                	add	a2,a2,s2
 914:	00b60023          	sb	a1,0(a2)
 918:	00050503          	lb	a0,0(a0)
 91c:	4481                	li	s1,0
 91e:	014905b3          	add	a1,s2,s4
 922:	2a05                	addw	s4,s4,1
 924:	00a58023          	sb	a0,0(a1)
 928:	b745                	j	8c8 <func0+0x34>
 92a:	4505                	li	a0,1
 92c:	02a48163          	beq	s1,a0,94e <func0+0xba>
 930:	4509                	li	a0,2
 932:	02a49163          	bne	s1,a0,954 <func0+0xc0>
 936:	001a059b          	addw	a1,s4,1
 93a:	01490633          	add	a2,s2,s4
 93e:	05f00513          	li	a0,95
 942:	00a60023          	sb	a0,0(a2)
 946:	4489                	li	s1,2
 948:	a829                	j	962 <func0+0xce>
 94a:	4a01                	li	s4,0
 94c:	a005                	j	96c <func0+0xd8>
 94e:	05f00513          	li	a0,95
 952:	a039                	j	960 <func0+0xcc>
 954:	450d                	li	a0,3
 956:	00a4cb63          	blt	s1,a0,96c <func0+0xd8>
 95a:	02d00513          	li	a0,45
 95e:	4485                	li	s1,1
 960:	85d2                	mv	a1,s4
 962:	009a0a3b          	addw	s4,s4,s1
 966:	95ca                	add	a1,a1,s2
 968:	00a58023          	sb	a0,0(a1)
 96c:	01490533          	add	a0,s2,s4
 970:	00050023          	sb	zero,0(a0)
 974:	60a6                	ld	ra,72(sp)
 976:	6406                	ld	s0,64(sp)
 978:	74e2                	ld	s1,56(sp)
 97a:	7942                	ld	s2,48(sp)
 97c:	79a2                	ld	s3,40(sp)
 97e:	7a02                	ld	s4,32(sp)
 980:	6ae2                	ld	s5,24(sp)
 982:	6b42                	ld	s6,16(sp)
 984:	6ba2                	ld	s7,8(sp)
 986:	6c02                	ld	s8,0(sp)
 988:	6161                	add	sp,sp,80
 98a:	8082                	ret
