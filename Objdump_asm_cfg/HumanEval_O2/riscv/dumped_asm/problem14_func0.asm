000000000000077c <func0>:
 77c:	c989                	beqz	a1,78e <func0+0x12>
 77e:	862e                	mv	a2,a1
 780:	02b565bb          	remw	a1,a0,a1
 784:	8532                	mv	a0,a2
 786:	fde5                	bnez	a1,77e <func0+0x2>
 788:	0006051b          	sext.w	a0,a2
 78c:	8082                	ret
 78e:	2501                	sext.w	a0,a0
 790:	8082                	ret
