0000000000000a44 <func0>:
 a44:	1101                	add	sp,sp,-32
 a46:	ec06                	sd	ra,24(sp)
 a48:	e822                	sd	s0,16(sp)
 a4a:	e426                	sd	s1,8(sp)
 a4c:	84ae                	mv	s1,a1
 a4e:	842a                	mv	s0,a0
 a50:	da1ff0ef          	jal	7f0 <strlen@plt>
 a54:	cd15                	beqz	a0,a90 <func0+0x4c>
 a56:	fb400593          	li	a1,-76
 a5a:	c099                	beqz	s1,a60 <func0+0x1c>
 a5c:	fa400593          	li	a1,-92
 a60:	4ec4f637          	lui	a2,0x4ec4f
 a64:	c4f6061b          	addw	a2,a2,-945 # 4ec4ec4f <__global_pointer$+0x4ec4c44f>
 a68:	46e9                	li	a3,26
 a6a:	00044703          	lbu	a4,0(s0)
 a6e:	972e                	add	a4,a4,a1
 a70:	02c707b3          	mul	a5,a4,a2
 a74:	03f7d493          	srl	s1,a5,0x3f
 a78:	938d                	srl	a5,a5,0x23
 a7a:	9fa5                	addw	a5,a5,s1
 a7c:	02d787bb          	mulw	a5,a5,a3
 a80:	9f1d                	subw	a4,a4,a5
 a82:	0617071b          	addw	a4,a4,97
 a86:	00e40023          	sb	a4,0(s0)
 a8a:	157d                	add	a0,a0,-1
 a8c:	0405                	add	s0,s0,1
 a8e:	fd71                	bnez	a0,a6a <func0+0x26>
 a90:	60e2                	ld	ra,24(sp)
 a92:	6442                	ld	s0,16(sp)
 a94:	64a2                	ld	s1,8(sp)
 a96:	6105                	add	sp,sp,32
 a98:	8082                	ret
