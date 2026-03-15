000000000000088c <func0>:
 88c:	c99d                	beqz	a1,8c2 <func0+0x36>
 88e:	02b05c63          	blez	a1,8c6 <func0+0x3a>
 892:	4601                	li	a2,0
 894:	4685                	li	a3,1
 896:	a811                	j	8aa <func0+0x1e>
 898:	86be                	mv	a3,a5
 89a:	41f7579b          	sraw	a5,a4,0x1f
 89e:	8f3d                	xor	a4,a4,a5
 8a0:	9f1d                	subw	a4,a4,a5
 8a2:	9e39                	addw	a2,a2,a4
 8a4:	15fd                	add	a1,a1,-1
 8a6:	0511                	add	a0,a0,4
 8a8:	c991                	beqz	a1,8bc <func0+0x30>
 8aa:	4118                	lw	a4,0(a0)
 8ac:	4781                	li	a5,0
 8ae:	c311                	beqz	a4,8b2 <func0+0x26>
 8b0:	87b6                	mv	a5,a3
 8b2:	fe0753e3          	bgez	a4,898 <func0+0xc>
 8b6:	40f006bb          	negw	a3,a5
 8ba:	b7c5                	j	89a <func0+0xe>
 8bc:	02c6853b          	mulw	a0,a3,a2
 8c0:	8082                	ret
 8c2:	7561                	lui	a0,0xffff8
 8c4:	8082                	ret
 8c6:	4501                	li	a0,0
 8c8:	8082                	ret
