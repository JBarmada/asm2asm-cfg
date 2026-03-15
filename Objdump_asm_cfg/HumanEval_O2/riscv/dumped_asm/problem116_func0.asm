0000000000000a90 <func0>:
 a90:	04b05963          	blez	a1,ae2 <func0+0x52>
 a94:	4301                	li	t1,0
 a96:	4281                	li	t0,0
 a98:	fff6881b          	addw	a6,a3,-1
 a9c:	02061713          	sll	a4,a2,0x20
 aa0:	02075893          	srl	a7,a4,0x20
 aa4:	a021                	j	aac <func0+0x1c>
 aa6:	0305                	add	t1,t1,1
 aa8:	02b30b63          	beq	t1,a1,ade <func0+0x4e>
 aac:	fec05de3          	blez	a2,aa6 <func0+0x16>
 ab0:	00331713          	sll	a4,t1,0x3
 ab4:	972a                	add	a4,a4,a0
 ab6:	00073e03          	ld	t3,0(a4)
 aba:	4381                	li	t2,0
 abc:	87c6                	mv	a5,a7
 abe:	000e2703          	lw	a4,0(t3)
 ac2:	007703bb          	addw	t2,a4,t2
 ac6:	17fd                	add	a5,a5,-1
 ac8:	0e11                	add	t3,t3,4
 aca:	fbf5                	bnez	a5,abe <func0+0x2e>
 acc:	fc705de3          	blez	t2,aa6 <func0+0x16>
 ad0:	0078073b          	addw	a4,a6,t2
 ad4:	02d7473b          	divw	a4,a4,a3
 ad8:	005702bb          	addw	t0,a4,t0
 adc:	b7e9                	j	aa6 <func0+0x16>
 ade:	8516                	mv	a0,t0
 ae0:	8082                	ret
 ae2:	4501                	li	a0,0
 ae4:	8082                	ret
