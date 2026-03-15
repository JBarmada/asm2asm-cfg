00000000000008f0 <func0>:
 8f0:	1141                	add	sp,sp,-16
 8f2:	e406                	sd	ra,8(sp)
 8f4:	e022                	sd	s0,0(sp)
 8f6:	842a                	mv	s0,a0
 8f8:	050a                	sll	a0,a0,0x2
 8fa:	d67ff0ef          	jal	660 <malloc@plt>
 8fe:	4589                	li	a1,2
 900:	c100                	sw	s0,0(a0)
 902:	00b44c63          	blt	s0,a1,91a <func0+0x2a>
 906:	410c                	lw	a1,0(a0)
 908:	00450613          	add	a2,a0,4
 90c:	fff40693          	add	a3,s0,-1
 910:	2589                	addw	a1,a1,2
 912:	c20c                	sw	a1,0(a2)
 914:	16fd                	add	a3,a3,-1
 916:	0611                	add	a2,a2,4
 918:	fee5                	bnez	a3,910 <func0+0x20>
 91a:	60a2                	ld	ra,8(sp)
 91c:	6402                	ld	s0,0(sp)
 91e:	0141                	add	sp,sp,16
 920:	8082                	ret
