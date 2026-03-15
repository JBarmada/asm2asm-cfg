0000000000000a88 <func0>:
 a88:	4709                	li	a4,2
 a8a:	04e5c763          	blt	a1,a4,ad8 <func0+0x50>
 a8e:	4301                	li	t1,0
 a90:	fff5889b          	addw	a7,a1,-1
 a94:	00450813          	add	a6,a0,4
 a98:	82c6                	mv	t0,a7
 a9a:	a029                	j	aa4 <func0+0x1c>
 a9c:	2305                	addw	t1,t1,1
 a9e:	32fd                	addw	t0,t0,-1
 aa0:	03135c63          	bge	t1,a7,ad8 <func0+0x50>
 aa4:	fff34713          	not	a4,t1
 aa8:	9f2d                	addw	a4,a4,a1
 aaa:	fee059e3          	blez	a4,a9c <func0+0x14>
 aae:	00052383          	lw	t2,0(a0)
 ab2:	02029713          	sll	a4,t0,0x20
 ab6:	02075793          	srl	a5,a4,0x20
 aba:	8742                	mv	a4,a6
 abc:	a801                	j	acc <func0+0x44>
 abe:	ffc72e23          	sw	t3,-4(a4)
 ac2:	00772023          	sw	t2,0(a4)
 ac6:	17fd                	add	a5,a5,-1
 ac8:	0711                	add	a4,a4,4
 aca:	dbe9                	beqz	a5,a9c <func0+0x14>
 acc:	00072e03          	lw	t3,0(a4)
 ad0:	fe7e47e3          	blt	t3,t2,abe <func0+0x36>
 ad4:	83f2                	mv	t2,t3
 ad6:	bfc5                	j	ac6 <func0+0x3e>
 ad8:	00c05b63          	blez	a2,aee <func0+0x66>
 adc:	9d91                	subw	a1,a1,a2
 ade:	058a                	sll	a1,a1,0x2
 ae0:	952e                	add	a0,a0,a1
 ae2:	410c                	lw	a1,0(a0)
 ae4:	c28c                	sw	a1,0(a3)
 ae6:	0511                	add	a0,a0,4
 ae8:	167d                	add	a2,a2,-1
 aea:	0691                	add	a3,a3,4
 aec:	fa7d                	bnez	a2,ae2 <func0+0x5a>
 aee:	8082                	ret
