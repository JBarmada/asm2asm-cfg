0000000000000750 <func0>:
 750:	4581                	li	a1,0
 752:	00b50633          	add	a2,a0,a1
 756:	00064603          	lbu	a2,0(a2)
 75a:	0585                	add	a1,a1,1
 75c:	fa7d                	bnez	a2,752 <func0+0x2>
 75e:	fff5851b          	addw	a0,a1,-1
 762:	8082                	ret
