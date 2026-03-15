0000000000000838 <func0>:
 838:	862a                	mv	a2,a0
 83a:	557d                	li	a0,-1
 83c:	02c5c263          	blt	a1,a2,860 <func0+0x28>
 840:	00c5c6b3          	xor	a3,a1,a2
 844:	80000637          	lui	a2,0x80000
 848:	2605                	addw	a2,a2,1 # ffffffff80000001 <__global_pointer$+0xffffffff7fffd801>
 84a:	8e6d                	and	a2,a2,a1
 84c:	00164713          	xor	a4,a2,1
 850:	8ed9                	or	a3,a3,a4
 852:	c699                	beqz	a3,860 <func0+0x28>
 854:	fff60513          	add	a0,a2,-1
 858:	00153513          	seqz	a0,a0
 85c:	40a5853b          	subw	a0,a1,a0
 860:	8082                	ret
