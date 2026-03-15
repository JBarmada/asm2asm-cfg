00000000000007a4 <func0>:
 7a4:	02a05363          	blez	a0,7ca <func0+0x26>
 7a8:	4585                	li	a1,1
 7aa:	00b50e63          	beq	a0,a1,7c6 <func0+0x22>
 7ae:	460d                	li	a2,3
 7b0:	45c9                	li	a1,18
 7b2:	00c56a63          	bltu	a0,a2,7c6 <func0+0x22>
 7b6:	45c9                	li	a1,18
 7b8:	4609                	li	a2,2
 7ba:	46a9                	li	a3,10
 7bc:	2605                	addw	a2,a2,1
 7be:	02d585bb          	mulw	a1,a1,a3
 7c2:	fea64de3          	blt	a2,a0,7bc <func0+0x18>
 7c6:	852e                	mv	a0,a1
 7c8:	8082                	ret
 7ca:	4501                	li	a0,0
 7cc:	8082                	ret
