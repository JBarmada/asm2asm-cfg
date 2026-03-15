0000000000000978 <func0>:
 978:	7119                	add	sp,sp,-128
 97a:	fc86                	sd	ra,120(sp)
 97c:	f8a2                	sd	s0,112(sp)
 97e:	f4a6                	sd	s1,104(sp)
 980:	f0ca                	sd	s2,96(sp)
 982:	ecce                	sd	s3,88(sp)
 984:	e8d2                	sd	s4,80(sp)
 986:	e4d6                	sd	s5,72(sp)
 988:	e0da                	sd	s6,64(sp)
 98a:	fc5e                	sd	s7,56(sp)
 98c:	f862                	sd	s8,48(sp)
 98e:	f466                	sd	s9,40(sp)
 990:	f06a                	sd	s10,32(sp)
 992:	ec6e                	sd	s11,24(sp)
 994:	8b2a                	mv	s6,a0
 996:	dabff0ef          	jal	740 <strlen@plt>
 99a:	892a                	mv	s2,a0
 99c:	0015151b          	sllw	a0,a0,0x1
 9a0:	e82a                	sd	a0,16(sp)
 9a2:	00156513          	or	a0,a0,1
 9a6:	d8bff0ef          	jal	730 <malloc@plt>
 9aa:	89aa                	mv	s3,a0
 9ac:	0e050d63          	beqz	a0,aa6 <func0+0x12e>
 9b0:	00090a9b          	sext.w	s5,s2
 9b4:	0b505463          	blez	s5,a5c <func0+0xe4>
 9b8:	4401                	li	s0,0
 9ba:	557d                	li	a0,-1
 9bc:	02051493          	sll	s1,a0,0x20
 9c0:	9101                	srl	a0,a0,0x20
 9c2:	e02a                	sd	a0,0(sp)
 9c4:	02091513          	sll	a0,s2,0x20
 9c8:	02055c93          	srl	s9,a0,0x20
 9cc:	e42a                	sd	a0,8(sp)
 9ce:	00950d33          	add	s10,a0,s1
 9d2:	01598db3          	add	s11,s3,s5
 9d6:	4b89                	li	s7,2
 9d8:	8c5a                	mv	s8,s6
 9da:	a821                	j	9f2 <func0+0x7a>
 9dc:	01540533          	add	a0,s0,s5
 9e0:	954e                	add	a0,a0,s3
 9e2:	00050023          	sb	zero,0(a0)
 9e6:	0c0a0063          	beqz	s4,aa6 <func0+0x12e>
 9ea:	0405                	add	s0,s0,1
 9ec:	0c05                	add	s8,s8,1
 9ee:	07940e63          	beq	s0,s9,a6a <func0+0xf2>
 9f2:	408a85b3          	sub	a1,s5,s0
 9f6:	0375ce63          	blt	a1,s7,a32 <func0+0xba>
 9fa:	4501                	li	a0,0
 9fc:	01f5d61b          	srlw	a2,a1,0x1f
 a00:	9db1                	addw	a1,a1,a2
 a02:	4015d59b          	sraw	a1,a1,0x1
 a06:	02059613          	sll	a2,a1,0x20
 a0a:	9201                	srl	a2,a2,0x20
 a0c:	86ea                	mv	a3,s10
 a0e:	00ac0733          	add	a4,s8,a0
 a12:	00074703          	lbu	a4,0(a4)
 a16:	4206d793          	sra	a5,a3,0x20
 a1a:	97da                	add	a5,a5,s6
 a1c:	0007c783          	lbu	a5,0(a5)
 a20:	fcf715e3          	bne	a4,a5,9ea <func0+0x72>
 a24:	0505                	add	a0,a0,1
 a26:	96a6                	add	a3,a3,s1
 a28:	fea613e3          	bne	a2,a0,a0e <func0+0x96>
 a2c:	00b52a33          	slt	s4,a0,a1
 a30:	a011                	j	a34 <func0+0xbc>
 a32:	4a01                	li	s4,0
 a34:	854e                	mv	a0,s3
 a36:	85da                	mv	a1,s6
 a38:	8656                	mv	a2,s5
 a3a:	cd7ff0ef          	jal	710 <strncpy@plt>
 a3e:	dc59                	beqz	s0,9dc <func0+0x64>
 a40:	4501                	li	a0,0
 a42:	85ee                	mv	a1,s11
 a44:	00ac0633          	add	a2,s8,a0
 a48:	fff60603          	lb	a2,-1(a2)
 a4c:	00c58023          	sb	a2,0(a1)
 a50:	157d                	add	a0,a0,-1
 a52:	00a40633          	add	a2,s0,a0
 a56:	0585                	add	a1,a1,1
 a58:	f675                	bnez	a2,a44 <func0+0xcc>
 a5a:	b749                	j	9dc <func0+0x64>
 a5c:	854e                	mv	a0,s3
 a5e:	85da                	mv	a1,s6
 a60:	8656                	mv	a2,s5
 a62:	cafff0ef          	jal	710 <strncpy@plt>
 a66:	6742                	ld	a4,16(sp)
 a68:	a81d                	j	a9e <func0+0x126>
 a6a:	854e                	mv	a0,s3
 a6c:	85da                	mv	a1,s6
 a6e:	8656                	mv	a2,s5
 a70:	ca1ff0ef          	jal	710 <strncpy@plt>
 a74:	6742                	ld	a4,16(sp)
 a76:	03505463          	blez	s5,a9e <func0+0x126>
 a7a:	6502                	ld	a0,0(sp)
 a7c:	00a97533          	and	a0,s2,a0
 a80:	65a2                	ld	a1,8(sp)
 a82:	95a6                	add	a1,a1,s1
 a84:	01598633          	add	a2,s3,s5
 a88:	4205d693          	sra	a3,a1,0x20
 a8c:	96da                	add	a3,a3,s6
 a8e:	00068683          	lb	a3,0(a3)
 a92:	00d60023          	sb	a3,0(a2)
 a96:	95a6                	add	a1,a1,s1
 a98:	157d                	add	a0,a0,-1
 a9a:	0605                	add	a2,a2,1
 a9c:	f575                	bnez	a0,a88 <func0+0x110>
 a9e:	00e98533          	add	a0,s3,a4
 aa2:	00050023          	sb	zero,0(a0)
 aa6:	854e                	mv	a0,s3
 aa8:	70e6                	ld	ra,120(sp)
 aaa:	7446                	ld	s0,112(sp)
 aac:	74a6                	ld	s1,104(sp)
 aae:	7906                	ld	s2,96(sp)
 ab0:	69e6                	ld	s3,88(sp)
 ab2:	6a46                	ld	s4,80(sp)
 ab4:	6aa6                	ld	s5,72(sp)
 ab6:	6b06                	ld	s6,64(sp)
 ab8:	7be2                	ld	s7,56(sp)
 aba:	7c42                	ld	s8,48(sp)
 abc:	7ca2                	ld	s9,40(sp)
 abe:	7d02                	ld	s10,32(sp)
 ac0:	6de2                	ld	s11,24(sp)
 ac2:	6109                	add	sp,sp,128
 ac4:	8082                	ret
