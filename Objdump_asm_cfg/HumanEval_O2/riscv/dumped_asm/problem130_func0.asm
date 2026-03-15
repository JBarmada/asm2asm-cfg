0000000000000b08 <func0>:
 b08:	1101                	add	sp,sp,-32
 b0a:	ec06                	sd	ra,24(sp)
 b0c:	e822                	sd	s0,16(sp)
 b0e:	e426                	sd	s1,8(sp)
 b10:	e04a                	sd	s2,0(sp)
 b12:	8932                	mv	s2,a2
 b14:	0ab05f63          	blez	a1,bd2 <func0+0xca>
 b18:	4881                	li	a7,0
 b1a:	4805                	li	a6,1
 b1c:	a021                	j	b24 <func0+0x1c>
 b1e:	0885                	add	a7,a7,1
 b20:	02b88a63          	beq	a7,a1,b54 <func0+0x4c>
 b24:	00389613          	sll	a2,a7,0x3
 b28:	962a                	add	a2,a2,a0
 b2a:	6200                	ld	s0,0(a2)
 b2c:	4481                	li	s1,0
 b2e:	a809                	j	b40 <func0+0x38>
 b30:	0007831b          	sext.w	t1,a5
 b34:	0007029b          	sext.w	t0,a4
 b38:	0485                	add	s1,s1,1
 b3a:	0411                	add	s0,s0,4
 b3c:	fe9581e3          	beq	a1,s1,b1e <func0+0x16>
 b40:	4010                	lw	a2,0(s0)
 b42:	87c6                	mv	a5,a7
 b44:	01060363          	beq	a2,a6,b4a <func0+0x42>
 b48:	879a                	mv	a5,t1
 b4a:	8726                	mv	a4,s1
 b4c:	ff0602e3          	beq	a2,a6,b30 <func0+0x28>
 b50:	8716                	mv	a4,t0
 b52:	bff9                	j	b30 <func0+0x28>
 b54:	02b584bb          	mulw	s1,a1,a1
 b58:	00229793          	sll	a5,t0,0x2
 b5c:	00605e63          	blez	t1,b78 <func0+0x70>
 b60:	fff3061b          	addw	a2,t1,-1
 b64:	1602                	sll	a2,a2,0x20
 b66:	8275                	srl	a2,a2,0x1d
 b68:	962a                	add	a2,a2,a0
 b6a:	6210                	ld	a2,0(a2)
 b6c:	963e                	add	a2,a2,a5
 b6e:	4210                	lw	a2,0(a2)
 b70:	00964363          	blt	a2,s1,b76 <func0+0x6e>
 b74:	8626                	mv	a2,s1
 b76:	84b2                	mv	s1,a2
 b78:	35fd                	addw	a1,a1,-1
 b7a:	00b35d63          	bge	t1,a1,b94 <func0+0x8c>
 b7e:	0013061b          	addw	a2,t1,1
 b82:	060e                	sll	a2,a2,0x3
 b84:	962a                	add	a2,a2,a0
 b86:	6210                	ld	a2,0(a2)
 b88:	963e                	add	a2,a2,a5
 b8a:	4210                	lw	a2,0(a2)
 b8c:	00964363          	blt	a2,s1,b92 <func0+0x8a>
 b90:	8626                	mv	a2,s1
 b92:	84b2                	mv	s1,a2
 b94:	00331713          	sll	a4,t1,0x3
 b98:	00505f63          	blez	t0,bb6 <func0+0xae>
 b9c:	00e50633          	add	a2,a0,a4
 ba0:	6210                	ld	a2,0(a2)
 ba2:	fff2879b          	addw	a5,t0,-1
 ba6:	1782                	sll	a5,a5,0x20
 ba8:	83f9                	srl	a5,a5,0x1e
 baa:	963e                	add	a2,a2,a5
 bac:	4210                	lw	a2,0(a2)
 bae:	00964363          	blt	a2,s1,bb4 <func0+0xac>
 bb2:	8626                	mv	a2,s1
 bb4:	84b2                	mv	s1,a2
 bb6:	02b2d063          	bge	t0,a1,bd6 <func0+0xce>
 bba:	953a                	add	a0,a0,a4
 bbc:	6108                	ld	a0,0(a0)
 bbe:	0012859b          	addw	a1,t0,1
 bc2:	058a                	sll	a1,a1,0x2
 bc4:	952e                	add	a0,a0,a1
 bc6:	4108                	lw	a0,0(a0)
 bc8:	00954363          	blt	a0,s1,bce <func0+0xc6>
 bcc:	8526                	mv	a0,s1
 bce:	84aa                	mv	s1,a0
 bd0:	a019                	j	bd6 <func0+0xce>
 bd2:	02b584bb          	mulw	s1,a1,a1
 bd6:	0126a023          	sw	s2,0(a3)
 bda:	00291513          	sll	a0,s2,0x2
 bde:	a83ff0ef          	jal	660 <malloc@plt>
 be2:	03205063          	blez	s2,c02 <func0+0xfa>
 be6:	4581                	li	a1,0
 be8:	862a                	mv	a2,a0
 bea:	a031                	j	bf6 <func0+0xee>
 bec:	c214                	sw	a3,0(a2)
 bee:	0585                	add	a1,a1,1
 bf0:	0611                	add	a2,a2,4
 bf2:	00b90863          	beq	s2,a1,c02 <func0+0xfa>
 bf6:	0015f713          	and	a4,a1,1
 bfa:	4685                	li	a3,1
 bfc:	db65                	beqz	a4,bec <func0+0xe4>
 bfe:	86a6                	mv	a3,s1
 c00:	b7f5                	j	bec <func0+0xe4>
 c02:	60e2                	ld	ra,24(sp)
 c04:	6442                	ld	s0,16(sp)
 c06:	64a2                	ld	s1,8(sp)
 c08:	6902                	ld	s2,0(sp)
 c0a:	6105                	add	sp,sp,32
 c0c:	8082                	ret
