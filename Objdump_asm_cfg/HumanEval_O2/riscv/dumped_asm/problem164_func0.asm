0000000000000878 <func0>:
 878:	0006a023          	sw	zero,0(a3)
 87c:	882e                	mv	a6,a1
 87e:	00b54363          	blt	a0,a1,884 <func0+0xc>
 882:	882a                	mv	a6,a0
 884:	00a5c763          	blt	a1,a0,892 <func0+0x1a>
 888:	85aa                	mv	a1,a0
 88a:	a021                	j	892 <func0+0x1a>
 88c:	2585                	addw	a1,a1,1
 88e:	03055463          	bge	a0,a6,8b6 <func0+0x3e>
 892:	0005851b          	sext.w	a0,a1
 896:	00a52793          	slti	a5,a0,10
 89a:	0017c793          	xor	a5,a5,1
 89e:	8fcd                	or	a5,a5,a1
 8a0:	8b85                	and	a5,a5,1
 8a2:	f7ed                	bnez	a5,88c <func0+0x14>
 8a4:	429c                	lw	a5,0(a3)
 8a6:	0017871b          	addw	a4,a5,1
 8aa:	c298                	sw	a4,0(a3)
 8ac:	00279713          	sll	a4,a5,0x2
 8b0:	9732                	add	a4,a4,a2
 8b2:	c30c                	sw	a1,0(a4)
 8b4:	bfe1                	j	88c <func0+0x14>
 8b6:	8082                	ret
