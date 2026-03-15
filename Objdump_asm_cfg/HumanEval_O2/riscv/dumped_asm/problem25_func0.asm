00000000000007a0 <func0>:
 7a0:	4591                	li	a1,4
 7a2:	00b54f63          	blt	a0,a1,7c0 <func0+0x20>
 7a6:	4609                	li	a2,2
 7a8:	02c545bb          	divw	a1,a0,a2
 7ac:	02c586bb          	mulw	a3,a1,a2
 7b0:	40d506bb          	subw	a3,a0,a3
 7b4:	c699                	beqz	a3,7c2 <func0+0x22>
 7b6:	2605                	addw	a2,a2,1
 7b8:	02c605bb          	mulw	a1,a2,a2
 7bc:	feb556e3          	bge	a0,a1,7a8 <func0+0x8>
 7c0:	4585                	li	a1,1
 7c2:	852e                	mv	a0,a1
 7c4:	8082                	ret
