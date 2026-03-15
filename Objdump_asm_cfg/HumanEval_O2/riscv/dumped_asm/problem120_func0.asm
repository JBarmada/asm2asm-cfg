0000000000000a70 <func0>:
 a70:	7139                	add	sp,sp,-64
 a72:	fc06                	sd	ra,56(sp)
 a74:	f822                	sd	s0,48(sp)
 a76:	f426                	sd	s1,40(sp)
 a78:	f04a                	sd	s2,32(sp)
 a7a:	ec4e                	sd	s3,24(sp)
 a7c:	e852                	sd	s4,16(sp)
 a7e:	e456                	sd	s5,8(sp)
 a80:	8aae                	mv	s5,a1
 a82:	842a                	mv	s0,a0
 a84:	557d                	li	a0,-1
 a86:	02055993          	srl	s3,a0,0x20
 a8a:	8522                	mv	a0,s0
 a8c:	be5ff0ef          	jal	670 <strlen@plt>
 a90:	892a                	mv	s2,a0
 a92:	00050a1b          	sext.w	s4,a0
 a96:	8556                	mv	a0,s5
 a98:	bd9ff0ef          	jal	670 <strlen@plt>
 a9c:	4581                	li	a1,0
 a9e:	03405c63          	blez	s4,ad6 <func0+0x66>
 aa2:	013976b3          	and	a3,s2,s3
 aa6:	4785                	li	a5,1
 aa8:	8722                	mv	a4,s0
 aaa:	a029                	j	ab4 <func0+0x44>
 aac:	16fd                	add	a3,a3,-1
 aae:	0705                	add	a4,a4,1
 ab0:	87b2                	mv	a5,a2
 ab2:	c29d                	beqz	a3,ad8 <func0+0x68>
 ab4:	00074603          	lbu	a2,0(a4)
 ab8:	fd860493          	add	s1,a2,-40
 abc:	0014b493          	seqz	s1,s1
 ac0:	9da5                	addw	a1,a1,s1
 ac2:	fd760613          	add	a2,a2,-41
 ac6:	00163613          	seqz	a2,a2
 aca:	9d91                	subw	a1,a1,a2
 acc:	4601                	li	a2,0
 ace:	fc05cfe3          	bltz	a1,aac <func0+0x3c>
 ad2:	863e                	mv	a2,a5
 ad4:	bfe1                	j	aac <func0+0x3c>
 ad6:	4605                	li	a2,1
 ad8:	0005081b          	sext.w	a6,a0
 adc:	07005d63          	blez	a6,b56 <func0+0xe6>
 ae0:	01357733          	and	a4,a0,s3
 ae4:	87d6                	mv	a5,s5
 ae6:	a029                	j	af0 <func0+0x80>
 ae8:	177d                	add	a4,a4,-1
 aea:	0785                	add	a5,a5,1
 aec:	8636                	mv	a2,a3
 aee:	c315                	beqz	a4,b12 <func0+0xa2>
 af0:	0007c683          	lbu	a3,0(a5)
 af4:	fd868493          	add	s1,a3,-40
 af8:	0014b493          	seqz	s1,s1
 afc:	9da5                	addw	a1,a1,s1
 afe:	fd768693          	add	a3,a3,-41
 b02:	0016b693          	seqz	a3,a3
 b06:	9d95                	subw	a1,a1,a3
 b08:	4681                	li	a3,0
 b0a:	fc05cfe3          	bltz	a1,ae8 <func0+0x78>
 b0e:	86b2                	mv	a3,a2
 b10:	bfe1                	j	ae8 <func0+0x78>
 b12:	0015b593          	seqz	a1,a1
 b16:	00d03633          	snez	a2,a3
 b1a:	8df1                	and	a1,a1,a2
 b1c:	e9d9                	bnez	a1,bb2 <func0+0x142>
 b1e:	05005263          	blez	a6,b62 <func0+0xf2>
 b22:	4581                	li	a1,0
 b24:	01357633          	and	a2,a0,s3
 b28:	4685                	li	a3,1
 b2a:	a029                	j	b34 <func0+0xc4>
 b2c:	167d                	add	a2,a2,-1
 b2e:	0a85                	add	s5,s5,1
 b30:	86aa                	mv	a3,a0
 b32:	ca15                	beqz	a2,b66 <func0+0xf6>
 b34:	000ac503          	lbu	a0,0(s5)
 b38:	fd850713          	add	a4,a0,-40
 b3c:	00173713          	seqz	a4,a4
 b40:	9db9                	addw	a1,a1,a4
 b42:	fd750513          	add	a0,a0,-41
 b46:	00153513          	seqz	a0,a0
 b4a:	9d89                	subw	a1,a1,a0
 b4c:	4501                	li	a0,0
 b4e:	fc05cfe3          	bltz	a1,b2c <func0+0xbc>
 b52:	8536                	mv	a0,a3
 b54:	bfe1                	j	b2c <func0+0xbc>
 b56:	0015b513          	seqz	a0,a1
 b5a:	00c035b3          	snez	a1,a2
 b5e:	8d6d                	and	a0,a0,a1
 b60:	e929                	bnez	a0,bb2 <func0+0x142>
 b62:	4581                	li	a1,0
 b64:	4505                	li	a0,1
 b66:	03405a63          	blez	s4,b9a <func0+0x12a>
 b6a:	01397633          	and	a2,s2,s3
 b6e:	a029                	j	b78 <func0+0x108>
 b70:	167d                	add	a2,a2,-1
 b72:	0405                	add	s0,s0,1
 b74:	8536                	mv	a0,a3
 b76:	c21d                	beqz	a2,b9c <func0+0x12c>
 b78:	00044683          	lbu	a3,0(s0)
 b7c:	fd868713          	add	a4,a3,-40
 b80:	00173713          	seqz	a4,a4
 b84:	9db9                	addw	a1,a1,a4
 b86:	fd768693          	add	a3,a3,-41
 b8a:	0016b693          	seqz	a3,a3
 b8e:	9d95                	subw	a1,a1,a3
 b90:	4681                	li	a3,0
 b92:	fc05cfe3          	bltz	a1,b70 <func0+0x100>
 b96:	86aa                	mv	a3,a0
 b98:	bfe1                	j	b70 <func0+0x100>
 b9a:	86aa                	mv	a3,a0
 b9c:	0015b513          	seqz	a0,a1
 ba0:	00d035b3          	snez	a1,a3
 ba4:	8d6d                	and	a0,a0,a1
 ba6:	e511                	bnez	a0,bb2 <func0+0x142>
 ba8:	00000517          	auipc	a0,0x0
 bac:	06f50513          	add	a0,a0,111 # c17 <_IO_stdin_used+0x4b>
 bb0:	a029                	j	bba <func0+0x14a>
 bb2:	00000517          	auipc	a0,0x0
 bb6:	01e50513          	add	a0,a0,30 # bd0 <_IO_stdin_used+0x4>
 bba:	70e2                	ld	ra,56(sp)
 bbc:	7442                	ld	s0,48(sp)
 bbe:	74a2                	ld	s1,40(sp)
 bc0:	7902                	ld	s2,32(sp)
 bc2:	69e2                	ld	s3,24(sp)
 bc4:	6a42                	ld	s4,16(sp)
 bc6:	6aa2                	ld	s5,8(sp)
 bc8:	6121                	add	sp,sp,64
 bca:	8082                	ret
