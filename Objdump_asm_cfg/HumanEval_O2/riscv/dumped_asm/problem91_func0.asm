0000000000000824 <func0>:
 824:	4689                	li	a3,2
 826:	567d                	li	a2,-1
 828:	04d5c363          	blt	a1,a3,86e <func0+0x4a>
 82c:	80000637          	lui	a2,0x80000
 830:	fff6081b          	addw	a6,a2,-1 # 7fffffff <__global_pointer$+0x7fffd7ff>
 834:	8642                	mv	a2,a6
 836:	a021                	j	83e <func0+0x1a>
 838:	15fd                	add	a1,a1,-1
 83a:	0511                	add	a0,a0,4
 83c:	c195                	beqz	a1,860 <func0+0x3c>
 83e:	4118                	lw	a4,0(a0)
 840:	010727b3          	slt	a5,a4,a6
 844:	0017c793          	xor	a5,a5,1
 848:	00c746b3          	xor	a3,a4,a2
 84c:	0016b693          	seqz	a3,a3
 850:	8edd                	or	a3,a3,a5
 852:	e291                	bnez	a3,856 <func0+0x32>
 854:	883a                	mv	a6,a4
 856:	fec751e3          	bge	a4,a2,838 <func0+0x14>
 85a:	8832                	mv	a6,a2
 85c:	863a                	mv	a2,a4
 85e:	bfe9                	j	838 <func0+0x14>
 860:	80000537          	lui	a0,0x80000
 864:	357d                	addw	a0,a0,-1 # 7fffffff <__global_pointer$+0x7fffd7ff>
 866:	567d                	li	a2,-1
 868:	00a80363          	beq	a6,a0,86e <func0+0x4a>
 86c:	8642                	mv	a2,a6
 86e:	8532                	mv	a0,a2
 870:	8082                	ret
