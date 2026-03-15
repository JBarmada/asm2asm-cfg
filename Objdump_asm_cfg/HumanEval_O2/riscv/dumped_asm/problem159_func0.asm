0000000000000de0 <func0>:
 de0:	710d                	add	sp,sp,-352
 de2:	ee86                	sd	ra,344(sp)
 de4:	eaa2                	sd	s0,336(sp)
 de6:	e6a6                	sd	s1,328(sp)
 de8:	e2ca                	sd	s2,320(sp)
 dea:	fe4e                	sd	s3,312(sp)
 dec:	fa52                	sd	s4,304(sp)
 dee:	f656                	sd	s5,296(sp)
 df0:	f25a                	sd	s6,288(sp)
 df2:	ee5e                	sd	s7,280(sp)
 df4:	ea62                	sd	s8,272(sp)
 df6:	e666                	sd	s9,264(sp)
 df8:	08b05863          	blez	a1,e88 <func0+0xa8>
 dfc:	8a2e                	mv	s4,a1
 dfe:	89aa                	mv	s3,a0
 e00:	4c01                	li	s8,0
 e02:	4b01                	li	s6,0
 e04:	00000917          	auipc	s2,0x0
 e08:	0ff90913          	add	s2,s2,255 # f03 <_IO_stdin_used+0x57>
 e0c:	00810b93          	add	s7,sp,8
 e10:	a031                	j	e1c <func0+0x3c>
 e12:	8b66                	mv	s6,s9
 e14:	8956                	mv	s2,s5
 e16:	0c05                	add	s8,s8,1
 e18:	074c0c63          	beq	s8,s4,e90 <func0+0xb0>
 e1c:	0028                	add	a0,sp,8
 e1e:	10000613          	li	a2,256
 e22:	4581                	li	a1,0
 e24:	bfdff0ef          	jal	a20 <memset@plt>
 e28:	003c1513          	sll	a0,s8,0x3
 e2c:	954e                	add	a0,a0,s3
 e2e:	00053a83          	ld	s5,0(a0)
 e32:	000ac483          	lbu	s1,0(s5)
 e36:	cc8d                	beqz	s1,e70 <func0+0x90>
 e38:	4c81                	li	s9,0
 e3a:	001a8413          	add	s0,s5,1
 e3e:	a029                	j	e48 <func0+0x68>
 e40:	00044483          	lbu	s1,0(s0)
 e44:	0405                	add	s0,s0,1
 e46:	c495                	beqz	s1,e72 <func0+0x92>
 e48:	0ff4f593          	zext.b	a1,s1
 e4c:	0028                	add	a0,sp,8
 e4e:	b93ff0ef          	jal	9e0 <strchr@plt>
 e52:	f57d                	bnez	a0,e40 <func0+0x60>
 e54:	0028                	add	a0,sp,8
 e56:	b9bff0ef          	jal	9f0 <strlen@plt>
 e5a:	0005059b          	sext.w	a1,a0
 e5e:	95de                	add	a1,a1,s7
 e60:	00958023          	sb	s1,0(a1)
 e64:	2505                	addw	a0,a0,1
 e66:	955e                	add	a0,a0,s7
 e68:	00050023          	sb	zero,0(a0)
 e6c:	2c85                	addw	s9,s9,1
 e6e:	bfc9                	j	e40 <func0+0x60>
 e70:	4c81                	li	s9,0
 e72:	fb9b40e3          	blt	s6,s9,e12 <func0+0x32>
 e76:	fb6c90e3          	bne	s9,s6,e16 <func0+0x36>
 e7a:	8556                	mv	a0,s5
 e7c:	85ca                	mv	a1,s2
 e7e:	b93ff0ef          	jal	a10 <strcmp@plt>
 e82:	f80548e3          	bltz	a0,e12 <func0+0x32>
 e86:	bf41                	j	e16 <func0+0x36>
 e88:	00000917          	auipc	s2,0x0
 e8c:	07b90913          	add	s2,s2,123 # f03 <_IO_stdin_used+0x57>
 e90:	854a                	mv	a0,s2
 e92:	60f6                	ld	ra,344(sp)
 e94:	6456                	ld	s0,336(sp)
 e96:	64b6                	ld	s1,328(sp)
 e98:	6916                	ld	s2,320(sp)
 e9a:	79f2                	ld	s3,312(sp)
 e9c:	7a52                	ld	s4,304(sp)
 e9e:	7ab2                	ld	s5,296(sp)
 ea0:	7b12                	ld	s6,288(sp)
 ea2:	6bf2                	ld	s7,280(sp)
 ea4:	6c52                	ld	s8,272(sp)
 ea6:	6cb2                	ld	s9,264(sp)
 ea8:	6135                	add	sp,sp,352
 eaa:	8082                	ret
