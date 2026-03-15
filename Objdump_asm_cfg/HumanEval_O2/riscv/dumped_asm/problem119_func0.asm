0000000000000a5c <func0>:
 a5c:	7139                	add	sp,sp,-64
 a5e:	fc06                	sd	ra,56(sp)
 a60:	f822                	sd	s0,48(sp)
 a62:	f426                	sd	s1,40(sp)
 a64:	f04a                	sd	s2,32(sp)
 a66:	ec4e                	sd	s3,24(sp)
 a68:	e852                	sd	s4,16(sp)
 a6a:	e456                	sd	s5,8(sp)
 a6c:	e05a                	sd	s6,0(sp)
 a6e:	892a                	mv	s2,a0
 a70:	c31ff0ef          	jal	6a0 <strlen@plt>
 a74:	ffe50a1b          	addw	s4,a0,-2
 a78:	05405b63          	blez	s4,ace <func0+0x72>
 a7c:	001a0493          	add	s1,s4,1
 a80:	00000997          	auipc	s3,0x0
 a84:	26b98993          	add	s3,s3,619 # ceb <_IO_stdin_used+0x1fb>
 a88:	4a85                	li	s5,1
 a8a:	a021                	j	a92 <func0+0x36>
 a8c:	14fd                	add	s1,s1,-1
 a8e:	049ad063          	bge	s5,s1,ace <func0+0x72>
 a92:	00990433          	add	s0,s2,s1
 a96:	fff44b03          	lbu	s6,-1(s0)
 a9a:	462d                	li	a2,11
 a9c:	854e                	mv	a0,s3
 a9e:	85da                	mv	a1,s6
 aa0:	c11ff0ef          	jal	6b0 <memchr@plt>
 aa4:	3a7d                	addw	s4,s4,-1
 aa6:	d17d                	beqz	a0,a8c <func0+0x30>
 aa8:	00044583          	lbu	a1,0(s0)
 aac:	462d                	li	a2,11
 aae:	854e                	mv	a0,s3
 ab0:	c01ff0ef          	jal	6b0 <memchr@plt>
 ab4:	fd61                	bnez	a0,a8c <func0+0x30>
 ab6:	020a1513          	sll	a0,s4,0x20
 aba:	9101                	srl	a0,a0,0x20
 abc:	954a                	add	a0,a0,s2
 abe:	00054583          	lbu	a1,0(a0)
 ac2:	462d                	li	a2,11
 ac4:	854e                	mv	a0,s3
 ac6:	bebff0ef          	jal	6b0 <memchr@plt>
 aca:	f169                	bnez	a0,a8c <func0+0x30>
 acc:	a011                	j	ad0 <func0+0x74>
 ace:	4b01                	li	s6,0
 ad0:	00001517          	auipc	a0,0x1
 ad4:	59850513          	add	a0,a0,1432 # 2068 <func0.out>
 ad8:	01650023          	sb	s6,0(a0)
 adc:	70e2                	ld	ra,56(sp)
 ade:	7442                	ld	s0,48(sp)
 ae0:	74a2                	ld	s1,40(sp)
 ae2:	7902                	ld	s2,32(sp)
 ae4:	69e2                	ld	s3,24(sp)
 ae6:	6a42                	ld	s4,16(sp)
 ae8:	6aa2                	ld	s5,8(sp)
 aea:	6b02                	ld	s6,0(sp)
 aec:	6121                	add	sp,sp,64
 aee:	8082                	ret
