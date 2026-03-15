0000000000000bdc <func0>:
 bdc:	7139                	add	sp,sp,-64
 bde:	fc06                	sd	ra,56(sp)
 be0:	f822                	sd	s0,48(sp)
 be2:	f426                	sd	s1,40(sp)
 be4:	f04a                	sd	s2,32(sp)
 be6:	ec4e                	sd	s3,24(sp)
 be8:	e852                	sd	s4,16(sp)
 bea:	e456                	sd	s5,8(sp)
 bec:	e05a                	sd	s6,0(sp)
 bee:	8936                	mv	s2,a3
 bf0:	89b2                	mv	s3,a2
 bf2:	8a2e                	mv	s4,a1
 bf4:	8b2a                	mv	s6,a0
 bf6:	b3bff0ef          	jal	730 <strlen@plt>
 bfa:	2505                	addw	a0,a0,1
 bfc:	b25ff0ef          	jal	720 <malloc@plt>
 c00:	000b4683          	lbu	a3,0(s6)
 c04:	8aaa                	mv	s5,a0
 c06:	c2a9                	beqz	a3,c48 <func0+0x6c>
 c08:	000a4403          	lbu	s0,0(s4)
 c0c:	4601                	li	a2,0
 c0e:	4581                	li	a1,0
 c10:	001a0713          	add	a4,s4,1
 c14:	a821                	j	c2c <func0+0x50>
 c16:	00ba8533          	add	a0,s5,a1
 c1a:	2585                	addw	a1,a1,1
 c1c:	00d50023          	sb	a3,0(a0)
 c20:	0605                	add	a2,a2,1
 c22:	00cb0533          	add	a0,s6,a2
 c26:	00054683          	lbu	a3,0(a0)
 c2a:	c285                	beqz	a3,c4a <func0+0x6e>
 c2c:	87ba                	mv	a5,a4
 c2e:	8522                	mv	a0,s0
 c30:	d07d                	beqz	s0,c16 <func0+0x3a>
 c32:	0ff57513          	zext.b	a0,a0
 c36:	0ff6f493          	zext.b	s1,a3
 c3a:	fea483e3          	beq	s1,a0,c20 <func0+0x44>
 c3e:	0007c503          	lbu	a0,0(a5)
 c42:	0785                	add	a5,a5,1
 c44:	f57d                	bnez	a0,c32 <func0+0x56>
 c46:	bfc1                	j	c16 <func0+0x3a>
 c48:	4581                	li	a1,0
 c4a:	00ba8533          	add	a0,s5,a1
 c4e:	00050023          	sb	zero,0(a0)
 c52:	8556                	mv	a0,s5
 c54:	addff0ef          	jal	730 <strlen@plt>
 c58:	0005059b          	sext.w	a1,a0
 c5c:	4609                	li	a2,2
 c5e:	00000497          	auipc	s1,0x0
 c62:	13e48493          	add	s1,s1,318 # d9c <_IO_stdin_used+0xd4>
 c66:	02c5cd63          	blt	a1,a2,ca0 <func0+0xc4>
 c6a:	55fd                	li	a1,-1
 c6c:	1582                	sll	a1,a1,0x20
 c6e:	0015561b          	srlw	a2,a0,0x1
 c72:	1502                	sll	a0,a0,0x20
 c74:	00b506b3          	add	a3,a0,a1
 c78:	00000517          	auipc	a0,0x0
 c7c:	06150513          	add	a0,a0,97 # cd9 <_IO_stdin_used+0x11>
 c80:	8756                	mv	a4,s5
 c82:	00074783          	lbu	a5,0(a4)
 c86:	4206d413          	sra	s0,a3,0x20
 c8a:	9456                	add	s0,s0,s5
 c8c:	00044403          	lbu	s0,0(s0)
 c90:	00879763          	bne	a5,s0,c9e <func0+0xc2>
 c94:	96ae                	add	a3,a3,a1
 c96:	167d                	add	a2,a2,-1
 c98:	0705                	add	a4,a4,1
 c9a:	f665                	bnez	a2,c82 <func0+0xa6>
 c9c:	a011                	j	ca0 <func0+0xc4>
 c9e:	84aa                	mv	s1,a0
 ca0:	854e                	mv	a0,s3
 ca2:	85d6                	mv	a1,s5
 ca4:	a9dff0ef          	jal	740 <strcpy@plt>
 ca8:	854a                	mv	a0,s2
 caa:	85a6                	mv	a1,s1
 cac:	a95ff0ef          	jal	740 <strcpy@plt>
 cb0:	8556                	mv	a0,s5
 cb2:	70e2                	ld	ra,56(sp)
 cb4:	7442                	ld	s0,48(sp)
 cb6:	74a2                	ld	s1,40(sp)
 cb8:	7902                	ld	s2,32(sp)
 cba:	69e2                	ld	s3,24(sp)
 cbc:	6a42                	ld	s4,16(sp)
 cbe:	6aa2                	ld	s5,8(sp)
 cc0:	6b02                	ld	s6,0(sp)
 cc2:	6121                	add	sp,sp,64
 cc4:	b475                	j	770 <free@plt>
