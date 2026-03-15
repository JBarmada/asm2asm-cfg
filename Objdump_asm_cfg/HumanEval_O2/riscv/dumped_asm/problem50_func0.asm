0000000000000854 <func0>:
 854:	00a05d63          	blez	a0,86e <func0+0x1a>
 858:	4681                	li	a3,0
 85a:	4605                	li	a2,1
 85c:	0016161b          	sllw	a2,a2,0x1
 860:	2685                	addw	a3,a3,1
 862:	02b6663b          	remw	a2,a2,a1
 866:	fea6cbe3          	blt	a3,a0,85c <func0+0x8>
 86a:	8532                	mv	a0,a2
 86c:	8082                	ret
 86e:	4605                	li	a2,1
 870:	8532                	mv	a0,a2
 872:	8082                	ret
