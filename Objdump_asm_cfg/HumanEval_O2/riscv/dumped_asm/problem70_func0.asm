00000000000006fc <func0>:
 6fc:	1101                	add	sp,sp,-32
 6fe:	ec06                	sd	ra,24(sp)
 700:	e822                	sd	s0,16(sp)
 702:	e426                	sd	s1,8(sp)
 704:	e04a                	sd	s2,0(sp)
 706:	842e                	mv	s0,a1
 708:	892a                	mv	s2,a0
 70a:	0015851b          	addw	a0,a1,1
 70e:	4591                	li	a1,4
 710:	f11ff0ef          	jal	620 <calloc@plt>
 714:	02805a63          	blez	s0,748 <func0+0x4c>
 718:	55fd                	li	a1,-1
 71a:	a029                	j	724 <func0+0x28>
 71c:	147d                	add	s0,s0,-1
 71e:	0911                	add	s2,s2,4
 720:	85a6                	mv	a1,s1
 722:	c405                	beqz	s0,74a <func0+0x4e>
 724:	00092483          	lw	s1,0(s2)
 728:	00249613          	sll	a2,s1,0x2
 72c:	962a                	add	a2,a2,a0
 72e:	4214                	lw	a3,0(a2)
 730:	2685                	addw	a3,a3,1
 732:	0096a733          	slt	a4,a3,s1
 736:	00174713          	xor	a4,a4,1
 73a:	0095a7b3          	slt	a5,a1,s1
 73e:	8f7d                	and	a4,a4,a5
 740:	c214                	sw	a3,0(a2)
 742:	ff69                	bnez	a4,71c <func0+0x20>
 744:	84ae                	mv	s1,a1
 746:	bfd9                	j	71c <func0+0x20>
 748:	54fd                	li	s1,-1
 74a:	ee7ff0ef          	jal	630 <free@plt>
 74e:	8526                	mv	a0,s1
 750:	60e2                	ld	ra,24(sp)
 752:	6442                	ld	s0,16(sp)
 754:	64a2                	ld	s1,8(sp)
 756:	6902                	ld	s2,0(sp)
 758:	6105                	add	sp,sp,32
 75a:	8082                	ret
