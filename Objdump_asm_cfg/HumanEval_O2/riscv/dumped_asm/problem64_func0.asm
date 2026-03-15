000000000000083c <func0>:
 83c:	7161                	add	sp,sp,-432
 83e:	f706                	sd	ra,424(sp)
 840:	f322                	sd	s0,416(sp)
 842:	ef26                	sd	s1,408(sp)
 844:	842a                	mv	s0,a0
 846:	0028                	add	a0,sp,8
 848:	19000613          	li	a2,400
 84c:	0024                	add	s1,sp,8
 84e:	4581                	li	a1,0
 850:	df1ff0ef          	jal	640 <memset@plt>
 854:	4505                	li	a0,1
 856:	458d                	li	a1,3
 858:	c82a                	sw	a0,16(sp)
 85a:	02b44363          	blt	s0,a1,880 <func0+0x44>
 85e:	4681                	li	a3,0
 860:	0014059b          	addw	a1,s0,1
 864:	1582                	sll	a1,a1,0x20
 866:	0205d613          	srl	a2,a1,0x20
 86a:	084c                	add	a1,sp,20
 86c:	1675                	add	a2,a2,-3
 86e:	ff85a703          	lw	a4,-8(a1)
 872:	9d39                	addw	a0,a0,a4
 874:	9d35                	addw	a0,a0,a3
 876:	c188                	sw	a0,0(a1)
 878:	167d                	add	a2,a2,-1
 87a:	0591                	add	a1,a1,4
 87c:	86ba                	mv	a3,a4
 87e:	fa65                	bnez	a2,86e <func0+0x32>
 880:	00241513          	sll	a0,s0,0x2
 884:	9526                	add	a0,a0,s1
 886:	4108                	lw	a0,0(a0)
 888:	70ba                	ld	ra,424(sp)
 88a:	741a                	ld	s0,416(sp)
 88c:	64fa                	ld	s1,408(sp)
 88e:	615d                	add	sp,sp,432
 890:	8082                	ret
