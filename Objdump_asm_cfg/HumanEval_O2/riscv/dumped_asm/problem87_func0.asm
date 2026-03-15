0000000000000a00 <func0>:
 a00:	7135                	add	sp,sp,-160
 a02:	ed06                	sd	ra,152(sp)
 a04:	e922                	sd	s0,144(sp)
 a06:	e526                	sd	s1,136(sp)
 a08:	e14a                	sd	s2,128(sp)
 a0a:	fcce                	sd	s3,120(sp)
 a0c:	f8d2                	sd	s4,112(sp)
 a0e:	f4d6                	sd	s5,104(sp)
 a10:	f0da                	sd	s6,96(sp)
 a12:	ecde                	sd	s7,88(sp)
 a14:	e8e2                	sd	s8,80(sp)
 a16:	e4e6                	sd	s9,72(sp)
 a18:	e0ea                	sd	s10,64(sp)
 a1a:	fc6e                	sd	s11,56(sp)
 a1c:	8a2a                	mv	s4,a0
 a1e:	d23ff0ef          	jal	740 <strlen@plt>
 a22:	89aa                	mv	s3,a0
 a24:	2509                	addw	a0,a0,2
 a26:	cfbff0ef          	jal	720 <malloc@plt>
 a2a:	02099593          	sll	a1,s3,0x20
 a2e:	892a                	mv	s2,a0
 a30:	4a81                	li	s5,0
 a32:	0c05c163          	bltz	a1,af4 <func0+0xf4>
 a36:	4d01                	li	s10,0
 a38:	4a81                	li	s5,0
 a3a:	4d81                	li	s11,0
 a3c:	0019851b          	addw	a0,s3,1
 a40:	1502                	sll	a0,a0,0x20
 a42:	02055993          	srl	s3,a0,0x20
 a46:	00610b13          	add	s6,sp,6
 a4a:	02000b93          	li	s7,32
 a4e:	4c09                	li	s8,2
 a50:	00510c93          	add	s9,sp,5
 a54:	a819                	j	a6a <func0+0x6a>
 a56:	001d851b          	addw	a0,s11,1
 a5a:	01bc8633          	add	a2,s9,s11
 a5e:	00b60023          	sb	a1,0(a2)
 a62:	0d05                	add	s10,s10,1
 a64:	8daa                	mv	s11,a0
 a66:	093d0763          	beq	s10,s3,af4 <func0+0xf4>
 a6a:	01aa0533          	add	a0,s4,s10
 a6e:	00054583          	lbu	a1,0(a0)
 a72:	0205e513          	or	a0,a1,32
 a76:	ff7510e3          	bne	a0,s7,a56 <func0+0x56>
 a7a:	058dc763          	blt	s11,s8,ac8 <func0+0xc8>
 a7e:	4581                	li	a1,0
 a80:	fffd851b          	addw	a0,s11,-1
 a84:	1502                	sll	a0,a0,0x20
 a86:	02055813          	srl	a6,a0,0x20
 a8a:	4605                	li	a2,1
 a8c:	845a                	mv	s0,s6
 a8e:	a029                	j	a98 <func0+0x98>
 a90:	0605                	add	a2,a2,1
 a92:	0405                	add	s0,s0,1
 a94:	03058a63          	beq	a1,a6,ac8 <func0+0xc8>
 a98:	86ae                	mv	a3,a1
 a9a:	0585                	add	a1,a1,1
 a9c:	ffb5fae3          	bgeu	a1,s11,a90 <func0+0x90>
 aa0:	00dc8733          	add	a4,s9,a3
 aa4:	87ee                	mv	a5,s11
 aa6:	86a2                	mv	a3,s0
 aa8:	a029                	j	ab2 <func0+0xb2>
 aaa:	17fd                	add	a5,a5,-1
 aac:	0685                	add	a3,a3,1
 aae:	fef601e3          	beq	a2,a5,a90 <func0+0x90>
 ab2:	00074503          	lbu	a0,0(a4)
 ab6:	0006c483          	lbu	s1,0(a3)
 aba:	fea4f8e3          	bgeu	s1,a0,aaa <func0+0xaa>
 abe:	00970023          	sb	s1,0(a4)
 ac2:	00a68023          	sb	a0,0(a3)
 ac6:	b7d5                	j	aaa <func0+0xaa>
 ac8:	01505763          	blez	s5,ad6 <func0+0xd6>
 acc:	01590533          	add	a0,s2,s5
 ad0:	2a85                	addw	s5,s5,1
 ad2:	01750023          	sb	s7,0(a0)
 ad6:	01b04463          	bgtz	s11,ade <func0+0xde>
 ada:	4501                	li	a0,0
 adc:	b759                	j	a62 <func0+0x62>
 ade:	01590533          	add	a0,s2,s5
 ae2:	00510593          	add	a1,sp,5
 ae6:	866e                	mv	a2,s11
 ae8:	c49ff0ef          	jal	730 <memcpy@plt>
 aec:	4501                	li	a0,0
 aee:	01ba8abb          	addw	s5,s5,s11
 af2:	bf85                	j	a62 <func0+0x62>
 af4:	01590533          	add	a0,s2,s5
 af8:	00050023          	sb	zero,0(a0)
 afc:	854a                	mv	a0,s2
 afe:	60ea                	ld	ra,152(sp)
 b00:	644a                	ld	s0,144(sp)
 b02:	64aa                	ld	s1,136(sp)
 b04:	690a                	ld	s2,128(sp)
 b06:	79e6                	ld	s3,120(sp)
 b08:	7a46                	ld	s4,112(sp)
 b0a:	7aa6                	ld	s5,104(sp)
 b0c:	7b06                	ld	s6,96(sp)
 b0e:	6be6                	ld	s7,88(sp)
 b10:	6c46                	ld	s8,80(sp)
 b12:	6ca6                	ld	s9,72(sp)
 b14:	6d06                	ld	s10,64(sp)
 b16:	7de2                	ld	s11,56(sp)
 b18:	610d                	add	sp,sp,160
 b1a:	8082                	ret
