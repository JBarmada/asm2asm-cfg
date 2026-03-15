0000000000000ab4 <func0>:
 ab4:	7119                	add	sp,sp,-128
 ab6:	fc86                	sd	ra,120(sp)
 ab8:	f8a2                	sd	s0,112(sp)
 aba:	f4a6                	sd	s1,104(sp)
 abc:	f0ca                	sd	s2,96(sp)
 abe:	ecce                	sd	s3,88(sp)
 ac0:	e8d2                	sd	s4,80(sp)
 ac2:	e4d6                	sd	s5,72(sp)
 ac4:	e0da                	sd	s6,64(sp)
 ac6:	fc5e                	sd	s7,56(sp)
 ac8:	f862                	sd	s8,48(sp)
 aca:	f466                	sd	s9,40(sp)
 acc:	f06a                	sd	s10,32(sp)
 ace:	ec6e                	sd	s11,24(sp)
 ad0:	e42e                	sd	a1,8(sp)
 ad2:	84aa                	mv	s1,a0
 ad4:	00010b23          	sb	zero,22(sp)
 ad8:	00011a23          	sh	zero,20(sp)
 adc:	c95ff0ef          	jal	770 <strlen@plt>
 ae0:	842a                	mv	s0,a0
 ae2:	0005099b          	sext.w	s3,a0
 ae6:	2509                	addw	a0,a0,2
 ae8:	c79ff0ef          	jal	760 <malloc@plt>
 aec:	892a                	mv	s2,a0
 aee:	85a6                	mv	a1,s1
 af0:	c91ff0ef          	jal	780 <strcpy@plt>
 af4:	854a                	mv	a0,s2
 af6:	c7bff0ef          	jal	770 <strlen@plt>
 afa:	954a                	add	a0,a0,s2
 afc:	000500a3          	sb	zero,1(a0)
 b00:	02000a13          	li	s4,32
 b04:	800005b7          	lui	a1,0x80000
 b08:	35f9                	addw	a1,a1,-2 # 7ffffffe <__global_pointer$+0x7fffd7fe>
 b0a:	01450023          	sb	s4,0(a0)
 b0e:	0f35ea63          	bltu	a1,s3,c02 <func0+0x14e>
 b12:	4c01                	li	s8,0
 b14:	4481                	li	s1,0
 b16:	4b81                	li	s7,0
 b18:	0014051b          	addw	a0,s0,1
 b1c:	1502                	sll	a0,a0,0x20
 b1e:	02055413          	srl	s0,a0,0x20
 b22:	06f00b13          	li	s6,111
 b26:	00000a97          	auipc	s5,0x0
 b2a:	217a8a93          	add	s5,s5,535 # d3d <_IO_stdin_used+0x10d>
 b2e:	01410c93          	add	s9,sp,20
 b32:	4d85                	li	s11,1
 b34:	89ca                	mv	s3,s2
 b36:	a01d                	j	b5c <func0+0xa8>
 b38:	4b91                	li	s7,4
 b3a:	002b9593          	sll	a1,s7,0x2
 b3e:	8562                	mv	a0,s8
 b40:	c71ff0ef          	jal	7b0 <realloc@plt>
 b44:	8c2a                	mv	s8,a0
 b46:	00249513          	sll	a0,s1,0x2
 b4a:	2485                	addw	s1,s1,1
 b4c:	9562                	add	a0,a0,s8
 b4e:	01b52023          	sw	s11,0(a0)
 b52:	00010a23          	sb	zero,20(sp)
 b56:	147d                	add	s0,s0,-1
 b58:	0985                	add	s3,s3,1
 b5a:	c455                	beqz	s0,c06 <func0+0x152>
 b5c:	0009cd03          	lbu	s10,0(s3)
 b60:	014d1c63          	bne	s10,s4,b78 <func0+0xc4>
 b64:	01415503          	lhu	a0,20(sp)
 b68:	05651163          	bne	a0,s6,baa <func0+0xf6>
 b6c:	03749963          	bne	s1,s7,b9e <func0+0xea>
 b70:	00904f63          	bgtz	s1,b8e <func0+0xda>
 b74:	4b91                	li	s7,4
 b76:	a831                	j	b92 <func0+0xde>
 b78:	0848                	add	a0,sp,20
 b7a:	bf7ff0ef          	jal	770 <strlen@plt>
 b7e:	fcadece3          	bltu	s11,a0,b56 <func0+0xa2>
 b82:	9566                	add	a0,a0,s9
 b84:	01a50023          	sb	s10,0(a0)
 b88:	000500a3          	sb	zero,1(a0)
 b8c:	b7e9                	j	b56 <func0+0xa2>
 b8e:	00149b9b          	sllw	s7,s1,0x1
 b92:	002b9593          	sll	a1,s7,0x2
 b96:	8562                	mv	a0,s8
 b98:	c19ff0ef          	jal	7b0 <realloc@plt>
 b9c:	8c2a                	mv	s8,a0
 b9e:	00249513          	sll	a0,s1,0x2
 ba2:	2485                	addw	s1,s1,1
 ba4:	9562                	add	a0,a0,s8
 ba6:	4591                	li	a1,4
 ba8:	c10c                	sw	a1,0(a0)
 baa:	0848                	add	a0,sp,20
 bac:	460d                	li	a2,3
 bae:	85d6                	mv	a1,s5
 bb0:	bf1ff0ef          	jal	7a0 <bcmp@plt>
 bb4:	2501                	sext.w	a0,a0
 bb6:	e50d                	bnez	a0,be0 <func0+0x12c>
 bb8:	01749e63          	bne	s1,s7,bd4 <func0+0x120>
 bbc:	01704463          	bgtz	s7,bc4 <func0+0x110>
 bc0:	4b91                	li	s7,4
 bc2:	a019                	j	bc8 <func0+0x114>
 bc4:	001b9b9b          	sllw	s7,s7,0x1
 bc8:	002b9593          	sll	a1,s7,0x2
 bcc:	8562                	mv	a0,s8
 bce:	be3ff0ef          	jal	7b0 <realloc@plt>
 bd2:	8c2a                	mv	s8,a0
 bd4:	00249513          	sll	a0,s1,0x2
 bd8:	2485                	addw	s1,s1,1
 bda:	9562                	add	a0,a0,s8
 bdc:	4589                	li	a1,2
 bde:	c10c                	sw	a1,0(a0)
 be0:	00000597          	auipc	a1,0x0
 be4:	0cb58593          	add	a1,a1,203 # cab <_IO_stdin_used+0x7b>
 be8:	0848                	add	a0,sp,20
 bea:	460d                	li	a2,3
 bec:	bb5ff0ef          	jal	7a0 <bcmp@plt>
 bf0:	2501                	sext.w	a0,a0
 bf2:	f125                	bnez	a0,b52 <func0+0x9e>
 bf4:	f57499e3          	bne	s1,s7,b46 <func0+0x92>
 bf8:	f57050e3          	blez	s7,b38 <func0+0x84>
 bfc:	001b9b9b          	sllw	s7,s7,0x1
 c00:	bf2d                	j	b3a <func0+0x86>
 c02:	4481                	li	s1,0
 c04:	4c01                	li	s8,0
 c06:	854a                	mv	a0,s2
 c08:	bb9ff0ef          	jal	7c0 <free@plt>
 c0c:	6522                	ld	a0,8(sp)
 c0e:	c104                	sw	s1,0(a0)
 c10:	8562                	mv	a0,s8
 c12:	70e6                	ld	ra,120(sp)
 c14:	7446                	ld	s0,112(sp)
 c16:	74a6                	ld	s1,104(sp)
 c18:	7906                	ld	s2,96(sp)
 c1a:	69e6                	ld	s3,88(sp)
 c1c:	6a46                	ld	s4,80(sp)
 c1e:	6aa6                	ld	s5,72(sp)
 c20:	6b06                	ld	s6,64(sp)
 c22:	7be2                	ld	s7,56(sp)
 c24:	7c42                	ld	s8,48(sp)
 c26:	7ca2                	ld	s9,40(sp)
 c28:	7d02                	ld	s10,32(sp)
 c2a:	6de2                	ld	s11,24(sp)
 c2c:	6109                	add	sp,sp,128
 c2e:	8082                	ret
