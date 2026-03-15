0000000000000840 <func0>:
 840:	4601                	li	a2,0
 842:	00b05f63          	blez	a1,860 <func0+0x20>
 846:	0c700693          	li	a3,199
 84a:	a021                	j	852 <func0+0x12>
 84c:	15fd                	add	a1,a1,-1
 84e:	0511                	add	a0,a0,4
 850:	c981                	beqz	a1,860 <func0+0x20>
 852:	4118                	lw	a4,0(a0)
 854:	0637079b          	addw	a5,a4,99
 858:	fed7fae3          	bgeu	a5,a3,84c <func0+0xc>
 85c:	9e39                	addw	a2,a2,a4
 85e:	b7fd                	j	84c <func0+0xc>
 860:	8532                	mv	a0,a2
 862:	8082                	ret
