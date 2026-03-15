0000000000000a78 <func0>:
 a78:	715d                	add	sp,sp,-80
 a7a:	e486                	sd	ra,72(sp)
 a7c:	e0a2                	sd	s0,64(sp)
 a7e:	fc26                	sd	s1,56(sp)
 a80:	f84a                	sd	s2,48(sp)
 a82:	f44e                	sd	s3,40(sp)
 a84:	f052                	sd	s4,32(sp)
 a86:	ec56                	sd	s5,24(sp)
 a88:	e85a                	sd	s6,16(sp)
 a8a:	e45e                	sd	s7,8(sp)
 a8c:	e062                	sd	s8,0(sp)
 a8e:	8aaa                	mv	s5,a0
 a90:	cb1ff0ef          	jal	740 <strlen@plt>
 a94:	892a                	mv	s2,a0
 a96:	00050a1b          	sext.w	s4,a0
 a9a:	02051993          	sll	s3,a0,0x20
 a9e:	05405e63          	blez	s4,afa <func0+0x82>
 aa2:	cefff0ef          	jal	790 <__ctype_b_loc@plt>
 aa6:	8b2a                	mv	s6,a0
 aa8:	4b81                	li	s7,0
 aaa:	0209d493          	srl	s1,s3,0x20
 aae:	8456                	mv	s0,s5
 ab0:	a029                	j	aba <func0+0x42>
 ab2:	2b85                	addw	s7,s7,1
 ab4:	14fd                	add	s1,s1,-1
 ab6:	0405                	add	s0,s0,1
 ab8:	c0b1                	beqz	s1,afc <func0+0x84>
 aba:	00044c03          	lbu	s8,0(s0)
 abe:	000b3503          	ld	a0,0(s6)
 ac2:	001c1593          	sll	a1,s8,0x1
 ac6:	952e                	add	a0,a0,a1
 ac8:	00055503          	lhu	a0,0(a0)
 acc:	40057593          	and	a1,a0,1024
 ad0:	d1ed                	beqz	a1,ab2 <func0+0x3a>
 ad2:	10057593          	and	a1,a0,256
 ad6:	e599                	bnez	a1,ae4 <func0+0x6c>
 ad8:	20057513          	and	a0,a0,512
 adc:	dd61                	beqz	a0,ab4 <func0+0x3c>
 ade:	c83ff0ef          	jal	760 <__ctype_toupper_loc@plt>
 ae2:	a019                	j	ae8 <func0+0x70>
 ae4:	c8dff0ef          	jal	770 <__ctype_tolower_loc@plt>
 ae8:	6108                	ld	a0,0(a0)
 aea:	002c1593          	sll	a1,s8,0x2
 aee:	952e                	add	a0,a0,a1
 af0:	00050503          	lb	a0,0(a0)
 af4:	00a40023          	sb	a0,0(s0)
 af8:	bf75                	j	ab4 <func0+0x3c>
 afa:	4b81                	li	s7,0
 afc:	014bc533          	xor	a0,s7,s4
 b00:	00a03533          	snez	a0,a0
 b04:	002a2593          	slti	a1,s4,2
 b08:	8d4d                	or	a0,a0,a1
 b0a:	e51d                	bnez	a0,b38 <func0+0xc0>
 b0c:	557d                	li	a0,-1
 b0e:	1502                	sll	a0,a0,0x20
 b10:	0019559b          	srlw	a1,s2,0x1
 b14:	00a98633          	add	a2,s3,a0
 b18:	86d6                	mv	a3,s5
 b1a:	42065713          	sra	a4,a2,0x20
 b1e:	9756                	add	a4,a4,s5
 b20:	00070783          	lb	a5,0(a4)
 b24:	00068483          	lb	s1,0(a3)
 b28:	00f68023          	sb	a5,0(a3)
 b2c:	00970023          	sb	s1,0(a4)
 b30:	962a                	add	a2,a2,a0
 b32:	15fd                	add	a1,a1,-1
 b34:	0685                	add	a3,a3,1
 b36:	f1f5                	bnez	a1,b1a <func0+0xa2>
 b38:	8556                	mv	a0,s5
 b3a:	60a6                	ld	ra,72(sp)
 b3c:	6406                	ld	s0,64(sp)
 b3e:	74e2                	ld	s1,56(sp)
 b40:	7942                	ld	s2,48(sp)
 b42:	79a2                	ld	s3,40(sp)
 b44:	7a02                	ld	s4,32(sp)
 b46:	6ae2                	ld	s5,24(sp)
 b48:	6b42                	ld	s6,16(sp)
 b4a:	6ba2                	ld	s7,8(sp)
 b4c:	6c02                	ld	s8,0(sp)
 b4e:	6161                	add	sp,sp,80
 b50:	8082                	ret
