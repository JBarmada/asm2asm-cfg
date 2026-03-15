0000000000000938 <func0>:
 938:	1141                	add	sp,sp,-16
 93a:	e406                	sd	ra,8(sp)
 93c:	e022                	sd	s0,0(sp)
 93e:	842a                	mv	s0,a0
 940:	cf1ff0ef          	jal	630 <strlen@plt>
 944:	c939                	beqz	a0,99a <func0+0x62>
 946:	00044583          	lbu	a1,0(s0)
 94a:	fd858613          	add	a2,a1,-40
 94e:	00163613          	seqz	a2,a2
 952:	fd758593          	add	a1,a1,-41
 956:	0015b593          	seqz	a1,a1
 95a:	40b605b3          	sub	a1,a2,a1
 95e:	0405c163          	bltz	a1,9a0 <func0+0x68>
 962:	4685                	li	a3,1
 964:	8636                	mv	a2,a3
 966:	02d50563          	beq	a0,a3,990 <func0+0x58>
 96a:	00c406b3          	add	a3,s0,a2
 96e:	0006c683          	lbu	a3,0(a3)
 972:	fd868713          	add	a4,a3,-40
 976:	00173713          	seqz	a4,a4
 97a:	9db9                	addw	a1,a1,a4
 97c:	fd768693          	add	a3,a3,-41
 980:	0016b693          	seqz	a3,a3
 984:	9d95                	subw	a1,a1,a3
 986:	00160693          	add	a3,a2,1
 98a:	fc05dde3          	bgez	a1,964 <func0+0x2c>
 98e:	4585                	li	a1,1
 990:	00a63533          	sltu	a0,a2,a0
 994:	00154513          	xor	a0,a0,1
 998:	a031                	j	9a4 <func0+0x6c>
 99a:	4581                	li	a1,0
 99c:	4505                	li	a0,1
 99e:	a019                	j	9a4 <func0+0x6c>
 9a0:	4501                	li	a0,0
 9a2:	4585                	li	a1,1
 9a4:	2581                	sext.w	a1,a1
 9a6:	0015b593          	seqz	a1,a1
 9aa:	8d6d                	and	a0,a0,a1
 9ac:	60a2                	ld	ra,8(sp)
 9ae:	6402                	ld	s0,0(sp)
 9b0:	0141                	add	sp,sp,16
 9b2:	8082                	ret
