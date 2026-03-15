0000000000000850 <func0>:
 850:	00054603          	lbu	a2,0(a0)
 854:	c60d                	beqz	a2,87e <func0+0x2e>
 856:	85aa                	mv	a1,a0
 858:	4501                	li	a0,0
 85a:	0585                	add	a1,a1,1
 85c:	46e9                	li	a3,26
 85e:	a801                	j	86e <func0+0x1e>
 860:	0ff67713          	zext.b	a4,a2
 864:	0005c603          	lbu	a2,0(a1)
 868:	9d39                	addw	a0,a0,a4
 86a:	0585                	add	a1,a1,1
 86c:	ca11                	beqz	a2,880 <func0+0x30>
 86e:	fbf6071b          	addw	a4,a2,-65
 872:	0ff77713          	zext.b	a4,a4
 876:	fed765e3          	bltu	a4,a3,860 <func0+0x10>
 87a:	4601                	li	a2,0
 87c:	b7d5                	j	860 <func0+0x10>
 87e:	4501                	li	a0,0
 880:	8082                	ret
