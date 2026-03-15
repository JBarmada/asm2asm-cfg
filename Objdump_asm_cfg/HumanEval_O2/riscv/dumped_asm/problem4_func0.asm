0000000000000848 <func0>:
 848:	02b05463          	blez	a1,870 <func0+0x28>
 84c:	4110                	lw	a2,0(a0)
 84e:	02064363          	bltz	a2,874 <func0+0x2c>
 852:	0511                	add	a0,a0,4
 854:	4705                	li	a4,1
 856:	86ba                	mv	a3,a4
 858:	00e58963          	beq	a1,a4,86a <func0+0x22>
 85c:	4118                	lw	a4,0(a0)
 85e:	9e39                	addw	a2,a2,a4
 860:	00168713          	add	a4,a3,1
 864:	0511                	add	a0,a0,4
 866:	fe0658e3          	bgez	a2,856 <func0+0xe>
 86a:	00b6b533          	sltu	a0,a3,a1
 86e:	8082                	ret
 870:	4501                	li	a0,0
 872:	8082                	ret
 874:	4505                	li	a0,1
 876:	8082                	ret
