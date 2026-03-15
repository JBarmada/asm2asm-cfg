00000000000009d0 <func0>:
 9d0:	c5ad                	beqz	a1,a3a <func0+0x6a>
 9d2:	4609                	li	a2,2
 9d4:	06c5c663          	blt	a1,a2,a40 <func0+0x70>
 9d8:	00052383          	lw	t2,0(a0)
 9dc:	4154                	lw	a3,4(a0)
 9de:	4305                	li	t1,1
 9e0:	0676c163          	blt	a3,t2,a42 <func0+0x72>
 9e4:	4701                	li	a4,0
 9e6:	567d                	li	a2,-1
 9e8:	02065293          	srl	t0,a2,0x20
 9ec:	00850793          	add	a5,a0,8
 9f0:	ffe58813          	add	a6,a1,-2
 9f4:	4885                	li	a7,1
 9f6:	4305                	li	t1,1
 9f8:	8eb6                	mv	t4,a3
 9fa:	00170e13          	add	t3,a4,1
 9fe:	01c8b6b3          	sltu	a3,a7,t3
 a02:	007ec633          	xor	a2,t4,t2
 a06:	00163613          	seqz	a2,a2
 a0a:	8e75                	and	a2,a2,a3
 a0c:	ca11                	beqz	a2,a20 <func0+0x50>
 a0e:	00570633          	add	a2,a4,t0
 a12:	00567633          	and	a2,a2,t0
 a16:	060a                	sll	a2,a2,0x2
 a18:	962a                	add	a2,a2,a0
 a1a:	4210                	lw	a2,0(a2)
 a1c:	02c38363          	beq	t2,a2,a42 <func0+0x72>
 a20:	00270613          	add	a2,a4,2
 a24:	00b63333          	sltu	t1,a2,a1
 a28:	00e80d63          	beq	a6,a4,a42 <func0+0x72>
 a2c:	4394                	lw	a3,0(a5)
 a2e:	0791                	add	a5,a5,4
 a30:	8772                	mv	a4,t3
 a32:	83f6                	mv	t2,t4
 a34:	fdd6d2e3          	bge	a3,t4,9f8 <func0+0x28>
 a38:	a029                	j	a42 <func0+0x72>
 a3a:	4505                	li	a0,1
 a3c:	8905                	and	a0,a0,1
 a3e:	8082                	ret
 a40:	4301                	li	t1,0
 a42:	00134513          	xor	a0,t1,1
 a46:	8905                	and	a0,a0,1
 a48:	8082                	ret
