0000000000000b68 <func0>:
 b68:	7135                	add	sp,sp,-160
 b6a:	ed06                	sd	ra,152(sp)
 b6c:	e922                	sd	s0,144(sp)
 b6e:	e526                	sd	s1,136(sp)
 b70:	e14a                	sd	s2,128(sp)
 b72:	fcce                	sd	s3,120(sp)
 b74:	f8d2                	sd	s4,112(sp)
 b76:	89b6                	mv	s3,a3
 b78:	8932                	mv	s2,a2
 b7a:	84ae                	mv	s1,a1
 b7c:	842a                	mv	s0,a0
 b7e:	0028                	add	a0,sp,8
 b80:	06800613          	li	a2,104
 b84:	00810a13          	add	s4,sp,8
 b88:	4581                	li	a1,0
 b8a:	ab7ff0ef          	jal	640 <memset@plt>
 b8e:	4501                	li	a0,0
 b90:	02000593          	li	a1,32
 b94:	a011                	j	b98 <func0+0x30>
 b96:	0405                	add	s0,s0,1
 b98:	00044603          	lbu	a2,0(s0)
 b9c:	feb60de3          	beq	a2,a1,b96 <func0+0x2e>
 ba0:	ce11                	beqz	a2,bbc <func0+0x54>
 ba2:	060a                	sll	a2,a2,0x2
 ba4:	014606b3          	add	a3,a2,s4
 ba8:	e7c6a703          	lw	a4,-388(a3)
 bac:	0017061b          	addw	a2,a4,1
 bb0:	e6c6ae23          	sw	a2,-388(a3)
 bb4:	fea741e3          	blt	a4,a0,b96 <func0+0x2e>
 bb8:	8532                	mv	a0,a2
 bba:	bff1                	j	b96 <func0+0x2e>
 bbc:	4581                	li	a1,0
 bbe:	4681                	li	a3,0
 bc0:	00810813          	add	a6,sp,8
 bc4:	06800793          	li	a5,104
 bc8:	a029                	j	bd2 <func0+0x6a>
 bca:	0591                	add	a1,a1,4
 bcc:	2605                	addw	a2,a2,1
 bce:	02f58263          	beq	a1,a5,bf2 <func0+0x8a>
 bd2:	00b80433          	add	s0,a6,a1
 bd6:	4000                	lw	s0,0(s0)
 bd8:	00b48733          	add	a4,s1,a1
 bdc:	c300                	sw	s0,0(a4)
 bde:	fea416e3          	bne	s0,a0,bca <func0+0x62>
 be2:	0616071b          	addw	a4,a2,97
 be6:	00d98433          	add	s0,s3,a3
 bea:	2685                	addw	a3,a3,1
 bec:	00e40023          	sb	a4,0(s0)
 bf0:	bfe9                	j	bca <func0+0x62>
 bf2:	00a92023          	sw	a0,0(s2)
 bf6:	00d98533          	add	a0,s3,a3
 bfa:	00050023          	sb	zero,0(a0)
 bfe:	60ea                	ld	ra,152(sp)
 c00:	644a                	ld	s0,144(sp)
 c02:	64aa                	ld	s1,136(sp)
 c04:	690a                	ld	s2,128(sp)
 c06:	79e6                	ld	s3,120(sp)
 c08:	7a46                	ld	s4,112(sp)
 c0a:	610d                	add	sp,sp,160
 c0c:	8082                	ret
