00000000000008bc <func0>:
 8bc:	1141                	add	sp,sp,-16
 8be:	e406                	sd	ra,8(sp)
 8c0:	e022                	sd	s0,0(sp)
 8c2:	842a                	mv	s0,a0
 8c4:	050a                	sll	a0,a0,0x2
 8c6:	d9bff0ef          	jal	660 <malloc@plt>
 8ca:	02805a63          	blez	s0,8fe <func0+0x42>
 8ce:	4581                	li	a1,0
 8d0:	0014061b          	addw	a2,s0,1
 8d4:	1602                	sll	a2,a2,0x20
 8d6:	02065813          	srl	a6,a2,0x20
 8da:	4685                	li	a3,1
 8dc:	872a                	mv	a4,a0
 8de:	4405                	li	s0,1
 8e0:	a031                	j	8ec <func0+0x30>
 8e2:	c31c                	sw	a5,0(a4)
 8e4:	0685                	add	a3,a3,1
 8e6:	0711                	add	a4,a4,4
 8e8:	00d80b63          	beq	a6,a3,8fe <func0+0x42>
 8ec:	02d4043b          	mulw	s0,s0,a3
 8f0:	0016f613          	and	a2,a3,1
 8f4:	9db5                	addw	a1,a1,a3
 8f6:	87a2                	mv	a5,s0
 8f8:	d66d                	beqz	a2,8e2 <func0+0x26>
 8fa:	87ae                	mv	a5,a1
 8fc:	b7dd                	j	8e2 <func0+0x26>
 8fe:	60a2                	ld	ra,8(sp)
 900:	6402                	ld	s0,0(sp)
 902:	0141                	add	sp,sp,16
 904:	8082                	ret
