0000000000000aac <func0>:
 aac:	715d                	add	sp,sp,-80
 aae:	e486                	sd	ra,72(sp)
 ab0:	e0a2                	sd	s0,64(sp)
 ab2:	fc26                	sd	s1,56(sp)
 ab4:	f84a                	sd	s2,48(sp)
 ab6:	f44e                	sd	s3,40(sp)
 ab8:	f052                	sd	s4,32(sp)
 aba:	ec56                	sd	s5,24(sp)
 abc:	e85a                	sd	s6,16(sp)
 abe:	e45e                	sd	s7,8(sp)
 ac0:	e062                	sd	s8,0(sp)
 ac2:	8932                	mv	s2,a2
 ac4:	8aae                	mv	s5,a1
 ac6:	842a                	mv	s0,a0
 ac8:	00000497          	auipc	s1,0x0
 acc:	22648493          	add	s1,s1,550 # cee <_IO_stdin_used+0x6a>
 ad0:	8526                	mv	a0,s1
 ad2:	85a2                	mv	a1,s0
 ad4:	bedff0ef          	jal	6c0 <strcmp@plt>
 ad8:	8a2a                	mv	s4,a0
 ada:	8526                	mv	a0,s1
 adc:	85d6                	mv	a1,s5
 ade:	be3ff0ef          	jal	6c0 <strcmp@plt>
 ae2:	89aa                	mv	s3,a0
 ae4:	00000497          	auipc	s1,0x0
 ae8:	1fe48493          	add	s1,s1,510 # ce2 <_IO_stdin_used+0x5e>
 aec:	8526                	mv	a0,s1
 aee:	85a2                	mv	a1,s0
 af0:	bd1ff0ef          	jal	6c0 <strcmp@plt>
 af4:	4b05                	li	s6,1
 af6:	4b85                	li	s7,1
 af8:	c509                	beqz	a0,b02 <func0+0x56>
 afa:	01403533          	snez	a0,s4
 afe:	40a00bbb          	negw	s7,a0
 b02:	8526                	mv	a0,s1
 b04:	85d6                	mv	a1,s5
 b06:	bbbff0ef          	jal	6c0 <strcmp@plt>
 b0a:	c509                	beqz	a0,b14 <func0+0x68>
 b0c:	01303533          	snez	a0,s3
 b10:	40a00b3b          	negw	s6,a0
 b14:	00000497          	auipc	s1,0x0
 b18:	1d448493          	add	s1,s1,468 # ce8 <_IO_stdin_used+0x64>
 b1c:	8526                	mv	a0,s1
 b1e:	85a2                	mv	a1,s0
 b20:	ba1ff0ef          	jal	6c0 <strcmp@plt>
 b24:	4989                	li	s3,2
 b26:	4c09                	li	s8,2
 b28:	c111                	beqz	a0,b2c <func0+0x80>
 b2a:	8c5e                	mv	s8,s7
 b2c:	8526                	mv	a0,s1
 b2e:	85d6                	mv	a1,s5
 b30:	b91ff0ef          	jal	6c0 <strcmp@plt>
 b34:	c111                	beqz	a0,b38 <func0+0x8c>
 b36:	89da                	mv	s3,s6
 b38:	00000497          	auipc	s1,0x0
 b3c:	1dd48493          	add	s1,s1,477 # d15 <_IO_stdin_used+0x91>
 b40:	8526                	mv	a0,s1
 b42:	85a2                	mv	a1,s0
 b44:	b7dff0ef          	jal	6c0 <strcmp@plt>
 b48:	4a0d                	li	s4,3
 b4a:	4b0d                	li	s6,3
 b4c:	c111                	beqz	a0,b50 <func0+0xa4>
 b4e:	8b62                	mv	s6,s8
 b50:	8526                	mv	a0,s1
 b52:	85d6                	mv	a1,s5
 b54:	b6dff0ef          	jal	6c0 <strcmp@plt>
 b58:	c111                	beqz	a0,b5c <func0+0xb0>
 b5a:	8a4e                	mv	s4,s3
 b5c:	00000497          	auipc	s1,0x0
 b60:	13a48493          	add	s1,s1,314 # c96 <_IO_stdin_used+0x12>
 b64:	8526                	mv	a0,s1
 b66:	85a2                	mv	a1,s0
 b68:	b59ff0ef          	jal	6c0 <strcmp@plt>
 b6c:	4991                	li	s3,4
 b6e:	4b91                	li	s7,4
 b70:	c111                	beqz	a0,b74 <func0+0xc8>
 b72:	8bda                	mv	s7,s6
 b74:	8526                	mv	a0,s1
 b76:	85d6                	mv	a1,s5
 b78:	b49ff0ef          	jal	6c0 <strcmp@plt>
 b7c:	c111                	beqz	a0,b80 <func0+0xd4>
 b7e:	89d2                	mv	s3,s4
 b80:	00000497          	auipc	s1,0x0
 b84:	10848493          	add	s1,s1,264 # c88 <_IO_stdin_used+0x4>
 b88:	8526                	mv	a0,s1
 b8a:	85a2                	mv	a1,s0
 b8c:	b35ff0ef          	jal	6c0 <strcmp@plt>
 b90:	4a15                	li	s4,5
 b92:	4b15                	li	s6,5
 b94:	c111                	beqz	a0,b98 <func0+0xec>
 b96:	8b5e                	mv	s6,s7
 b98:	8526                	mv	a0,s1
 b9a:	85d6                	mv	a1,s5
 b9c:	b25ff0ef          	jal	6c0 <strcmp@plt>
 ba0:	c111                	beqz	a0,ba4 <func0+0xf8>
 ba2:	8a4e                	mv	s4,s3
 ba4:	00000497          	auipc	s1,0x0
 ba8:	0eb48493          	add	s1,s1,235 # c8f <_IO_stdin_used+0xb>
 bac:	8526                	mv	a0,s1
 bae:	85a2                	mv	a1,s0
 bb0:	b11ff0ef          	jal	6c0 <strcmp@plt>
 bb4:	4999                	li	s3,6
 bb6:	4b99                	li	s7,6
 bb8:	c111                	beqz	a0,bbc <func0+0x110>
 bba:	8bda                	mv	s7,s6
 bbc:	8526                	mv	a0,s1
 bbe:	85d6                	mv	a1,s5
 bc0:	b01ff0ef          	jal	6c0 <strcmp@plt>
 bc4:	c111                	beqz	a0,bc8 <func0+0x11c>
 bc6:	89d2                	mv	s3,s4
 bc8:	00000497          	auipc	s1,0x0
 bcc:	0d648493          	add	s1,s1,214 # c9e <_IO_stdin_used+0x1a>
 bd0:	8526                	mv	a0,s1
 bd2:	85a2                	mv	a1,s0
 bd4:	aedff0ef          	jal	6c0 <strcmp@plt>
 bd8:	4a1d                	li	s4,7
 bda:	441d                	li	s0,7
 bdc:	c111                	beqz	a0,be0 <func0+0x134>
 bde:	845e                	mv	s0,s7
 be0:	8526                	mv	a0,s1
 be2:	85d6                	mv	a1,s5
 be4:	addff0ef          	jal	6c0 <strcmp@plt>
 be8:	c111                	beqz	a0,bec <func0+0x140>
 bea:	8a4e                	mv	s4,s3
 bec:	00140513          	add	a0,s0,1
 bf0:	00153513          	seqz	a0,a0
 bf4:	001a0593          	add	a1,s4,1
 bf8:	0015b593          	seqz	a1,a1
 bfc:	8d4d                	or	a0,a0,a1
 bfe:	014445b3          	xor	a1,s0,s4
 c02:	0015b593          	seqz	a1,a1
 c06:	8d4d                	or	a0,a0,a1
 c08:	ed39                	bnez	a0,c66 <func0+0x1ba>
 c0a:	84a2                	mv	s1,s0
 c0c:	008a4363          	blt	s4,s0,c12 <func0+0x166>
 c10:	84d2                	mv	s1,s4
 c12:	01444363          	blt	s0,s4,c18 <func0+0x16c>
 c16:	8452                	mv	s0,s4
 c18:	fff44513          	not	a0,s0
 c1c:	9d25                	addw	a0,a0,s1
 c1e:	00a92023          	sw	a0,0(s2)
 c22:	04a05263          	blez	a0,c66 <func0+0x1ba>
 c26:	050e                	sll	a0,a0,0x3
 c28:	a79ff0ef          	jal	6a0 <malloc@plt>
 c2c:	0014059b          	addw	a1,s0,1
 c30:	0295fe63          	bgeu	a1,s1,c6c <func0+0x1c0>
 c34:	1582                	sll	a1,a1,0x20
 c36:	0205d613          	srl	a2,a1,0x20
 c3a:	01e5d693          	srl	a3,a1,0x1e
 c3e:	00000597          	auipc	a1,0x0
 c42:	14258593          	add	a1,a1,322 # d80 <_IO_stdin_used+0xfc>
 c46:	96ae                	add	a3,a3,a1
 c48:	8722                	mv	a4,s0
 c4a:	429c                	lw	a5,0(a3)
 c4c:	97ae                	add	a5,a5,a1
 c4e:	9f01                	subw	a4,a4,s0
 c50:	070e                	sll	a4,a4,0x3
 c52:	972a                	add	a4,a4,a0
 c54:	e31c                	sd	a5,0(a4)
 c56:	8732                	mv	a4,a2
 c58:	0016079b          	addw	a5,a2,1
 c5c:	0605                	add	a2,a2,1
 c5e:	0691                	add	a3,a3,4
 c60:	fef495e3          	bne	s1,a5,c4a <func0+0x19e>
 c64:	a021                	j	c6c <func0+0x1c0>
 c66:	4501                	li	a0,0
 c68:	00092023          	sw	zero,0(s2)
 c6c:	60a6                	ld	ra,72(sp)
 c6e:	6406                	ld	s0,64(sp)
 c70:	74e2                	ld	s1,56(sp)
 c72:	7942                	ld	s2,48(sp)
 c74:	79a2                	ld	s3,40(sp)
 c76:	7a02                	ld	s4,32(sp)
 c78:	6ae2                	ld	s5,24(sp)
 c7a:	6b42                	ld	s6,16(sp)
 c7c:	6ba2                	ld	s7,8(sp)
 c7e:	6c02                	ld	s8,0(sp)
 c80:	6161                	add	sp,sp,80
 c82:	8082                	ret
