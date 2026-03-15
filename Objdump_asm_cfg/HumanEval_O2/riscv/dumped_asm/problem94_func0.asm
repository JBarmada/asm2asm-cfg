0000000000000968 <func0>:
 968:	715d                	add	sp,sp,-80
 96a:	e486                	sd	ra,72(sp)
 96c:	e0a2                	sd	s0,64(sp)
 96e:	fc26                	sd	s1,56(sp)
 970:	f84a                	sd	s2,48(sp)
 972:	f44e                	sd	s3,40(sp)
 974:	f052                	sd	s4,32(sp)
 976:	ec56                	sd	s5,24(sp)
 978:	e85a                	sd	s6,16(sp)
 97a:	e45e                	sd	s7,8(sp)
 97c:	00054483          	lbu	s1,0(a0)
 980:	89ae                	mv	s3,a1
 982:	c0d1                	beqz	s1,a06 <func0+0x9e>
 984:	892a                	mv	s2,a0
 986:	dbbff0ef          	jal	740 <__ctype_b_loc@plt>
 98a:	00001597          	auipc	a1,0x1
 98e:	6e658593          	add	a1,a1,1766 # 2070 <__SDATA_BEGIN__>
 992:	0005ba03          	ld	s4,0(a1)
 996:	8b2a                	mv	s6,a0
 998:	4401                	li	s0,0
 99a:	00190a93          	add	s5,s2,1
 99e:	03400913          	li	s2,52
 9a2:	000b3503          	ld	a0,0(s6)
 9a6:	0ff4fb93          	zext.b	s7,s1
 9aa:	001b9593          	sll	a1,s7,0x1
 9ae:	952e                	add	a0,a0,a1
 9b0:	00055503          	lhu	a0,0(a0)
 9b4:	20057593          	and	a1,a0,512
 9b8:	e599                	bnez	a1,9c6 <func0+0x5e>
 9ba:	10057513          	and	a0,a0,256
 9be:	cd01                	beqz	a0,9d6 <func0+0x6e>
 9c0:	d61ff0ef          	jal	720 <__ctype_tolower_loc@plt>
 9c4:	a019                	j	9ca <func0+0x62>
 9c6:	d4bff0ef          	jal	710 <__ctype_toupper_loc@plt>
 9ca:	6108                	ld	a0,0(a0)
 9cc:	002b9593          	sll	a1,s7,0x2
 9d0:	952e                	add	a0,a0,a1
 9d2:	00050483          	lb	s1,0(a0)
 9d6:	0ff4f513          	zext.b	a0,s1
 9da:	fbf50513          	add	a0,a0,-65
 9de:	00a96763          	bltu	s2,a0,9ec <func0+0x84>
 9e2:	00aa5533          	srl	a0,s4,a0
 9e6:	8905                	and	a0,a0,1
 9e8:	c111                	beqz	a0,9ec <func0+0x84>
 9ea:	0489                	add	s1,s1,2
 9ec:	00898533          	add	a0,s3,s0
 9f0:	00950023          	sb	s1,0(a0)
 9f4:	008a8533          	add	a0,s5,s0
 9f8:	00054483          	lbu	s1,0(a0)
 9fc:	00140513          	add	a0,s0,1
 a00:	842a                	mv	s0,a0
 a02:	f0c5                	bnez	s1,9a2 <func0+0x3a>
 a04:	a011                	j	a08 <func0+0xa0>
 a06:	4501                	li	a0,0
 a08:	954e                	add	a0,a0,s3
 a0a:	00050023          	sb	zero,0(a0)
 a0e:	60a6                	ld	ra,72(sp)
 a10:	6406                	ld	s0,64(sp)
 a12:	74e2                	ld	s1,56(sp)
 a14:	7942                	ld	s2,48(sp)
 a16:	79a2                	ld	s3,40(sp)
 a18:	7a02                	ld	s4,32(sp)
 a1a:	6ae2                	ld	s5,24(sp)
 a1c:	6b42                	ld	s6,16(sp)
 a1e:	6ba2                	ld	s7,8(sp)
 a20:	6161                	add	sp,sp,80
 a22:	8082                	ret
