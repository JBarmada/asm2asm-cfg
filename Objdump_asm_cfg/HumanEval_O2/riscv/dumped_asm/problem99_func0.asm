00000000000008a4 <func0>:
 8a4:	7139                	add	sp,sp,-64
 8a6:	fc06                	sd	ra,56(sp)
 8a8:	f822                	sd	s0,48(sp)
 8aa:	f426                	sd	s1,40(sp)
 8ac:	f04a                	sd	s2,32(sp)
 8ae:	ec4e                	sd	s3,24(sp)
 8b0:	e852                	sd	s4,16(sp)
 8b2:	e456                	sd	s5,8(sp)
 8b4:	8a2a                	mv	s4,a0
 8b6:	00054503          	lbu	a0,0(a0)
 8ba:	c131                	beqz	a0,8fe <func0+0x5a>
 8bc:	8552                	mv	a0,s4
 8be:	db3ff0ef          	jal	670 <strlen@plt>
 8c2:	892a                	mv	s2,a0
 8c4:	4401                	li	s0,0
 8c6:	4a81                	li	s5,0
 8c8:	4485                	li	s1,1
 8ca:	00000997          	auipc	s3,0x0
 8ce:	10598993          	add	s3,s3,261 # 9cf <_IO_stdin_used+0xbb>
 8d2:	03247763          	bgeu	s0,s2,900 <func0+0x5c>
 8d6:	008a0533          	add	a0,s4,s0
 8da:	00054583          	lbu	a1,0(a0)
 8de:	4619                	li	a2,6
 8e0:	854e                	mv	a0,s3
 8e2:	d9fff0ef          	jal	680 <memchr@plt>
 8e6:	009a05b3          	add	a1,s4,s1
 8ea:	0005c583          	lbu	a1,0(a1)
 8ee:	00a03533          	snez	a0,a0
 8f2:	00aa8abb          	addw	s5,s5,a0
 8f6:	0409                	add	s0,s0,2
 8f8:	0485                	add	s1,s1,1
 8fa:	fde1                	bnez	a1,8d2 <func0+0x2e>
 8fc:	a011                	j	900 <func0+0x5c>
 8fe:	4a81                	li	s5,0
 900:	8556                	mv	a0,s5
 902:	70e2                	ld	ra,56(sp)
 904:	7442                	ld	s0,48(sp)
 906:	74a2                	ld	s1,40(sp)
 908:	7902                	ld	s2,32(sp)
 90a:	69e2                	ld	s3,24(sp)
 90c:	6a42                	ld	s4,16(sp)
 90e:	6aa2                	ld	s5,8(sp)
 910:	6121                	add	sp,sp,64
 912:	8082                	ret
