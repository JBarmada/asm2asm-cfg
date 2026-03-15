0000000000000808 <func0>:
 808:	4609                	li	a2,2
 80a:	577d                	li	a4,-1
 80c:	02c5c563          	blt	a1,a2,836 <func0+0x2e>
 810:	00052803          	lw	a6,0(a0)
 814:	0511                	add	a0,a0,4
 816:	57fd                	li	a5,-1
 818:	4685                	li	a3,1
 81a:	a031                	j	826 <func0+0x1e>
 81c:	0685                	add	a3,a3,1
 81e:	0511                	add	a0,a0,4
 820:	87ba                	mv	a5,a4
 822:	00d58a63          	beq	a1,a3,836 <func0+0x2e>
 826:	8642                	mv	a2,a6
 828:	00052803          	lw	a6,0(a0)
 82c:	8736                	mv	a4,a3
 82e:	fec847e3          	blt	a6,a2,81c <func0+0x14>
 832:	873e                	mv	a4,a5
 834:	b7e5                	j	81c <func0+0x14>
 836:	0007051b          	sext.w	a0,a4
 83a:	8082                	ret
