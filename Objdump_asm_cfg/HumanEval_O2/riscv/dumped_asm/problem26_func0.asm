0000000000000a2c <func0>:
 a2c:	1101                	add	sp,sp,-32
 a2e:	ec06                	sd	ra,24(sp)
 a30:	e822                	sd	s0,16(sp)
 a32:	e426                	sd	s1,8(sp)
 a34:	84ae                	mv	s1,a1
 a36:	842a                	mv	s0,a0
 a38:	10000513          	li	a0,256
 a3c:	c25ff0ef          	jal	660 <malloc@plt>
 a40:	4611                	li	a2,4
 a42:	0004a023          	sw	zero,0(s1)
 a46:	4581                	li	a1,0
 a48:	02c45363          	bge	s0,a2,a6e <func0+0x42>
 a4c:	0004061b          	sext.w	a2,s0
 a50:	4685                	li	a3,1
 a52:	00c6d963          	bge	a3,a2,a64 <func0+0x38>
 a56:	0015861b          	addw	a2,a1,1
 a5a:	c090                	sw	a2,0(s1)
 a5c:	2581                	sext.w	a1,a1
 a5e:	058a                	sll	a1,a1,0x2
 a60:	95aa                	add	a1,a1,a0
 a62:	c180                	sw	s0,0(a1)
 a64:	60e2                	ld	ra,24(sp)
 a66:	6442                	ld	s0,16(sp)
 a68:	64a2                	ld	s1,8(sp)
 a6a:	6105                	add	sp,sp,32
 a6c:	8082                	ret
 a6e:	4609                	li	a2,2
 a70:	a801                	j	a80 <func0+0x54>
 a72:	2605                	addw	a2,a2,1
 a74:	02c606bb          	mulw	a3,a2,a2
 a78:	0004071b          	sext.w	a4,s0
 a7c:	fcd748e3          	blt	a4,a3,a4c <func0+0x20>
 a80:	02c466bb          	remw	a3,s0,a2
 a84:	f6fd                	bnez	a3,a72 <func0+0x46>
 a86:	2581                	sext.w	a1,a1
 a88:	00259693          	sll	a3,a1,0x2
 a8c:	96aa                	add	a3,a3,a0
 a8e:	02c4443b          	divw	s0,s0,a2
 a92:	0585                	add	a1,a1,1
 a94:	c290                	sw	a2,0(a3)
 a96:	02c4673b          	remw	a4,s0,a2
 a9a:	0691                	add	a3,a3,4
 a9c:	db6d                	beqz	a4,a8e <func0+0x62>
 a9e:	c08c                	sw	a1,0(s1)
 aa0:	bfc9                	j	a72 <func0+0x46>
