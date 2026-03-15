00000000000007a0 <func0>:
 7a0:	4591                	li	a1,4
 7a2:	00b55463          	bge	a0,a1,7aa <func0+0xa>
 7a6:	2501                	sext.w	a0,a0
 7a8:	8082                	ret
 7aa:	4589                	li	a1,2
 7ac:	a801                	j	7bc <func0+0x1c>
 7ae:	2585                	addw	a1,a1,1
 7b0:	02b5863b          	mulw	a2,a1,a1
 7b4:	0005069b          	sext.w	a3,a0
 7b8:	fec6c7e3          	blt	a3,a2,7a6 <func0+0x6>
 7bc:	02b5663b          	remw	a2,a0,a1
 7c0:	0005069b          	sext.w	a3,a0
 7c4:	00c03633          	snez	a2,a2
 7c8:	00d5a6b3          	slt	a3,a1,a3
 7cc:	0016c693          	xor	a3,a3,1
 7d0:	8e55                	or	a2,a2,a3
 7d2:	fe71                	bnez	a2,7ae <func0+0xe>
 7d4:	02b5453b          	divw	a0,a0,a1
 7d8:	02b5663b          	remw	a2,a0,a1
 7dc:	00163613          	seqz	a2,a2
 7e0:	00a5a6b3          	slt	a3,a1,a0
 7e4:	8e75                	and	a2,a2,a3
 7e6:	f67d                	bnez	a2,7d4 <func0+0x34>
 7e8:	b7d9                	j	7ae <func0+0xe>
