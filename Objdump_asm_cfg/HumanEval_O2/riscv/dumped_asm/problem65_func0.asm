00000000000008b4 <func0>:
 8b4:	715d                	add	sp,sp,-80
 8b6:	e486                	sd	ra,72(sp)
 8b8:	e0a2                	sd	s0,64(sp)
 8ba:	fc26                	sd	s1,56(sp)
 8bc:	f84a                	sd	s2,48(sp)
 8be:	f44e                	sd	s3,40(sp)
 8c0:	f052                	sd	s4,32(sp)
 8c2:	ec56                	sd	s5,24(sp)
 8c4:	e85a                	sd	s6,16(sp)
 8c6:	e45e                	sd	s7,8(sp)
 8c8:	892a                	mv	s2,a0
 8ca:	da7ff0ef          	jal	670 <strlen@plt>
 8ce:	00050a1b          	sext.w	s4,a0
 8d2:	05405e63          	blez	s4,92e <func0+0x7a>
 8d6:	89aa                	mv	s3,a0
 8d8:	4b81                	li	s7,0
 8da:	557d                	li	a0,-1
 8dc:	02055a93          	srl	s5,a0,0x20
 8e0:	02099513          	sll	a0,s3,0x20
 8e4:	02055413          	srl	s0,a0,0x20
 8e8:	00000b17          	auipc	s6,0x0
 8ec:	126b0b13          	add	s6,s6,294 # a0e <_IO_stdin_used+0xc6>
 8f0:	84ca                	mv	s1,s2
 8f2:	0004c583          	lbu	a1,0(s1)
 8f6:	462d                	li	a2,11
 8f8:	855a                	mv	a0,s6
 8fa:	d87ff0ef          	jal	680 <memchr@plt>
 8fe:	00a03533          	snez	a0,a0
 902:	00ab8bbb          	addw	s7,s7,a0
 906:	147d                	add	s0,s0,-1
 908:	0485                	add	s1,s1,1
 90a:	f465                	bnez	s0,8f2 <func0+0x3e>
 90c:	03405263          	blez	s4,930 <func0+0x7c>
 910:	01598533          	add	a0,s3,s5
 914:	01557533          	and	a0,a0,s5
 918:	954a                	add	a0,a0,s2
 91a:	00054503          	lbu	a0,0(a0)
 91e:	02056513          	or	a0,a0,32
 922:	07900593          	li	a1,121
 926:	00b51563          	bne	a0,a1,930 <func0+0x7c>
 92a:	2b85                	addw	s7,s7,1
 92c:	a011                	j	930 <func0+0x7c>
 92e:	4b81                	li	s7,0
 930:	855e                	mv	a0,s7
 932:	60a6                	ld	ra,72(sp)
 934:	6406                	ld	s0,64(sp)
 936:	74e2                	ld	s1,56(sp)
 938:	7942                	ld	s2,48(sp)
 93a:	79a2                	ld	s3,40(sp)
 93c:	7a02                	ld	s4,32(sp)
 93e:	6ae2                	ld	s5,24(sp)
 940:	6b42                	ld	s6,16(sp)
 942:	6ba2                	ld	s7,8(sp)
 944:	6161                	add	sp,sp,80
 946:	8082                	ret
