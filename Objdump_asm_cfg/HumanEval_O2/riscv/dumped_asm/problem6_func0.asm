00000000000008ac <func0>:
 8ac:	1101                	add	sp,sp,-32
 8ae:	ec06                	sd	ra,24(sp)
 8b0:	e822                	sd	s0,16(sp)
 8b2:	e426                	sd	s1,8(sp)
 8b4:	e04a                	sd	s2,0(sp)
 8b6:	8432                	mv	s0,a2
 8b8:	84ae                	mv	s1,a1
 8ba:	892a                	mv	s2,a0
 8bc:	00b04463          	bgtz	a1,8c4 <func0+0x18>
 8c0:	4501                	li	a0,0
 8c2:	a021                	j	8ca <func0+0x1e>
 8c4:	0014951b          	sllw	a0,s1,0x1
 8c8:	357d                	addw	a0,a0,-1
 8ca:	c288                	sw	a0,0(a3)
 8cc:	050a                	sll	a0,a0,0x2
 8ce:	d93ff0ef          	jal	660 <malloc@plt>
 8d2:	02905963          	blez	s1,904 <func0+0x58>
 8d6:	00092583          	lw	a1,0(s2)
 8da:	4605                	li	a2,1
 8dc:	c10c                	sw	a1,0(a0)
 8de:	02c48363          	beq	s1,a2,904 <func0+0x58>
 8e2:	02049593          	sll	a1,s1,0x20
 8e6:	0205d613          	srl	a2,a1,0x20
 8ea:	00490593          	add	a1,s2,4
 8ee:	167d                	add	a2,a2,-1
 8f0:	00850693          	add	a3,a0,8
 8f4:	fe86ae23          	sw	s0,-4(a3)
 8f8:	4198                	lw	a4,0(a1)
 8fa:	c298                	sw	a4,0(a3)
 8fc:	0591                	add	a1,a1,4
 8fe:	167d                	add	a2,a2,-1
 900:	06a1                	add	a3,a3,8
 902:	fa6d                	bnez	a2,8f4 <func0+0x48>
 904:	60e2                	ld	ra,24(sp)
 906:	6442                	ld	s0,16(sp)
 908:	64a2                	ld	s1,8(sp)
 90a:	6902                	ld	s2,0(sp)
 90c:	6105                	add	sp,sp,32
 90e:	8082                	ret
