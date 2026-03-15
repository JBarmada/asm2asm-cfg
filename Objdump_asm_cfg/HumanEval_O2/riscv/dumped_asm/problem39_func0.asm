00000000000009e0 <func0>:
 9e0:	711d                	add	sp,sp,-96
 9e2:	ec86                	sd	ra,88(sp)
 9e4:	e8a2                	sd	s0,80(sp)
 9e6:	e4a6                	sd	s1,72(sp)
 9e8:	e0ca                	sd	s2,64(sp)
 9ea:	fc4e                	sd	s3,56(sp)
 9ec:	f852                	sd	s4,48(sp)
 9ee:	f456                	sd	s5,40(sp)
 9f0:	f05a                	sd	s6,32(sp)
 9f2:	ec5e                	sd	s7,24(sp)
 9f4:	e862                	sd	s8,16(sp)
 9f6:	e466                	sd	s9,8(sp)
 9f8:	892e                	mv	s2,a1
 9fa:	8a2a                	mv	s4,a0
 9fc:	db5ff0ef          	jal	7b0 <strlen@plt>
 a00:	00050a9b          	sext.w	s5,a0
 a04:	09505b63          	blez	s5,a9a <func0+0xba>
 a08:	89aa                	mv	s3,a0
 a0a:	4481                	li	s1,0
 a0c:	2509                	addw	a0,a0,2
 a0e:	aaaab5b7          	lui	a1,0xaaaab
 a12:	aab5859b          	addw	a1,a1,-1365 # ffffffffaaaaaaab <__global_pointer$+0xffffffffaaaa82ab>
 a16:	1582                	sll	a1,a1,0x20
 a18:	1502                	sll	a0,a0,0x20
 a1a:	02b53533          	mulhu	a0,a0,a1
 a1e:	02155413          	srl	s0,a0,0x21
 a22:	00410c13          	add	s8,sp,4
 a26:	a02d                	j	a50 <func0+0x70>
 a28:	00510503          	lb	a0,5(sp)
 a2c:	00410583          	lb	a1,4(sp)
 a30:	00a10223          	sb	a0,4(sp)
 a34:	00610503          	lb	a0,6(sp)
 a38:	00a102a3          	sb	a0,5(sp)
 a3c:	00b10323          	sb	a1,6(sp)
 a40:	004c                	add	a1,sp,4
 a42:	855a                	mv	a0,s6
 a44:	865e                	mv	a2,s7
 a46:	d3bff0ef          	jal	780 <strncpy@plt>
 a4a:	147d                	add	s0,s0,-1
 a4c:	048d                	add	s1,s1,3
 a4e:	c431                	beqz	s0,a9a <func0+0xba>
 a50:	0034851b          	addw	a0,s1,3
 a54:	4c8d                	li	s9,3
 a56:	00aac463          	blt	s5,a0,a5e <func0+0x7e>
 a5a:	4b8d                	li	s7,3
 a5c:	a019                	j	a62 <func0+0x82>
 a5e:	40998bbb          	subw	s7,s3,s1
 a62:	009a0b33          	add	s6,s4,s1
 a66:	0048                	add	a0,sp,4
 a68:	85da                	mv	a1,s6
 a6a:	865e                	mv	a2,s7
 a6c:	d15ff0ef          	jal	780 <strncpy@plt>
 a70:	017c0533          	add	a0,s8,s7
 a74:	00050023          	sb	zero,0(a0)
 a78:	fd9b94e3          	bne	s7,s9,a40 <func0+0x60>
 a7c:	fa0906e3          	beqz	s2,a28 <func0+0x48>
 a80:	00510503          	lb	a0,5(sp)
 a84:	00610583          	lb	a1,6(sp)
 a88:	00a10323          	sb	a0,6(sp)
 a8c:	00410503          	lb	a0,4(sp)
 a90:	00a102a3          	sb	a0,5(sp)
 a94:	00b10223          	sb	a1,4(sp)
 a98:	b765                	j	a40 <func0+0x60>
 a9a:	60e6                	ld	ra,88(sp)
 a9c:	6446                	ld	s0,80(sp)
 a9e:	64a6                	ld	s1,72(sp)
 aa0:	6906                	ld	s2,64(sp)
 aa2:	79e2                	ld	s3,56(sp)
 aa4:	7a42                	ld	s4,48(sp)
 aa6:	7aa2                	ld	s5,40(sp)
 aa8:	7b02                	ld	s6,32(sp)
 aaa:	6be2                	ld	s7,24(sp)
 aac:	6c42                	ld	s8,16(sp)
 aae:	6ca2                	ld	s9,8(sp)
 ab0:	6125                	add	sp,sp,96
 ab2:	8082                	ret
