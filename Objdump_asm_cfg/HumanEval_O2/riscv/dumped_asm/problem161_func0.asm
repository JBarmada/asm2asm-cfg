0000000000000a0c <func0>:
 a0c:	711d                	add	sp,sp,-96
 a0e:	ec86                	sd	ra,88(sp)
 a10:	e8a2                	sd	s0,80(sp)
 a12:	e4a6                	sd	s1,72(sp)
 a14:	e0ca                	sd	s2,64(sp)
 a16:	fc4e                	sd	s3,56(sp)
 a18:	f852                	sd	s4,48(sp)
 a1a:	f456                	sd	s5,40(sp)
 a1c:	f05a                	sd	s6,32(sp)
 a1e:	ec5e                	sd	s7,24(sp)
 a20:	e862                	sd	s8,16(sp)
 a22:	e466                	sd	s9,8(sp)
 a24:	84b6                	mv	s1,a3
 a26:	89b2                	mv	s3,a2
 a28:	8a2e                	mv	s4,a1
 a2a:	892a                	mv	s2,a0
 a2c:	00269a93          	sll	s5,a3,0x2
 a30:	8556                	mv	a0,s5
 a32:	dbfff0ef          	jal	7f0 <malloc@plt>
 a36:	8b2a                	mv	s6,a0
 a38:	8556                	mv	a0,s5
 a3a:	db7ff0ef          	jal	7f0 <malloc@plt>
 a3e:	8caa                	mv	s9,a0
 a40:	00905e63          	blez	s1,a5c <func0+0x50>
 a44:	855a                	mv	a0,s6
 a46:	85d2                	mv	a1,s4
 a48:	8656                	mv	a2,s5
 a4a:	dc7ff0ef          	jal	810 <memcpy@plt>
 a4e:	4501                	li	a0,0
 a50:	85e6                	mv	a1,s9
 a52:	c188                	sw	a0,0(a1)
 a54:	0505                	add	a0,a0,1
 a56:	0591                	add	a1,a1,4
 a58:	fea49de3          	bne	s1,a0,a52 <func0+0x46>
 a5c:	1d305463          	blez	s3,c24 <func0+0x218>
 a60:	4a81                	li	s5,0
 a62:	00000a17          	auipc	s4,0x0
 a66:	1f2a0a13          	add	s4,s4,498 # c54 <_IO_stdin_used+0x4>
 a6a:	a03d                	j	a98 <func0+0x8c>
 a6c:	00249593          	sll	a1,s1,0x2
 a70:	00bb0bb3          	add	s7,s6,a1
 a74:	000ba583          	lw	a1,0(s7)
 a78:	050a                	sll	a0,a0,0x2
 a7a:	955a                	add	a0,a0,s6
 a7c:	4108                	lw	a0,0(a0)
 a7e:	d2058553          	fcvt.d.w	fa0,a1
 a82:	d20505d3          	fcvt.d.w	fa1,a0
 a86:	d7bff0ef          	jal	800 <pow@plt>
 a8a:	c2051553          	fcvt.w.d	a0,fa0,rtz
 a8e:	00aba023          	sw	a0,0(s7)
 a92:	c004                	sw	s1,0(s0)
 a94:	053a8c63          	beq	s5,s3,aec <func0+0xe0>
 a98:	003a9513          	sll	a0,s5,0x3
 a9c:	954a                	add	a0,a0,s2
 a9e:	6108                	ld	a0,0(a0)
 aa0:	85d2                	mv	a1,s4
 aa2:	d8fff0ef          	jal	830 <strcmp@plt>
 aa6:	c509                	beqz	a0,ab0 <func0+0xa4>
 aa8:	0a85                	add	s5,s5,1
 aaa:	ff3a97e3          	bne	s5,s3,a98 <func0+0x8c>
 aae:	a83d                	j	aec <func0+0xe0>
 ab0:	002a9513          	sll	a0,s5,0x2
 ab4:	9566                	add	a0,a0,s9
 ab6:	4104                	lw	s1,0(a0)
 ab8:	00249593          	sll	a1,s1,0x2
 abc:	95e6                	add	a1,a1,s9
 abe:	418c                	lw	a1,0(a1)
 ac0:	00958663          	beq	a1,s1,acc <func0+0xc0>
 ac4:	84ae                	mv	s1,a1
 ac6:	c10c                	sw	a1,0(a0)
 ac8:	058a                	sll	a1,a1,0x2
 aca:	bfcd                	j	abc <func0+0xb0>
 acc:	0a85                	add	s5,s5,1
 ace:	002a9513          	sll	a0,s5,0x2
 ad2:	00ac8433          	add	s0,s9,a0
 ad6:	4008                	lw	a0,0(s0)
 ad8:	00251593          	sll	a1,a0,0x2
 adc:	95e6                	add	a1,a1,s9
 ade:	418c                	lw	a1,0(a1)
 ae0:	f8a586e3          	beq	a1,a0,a6c <func0+0x60>
 ae4:	852e                	mv	a0,a1
 ae6:	c00c                	sw	a1,0(s0)
 ae8:	058a                	sll	a1,a1,0x2
 aea:	bfcd                	j	adc <func0+0xd0>
 aec:	13305c63          	blez	s3,c24 <func0+0x218>
 af0:	4c01                	li	s8,0
 af2:	00000a17          	auipc	s4,0x0
 af6:	163a0a13          	add	s4,s4,355 # c55 <_IO_stdin_used+0x5>
 afa:	00000a97          	auipc	s5,0x0
 afe:	1cfa8a93          	add	s5,s5,463 # cc9 <_IO_stdin_used+0x79>
 b02:	a021                	j	b0a <func0+0xfe>
 b04:	0c05                	add	s8,s8,1
 b06:	093c0163          	beq	s8,s3,b88 <func0+0x17c>
 b0a:	003c1513          	sll	a0,s8,0x3
 b0e:	954a                	add	a0,a0,s2
 b10:	6104                	ld	s1,0(a0)
 b12:	8526                	mv	a0,s1
 b14:	85d2                	mv	a1,s4
 b16:	d1bff0ef          	jal	830 <strcmp@plt>
 b1a:	8baa                	mv	s7,a0
 b1c:	c511                	beqz	a0,b28 <func0+0x11c>
 b1e:	8526                	mv	a0,s1
 b20:	85d6                	mv	a1,s5
 b22:	d0fff0ef          	jal	830 <strcmp@plt>
 b26:	fd79                	bnez	a0,b04 <func0+0xf8>
 b28:	002c1513          	sll	a0,s8,0x2
 b2c:	00ac85b3          	add	a1,s9,a0
 b30:	4188                	lw	a0,0(a1)
 b32:	00251613          	sll	a2,a0,0x2
 b36:	9666                	add	a2,a2,s9
 b38:	4210                	lw	a2,0(a2)
 b3a:	00a60663          	beq	a2,a0,b46 <func0+0x13a>
 b3e:	8532                	mv	a0,a2
 b40:	c190                	sw	a2,0(a1)
 b42:	060a                	sll	a2,a2,0x2
 b44:	bfcd                	j	b36 <func0+0x12a>
 b46:	0c05                	add	s8,s8,1
 b48:	002c1593          	sll	a1,s8,0x2
 b4c:	95e6                	add	a1,a1,s9
 b4e:	4190                	lw	a2,0(a1)
 b50:	00261693          	sll	a3,a2,0x2
 b54:	96e6                	add	a3,a3,s9
 b56:	4294                	lw	a3,0(a3)
 b58:	00c68663          	beq	a3,a2,b64 <func0+0x158>
 b5c:	8636                	mv	a2,a3
 b5e:	c194                	sw	a3,0(a1)
 b60:	068a                	sll	a3,a3,0x2
 b62:	bfcd                	j	b54 <func0+0x148>
 b64:	060a                	sll	a2,a2,0x2
 b66:	965a                	add	a2,a2,s6
 b68:	4214                	lw	a3,0(a2)
 b6a:	00251613          	sll	a2,a0,0x2
 b6e:	965a                	add	a2,a2,s6
 b70:	4218                	lw	a4,0(a2)
 b72:	000b8563          	beqz	s7,b7c <func0+0x170>
 b76:	02d746bb          	divw	a3,a4,a3
 b7a:	a019                	j	b80 <func0+0x174>
 b7c:	02d706bb          	mulw	a3,a4,a3
 b80:	c214                	sw	a3,0(a2)
 b82:	c188                	sw	a0,0(a1)
 b84:	f93c13e3          	bne	s8,s3,b0a <func0+0xfe>
 b88:	09305e63          	blez	s3,c24 <func0+0x218>
 b8c:	4c01                	li	s8,0
 b8e:	00000a17          	auipc	s4,0x0
 b92:	0c9a0a13          	add	s4,s4,201 # c57 <_IO_stdin_used+0x7>
 b96:	00000a97          	auipc	s5,0x0
 b9a:	109a8a93          	add	s5,s5,265 # c9f <_IO_stdin_used+0x4f>
 b9e:	a811                	j	bb2 <func0+0x1a6>
 ba0:	00251693          	sll	a3,a0,0x2
 ba4:	96da                	add	a3,a3,s6
 ba6:	4298                	lw	a4,0(a3)
 ba8:	9e39                	addw	a2,a2,a4
 baa:	c290                	sw	a2,0(a3)
 bac:	c188                	sw	a0,0(a1)
 bae:	073c0b63          	beq	s8,s3,c24 <func0+0x218>
 bb2:	003c1513          	sll	a0,s8,0x3
 bb6:	954a                	add	a0,a0,s2
 bb8:	6104                	ld	s1,0(a0)
 bba:	8526                	mv	a0,s1
 bbc:	85d2                	mv	a1,s4
 bbe:	c73ff0ef          	jal	830 <strcmp@plt>
 bc2:	8baa                	mv	s7,a0
 bc4:	c911                	beqz	a0,bd8 <func0+0x1cc>
 bc6:	8526                	mv	a0,s1
 bc8:	85d6                	mv	a1,s5
 bca:	c67ff0ef          	jal	830 <strcmp@plt>
 bce:	c509                	beqz	a0,bd8 <func0+0x1cc>
 bd0:	0c05                	add	s8,s8,1
 bd2:	ff3c10e3          	bne	s8,s3,bb2 <func0+0x1a6>
 bd6:	a0b9                	j	c24 <func0+0x218>
 bd8:	002c1513          	sll	a0,s8,0x2
 bdc:	00ac85b3          	add	a1,s9,a0
 be0:	4188                	lw	a0,0(a1)
 be2:	00251613          	sll	a2,a0,0x2
 be6:	9666                	add	a2,a2,s9
 be8:	4210                	lw	a2,0(a2)
 bea:	00a60663          	beq	a2,a0,bf6 <func0+0x1ea>
 bee:	8532                	mv	a0,a2
 bf0:	c190                	sw	a2,0(a1)
 bf2:	060a                	sll	a2,a2,0x2
 bf4:	bfcd                	j	be6 <func0+0x1da>
 bf6:	0c05                	add	s8,s8,1
 bf8:	002c1593          	sll	a1,s8,0x2
 bfc:	95e6                	add	a1,a1,s9
 bfe:	4190                	lw	a2,0(a1)
 c00:	00261693          	sll	a3,a2,0x2
 c04:	96e6                	add	a3,a3,s9
 c06:	4294                	lw	a3,0(a3)
 c08:	00c68663          	beq	a3,a2,c14 <func0+0x208>
 c0c:	8636                	mv	a2,a3
 c0e:	c194                	sw	a3,0(a1)
 c10:	068a                	sll	a3,a3,0x2
 c12:	bfcd                	j	c04 <func0+0x1f8>
 c14:	060a                	sll	a2,a2,0x2
 c16:	965a                	add	a2,a2,s6
 c18:	4210                	lw	a2,0(a2)
 c1a:	f80b83e3          	beqz	s7,ba0 <func0+0x194>
 c1e:	40c00633          	neg	a2,a2
 c22:	bfbd                	j	ba0 <func0+0x194>
 c24:	000b2483          	lw	s1,0(s6)
 c28:	855a                	mv	a0,s6
 c2a:	c17ff0ef          	jal	840 <free@plt>
 c2e:	8566                	mv	a0,s9
 c30:	c11ff0ef          	jal	840 <free@plt>
 c34:	8526                	mv	a0,s1
 c36:	60e6                	ld	ra,88(sp)
 c38:	6446                	ld	s0,80(sp)
 c3a:	64a6                	ld	s1,72(sp)
 c3c:	6906                	ld	s2,64(sp)
 c3e:	79e2                	ld	s3,56(sp)
 c40:	7a42                	ld	s4,48(sp)
 c42:	7aa2                	ld	s5,40(sp)
 c44:	7b02                	ld	s6,32(sp)
 c46:	6be2                	ld	s7,24(sp)
 c48:	6c42                	ld	s8,16(sp)
 c4a:	6ca2                	ld	s9,8(sp)
 c4c:	6125                	add	sp,sp,96
 c4e:	8082                	ret
