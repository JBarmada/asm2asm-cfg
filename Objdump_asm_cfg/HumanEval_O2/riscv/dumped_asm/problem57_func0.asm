00000000000008e8 <func0>:
 8e8:	4581                	li	a1,0
 8ea:	03c00613          	li	a2,60
 8ee:	a811                	j	902 <func0+0x1a>
 8f0:	2585                	addw	a1,a1,1
 8f2:	fc268693          	add	a3,a3,-62
 8f6:	0016b693          	seqz	a3,a3
 8fa:	9d95                	subw	a1,a1,a3
 8fc:	0505                	add	a0,a0,1
 8fe:	0005ca63          	bltz	a1,912 <func0+0x2a>
 902:	00054683          	lbu	a3,0(a0)
 906:	fec685e3          	beq	a3,a2,8f0 <func0+0x8>
 90a:	f6e5                	bnez	a3,8f2 <func0+0xa>
 90c:	0015b513          	seqz	a0,a1
 910:	8082                	ret
 912:	4501                	li	a0,0
 914:	8082                	ret
