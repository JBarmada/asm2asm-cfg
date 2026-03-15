00000000000008b4 <func0>:
 8b4:	4589                	li	a1,2
 8b6:	00b55463          	bge	a0,a1,8be <func0+0xa>
 8ba:	4501                	li	a0,0
 8bc:	8082                	ret
 8be:	4591                	li	a1,4
 8c0:	00b57d63          	bgeu	a0,a1,8da <func0+0x26>
 8c4:	4581                	li	a1,0
 8c6:	2501                	sext.w	a0,a0
 8c8:	00252513          	slti	a0,a0,2
 8cc:	00154513          	xor	a0,a0,1
 8d0:	9d2d                	addw	a0,a0,a1
 8d2:	1575                	add	a0,a0,-3
 8d4:	00153513          	seqz	a0,a0
 8d8:	8082                	ret
 8da:	4581                	li	a1,0
 8dc:	4609                	li	a2,2
 8de:	a801                	j	8ee <func0+0x3a>
 8e0:	2605                	addw	a2,a2,1
 8e2:	02c606bb          	mulw	a3,a2,a2
 8e6:	0005071b          	sext.w	a4,a0
 8ea:	fcd74ee3          	blt	a4,a3,8c6 <func0+0x12>
 8ee:	02c566bb          	remw	a3,a0,a2
 8f2:	f6fd                	bnez	a3,8e0 <func0+0x2c>
 8f4:	02c5453b          	divw	a0,a0,a2
 8f8:	02c566bb          	remw	a3,a0,a2
 8fc:	2585                	addw	a1,a1,1
 8fe:	dafd                	beqz	a3,8f4 <func0+0x40>
 900:	b7c5                	j	8e0 <func0+0x2c>
