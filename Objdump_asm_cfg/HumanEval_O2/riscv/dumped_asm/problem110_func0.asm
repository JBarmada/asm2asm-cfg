00000000000007e4 <func0>:
 7e4:	c595                	beqz	a1,810 <func0+0x2c>
 7e6:	4605                	li	a2,1
 7e8:	02b65663          	bge	a2,a1,814 <func0+0x30>
 7ec:	00052803          	lw	a6,0(a0)
 7f0:	4681                	li	a3,0
 7f2:	00450713          	add	a4,a0,4
 7f6:	fff58793          	add	a5,a1,-1
 7fa:	8642                	mv	a2,a6
 7fc:	00072883          	lw	a7,0(a4)
 800:	00c8a633          	slt	a2,a7,a2
 804:	9eb1                	addw	a3,a3,a2
 806:	17fd                	add	a5,a5,-1
 808:	0711                	add	a4,a4,4
 80a:	8646                	mv	a2,a7
 80c:	fbe5                	bnez	a5,7fc <func0+0x18>
 80e:	a031                	j	81a <func0+0x36>
 810:	4505                	li	a0,1
 812:	8082                	ret
 814:	00052803          	lw	a6,0(a0)
 818:	4681                	li	a3,0
 81a:	35fd                	addw	a1,a1,-1
 81c:	058a                	sll	a1,a1,0x2
 81e:	952e                	add	a0,a0,a1
 820:	4108                	lw	a0,0(a0)
 822:	00a82533          	slt	a0,a6,a0
 826:	9d35                	addw	a0,a0,a3
 828:	00253513          	sltiu	a0,a0,2
 82c:	8082                	ret
