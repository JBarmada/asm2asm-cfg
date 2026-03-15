0000000000000bd0 <func0>:
 bd0:	1101                	add	sp,sp,-32
 bd2:	ec06                	sd	ra,24(sp)
 bd4:	e822                	sd	s0,16(sp)
 bd6:	e426                	sd	s1,8(sp)
 bd8:	e04a                	sd	s2,0(sp)
 bda:	8432                	mv	s0,a2
 bdc:	892e                	mv	s2,a1
 bde:	84aa                	mv	s1,a0
 be0:	01f5d51b          	srlw	a0,a1,0x1f
 be4:	9d2d                	addw	a0,a0,a1
 be6:	0506                	sll	a0,a0,0x1
 be8:	9971                	and	a0,a0,-4
 bea:	0511                	add	a0,a0,4
 bec:	a75ff0ef          	jal	660 <malloc@plt>
 bf0:	05205e63          	blez	s2,c4c <func0+0x7c>
 bf4:	4681                	li	a3,0
 bf6:	fff9081b          	addw	a6,s2,-1
 bfa:	0018589b          	srlw	a7,a6,0x1
 bfe:	00289713          	sll	a4,a7,0x2
 c02:	0711                	add	a4,a4,4
 c04:	87a6                	mv	a5,s1
 c06:	0007a007          	flw	ft0,0(a5)
 c0a:	00d50633          	add	a2,a0,a3
 c0e:	00062027          	fsw	ft0,0(a2)
 c12:	0691                	add	a3,a3,4
 c14:	07a1                	add	a5,a5,8
 c16:	fed718e3          	bne	a4,a3,c06 <func0+0x36>
 c1a:	4689                	li	a3,2
 c1c:	02d87e63          	bgeu	a6,a3,c58 <func0+0x88>
 c20:	03205663          	blez	s2,c4c <func0+0x7c>
 c24:	4581                	li	a1,0
 c26:	a819                	j	c3c <func0+0x6c>
 c28:	8626                	mv	a2,s1
 c2a:	00062007          	flw	ft0,0(a2)
 c2e:	00042027          	fsw	ft0,0(s0)
 c32:	0585                	add	a1,a1,1
 c34:	0411                	add	s0,s0,4
 c36:	0491                	add	s1,s1,4
 c38:	00b90a63          	beq	s2,a1,c4c <func0+0x7c>
 c3c:	0015f613          	and	a2,a1,1
 c40:	f665                	bnez	a2,c28 <func0+0x58>
 c42:	0015d61b          	srlw	a2,a1,0x1
 c46:	060a                	sll	a2,a2,0x2
 c48:	962a                	add	a2,a2,a0
 c4a:	b7c5                	j	c2a <func0+0x5a>
 c4c:	60e2                	ld	ra,24(sp)
 c4e:	6442                	ld	s0,16(sp)
 c50:	64a2                	ld	s1,8(sp)
 c52:	6902                	ld	s2,0(sp)
 c54:	6105                	add	sp,sp,32
 c56:	b42d                	j	680 <free@plt>
 c58:	4601                	li	a2,0
 c5a:	00450813          	add	a6,a0,4
 c5e:	8746                	mv	a4,a7
 c60:	a029                	j	c6a <func0+0x9a>
 c62:	2605                	addw	a2,a2,1
 c64:	377d                	addw	a4,a4,-1
 c66:	fb167de3          	bgeu	a2,a7,c20 <func0+0x50>
 c6a:	ff167ce3          	bgeu	a2,a7,c62 <func0+0x92>
 c6e:	00052007          	flw	ft0,0(a0)
 c72:	02071693          	sll	a3,a4,0x20
 c76:	0206d793          	srl	a5,a3,0x20
 c7a:	86c2                	mv	a3,a6
 c7c:	a801                	j	c8c <func0+0xbc>
 c7e:	fe16ae27          	fsw	ft1,-4(a3)
 c82:	0006a027          	fsw	ft0,0(a3)
 c86:	17fd                	add	a5,a5,-1
 c88:	0691                	add	a3,a3,4
 c8a:	dfe1                	beqz	a5,c62 <func0+0x92>
 c8c:	0006a087          	flw	ft1,0(a3)
 c90:	a00095d3          	flt.s	a1,ft1,ft0
 c94:	f5ed                	bnez	a1,c7e <func0+0xae>
 c96:	20108053          	fmv.s	ft0,ft1
 c9a:	b7f5                	j	c86 <func0+0xb6>
