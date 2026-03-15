0000000000000824 <func0>:
 824:	1101                	add	sp,sp,-32
 826:	ec06                	sd	ra,24(sp)
 828:	e822                	sd	s0,16(sp)
 82a:	e426                	sd	s1,8(sp)
 82c:	e04a                	sd	s2,0(sp)
 82e:	00054483          	lbu	s1,0(a0)
 832:	ccb5                	beqz	s1,8ae <func0+0x8a>
 834:	892a                	mv	s2,a0
 836:	e0bff0ef          	jal	640 <__ctype_b_loc@plt>
 83a:	85aa                	mv	a1,a0
 83c:	4501                	li	a0,0
 83e:	4401                	li	s0,0
 840:	0005b283          	ld	t0,0(a1)
 844:	00190613          	add	a2,s2,1
 848:	4305                	li	t1,1
 84a:	03f00813          	li	a6,63
 84e:	c00026b7          	lui	a3,0xc0002
 852:	2685                	addw	a3,a3,1 # ffffffffc0002001 <__global_pointer$+0xffffffffbffff801>
 854:	02169893          	sll	a7,a3,0x21
 858:	a829                	j	872 <func0+0x4e>
 85a:	4685                	li	a3,1
 85c:	00d4d593          	srl	a1,s1,0xd
 860:	00064483          	lbu	s1,0(a2)
 864:	00803733          	snez	a4,s0
 868:	8df9                	and	a1,a1,a4
 86a:	9d2d                	addw	a0,a0,a1
 86c:	0605                	add	a2,a2,1
 86e:	8436                	mv	s0,a3
 870:	c0a1                	beqz	s1,8b0 <func0+0x8c>
 872:	0ff4f713          	zext.b	a4,s1
 876:	00171693          	sll	a3,a4,0x1
 87a:	9696                	add	a3,a3,t0
 87c:	00069483          	lh	s1,0(a3)
 880:	03249693          	sll	a3,s1,0x32
 884:	96fd                	sra	a3,a3,0x3f
 886:	fb770593          	add	a1,a4,-73
 88a:	0015b593          	seqz	a1,a1
 88e:	006037b3          	snez	a5,t1
 892:	8dfd                	and	a1,a1,a5
 894:	0066f333          	and	t1,a3,t1
 898:	f1e9                	bnez	a1,85a <func0+0x36>
 89a:	4681                	li	a3,0
 89c:	fce860e3          	bltu	a6,a4,85c <func0+0x38>
 8a0:	00e8d5b3          	srl	a1,a7,a4
 8a4:	8985                	and	a1,a1,1
 8a6:	d9dd                	beqz	a1,85c <func0+0x38>
 8a8:	4681                	li	a3,0
 8aa:	4305                	li	t1,1
 8ac:	bf45                	j	85c <func0+0x38>
 8ae:	4501                	li	a0,0
 8b0:	60e2                	ld	ra,24(sp)
 8b2:	6442                	ld	s0,16(sp)
 8b4:	64a2                	ld	s1,8(sp)
 8b6:	6902                	ld	s2,0(sp)
 8b8:	6105                	add	sp,sp,32
 8ba:	8082                	ret
