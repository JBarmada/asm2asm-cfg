0000000000000a18 <func0>:
 a18:	02b05e63          	blez	a1,a54 <func0+0x3c>
 a1c:	4881                	li	a7,0
 a1e:	4801                	li	a6,0
 a20:	a029                	j	a2a <func0+0x12>
 a22:	88be                	mv	a7,a5
 a24:	15fd                	add	a1,a1,-1
 a26:	0511                	add	a0,a0,4
 a28:	c985                	beqz	a1,a58 <func0+0x40>
 a2a:	411c                	lw	a5,0(a0)
 a2c:	0007cb63          	bltz	a5,a42 <func0+0x2a>
 a30:	dbf5                	beqz	a5,a24 <func0+0xc>
 a32:	0018b693          	seqz	a3,a7
 a36:	0117a733          	slt	a4,a5,a7
 a3a:	8ed9                	or	a3,a3,a4
 a3c:	f2fd                	bnez	a3,a22 <func0+0xa>
 a3e:	87c6                	mv	a5,a7
 a40:	b7cd                	j	a22 <func0+0xa>
 a42:	00183713          	seqz	a4,a6
 a46:	00f826b3          	slt	a3,a6,a5
 a4a:	8ed9                	or	a3,a3,a4
 a4c:	e291                	bnez	a3,a50 <func0+0x38>
 a4e:	87c2                	mv	a5,a6
 a50:	883e                	mv	a6,a5
 a52:	bfc9                	j	a24 <func0+0xc>
 a54:	4801                	li	a6,0
 a56:	4881                	li	a7,0
 a58:	01062023          	sw	a6,0(a2)
 a5c:	01162223          	sw	a7,4(a2)
 a60:	8082                	ret
