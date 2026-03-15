0000000000000770 <func0>:
 770:	7165                	add	sp,sp,-400
 772:	c002                	sw	zero,0(sp)
 774:	c202                	sw	zero,4(sp)
 776:	4589                	li	a1,2
 778:	c42e                	sw	a1,8(sp)
 77a:	4591                	li	a1,4
 77c:	c602                	sw	zero,12(sp)
 77e:	02b54763          	blt	a0,a1,7ac <func0+0x3c>
 782:	4701                	li	a4,0
 784:	4581                	li	a1,0
 786:	0015061b          	addw	a2,a0,1
 78a:	1602                	sll	a2,a2,0x20
 78c:	02065693          	srl	a3,a2,0x20
 790:	0030                	add	a2,sp,8
 792:	16f1                	add	a3,a3,-4
 794:	421c                	lw	a5,0(a2)
 796:	ff862803          	lw	a6,-8(a2)
 79a:	9dbd                	addw	a1,a1,a5
 79c:	9db9                	addw	a1,a1,a4
 79e:	010585bb          	addw	a1,a1,a6
 7a2:	c60c                	sw	a1,8(a2)
 7a4:	16fd                	add	a3,a3,-1
 7a6:	0611                	add	a2,a2,4
 7a8:	873e                	mv	a4,a5
 7aa:	f6ed                	bnez	a3,794 <func0+0x24>
 7ac:	050a                	sll	a0,a0,0x2
 7ae:	858a                	mv	a1,sp
 7b0:	952e                	add	a0,a0,a1
 7b2:	4108                	lw	a0,0(a0)
 7b4:	6159                	add	sp,sp,400
 7b6:	8082                	ret
