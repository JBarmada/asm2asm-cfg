0000000000000818 <func0>:
 818:	02b05563          	blez	a1,842 <func0+0x2a>
 81c:	4114                	lw	a3,0(a0)
 81e:	02c6d463          	bge	a3,a2,846 <func0+0x2e>
 822:	0511                	add	a0,a0,4
 824:	4705                	li	a4,1
 826:	86ba                	mv	a3,a4
 828:	00e58863          	beq	a1,a4,838 <func0+0x20>
 82c:	411c                	lw	a5,0(a0)
 82e:	00168713          	add	a4,a3,1
 832:	0511                	add	a0,a0,4
 834:	fec7c9e3          	blt	a5,a2,826 <func0+0xe>
 838:	00b6b533          	sltu	a0,a3,a1
 83c:	00154513          	xor	a0,a0,1
 840:	8082                	ret
 842:	4505                	li	a0,1
 844:	8082                	ret
 846:	4501                	li	a0,0
 848:	8082                	ret
