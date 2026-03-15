0000000000000808 <func0>:
 808:	1101                	add	sp,sp,-32
 80a:	ec06                	sd	ra,24(sp)
 80c:	e822                	sd	s0,16(sp)
 80e:	e426                	sd	s1,8(sp)
 810:	e04a                	sd	s2,0(sp)
 812:	892e                	mv	s2,a1
 814:	84aa                	mv	s1,a0
 816:	e4bff0ef          	jal	660 <strlen@plt>
 81a:	0005059b          	sext.w	a1,a0
 81e:	04b05063          	blez	a1,85e <func0+0x56>
 822:	1502                	sll	a0,a0,0x20
 824:	9101                	srl	a0,a0,0x20
 826:	4665                	li	a2,25
 828:	46e9                	li	a3,26
 82a:	874a                	mv	a4,s2
 82c:	a801                	j	83c <func0+0x34>
 82e:	1781                	add	a5,a5,-32
 830:	00f70023          	sb	a5,0(a4)
 834:	0705                	add	a4,a4,1
 836:	157d                	add	a0,a0,-1
 838:	0485                	add	s1,s1,1
 83a:	c115                	beqz	a0,85e <func0+0x56>
 83c:	0004c783          	lbu	a5,0(s1)
 840:	f9f7841b          	addw	s0,a5,-97
 844:	0ff47413          	zext.b	s0,s0
 848:	fe8673e3          	bgeu	a2,s0,82e <func0+0x26>
 84c:	fbf7841b          	addw	s0,a5,-65
 850:	0ff47413          	zext.b	s0,s0
 854:	fcd47ee3          	bgeu	s0,a3,830 <func0+0x28>
 858:	02078793          	add	a5,a5,32
 85c:	bfd1                	j	830 <func0+0x28>
 85e:	00b90533          	add	a0,s2,a1
 862:	00050023          	sb	zero,0(a0)
 866:	60e2                	ld	ra,24(sp)
 868:	6442                	ld	s0,16(sp)
 86a:	64a2                	ld	s1,8(sp)
 86c:	6902                	ld	s2,0(sp)
 86e:	6105                	add	sp,sp,32
 870:	8082                	ret
