0000000000000bc8 <func0>:
 bc8:	7139                	add	sp,sp,-64
 bca:	fc06                	sd	ra,56(sp)
 bcc:	f822                	sd	s0,48(sp)
 bce:	f426                	sd	s1,40(sp)
 bd0:	f04a                	sd	s2,32(sp)
 bd2:	ec4e                	sd	s3,24(sp)
 bd4:	e852                	sd	s4,16(sp)
 bd6:	e456                	sd	s5,8(sp)
 bd8:	e05a                	sd	s6,0(sp)
 bda:	8936                	mv	s2,a3
 bdc:	02b05f63          	blez	a1,c1a <func0+0x52>
 be0:	89b2                	mv	s3,a2
 be2:	842e                	mv	s0,a1
 be4:	84aa                	mv	s1,a0
 be6:	4a81                	li	s5,0
 be8:	4a01                	li	s4,0
 bea:	a021                	j	bf2 <func0+0x2a>
 bec:	147d                	add	s0,s0,-1
 bee:	04a1                	add	s1,s1,8
 bf0:	c41d                	beqz	s0,c1e <func0+0x56>
 bf2:	6088                	ld	a0,0(s1)
 bf4:	85ce                	mv	a1,s3
 bf6:	c7bff0ef          	jal	870 <strstr@plt>
 bfa:	d96d                	beqz	a0,bec <func0+0x24>
 bfc:	001a8b1b          	addw	s6,s5,1
 c00:	003b1593          	sll	a1,s6,0x3
 c04:	8552                	mv	a0,s4
 c06:	c7bff0ef          	jal	880 <realloc@plt>
 c0a:	608c                	ld	a1,0(s1)
 c0c:	8a2a                	mv	s4,a0
 c0e:	003a9513          	sll	a0,s5,0x3
 c12:	9552                	add	a0,a0,s4
 c14:	e10c                	sd	a1,0(a0)
 c16:	8ada                	mv	s5,s6
 c18:	bfd1                	j	bec <func0+0x24>
 c1a:	4a01                	li	s4,0
 c1c:	4a81                	li	s5,0
 c1e:	01592023          	sw	s5,0(s2)
 c22:	8552                	mv	a0,s4
 c24:	70e2                	ld	ra,56(sp)
 c26:	7442                	ld	s0,48(sp)
 c28:	74a2                	ld	s1,40(sp)
 c2a:	7902                	ld	s2,32(sp)
 c2c:	69e2                	ld	s3,24(sp)
 c2e:	6a42                	ld	s4,16(sp)
 c30:	6aa2                	ld	s5,8(sp)
 c32:	6b02                	ld	s6,0(sp)
 c34:	6121                	add	sp,sp,64
 c36:	8082                	ret
