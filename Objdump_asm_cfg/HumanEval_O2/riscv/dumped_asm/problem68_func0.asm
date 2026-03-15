00000000000008c8 <func0>:
 8c8:	7139                	add	sp,sp,-64
 8ca:	fc06                	sd	ra,56(sp)
 8cc:	f822                	sd	s0,48(sp)
 8ce:	f426                	sd	s1,40(sp)
 8d0:	f04a                	sd	s2,32(sp)
 8d2:	00011c23          	sh	zero,24(sp)
 8d6:	e802                	sd	zero,16(sp)
 8d8:	00011423          	sh	zero,8(sp)
 8dc:	e002                	sd	zero,0(sp)
 8de:	00054403          	lbu	s0,0(a0)
 8e2:	892e                	mv	s2,a1
 8e4:	c425                	beqz	s0,94c <func0+0x84>
 8e6:	84aa                	mv	s1,a0
 8e8:	da9ff0ef          	jal	690 <__ctype_b_loc@plt>
 8ec:	4781                	li	a5,0
 8ee:	4601                	li	a2,0
 8f0:	6108                	ld	a0,0(a0)
 8f2:	00148593          	add	a1,s1,1
 8f6:	01010813          	add	a6,sp,16
 8fa:	868a                	mv	a3,sp
 8fc:	a039                	j	90a <func0+0x42>
 8fe:	863a                	mv	a2,a4
 900:	0005c403          	lbu	s0,0(a1)
 904:	0585                	add	a1,a1,1
 906:	87a6                	mv	a5,s1
 908:	c031                	beqz	s0,94c <func0+0x84>
 90a:	0ff47713          	zext.b	a4,s0
 90e:	0706                	sll	a4,a4,0x1
 910:	972a                	add	a4,a4,a0
 912:	00174703          	lbu	a4,1(a4)
 916:	8b21                	and	a4,a4,8
 918:	ef01                	bnez	a4,930 <func0+0x68>
 91a:	4481                	li	s1,0
 91c:	00163713          	seqz	a4,a2
 920:	00f02433          	sgtz	s0,a5
 924:	8c79                	and	s0,s0,a4
 926:	4705                	li	a4,1
 928:	f879                	bnez	s0,8fe <func0+0x36>
 92a:	8732                	mv	a4,a2
 92c:	84be                	mv	s1,a5
 92e:	bfc1                	j	8fe <func0+0x36>
 930:	0017849b          	addw	s1,a5,1
 934:	c619                	beqz	a2,942 <func0+0x7a>
 936:	00f68633          	add	a2,a3,a5
 93a:	00860023          	sb	s0,0(a2)
 93e:	4605                	li	a2,1
 940:	b7c1                	j	900 <func0+0x38>
 942:	00f80733          	add	a4,a6,a5
 946:	00870023          	sb	s0,0(a4)
 94a:	bf5d                	j	900 <func0+0x38>
 94c:	0808                	add	a0,sp,16
 94e:	4629                	li	a2,10
 950:	4581                	li	a1,0
 952:	d1fff0ef          	jal	670 <strtol@plt>
 956:	84aa                	mv	s1,a0
 958:	850a                	mv	a0,sp
 95a:	4629                	li	a2,10
 95c:	4581                	li	a1,0
 95e:	d13ff0ef          	jal	670 <strtol@plt>
 962:	9d25                	addw	a0,a0,s1
 964:	40a9053b          	subw	a0,s2,a0
 968:	70e2                	ld	ra,56(sp)
 96a:	7442                	ld	s0,48(sp)
 96c:	74a2                	ld	s1,40(sp)
 96e:	7902                	ld	s2,32(sp)
 970:	6121                	add	sp,sp,64
 972:	8082                	ret
