0000000000000954 <func0>:
 954:	7179                	add	sp,sp,-48
 956:	f406                	sd	ra,40(sp)
 958:	f022                	sd	s0,32(sp)
 95a:	ec26                	sd	s1,24(sp)
 95c:	e84a                	sd	s2,16(sp)
 95e:	e44e                	sd	s3,8(sp)
 960:	89aa                	mv	s3,a0
 962:	00054403          	lbu	s0,0(a0)
 966:	c80d                	beqz	s0,998 <func0+0x44>
 968:	00198493          	add	s1,s3,1
 96c:	00000917          	auipc	s2,0x0
 970:	15a90913          	add	s2,s2,346 # ac6 <_IO_stdin_used+0x11a>
 974:	a029                	j	97e <func0+0x2a>
 976:	0004c403          	lbu	s0,0(s1)
 97a:	0485                	add	s1,s1,1
 97c:	cc11                	beqz	s0,998 <func0+0x44>
 97e:	0ff47593          	zext.b	a1,s0
 982:	462d                	li	a2,11
 984:	854a                	mv	a0,s2
 986:	cdbff0ef          	jal	660 <memchr@plt>
 98a:	f575                	bnez	a0,976 <func0+0x22>
 98c:	00198513          	add	a0,s3,1
 990:	00898023          	sb	s0,0(s3)
 994:	89aa                	mv	s3,a0
 996:	b7c5                	j	976 <func0+0x22>
 998:	00098023          	sb	zero,0(s3)
 99c:	70a2                	ld	ra,40(sp)
 99e:	7402                	ld	s0,32(sp)
 9a0:	64e2                	ld	s1,24(sp)
 9a2:	6942                	ld	s2,16(sp)
 9a4:	69a2                	ld	s3,8(sp)
 9a6:	6145                	add	sp,sp,48
 9a8:	8082                	ret
