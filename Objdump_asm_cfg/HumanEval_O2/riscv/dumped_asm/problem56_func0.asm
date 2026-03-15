00000000000007f0 <func0>:
 7f0:	81010113          	add	sp,sp,-2032
 7f4:	7e113423          	sd	ra,2024(sp)
 7f8:	7e813023          	sd	s0,2016(sp)
 7fc:	7c913c23          	sd	s1,2008(sp)
 800:	83010113          	add	sp,sp,-2000
 804:	842a                	mv	s0,a0
 806:	6505                	lui	a0,0x1
 808:	fa05061b          	addw	a2,a0,-96 # fa0 <__FRAME_END__+0x698>
 80c:	0028                	add	a0,sp,8
 80e:	0024                	add	s1,sp,8
 810:	4581                	li	a1,0
 812:	e2fff0ef          	jal	640 <memset@plt>
 816:	4505                	li	a0,1
 818:	4589                	li	a1,2
 81a:	c62a                	sw	a0,12(sp)
 81c:	02b44063          	blt	s0,a1,83c <func0+0x4c>
 820:	0014059b          	addw	a1,s0,1
 824:	1582                	sll	a1,a1,0x20
 826:	0205d613          	srl	a2,a1,0x20
 82a:	080c                	add	a1,sp,16
 82c:	1679                	add	a2,a2,-2
 82e:	ff85a683          	lw	a3,-8(a1)
 832:	9d35                	addw	a0,a0,a3
 834:	c188                	sw	a0,0(a1)
 836:	167d                	add	a2,a2,-1
 838:	0591                	add	a1,a1,4
 83a:	fa75                	bnez	a2,82e <func0+0x3e>
 83c:	00241513          	sll	a0,s0,0x2
 840:	9526                	add	a0,a0,s1
 842:	4108                	lw	a0,0(a0)
 844:	7d010113          	add	sp,sp,2000
 848:	7e813083          	ld	ra,2024(sp)
 84c:	7e013403          	ld	s0,2016(sp)
 850:	7d813483          	ld	s1,2008(sp)
 854:	7f010113          	add	sp,sp,2032
 858:	8082                	ret
