00000000000009dc <func0>:
 9dc:	716d                	add	sp,sp,-272
 9de:	e606                	sd	ra,264(sp)
 9e0:	e222                	sd	s0,256(sp)
 9e2:	fda6                	sd	s1,248(sp)
 9e4:	f9ca                	sd	s2,240(sp)
 9e6:	f5ce                	sd	s3,232(sp)
 9e8:	f1d2                	sd	s4,224(sp)
 9ea:	edd6                	sd	s5,216(sp)
 9ec:	84aa                	mv	s1,a0
 9ee:	00054603          	lbu	a2,0(a0)
 9f2:	02f00513          	li	a0,47
 9f6:	8aae                	mv	s5,a1
 9f8:	00a61563          	bne	a2,a0,a02 <func0+0x26>
 9fc:	4401                	li	s0,0
 9fe:	4581                	li	a1,0
 a00:	a015                	j	a24 <func0+0x48>
 a02:	4581                	li	a1,0
 a04:	00148693          	add	a3,s1,1
 a08:	07310713          	add	a4,sp,115
 a0c:	00b707b3          	add	a5,a4,a1
 a10:	00c78023          	sb	a2,0(a5)
 a14:	00b68633          	add	a2,a3,a1
 a18:	00064603          	lbu	a2,0(a2)
 a1c:	0585                	add	a1,a1,1
 a1e:	fea617e3          	bne	a2,a0,a0c <func0+0x30>
 a22:	842e                	mv	s0,a1
 a24:	557d                	li	a0,-1
 a26:	02055a13          	srl	s4,a0,0x20
 a2a:	07310513          	add	a0,sp,115
 a2e:	952e                	add	a0,a0,a1
 a30:	00050023          	sb	zero,0(a0)
 a34:	07310513          	add	a0,sp,115
 a38:	4629                	li	a2,10
 a3a:	4581                	li	a1,0
 a3c:	bf5ff0ef          	jal	630 <strtol@plt>
 a40:	0014059b          	addw	a1,s0,1
 a44:	1582                	sll	a1,a1,0x20
 a46:	9181                	srl	a1,a1,0x20
 a48:	95a6                	add	a1,a1,s1
 a4a:	0005c583          	lbu	a1,0(a1)
 a4e:	892a                	mv	s2,a0
 a50:	c595                	beqz	a1,a7c <func0+0xa0>
 a52:	4681                	li	a3,0
 a54:	02041513          	sll	a0,s0,0x20
 a58:	9101                	srl	a0,a0,0x20
 a5a:	9526                	add	a0,a0,s1
 a5c:	0509                	add	a0,a0,2
 a5e:	00e10613          	add	a2,sp,14
 a62:	00d60733          	add	a4,a2,a3
 a66:	00b70023          	sb	a1,0(a4)
 a6a:	00d505b3          	add	a1,a0,a3
 a6e:	0005c583          	lbu	a1,0(a1)
 a72:	0685                	add	a3,a3,1
 a74:	f5fd                	bnez	a1,a62 <func0+0x86>
 a76:	0146f533          	and	a0,a3,s4
 a7a:	a011                	j	a7e <func0+0xa2>
 a7c:	4501                	li	a0,0
 a7e:	00e10593          	add	a1,sp,14
 a82:	952e                	add	a0,a0,a1
 a84:	00050023          	sb	zero,0(a0)
 a88:	00e10513          	add	a0,sp,14
 a8c:	4629                	li	a2,10
 a8e:	4581                	li	a1,0
 a90:	ba1ff0ef          	jal	630 <strtol@plt>
 a94:	000ac603          	lbu	a2,0(s5)
 a98:	02f00593          	li	a1,47
 a9c:	89aa                	mv	s3,a0
 a9e:	00b61563          	bne	a2,a1,aa8 <func0+0xcc>
 aa2:	4401                	li	s0,0
 aa4:	4501                	li	a0,0
 aa6:	a015                	j	aca <func0+0xee>
 aa8:	4501                	li	a0,0
 aaa:	001a8693          	add	a3,s5,1
 aae:	07310713          	add	a4,sp,115
 ab2:	00a707b3          	add	a5,a4,a0
 ab6:	00c78023          	sb	a2,0(a5)
 aba:	00a68633          	add	a2,a3,a0
 abe:	00064603          	lbu	a2,0(a2)
 ac2:	0505                	add	a0,a0,1
 ac4:	feb617e3          	bne	a2,a1,ab2 <func0+0xd6>
 ac8:	842a                	mv	s0,a0
 aca:	07310593          	add	a1,sp,115
 ace:	952e                	add	a0,a0,a1
 ad0:	00050023          	sb	zero,0(a0)
 ad4:	07310513          	add	a0,sp,115
 ad8:	4629                	li	a2,10
 ada:	4581                	li	a1,0
 adc:	b55ff0ef          	jal	630 <strtol@plt>
 ae0:	0014059b          	addw	a1,s0,1
 ae4:	1582                	sll	a1,a1,0x20
 ae6:	9181                	srl	a1,a1,0x20
 ae8:	95d6                	add	a1,a1,s5
 aea:	0005c583          	lbu	a1,0(a1)
 aee:	84aa                	mv	s1,a0
 af0:	c595                	beqz	a1,b1c <func0+0x140>
 af2:	4681                	li	a3,0
 af4:	02041513          	sll	a0,s0,0x20
 af8:	9101                	srl	a0,a0,0x20
 afa:	9556                	add	a0,a0,s5
 afc:	0509                	add	a0,a0,2
 afe:	00e10613          	add	a2,sp,14
 b02:	00d60733          	add	a4,a2,a3
 b06:	00b70023          	sb	a1,0(a4)
 b0a:	00d505b3          	add	a1,a0,a3
 b0e:	0005c583          	lbu	a1,0(a1)
 b12:	0685                	add	a3,a3,1
 b14:	f5fd                	bnez	a1,b02 <func0+0x126>
 b16:	0146f533          	and	a0,a3,s4
 b1a:	a011                	j	b1e <func0+0x142>
 b1c:	4501                	li	a0,0
 b1e:	00e10593          	add	a1,sp,14
 b22:	952e                	add	a0,a0,a1
 b24:	00050023          	sb	zero,0(a0)
 b28:	00e10513          	add	a0,sp,14
 b2c:	4629                	li	a2,10
 b2e:	4581                	li	a1,0
 b30:	b01ff0ef          	jal	630 <strtol@plt>
 b34:	032485bb          	mulw	a1,s1,s2
 b38:	0335053b          	mulw	a0,a0,s3
 b3c:	02a5e53b          	remw	a0,a1,a0
 b40:	00153513          	seqz	a0,a0
 b44:	60b2                	ld	ra,264(sp)
 b46:	6412                	ld	s0,256(sp)
 b48:	74ee                	ld	s1,248(sp)
 b4a:	794e                	ld	s2,240(sp)
 b4c:	79ae                	ld	s3,232(sp)
 b4e:	7a0e                	ld	s4,224(sp)
 b50:	6aee                	ld	s5,216(sp)
 b52:	6151                	add	sp,sp,272
 b54:	8082                	ret
