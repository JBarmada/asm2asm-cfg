000000000000087c <func0>:
 87c:	4601                	li	a2,0
 87e:	4689                	li	a3,2
 880:	4885                	li	a7,1
 882:	4811                	li	a6,4
 884:	a809                	j	896 <func0+0x1a>
 886:	00d036b3          	snez	a3,a3
 88a:	9e35                	addw	a2,a2,a3
 88c:	011586bb          	addw	a3,a1,a7
 890:	88ae                	mv	a7,a1
 892:	02a60263          	beq	a2,a0,8b6 <func0+0x3a>
 896:	02a65263          	bge	a2,a0,8ba <func0+0x3e>
 89a:	85b6                	mv	a1,a3
 89c:	4685                	li	a3,1
 89e:	ff05c6e3          	blt	a1,a6,88a <func0+0xe>
 8a2:	4789                	li	a5,2
 8a4:	02f5e6bb          	remw	a3,a1,a5
 8a8:	def9                	beqz	a3,886 <func0+0xa>
 8aa:	2785                	addw	a5,a5,1
 8ac:	02f7873b          	mulw	a4,a5,a5
 8b0:	fee5dae3          	bge	a1,a4,8a4 <func0+0x28>
 8b4:	bfc9                	j	886 <func0+0xa>
 8b6:	852e                	mv	a0,a1
 8b8:	8082                	ret
 8ba:	4501                	li	a0,0
 8bc:	8082                	ret
