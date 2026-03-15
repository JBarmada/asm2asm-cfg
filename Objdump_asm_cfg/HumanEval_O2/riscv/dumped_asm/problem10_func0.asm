00000000000008d4 <func0>:
 8d4:	1101                	add	sp,sp,-32
 8d6:	ec06                	sd	ra,24(sp)
 8d8:	e822                	sd	s0,16(sp)
 8da:	e426                	sd	s1,8(sp)
 8dc:	02b05a63          	blez	a1,910 <func0+0x3c>
 8e0:	842e                	mv	s0,a1
 8e2:	84aa                	mv	s1,a0
 8e4:	00259513          	sll	a0,a1,0x2
 8e8:	d79ff0ef          	jal	660 <malloc@plt>
 8ec:	c11d                	beqz	a0,912 <func0+0x3e>
 8ee:	4090                	lw	a2,0(s1)
 8f0:	4581                	li	a1,0
 8f2:	a801                	j	902 <func0+0x2e>
 8f4:	00b50633          	add	a2,a0,a1
 8f8:	c214                	sw	a3,0(a2)
 8fa:	147d                	add	s0,s0,-1
 8fc:	0591                	add	a1,a1,4
 8fe:	8636                	mv	a2,a3
 900:	c809                	beqz	s0,912 <func0+0x3e>
 902:	00b486b3          	add	a3,s1,a1
 906:	4294                	lw	a3,0(a3)
 908:	fed646e3          	blt	a2,a3,8f4 <func0+0x20>
 90c:	86b2                	mv	a3,a2
 90e:	b7dd                	j	8f4 <func0+0x20>
 910:	4501                	li	a0,0
 912:	60e2                	ld	ra,24(sp)
 914:	6442                	ld	s0,16(sp)
 916:	64a2                	ld	s1,8(sp)
 918:	6105                	add	sp,sp,32
 91a:	8082                	ret
