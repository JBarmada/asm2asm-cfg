00000000000008b0 <func0>:
 8b0:	7179                	add	sp,sp,-48
 8b2:	f406                	sd	ra,40(sp)
 8b4:	f022                	sd	s0,32(sp)
 8b6:	ec26                	sd	s1,24(sp)
 8b8:	e84a                	sd	s2,16(sp)
 8ba:	e44e                	sd	s3,8(sp)
 8bc:	892a                	mv	s2,a0
 8be:	db3ff0ef          	jal	670 <strlen@plt>
 8c2:	c505                	beqz	a0,8ea <func0+0x3a>
 8c4:	84aa                	mv	s1,a0
 8c6:	4401                	li	s0,0
 8c8:	00000997          	auipc	s3,0x0
 8cc:	14a98993          	add	s3,s3,330 # a12 <_IO_stdin_used+0x116>
 8d0:	00094583          	lbu	a1,0(s2)
 8d4:	461d                	li	a2,7
 8d6:	854e                	mv	a0,s3
 8d8:	da9ff0ef          	jal	680 <memchr@plt>
 8dc:	00a03533          	snez	a0,a0
 8e0:	9c29                	addw	s0,s0,a0
 8e2:	14fd                	add	s1,s1,-1
 8e4:	0905                	add	s2,s2,1
 8e6:	f4ed                	bnez	s1,8d0 <func0+0x20>
 8e8:	a011                	j	8ec <func0+0x3c>
 8ea:	4401                	li	s0,0
 8ec:	8522                	mv	a0,s0
 8ee:	70a2                	ld	ra,40(sp)
 8f0:	7402                	ld	s0,32(sp)
 8f2:	64e2                	ld	s1,24(sp)
 8f4:	6942                	ld	s2,16(sp)
 8f6:	69a2                	ld	s3,8(sp)
 8f8:	6145                	add	sp,sp,48
 8fa:	8082                	ret
