0000000000000bb0 <func0>:
 bb0:	715d                	add	sp,sp,-80
 bb2:	e486                	sd	ra,72(sp)
 bb4:	e0a2                	sd	s0,64(sp)
 bb6:	fc26                	sd	s1,56(sp)
 bb8:	f84a                	sd	s2,48(sp)
 bba:	f44e                	sd	s3,40(sp)
 bbc:	f052                	sd	s4,32(sp)
 bbe:	ec56                	sd	s5,24(sp)
 bc0:	e85a                	sd	s6,16(sp)
 bc2:	e45e                	sd	s7,8(sp)
 bc4:	e062                	sd	s8,0(sp)
 bc6:	cdad                	beqz	a1,c40 <func0+0x90>
 bc8:	8a2e                	mv	s4,a1
 bca:	4985                	li	s3,1
 bcc:	06b05b63          	blez	a1,c42 <func0+0x92>
 bd0:	892a                	mv	s2,a0
 bd2:	4b01                	li	s6,0
 bd4:	4b81                	li	s7,0
 bd6:	4401                	li	s0,0
 bd8:	4a89                	li	s5,2
 bda:	a021                	j	be2 <func0+0x32>
 bdc:	0b05                	add	s6,s6,1
 bde:	074b0263          	beq	s6,s4,c42 <func0+0x92>
 be2:	004b1513          	sll	a0,s6,0x4
 be6:	954a                	add	a0,a0,s2
 be8:	00053c03          	ld	s8,0(a0)
 bec:	000c4483          	lbu	s1,0(s8)
 bf0:	d4f5                	beqz	s1,bdc <func0+0x2c>
 bf2:	d1fff0ef          	jal	910 <__ctype_b_loc@plt>
 bf6:	6108                	ld	a0,0(a0)
 bf8:	001c0593          	add	a1,s8,1
 bfc:	0ff4f613          	zext.b	a2,s1
 c00:	0606                	sll	a2,a2,0x1
 c02:	962a                	add	a2,a2,a0
 c04:	00065603          	lhu	a2,0(a2)
 c08:	40067693          	and	a3,a2,1024
 c0c:	ca95                	beqz	a3,c40 <func0+0x90>
 c0e:	10067693          	and	a3,a2,256
 c12:	ca91                	beqz	a3,c26 <func0+0x76>
 c14:	4b85                	li	s7,1
 c16:	20067613          	and	a2,a2,512
 c1a:	ea09                	bnez	a2,c2c <func0+0x7c>
 c1c:	008b863b          	addw	a2,s7,s0
 c20:	01561b63          	bne	a2,s5,c36 <func0+0x86>
 c24:	a831                	j	c40 <func0+0x90>
 c26:	20067613          	and	a2,a2,512
 c2a:	da6d                	beqz	a2,c1c <func0+0x6c>
 c2c:	4405                	li	s0,1
 c2e:	008b863b          	addw	a2,s7,s0
 c32:	01560763          	beq	a2,s5,c40 <func0+0x90>
 c36:	0005c483          	lbu	s1,0(a1)
 c3a:	0585                	add	a1,a1,1
 c3c:	f0e1                	bnez	s1,bfc <func0+0x4c>
 c3e:	bf79                	j	bdc <func0+0x2c>
 c40:	4981                	li	s3,0
 c42:	854e                	mv	a0,s3
 c44:	60a6                	ld	ra,72(sp)
 c46:	6406                	ld	s0,64(sp)
 c48:	74e2                	ld	s1,56(sp)
 c4a:	7942                	ld	s2,48(sp)
 c4c:	79a2                	ld	s3,40(sp)
 c4e:	7a02                	ld	s4,32(sp)
 c50:	6ae2                	ld	s5,24(sp)
 c52:	6b42                	ld	s6,16(sp)
 c54:	6ba2                	ld	s7,8(sp)
 c56:	6c02                	ld	s8,0(sp)
 c58:	6161                	add	sp,sp,80
 c5a:	8082                	ret
