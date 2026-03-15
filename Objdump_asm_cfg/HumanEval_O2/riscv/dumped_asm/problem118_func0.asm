0000000000000c58 <func0>:
 c58:	7159                	add	sp,sp,-112
 c5a:	f486                	sd	ra,104(sp)
 c5c:	f0a2                	sd	s0,96(sp)
 c5e:	eca6                	sd	s1,88(sp)
 c60:	e8ca                	sd	s2,80(sp)
 c62:	e4ce                	sd	s3,72(sp)
 c64:	e0d2                	sd	s4,64(sp)
 c66:	fc56                	sd	s5,56(sp)
 c68:	f85a                	sd	s6,48(sp)
 c6a:	f45e                	sd	s7,40(sp)
 c6c:	f062                	sd	s8,32(sp)
 c6e:	ec66                	sd	s9,24(sp)
 c70:	e86a                	sd	s10,16(sp)
 c72:	e46e                	sd	s11,8(sp)
 c74:	e032                	sd	a2,0(sp)
 c76:	89ae                	mv	s3,a1
 c78:	8a2a                	mv	s4,a0
 c7a:	b77ff0ef          	jal	7f0 <strlen@plt>
 c7e:	00150a93          	add	s5,a0,1
 c82:	8556                	mv	a0,s5
 c84:	b5dff0ef          	jal	7e0 <malloc@plt>
 c88:	8d2a                	mv	s10,a0
 c8a:	bc7ff0ef          	jal	850 <__ctype_b_loc@plt>
 c8e:	8c2a                	mv	s8,a0
 c90:	4481                	li	s1,0
 c92:	4b01                	li	s6,0
 c94:	4401                	li	s0,0
 c96:	4d81                	li	s11,0
 c98:	4c81                	li	s9,0
 c9a:	00000b97          	auipc	s7,0x0
 c9e:	1f5b8b93          	add	s7,s7,501 # e8f <_IO_stdin_used+0x133>
 ca2:	a039                	j	cb0 <func0+0x58>
 ca4:	4401                	li	s0,0
 ca6:	00148d9b          	addw	s11,s1,1
 caa:	0485                	add	s1,s1,1
 cac:	089a8163          	beq	s5,s1,d2e <func0+0xd6>
 cb0:	009a0533          	add	a0,s4,s1
 cb4:	00054583          	lbu	a1,0(a0)
 cb8:	000c3503          	ld	a0,0(s8)
 cbc:	00159613          	sll	a2,a1,0x1
 cc0:	9532                	add	a0,a0,a2
 cc2:	00055903          	lhu	s2,0(a0)
 cc6:	0015b513          	seqz	a0,a1
 cca:	03291613          	sll	a2,s2,0x32
 cce:	927d                	srl	a2,a2,0x3f
 cd0:	8d51                	or	a0,a0,a2
 cd2:	cd1d                	beqz	a0,d10 <func0+0xb8>
 cd4:	fd3418e3          	bne	s0,s3,ca4 <func0+0x4c>
 cd8:	41b4853b          	subw	a0,s1,s11
 cdc:	956a                	add	a0,a0,s10
 cde:	00050023          	sb	zero,0(a0)
 ce2:	001c841b          	addw	s0,s9,1
 ce6:	00341593          	sll	a1,s0,0x3
 cea:	855a                	mv	a0,s6
 cec:	b45ff0ef          	jal	830 <realloc@plt>
 cf0:	8b2a                	mv	s6,a0
 cf2:	856a                	mv	a0,s10
 cf4:	afdff0ef          	jal	7f0 <strlen@plt>
 cf8:	0505                	add	a0,a0,1
 cfa:	ae7ff0ef          	jal	7e0 <malloc@plt>
 cfe:	003c9593          	sll	a1,s9,0x3
 d02:	95da                	add	a1,a1,s6
 d04:	e188                	sd	a0,0(a1)
 d06:	85ea                	mv	a1,s10
 d08:	b09ff0ef          	jal	810 <strcpy@plt>
 d0c:	8ca2                	mv	s9,s0
 d0e:	bf59                	j	ca4 <func0+0x4c>
 d10:	41b4853b          	subw	a0,s1,s11
 d14:	956a                	add	a0,a0,s10
 d16:	00b50023          	sb	a1,0(a0)
 d1a:	462d                	li	a2,11
 d1c:	855e                	mv	a0,s7
 d1e:	ae3ff0ef          	jal	800 <memchr@plt>
 d22:	f541                	bnez	a0,caa <func0+0x52>
 d24:	03591513          	sll	a0,s2,0x35
 d28:	917d                	srl	a0,a0,0x3f
 d2a:	9c29                	addw	s0,s0,a0
 d2c:	bfbd                	j	caa <func0+0x52>
 d2e:	856a                	mv	a0,s10
 d30:	b31ff0ef          	jal	860 <free@plt>
 d34:	6502                	ld	a0,0(sp)
 d36:	01952023          	sw	s9,0(a0)
 d3a:	855a                	mv	a0,s6
 d3c:	70a6                	ld	ra,104(sp)
 d3e:	7406                	ld	s0,96(sp)
 d40:	64e6                	ld	s1,88(sp)
 d42:	6946                	ld	s2,80(sp)
 d44:	69a6                	ld	s3,72(sp)
 d46:	6a06                	ld	s4,64(sp)
 d48:	7ae2                	ld	s5,56(sp)
 d4a:	7b42                	ld	s6,48(sp)
 d4c:	7ba2                	ld	s7,40(sp)
 d4e:	7c02                	ld	s8,32(sp)
 d50:	6ce2                	ld	s9,24(sp)
 d52:	6d42                	ld	s10,16(sp)
 d54:	6da2                	ld	s11,8(sp)
 d56:	6165                	add	sp,sp,112
 d58:	8082                	ret
