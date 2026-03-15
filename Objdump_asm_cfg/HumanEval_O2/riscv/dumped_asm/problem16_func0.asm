00000000000008f8 <func0>:
 8f8:	7179                	add	sp,sp,-48
 8fa:	f406                	sd	ra,40(sp)
 8fc:	f022                	sd	s0,32(sp)
 8fe:	ec26                	sd	s1,24(sp)
 900:	e84a                	sd	s2,16(sp)
 902:	e44e                	sd	s3,8(sp)
 904:	e052                	sd	s4,0(sp)
 906:	06a05563          	blez	a0,970 <func0+0x78>
 90a:	892a                	mv	s2,a0
 90c:	4489                	li	s1,2
 90e:	4505                	li	a0,1
 910:	00000997          	auipc	s3,0x0
 914:	13198993          	add	s3,s3,305 # a41 <_IO_stdin_used+0xa5>
 918:	842a                	mv	s0,a0
 91a:	4501                	li	a0,0
 91c:	4581                	li	a1,0
 91e:	864e                	mv	a2,s3
 920:	86a2                	mv	a3,s0
 922:	e1fff0ef          	jal	740 <snprintf@plt>
 926:	9ca9                	addw	s1,s1,a0
 928:	0014051b          	addw	a0,s0,1
 92c:	ff2446e3          	blt	s0,s2,918 <func0+0x20>
 930:	8526                	mv	a0,s1
 932:	defff0ef          	jal	720 <malloc@plt>
 936:	c929                	beqz	a0,988 <func0+0x90>
 938:	89aa                	mv	s3,a0
 93a:	000500a3          	sb	zero,1(a0)
 93e:	03000513          	li	a0,48
 942:	00a98023          	sb	a0,0(s3)
 946:	05205263          	blez	s2,98a <func0+0x92>
 94a:	00198413          	add	s0,s3,1
 94e:	4505                	li	a0,1
 950:	00000a17          	auipc	s4,0x0
 954:	0f1a0a13          	add	s4,s4,241 # a41 <_IO_stdin_used+0xa5>
 958:	84aa                	mv	s1,a0
 95a:	8522                	mv	a0,s0
 95c:	85d2                	mv	a1,s4
 95e:	8626                	mv	a2,s1
 960:	df1ff0ef          	jal	750 <sprintf@plt>
 964:	942a                	add	s0,s0,a0
 966:	0014851b          	addw	a0,s1,1
 96a:	ff24c7e3          	blt	s1,s2,958 <func0+0x60>
 96e:	a831                	j	98a <func0+0x92>
 970:	4509                	li	a0,2
 972:	dafff0ef          	jal	720 <malloc@plt>
 976:	c909                	beqz	a0,988 <func0+0x90>
 978:	89aa                	mv	s3,a0
 97a:	000500a3          	sb	zero,1(a0)
 97e:	03000513          	li	a0,48
 982:	00a98023          	sb	a0,0(s3)
 986:	a011                	j	98a <func0+0x92>
 988:	4981                	li	s3,0
 98a:	854e                	mv	a0,s3
 98c:	70a2                	ld	ra,40(sp)
 98e:	7402                	ld	s0,32(sp)
 990:	64e2                	ld	s1,24(sp)
 992:	6942                	ld	s2,16(sp)
 994:	69a2                	ld	s3,8(sp)
 996:	6a02                	ld	s4,0(sp)
 998:	6145                	add	sp,sp,48
 99a:	8082                	ret
