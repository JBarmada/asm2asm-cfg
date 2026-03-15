0000000000000a04 <func0>:
 a04:	7139                	add	sp,sp,-64
 a06:	fc06                	sd	ra,56(sp)
 a08:	f822                	sd	s0,48(sp)
 a0a:	f426                	sd	s1,40(sp)
 a0c:	f04a                	sd	s2,32(sp)
 a0e:	ec4e                	sd	s3,24(sp)
 a10:	e852                	sd	s4,16(sp)
 a12:	e456                	sd	s5,8(sp)
 a14:	e05a                	sd	s6,0(sp)
 a16:	8936                	mv	s2,a3
 a18:	89b2                	mv	s3,a2
 a1a:	842e                	mv	s0,a1
 a1c:	84aa                	mv	s1,a0
 a1e:	8532                	mv	a0,a2
 a20:	da1ff0ef          	jal	7c0 <strlen@plt>
 a24:	8aaa                	mv	s5,a0
 a26:	00341513          	sll	a0,s0,0x3
 a2a:	d87ff0ef          	jal	7b0 <malloc@plt>
 a2e:	00a93023          	sd	a0,0(s2)
 a32:	4a01                	li	s4,0
 a34:	02805863          	blez	s0,a64 <func0+0x60>
 a38:	2a81                	sext.w	s5,s5
 a3a:	a021                	j	a42 <func0+0x3e>
 a3c:	147d                	add	s0,s0,-1
 a3e:	04a1                	add	s1,s1,8
 a40:	c015                	beqz	s0,a64 <func0+0x60>
 a42:	0004bb03          	ld	s6,0(s1)
 a46:	855a                	mv	a0,s6
 a48:	85ce                	mv	a1,s3
 a4a:	8656                	mv	a2,s5
 a4c:	d95ff0ef          	jal	7e0 <strncmp@plt>
 a50:	f575                	bnez	a0,a3c <func0+0x38>
 a52:	00093503          	ld	a0,0(s2)
 a56:	003a1593          	sll	a1,s4,0x3
 a5a:	2a05                	addw	s4,s4,1
 a5c:	952e                	add	a0,a0,a1
 a5e:	01653023          	sd	s6,0(a0)
 a62:	bfe9                	j	a3c <func0+0x38>
 a64:	8552                	mv	a0,s4
 a66:	70e2                	ld	ra,56(sp)
 a68:	7442                	ld	s0,48(sp)
 a6a:	74a2                	ld	s1,40(sp)
 a6c:	7902                	ld	s2,32(sp)
 a6e:	69e2                	ld	s3,24(sp)
 a70:	6a42                	ld	s4,16(sp)
 a72:	6aa2                	ld	s5,8(sp)
 a74:	6b02                	ld	s6,0(sp)
 a76:	6121                	add	sp,sp,64
 a78:	8082                	ret
