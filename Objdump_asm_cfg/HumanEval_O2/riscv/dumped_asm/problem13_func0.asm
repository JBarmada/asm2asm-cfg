0000000000000904 <func0>:
 904:	7139                	add	sp,sp,-64
 906:	fc06                	sd	ra,56(sp)
 908:	f822                	sd	s0,48(sp)
 90a:	f426                	sd	s1,40(sp)
 90c:	f04a                	sd	s2,32(sp)
 90e:	ec4e                	sd	s3,24(sp)
 910:	e852                	sd	s4,16(sp)
 912:	e456                	sd	s5,8(sp)
 914:	02b05e63          	blez	a1,950 <func0+0x4c>
 918:	8aae                	mv	s5,a1
 91a:	84aa                	mv	s1,a0
 91c:	4401                	li	s0,0
 91e:	00000a17          	auipc	s4,0x0
 922:	0aca0a13          	add	s4,s4,172 # 9ca <_IO_stdin_used+0x5e>
 926:	4981                	li	s3,0
 928:	a039                	j	936 <func0+0x32>
 92a:	1afd                	add	s5,s5,-1
 92c:	04a1                	add	s1,s1,8
 92e:	8a4a                	mv	s4,s2
 930:	844e                	mv	s0,s3
 932:	020a8363          	beqz	s5,958 <func0+0x54>
 936:	0004b903          	ld	s2,0(s1)
 93a:	854a                	mv	a0,s2
 93c:	e05ff0ef          	jal	740 <strlen@plt>
 940:	2501                	sext.w	a0,a0
 942:	00854363          	blt	a0,s0,948 <func0+0x44>
 946:	89aa                	mv	s3,a0
 948:	fea441e3          	blt	s0,a0,92a <func0+0x26>
 94c:	8952                	mv	s2,s4
 94e:	bff1                	j	92a <func0+0x26>
 950:	00000917          	auipc	s2,0x0
 954:	07a90913          	add	s2,s2,122 # 9ca <_IO_stdin_used+0x5e>
 958:	854a                	mv	a0,s2
 95a:	70e2                	ld	ra,56(sp)
 95c:	7442                	ld	s0,48(sp)
 95e:	74a2                	ld	s1,40(sp)
 960:	7902                	ld	s2,32(sp)
 962:	69e2                	ld	s3,24(sp)
 964:	6a42                	ld	s4,16(sp)
 966:	6aa2                	ld	s5,8(sp)
 968:	6121                	add	sp,sp,64
 96a:	8082                	ret
