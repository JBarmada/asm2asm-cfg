0000000000000bb0 <func0>:
 bb0:	711d                	add	sp,sp,-96
 bb2:	ec86                	sd	ra,88(sp)
 bb4:	e8a2                	sd	s0,80(sp)
 bb6:	e4a6                	sd	s1,72(sp)
 bb8:	e0ca                	sd	s2,64(sp)
 bba:	fc4e                	sd	s3,56(sp)
 bbc:	f852                	sd	s4,48(sp)
 bbe:	f456                	sd	s5,40(sp)
 bc0:	f05a                	sd	s6,32(sp)
 bc2:	ec5e                	sd	s7,24(sp)
 bc4:	e862                	sd	s8,16(sp)
 bc6:	8bae                	mv	s7,a1
 bc8:	892a                	mv	s2,a0
 bca:	00259513          	sll	a0,a1,0x2
 bce:	b53ff0ef          	jal	720 <malloc@plt>
 bd2:	89aa                	mv	s3,a0
 bd4:	0d705a63          	blez	s7,ca8 <func0+0xf8>
 bd8:	4401                	li	s0,0
 bda:	00510a93          	add	s5,sp,5
 bde:	00000a17          	auipc	s4,0x0
 be2:	2aaa0a13          	add	s4,s4,682 # e88 <_IO_stdin_used+0x1c0>
 be6:	4b09                	li	s6,2
 be8:	a819                	j	bfe <func0+0x4e>
 bea:	40a58533          	sub	a0,a1,a0
 bee:	03050513          	add	a0,a0,48
 bf2:	018985b3          	add	a1,s3,s8
 bf6:	0405                	add	s0,s0,1
 bf8:	c188                	sw	a0,0(a1)
 bfa:	05740f63          	beq	s0,s7,c58 <func0+0xa8>
 bfe:	00241c13          	sll	s8,s0,0x2
 c02:	018904b3          	add	s1,s2,s8
 c06:	4088                	lw	a0,0(s1)
 c08:	41f5559b          	sraw	a1,a0,0x1f
 c0c:	8d2d                	xor	a0,a0,a1
 c0e:	40b5063b          	subw	a2,a0,a1
 c12:	0048                	add	a0,sp,4
 c14:	85d2                	mv	a1,s4
 c16:	b3bff0ef          	jal	750 <sprintf@plt>
 c1a:	0048                	add	a0,sp,4
 c1c:	b15ff0ef          	jal	730 <strlen@plt>
 c20:	0005059b          	sext.w	a1,a0
 c24:	0365c063          	blt	a1,s6,c44 <func0+0x94>
 c28:	4581                	li	a1,0
 c2a:	1502                	sll	a0,a0,0x20
 c2c:	9101                	srl	a0,a0,0x20
 c2e:	157d                	add	a0,a0,-1
 c30:	8656                	mv	a2,s5
 c32:	00064683          	lbu	a3,0(a2)
 c36:	9db5                	addw	a1,a1,a3
 c38:	fd05859b          	addw	a1,a1,-48
 c3c:	157d                	add	a0,a0,-1
 c3e:	0605                	add	a2,a2,1
 c40:	f96d                	bnez	a0,c32 <func0+0x82>
 c42:	a011                	j	c46 <func0+0x96>
 c44:	4581                	li	a1,0
 c46:	4090                	lw	a2,0(s1)
 c48:	00414503          	lbu	a0,4(sp)
 c4c:	f8c05fe3          	blez	a2,bea <func0+0x3a>
 c50:	952e                	add	a0,a0,a1
 c52:	fd050513          	add	a0,a0,-48
 c56:	bf71                	j	bf2 <func0+0x42>
 c58:	05705863          	blez	s7,ca8 <func0+0xf8>
 c5c:	4501                	li	a0,0
 c5e:	00498893          	add	a7,s3,4
 c62:	00490293          	add	t0,s2,4
 c66:	fffb8693          	add	a3,s7,-1
 c6a:	4805                	li	a6,1
 c6c:	a021                	j	c74 <func0+0xc4>
 c6e:	2505                	addw	a0,a0,1
 c70:	03755c63          	bge	a0,s7,ca8 <func0+0xf8>
 c74:	ff0b8de3          	beq	s7,a6,c6e <func0+0xbe>
 c78:	0009a703          	lw	a4,0(s3)
 c7c:	87b6                	mv	a5,a3
 c7e:	8616                	mv	a2,t0
 c80:	85c6                	mv	a1,a7
 c82:	a831                	j	c9e <func0+0xee>
 c84:	c198                	sw	a4,0(a1)
 c86:	fe95ae23          	sw	s1,-4(a1)
 c8a:	ffc62483          	lw	s1,-4(a2)
 c8e:	4200                	lw	s0,0(a2)
 c90:	c204                	sw	s1,0(a2)
 c92:	fe862e23          	sw	s0,-4(a2)
 c96:	0591                	add	a1,a1,4
 c98:	17fd                	add	a5,a5,-1
 c9a:	0611                	add	a2,a2,4
 c9c:	dbe9                	beqz	a5,c6e <func0+0xbe>
 c9e:	4184                	lw	s1,0(a1)
 ca0:	fee4c2e3          	blt	s1,a4,c84 <func0+0xd4>
 ca4:	8726                	mv	a4,s1
 ca6:	bfc5                	j	c96 <func0+0xe6>
 ca8:	854e                	mv	a0,s3
 caa:	ac7ff0ef          	jal	770 <free@plt>
 cae:	854a                	mv	a0,s2
 cb0:	60e6                	ld	ra,88(sp)
 cb2:	6446                	ld	s0,80(sp)
 cb4:	64a6                	ld	s1,72(sp)
 cb6:	6906                	ld	s2,64(sp)
 cb8:	79e2                	ld	s3,56(sp)
 cba:	7a42                	ld	s4,48(sp)
 cbc:	7aa2                	ld	s5,40(sp)
 cbe:	7b02                	ld	s6,32(sp)
 cc0:	6be2                	ld	s7,24(sp)
 cc2:	6c42                	ld	s8,16(sp)
 cc4:	6125                	add	sp,sp,96
 cc6:	8082                	ret
