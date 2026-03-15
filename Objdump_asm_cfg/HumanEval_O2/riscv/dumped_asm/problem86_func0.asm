00000000000007b4 <func0>:
 7b4:	4689                	li	a3,2
 7b6:	02d5c463          	blt	a1,a3,7de <func0+0x2a>
 7ba:	862a                	mv	a2,a0
 7bc:	4501                	li	a0,0
 7be:	35f9                	addw	a1,a1,-2
 7c0:	0015d59b          	srlw	a1,a1,0x1
 7c4:	0585                	add	a1,a1,1
 7c6:	0611                	add	a2,a2,4
 7c8:	a021                	j	7d0 <func0+0x1c>
 7ca:	15fd                	add	a1,a1,-1
 7cc:	0621                	add	a2,a2,8
 7ce:	c989                	beqz	a1,7e0 <func0+0x2c>
 7d0:	00066683          	lwu	a3,0(a2)
 7d4:	0016f713          	and	a4,a3,1
 7d8:	fb6d                	bnez	a4,7ca <func0+0x16>
 7da:	9d35                	addw	a0,a0,a3
 7dc:	b7fd                	j	7ca <func0+0x16>
 7de:	4501                	li	a0,0
 7e0:	8082                	ret
