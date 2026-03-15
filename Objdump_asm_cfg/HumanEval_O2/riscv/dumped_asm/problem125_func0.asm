0000000000000a50 <func0>:
 a50:	1101                	add	sp,sp,-32
 a52:	ec06                	sd	ra,24(sp)
 a54:	e822                	sd	s0,16(sp)
 a56:	842a                	mv	s0,a0
 a58:	c29ff0ef          	jal	680 <strlen@plt>
 a5c:	45a9                	li	a1,10
 a5e:	0ab51663          	bne	a0,a1,b0a <func0+0xba>
 a62:	00044503          	lbu	a0,0(s0)
 a66:	fc65059b          	addw	a1,a0,-58
 a6a:	0ff5f593          	zext.b	a1,a1
 a6e:	0f600613          	li	a2,246
 a72:	08c5ec63          	bltu	a1,a2,b0a <func0+0xba>
 a76:	00144583          	lbu	a1,1(s0)
 a7a:	fc65869b          	addw	a3,a1,-58
 a7e:	0ff6f693          	zext.b	a3,a3
 a82:	08c6e463          	bltu	a3,a2,b0a <func0+0xba>
 a86:	00244603          	lbu	a2,2(s0)
 a8a:	02d00693          	li	a3,45
 a8e:	06d61e63          	bne	a2,a3,b0a <func0+0xba>
 a92:	00344603          	lbu	a2,3(s0)
 a96:	fc66069b          	addw	a3,a2,-58
 a9a:	0ff6f693          	zext.b	a3,a3
 a9e:	0f600713          	li	a4,246
 aa2:	06e6e463          	bltu	a3,a4,b0a <func0+0xba>
 aa6:	00444683          	lbu	a3,4(s0)
 aaa:	fc66879b          	addw	a5,a3,-58
 aae:	0ff7f793          	zext.b	a5,a5
 ab2:	04e7ec63          	bltu	a5,a4,b0a <func0+0xba>
 ab6:	00544703          	lbu	a4,5(s0)
 aba:	02d00793          	li	a5,45
 abe:	04f71663          	bne	a4,a5,b0a <func0+0xba>
 ac2:	00640703          	lb	a4,6(s0)
 ac6:	fc67071b          	addw	a4,a4,-58
 aca:	0ff77793          	zext.b	a5,a4
 ace:	0f600713          	li	a4,246
 ad2:	02e7ec63          	bltu	a5,a4,b0a <func0+0xba>
 ad6:	00740783          	lb	a5,7(s0)
 ada:	fc67879b          	addw	a5,a5,-58
 ade:	0ff7f793          	zext.b	a5,a5
 ae2:	02e7e463          	bltu	a5,a4,b0a <func0+0xba>
 ae6:	00840703          	lb	a4,8(s0)
 aea:	fc67071b          	addw	a4,a4,-58
 aee:	0ff77793          	zext.b	a5,a4
 af2:	0f600713          	li	a4,246
 af6:	00e7ea63          	bltu	a5,a4,b0a <func0+0xba>
 afa:	00940783          	lb	a5,9(s0)
 afe:	fc67879b          	addw	a5,a5,-58
 b02:	0ff7f793          	zext.b	a5,a5
 b06:	00e7f763          	bgeu	a5,a4,b14 <func0+0xc4>
 b0a:	4501                	li	a0,0
 b0c:	60e2                	ld	ra,24(sp)
 b0e:	6442                	ld	s0,16(sp)
 b10:	6105                	add	sp,sp,32
 b12:	8082                	ret
 b14:	00a106a3          	sb	a0,13(sp)
 b18:	00b10723          	sb	a1,14(sp)
 b1c:	000107a3          	sb	zero,15(sp)
 b20:	00c10523          	sb	a2,10(sp)
 b24:	00d105a3          	sb	a3,11(sp)
 b28:	00010623          	sb	zero,12(sp)
 b2c:	00d10513          	add	a0,sp,13
 b30:	4629                	li	a2,10
 b32:	4581                	li	a1,0
 b34:	b3dff0ef          	jal	670 <strtol@plt>
 b38:	842a                	mv	s0,a0
 b3a:	00a10513          	add	a0,sp,10
 b3e:	4629                	li	a2,10
 b40:	4581                	li	a1,0
 b42:	b2fff0ef          	jal	670 <strtol@plt>
 b46:	85aa                	mv	a1,a0
 b48:	ff34051b          	addw	a0,s0,-13
 b4c:	ff453513          	sltiu	a0,a0,-12
 b50:	fe05861b          	addw	a2,a1,-32
 b54:	fe163613          	sltiu	a2,a2,-31
 b58:	8e49                	or	a2,a2,a0
 b5a:	4501                	li	a0,0
 b5c:	fa45                	bnez	a2,b0c <func0+0xbc>
 b5e:	2581                	sext.w	a1,a1
 b60:	ffd47513          	and	a0,s0,-3
 b64:	2501                	sext.w	a0,a0
 b66:	ffc50613          	add	a2,a0,-4
 b6a:	00163613          	seqz	a2,a2
 b6e:	155d                	add	a0,a0,-9
 b70:	00153513          	seqz	a0,a0
 b74:	8d51                	or	a0,a0,a2
 b76:	fe158613          	add	a2,a1,-31
 b7a:	00163613          	seqz	a2,a2
 b7e:	8e69                	and	a2,a2,a0
 b80:	4501                	li	a0,0
 b82:	f649                	bnez	a2,b0c <func0+0xbc>
 b84:	0004051b          	sext.w	a0,s0
 b88:	1579                	add	a0,a0,-2
 b8a:	00a03533          	snez	a0,a0
 b8e:	01e5b593          	sltiu	a1,a1,30
 b92:	8d4d                	or	a0,a0,a1
 b94:	bfa5                	j	b0c <func0+0xbc>
