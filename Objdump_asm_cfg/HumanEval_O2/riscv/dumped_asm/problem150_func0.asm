0000000000000ec0 <func0>:
 ec0:	711d                	add	sp,sp,-96
 ec2:	ec86                	sd	ra,88(sp)
 ec4:	e8a2                	sd	s0,80(sp)
 ec6:	e4a6                	sd	s1,72(sp)
 ec8:	e0ca                	sd	s2,64(sp)
 eca:	fc4e                	sd	s3,56(sp)
 ecc:	f852                	sd	s4,48(sp)
 ece:	f456                	sd	s5,40(sp)
 ed0:	f05a                	sd	s6,32(sp)
 ed2:	ec5e                	sd	s7,24(sp)
 ed4:	e862                	sd	s8,16(sp)
 ed6:	e466                	sd	s9,8(sp)
 ed8:	e06a                	sd	s10,0(sp)
 eda:	892a                	mv	s2,a0
 edc:	00062023          	sw	zero,0(a2)
 ee0:	0ab05263          	blez	a1,f84 <func0+0xc4>
 ee4:	89b2                	mv	s3,a2
 ee6:	842e                	mv	s0,a1
 ee8:	4a01                	li	s4,0
 eea:	84ca                	mv	s1,s2
 eec:	a021                	j	ef4 <func0+0x34>
 eee:	147d                	add	s0,s0,-1
 ef0:	04a1                	add	s1,s1,8
 ef2:	c00d                	beqz	s0,f14 <func0+0x54>
 ef4:	0004ba83          	ld	s5,0(s1)
 ef8:	8556                	mv	a0,s5
 efa:	b27ff0ef          	jal	a20 <strlen@plt>
 efe:	8905                	and	a0,a0,1
 f00:	f57d                	bnez	a0,eee <func0+0x2e>
 f02:	003a1513          	sll	a0,s4,0x3
 f06:	954a                	add	a0,a0,s2
 f08:	01553023          	sd	s5,0(a0)
 f0c:	2a05                	addw	s4,s4,1
 f0e:	0149a023          	sw	s4,0(s3)
 f12:	bff1                	j	eee <func0+0x2e>
 f14:	4509                	li	a0,2
 f16:	06aa4863          	blt	s4,a0,f86 <func0+0xc6>
 f1a:	4a81                	li	s5,0
 f1c:	fffa0b1b          	addw	s6,s4,-1
 f20:	00890b93          	add	s7,s2,8
 f24:	8c5a                	mv	s8,s6
 f26:	a029                	j	f30 <func0+0x70>
 f28:	2a85                	addw	s5,s5,1
 f2a:	3c7d                	addw	s8,s8,-1
 f2c:	056add63          	bge	s5,s6,f86 <func0+0xc6>
 f30:	fffac513          	not	a0,s5
 f34:	00aa053b          	addw	a0,s4,a0
 f38:	fea058e3          	blez	a0,f28 <func0+0x68>
 f3c:	00093983          	ld	s3,0(s2)
 f40:	020c1513          	sll	a0,s8,0x20
 f44:	02055413          	srl	s0,a0,0x20
 f48:	84de                	mv	s1,s7
 f4a:	a801                	j	f5a <func0+0x9a>
 f4c:	ff94bc23          	sd	s9,-8(s1)
 f50:	0134b023          	sd	s3,0(s1)
 f54:	147d                	add	s0,s0,-1
 f56:	04a1                	add	s1,s1,8
 f58:	d861                	beqz	s0,f28 <func0+0x68>
 f5a:	854e                	mv	a0,s3
 f5c:	ac5ff0ef          	jal	a20 <strlen@plt>
 f60:	0004bc83          	ld	s9,0(s1)
 f64:	8d2a                	mv	s10,a0
 f66:	8566                	mv	a0,s9
 f68:	ab9ff0ef          	jal	a20 <strlen@plt>
 f6c:	ffa560e3          	bltu	a0,s10,f4c <func0+0x8c>
 f70:	00ad1863          	bne	s10,a0,f80 <func0+0xc0>
 f74:	854e                	mv	a0,s3
 f76:	85e6                	mv	a1,s9
 f78:	ad9ff0ef          	jal	a50 <strcmp@plt>
 f7c:	fca048e3          	bgtz	a0,f4c <func0+0x8c>
 f80:	89e6                	mv	s3,s9
 f82:	bfc9                	j	f54 <func0+0x94>
 f84:	4a01                	li	s4,0
 f86:	003a1413          	sll	s0,s4,0x3
 f8a:	8522                	mv	a0,s0
 f8c:	a75ff0ef          	jal	a00 <malloc@plt>
 f90:	84aa                	mv	s1,a0
 f92:	01405763          	blez	s4,fa0 <func0+0xe0>
 f96:	8526                	mv	a0,s1
 f98:	85ca                	mv	a1,s2
 f9a:	8622                	mv	a2,s0
 f9c:	a75ff0ef          	jal	a10 <memcpy@plt>
 fa0:	8526                	mv	a0,s1
 fa2:	60e6                	ld	ra,88(sp)
 fa4:	6446                	ld	s0,80(sp)
 fa6:	64a6                	ld	s1,72(sp)
 fa8:	6906                	ld	s2,64(sp)
 faa:	79e2                	ld	s3,56(sp)
 fac:	7a42                	ld	s4,48(sp)
 fae:	7aa2                	ld	s5,40(sp)
 fb0:	7b02                	ld	s6,32(sp)
 fb2:	6be2                	ld	s7,24(sp)
 fb4:	6c42                	ld	s8,16(sp)
 fb6:	6ca2                	ld	s9,8(sp)
 fb8:	6d02                	ld	s10,0(sp)
 fba:	6125                	add	sp,sp,96
 fbc:	8082                	ret
