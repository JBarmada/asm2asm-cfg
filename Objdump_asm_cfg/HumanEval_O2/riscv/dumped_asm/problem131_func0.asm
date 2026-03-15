0000000000000b88 <func0>:
 b88:	1101                	add	sp,sp,-32
 b8a:	ec06                	sd	ra,24(sp)
 b8c:	e822                	sd	s0,16(sp)
 b8e:	e426                	sd	s1,8(sp)
 b90:	842a                	mv	s0,a0
 b92:	0015049b          	addw	s1,a0,1
 b96:	00249513          	sll	a0,s1,0x2
 b9a:	ac7ff0ef          	jal	660 <malloc@plt>
 b9e:	4585                	li	a1,1
 ba0:	c10c                	sw	a1,0(a0)
 ba2:	c411                	beqz	s0,bae <func0+0x26>
 ba4:	460d                	li	a2,3
 ba6:	4589                	li	a1,2
 ba8:	c150                	sw	a2,4(a0)
 baa:	00b45763          	bge	s0,a1,bb8 <func0+0x30>
 bae:	60e2                	ld	ra,24(sp)
 bb0:	6442                	ld	s0,16(sp)
 bb2:	64a2                	ld	s1,8(sp)
 bb4:	6105                	add	sp,sp,32
 bb6:	8082                	ret
 bb8:	02049693          	sll	a3,s1,0x20
 bbc:	9281                	srl	a3,a3,0x20
 bbe:	a839                	j	bdc <func0+0x54>
 bc0:	00a707b3          	add	a5,a4,a0
 bc4:	ff87a783          	lw	a5,-8(a5)
 bc8:	0585                	add	a1,a1,1
 bca:	0015d49b          	srlw	s1,a1,0x1
 bce:	9e25                	addw	a2,a2,s1
 bd0:	9e3d                	addw	a2,a2,a5
 bd2:	2605                	addw	a2,a2,1
 bd4:	972a                	add	a4,a4,a0
 bd6:	c310                	sw	a2,0(a4)
 bd8:	fcd58be3          	beq	a1,a3,bae <func0+0x26>
 bdc:	0015f793          	and	a5,a1,1
 be0:	00259713          	sll	a4,a1,0x2
 be4:	fff1                	bnez	a5,bc0 <func0+0x38>
 be6:	0015d61b          	srlw	a2,a1,0x1
 bea:	2605                	addw	a2,a2,1
 bec:	0585                	add	a1,a1,1
 bee:	b7dd                	j	bd4 <func0+0x4c>
