00000000000009e0 <func0>:
 9e0:	7179                	add	sp,sp,-48
 9e2:	f406                	sd	ra,40(sp)
 9e4:	f022                	sd	s0,32(sp)
 9e6:	ec26                	sd	s1,24(sp)
 9e8:	e84a                	sd	s2,16(sp)
 9ea:	e44e                	sd	s3,8(sp)
 9ec:	e052                	sd	s4,0(sp)
 9ee:	04b05363          	blez	a1,a34 <func0+0x54>
 9f2:	8a2e                	mv	s4,a1
 9f4:	89aa                	mv	s3,a0
 9f6:	4901                	li	s2,0
 9f8:	842e                	mv	s0,a1
 9fa:	84aa                	mv	s1,a0
 9fc:	6088                	ld	a0,0(s1)
 9fe:	e03ff0ef          	jal	800 <strlen@plt>
 a02:	00a9093b          	addw	s2,s2,a0
 a06:	147d                	add	s0,s0,-1
 a08:	04a1                	add	s1,s1,8
 a0a:	f86d                	bnez	s0,9fc <func0+0x1c>
 a0c:	0019051b          	addw	a0,s2,1
 a10:	dd1ff0ef          	jal	7e0 <malloc@plt>
 a14:	c905                	beqz	a0,a44 <func0+0x64>
 a16:	892a                	mv	s2,a0
 a18:	00050023          	sb	zero,0(a0)
 a1c:	03405563          	blez	s4,a46 <func0+0x66>
 a20:	0009b583          	ld	a1,0(s3)
 a24:	854a                	mv	a0,s2
 a26:	dcbff0ef          	jal	7f0 <strcat@plt>
 a2a:	1a7d                	add	s4,s4,-1
 a2c:	09a1                	add	s3,s3,8
 a2e:	fe0a19e3          	bnez	s4,a20 <func0+0x40>
 a32:	a811                	j	a46 <func0+0x66>
 a34:	4505                	li	a0,1
 a36:	dabff0ef          	jal	7e0 <malloc@plt>
 a3a:	c509                	beqz	a0,a44 <func0+0x64>
 a3c:	892a                	mv	s2,a0
 a3e:	00050023          	sb	zero,0(a0)
 a42:	a011                	j	a46 <func0+0x66>
 a44:	4901                	li	s2,0
 a46:	854a                	mv	a0,s2
 a48:	70a2                	ld	ra,40(sp)
 a4a:	7402                	ld	s0,32(sp)
 a4c:	64e2                	ld	s1,24(sp)
 a4e:	6942                	ld	s2,16(sp)
 a50:	69a2                	ld	s3,8(sp)
 a52:	6a02                	ld	s4,0(sp)
 a54:	6145                	add	sp,sp,48
 a56:	8082                	ret
