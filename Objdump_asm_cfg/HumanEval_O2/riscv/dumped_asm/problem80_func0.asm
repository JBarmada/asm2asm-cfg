0000000000000934 <func0>:
 934:	7179                	add	sp,sp,-48
 936:	f406                	sd	ra,40(sp)
 938:	f022                	sd	s0,32(sp)
 93a:	ec26                	sd	s1,24(sp)
 93c:	e84a                	sd	s2,16(sp)
 93e:	e44e                	sd	s3,8(sp)
 940:	e052                	sd	s4,0(sp)
 942:	84aa                	mv	s1,a0
 944:	04000513          	li	a0,64
 948:	dd9ff0ef          	jal	720 <malloc@plt>
 94c:	c915                	beqz	a0,980 <func0+0x4c>
 94e:	842a                	mv	s0,a0
 950:	02050fa3          	sb	zero,63(a0)
 954:	c885                	beqz	s1,984 <func0+0x50>
 956:	03e00513          	li	a0,62
 95a:	02905b63          	blez	s1,990 <func0+0x5c>
 95e:	4585                	li	a1,1
 960:	0004861b          	sext.w	a2,s1
 964:	0014f693          	and	a3,s1,1
 968:	0306e693          	or	a3,a3,48
 96c:	00a40733          	add	a4,s0,a0
 970:	157d                	add	a0,a0,-1
 972:	00d70023          	sb	a3,0(a4)
 976:	0014d49b          	srlw	s1,s1,0x1
 97a:	fec5e3e3          	bltu	a1,a2,960 <func0+0x2c>
 97e:	a809                	j	990 <func0+0x5c>
 980:	4481                	li	s1,0
 982:	a085                	j	9e2 <func0+0xae>
 984:	03000513          	li	a0,48
 988:	02a40f23          	sb	a0,62(s0)
 98c:	03d00513          	li	a0,61
 990:	fff5059b          	addw	a1,a0,-1
 994:	0005061b          	sext.w	a2,a0
 998:	9622                	add	a2,a2,s0
 99a:	06200993          	li	s3,98
 99e:	01360023          	sb	s3,0(a2)
 9a2:	00b40933          	add	s2,s0,a1
 9a6:	06400a13          	li	s4,100
 9aa:	01490023          	sb	s4,0(s2)
 9ae:	04200593          	li	a1,66
 9b2:	40a5853b          	subw	a0,a1,a0
 9b6:	d6bff0ef          	jal	720 <malloc@plt>
 9ba:	c105                	beqz	a0,9da <func0+0xa6>
 9bc:	84aa                	mv	s1,a0
 9be:	85ca                	mv	a1,s2
 9c0:	d81ff0ef          	jal	740 <strcpy@plt>
 9c4:	8526                	mv	a0,s1
 9c6:	d6bff0ef          	jal	730 <strlen@plt>
 9ca:	9526                	add	a0,a0,s1
 9cc:	01450023          	sb	s4,0(a0)
 9d0:	013500a3          	sb	s3,1(a0)
 9d4:	00050123          	sb	zero,2(a0)
 9d8:	a011                	j	9dc <func0+0xa8>
 9da:	4481                	li	s1,0
 9dc:	8522                	mv	a0,s0
 9de:	d93ff0ef          	jal	770 <free@plt>
 9e2:	8526                	mv	a0,s1
 9e4:	70a2                	ld	ra,40(sp)
 9e6:	7402                	ld	s0,32(sp)
 9e8:	64e2                	ld	s1,24(sp)
 9ea:	6942                	ld	s2,16(sp)
 9ec:	69a2                	ld	s3,8(sp)
 9ee:	6a02                	ld	s4,0(sp)
 9f0:	6145                	add	sp,sp,48
 9f2:	8082                	ret
