00000000000007e8 <func0>:
 7e8:	00b05863          	blez	a1,7f8 <func0+0x10>
 7ec:	4110                	lw	a2,0(a0)
 7ee:	2605                	addw	a2,a2,1
 7f0:	c110                	sw	a2,0(a0)
 7f2:	15fd                	add	a1,a1,-1
 7f4:	0511                	add	a0,a0,4
 7f6:	f9fd                	bnez	a1,7ec <func0+0x4>
 7f8:	8082                	ret
