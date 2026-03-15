000000000000085c <func0>:
 85c:	4601                	li	a2,0
 85e:	02b05563          	blez	a1,888 <func0+0x2c>
 862:	35fd                	addw	a1,a1,-1
 864:	0015d59b          	srlw	a1,a1,0x1
 868:	0585                	add	a1,a1,1
 86a:	800006b7          	lui	a3,0x80000
 86e:	2685                	addw	a3,a3,1 # ffffffff80000001 <__global_pointer$+0xffffffff7fffd801>
 870:	4805                	li	a6,1
 872:	a021                	j	87a <func0+0x1e>
 874:	15fd                	add	a1,a1,-1
 876:	0521                	add	a0,a0,8
 878:	c981                	beqz	a1,888 <func0+0x2c>
 87a:	411c                	lw	a5,0(a0)
 87c:	00d7f733          	and	a4,a5,a3
 880:	ff071ae3          	bne	a4,a6,874 <func0+0x18>
 884:	9e3d                	addw	a2,a2,a5
 886:	b7fd                	j	874 <func0+0x18>
 888:	8532                	mv	a0,a2
 88a:	8082                	ret
