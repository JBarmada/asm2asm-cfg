000000000000084c <func0>:
 84c:	01f5d69b          	srlw	a3,a1,0x1f
 850:	9ead                	addw	a3,a3,a1
 852:	4709                	li	a4,2
 854:	4016d81b          	sraw	a6,a3,0x1
 858:	02e5cc63          	blt	a1,a4,890 <func0+0x44>
 85c:	4781                	li	a5,0
 85e:	4281                	li	t0,0
 860:	02081693          	sll	a3,a6,0x20
 864:	0206d893          	srl	a7,a3,0x20
 868:	832a                	mv	t1,a0
 86a:	00032703          	lw	a4,0(t1)
 86e:	fff7c693          	not	a3,a5
 872:	9ead                	addw	a3,a3,a1
 874:	068a                	sll	a3,a3,0x2
 876:	96aa                	add	a3,a3,a0
 878:	4294                	lw	a3,0(a3)
 87a:	02d71e63          	bne	a4,a3,8b6 <func0+0x6a>
 87e:	0017169b          	sllw	a3,a4,0x1
 882:	00d282bb          	addw	t0,t0,a3
 886:	0785                	add	a5,a5,1
 888:	0311                	add	t1,t1,4
 88a:	fef890e3          	bne	a7,a5,86a <func0+0x1e>
 88e:	a011                	j	892 <func0+0x46>
 890:	4281                	li	t0,0
 892:	800006b7          	lui	a3,0x80000
 896:	2685                	addw	a3,a3,1 # ffffffff80000001 <__global_pointer$+0xffffffff7fffd801>
 898:	8df5                	and	a1,a1,a3
 89a:	4685                	li	a3,1
 89c:	00d59863          	bne	a1,a3,8ac <func0+0x60>
 8a0:	00281593          	sll	a1,a6,0x2
 8a4:	952e                	add	a0,a0,a1
 8a6:	4108                	lw	a0,0(a0)
 8a8:	005502bb          	addw	t0,a0,t0
 8ac:	00562533          	slt	a0,a2,t0
 8b0:	00154513          	xor	a0,a0,1
 8b4:	8082                	ret
 8b6:	4501                	li	a0,0
 8b8:	8082                	ret
