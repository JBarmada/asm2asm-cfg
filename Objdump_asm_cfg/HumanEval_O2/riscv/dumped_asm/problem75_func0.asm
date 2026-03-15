0000000000000870 <func0>:
 870:	7139                	add	sp,sp,-64
 872:	fc06                	sd	ra,56(sp)
 874:	f822                	sd	s0,48(sp)
 876:	f426                	sd	s1,40(sp)
 878:	f04a                	sd	s2,32(sp)
 87a:	ec4e                	sd	s3,24(sp)
 87c:	e852                	sd	s4,16(sp)
 87e:	e456                	sd	s5,8(sp)
 880:	8ab6                	mv	s5,a3
 882:	8932                	mv	s2,a2
 884:	89aa                	mv	s3,a0
 886:	02b05163          	blez	a1,8a8 <func0+0x38>
 88a:	842e                	mv	s0,a1
 88c:	4a01                	li	s4,0
 88e:	84ce                	mv	s1,s3
 890:	6088                	ld	a0,0(s1)
 892:	e4fff0ef          	jal	6e0 <strlen@plt>
 896:	00aa0a3b          	addw	s4,s4,a0
 89a:	147d                	add	s0,s0,-1
 89c:	04a1                	add	s1,s1,8
 89e:	f86d                	bnez	s0,890 <func0+0x20>
 8a0:	4401                	li	s0,0
 8a2:	01504763          	bgtz	s5,8b0 <func0+0x40>
 8a6:	a831                	j	8c2 <func0+0x52>
 8a8:	4a01                	li	s4,0
 8aa:	4401                	li	s0,0
 8ac:	01505b63          	blez	s5,8c2 <func0+0x52>
 8b0:	84ca                	mv	s1,s2
 8b2:	6088                	ld	a0,0(s1)
 8b4:	e2dff0ef          	jal	6e0 <strlen@plt>
 8b8:	9c29                	addw	s0,s0,a0
 8ba:	1afd                	add	s5,s5,-1
 8bc:	04a1                	add	s1,s1,8
 8be:	fe0a9ae3          	bnez	s5,8b2 <func0+0x42>
 8c2:	01444363          	blt	s0,s4,8c8 <func0+0x58>
 8c6:	894e                	mv	s2,s3
 8c8:	008a4363          	blt	s4,s0,8ce <func0+0x5e>
 8cc:	89ca                	mv	s3,s2
 8ce:	854e                	mv	a0,s3
 8d0:	70e2                	ld	ra,56(sp)
 8d2:	7442                	ld	s0,48(sp)
 8d4:	74a2                	ld	s1,40(sp)
 8d6:	7902                	ld	s2,32(sp)
 8d8:	69e2                	ld	s3,24(sp)
 8da:	6a42                	ld	s4,16(sp)
 8dc:	6aa2                	ld	s5,8(sp)
 8de:	6121                	add	sp,sp,64
 8e0:	8082                	ret
