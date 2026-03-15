0000000000000960 <func0>:
 960:	1101                	add	sp,sp,-32
 962:	ec06                	sd	ra,24(sp)
 964:	e822                	sd	s0,16(sp)
 966:	e426                	sd	s1,8(sp)
 968:	e04a                	sd	s2,0(sp)
 96a:	892a                	mv	s2,a0
 96c:	4521                	li	a0,8
 96e:	cf3ff0ef          	jal	660 <malloc@plt>
 972:	00052023          	sw	zero,0(a0)
 976:	00052223          	sw	zero,4(a0)
 97a:	07205063          	blez	s2,9da <func0+0x7a>
 97e:	4801                	li	a6,0
 980:	4881                	li	a7,0
 982:	4585                	li	a1,1
 984:	46a9                	li	a3,10
 986:	66666637          	lui	a2,0x66666
 98a:	6676071b          	addw	a4,a2,1639 # 66666667 <__global_pointer$+0x66663e67>
 98e:	4349                	li	t1,18
 990:	a801                	j	9a0 <func0+0x40>
 992:	2885                	addw	a7,a7,1
 994:	01152223          	sw	a7,4(a0)
 998:	0012859b          	addw	a1,t0,1
 99c:	0322df63          	bge	t0,s2,9da <func0+0x7a>
 9a0:	4401                	li	s0,0
 9a2:	82ae                	mv	t0,a1
 9a4:	02d4043b          	mulw	s0,s0,a3
 9a8:	02e584b3          	mul	s1,a1,a4
 9ac:	03f4d613          	srl	a2,s1,0x3f
 9b0:	9489                	sra	s1,s1,0x22
 9b2:	9e25                	addw	a2,a2,s1
 9b4:	02d604bb          	mulw	s1,a2,a3
 9b8:	409584bb          	subw	s1,a1,s1
 9bc:	0095879b          	addw	a5,a1,9
 9c0:	9c25                	addw	s0,s0,s1
 9c2:	85b2                	mv	a1,a2
 9c4:	fef360e3          	bltu	t1,a5,9a4 <func0+0x44>
 9c8:	fc8298e3          	bne	t0,s0,998 <func0+0x38>
 9cc:	0012f593          	and	a1,t0,1
 9d0:	f1e9                	bnez	a1,992 <func0+0x32>
 9d2:	2805                	addw	a6,a6,1
 9d4:	01052023          	sw	a6,0(a0)
 9d8:	b7c1                	j	998 <func0+0x38>
 9da:	60e2                	ld	ra,24(sp)
 9dc:	6442                	ld	s0,16(sp)
 9de:	64a2                	ld	s1,8(sp)
 9e0:	6902                	ld	s2,0(sp)
 9e2:	6105                	add	sp,sp,32
 9e4:	8082                	ret
