00000000000009a0 <func0>:
 9a0:	08b05963          	blez	a1,a32 <func0+0x92>
 9a4:	4801                	li	a6,0
 9a6:	4f05                	li	t5,1
 9a8:	4f89                	li	t6,2
 9aa:	4885                	li	a7,1
 9ac:	a021                	j	9b4 <func0+0x14>
 9ae:	0885                	add	a7,a7,1
 9b0:	08b80163          	beq	a6,a1,a32 <func0+0x92>
 9b4:	8642                	mv	a2,a6
 9b6:	0805                	add	a6,a6,1
 9b8:	feb87be3          	bgeu	a6,a1,9ae <func0+0xe>
 9bc:	060a                	sll	a2,a2,0x2
 9be:	00c502b3          	add	t0,a0,a2
 9c2:	8ec6                	mv	t4,a7
 9c4:	a801                	j	9d4 <func0+0x34>
 9c6:	01c2a023          	sw	t3,0(t0)
 9ca:	0063a023          	sw	t1,0(t2)
 9ce:	0e85                	add	t4,t4,1
 9d0:	fcbe8fe3          	beq	t4,a1,9ae <func0+0xe>
 9d4:	0002a303          	lw	t1,0(t0)
 9d8:	00605c63          	blez	t1,9f0 <func0+0x50>
 9dc:	4701                	li	a4,0
 9de:	879a                	mv	a5,t1
 9e0:	863e                	mv	a2,a5
 9e2:	8b85                	and	a5,a5,1
 9e4:	9f3d                	addw	a4,a4,a5
 9e6:	0016579b          	srlw	a5,a2,0x1
 9ea:	fff67be3          	bgeu	a2,t6,9e0 <func0+0x40>
 9ee:	a011                	j	9f2 <func0+0x52>
 9f0:	4701                	li	a4,0
 9f2:	002e9613          	sll	a2,t4,0x2
 9f6:	00c503b3          	add	t2,a0,a2
 9fa:	0003ae03          	lw	t3,0(t2)
 9fe:	01c05e63          	blez	t3,a1a <func0+0x7a>
 a02:	4781                	li	a5,0
 a04:	86f2                	mv	a3,t3
 a06:	8636                	mv	a2,a3
 a08:	8a85                	and	a3,a3,1
 a0a:	9fb5                	addw	a5,a5,a3
 a0c:	0016569b          	srlw	a3,a2,0x1
 a10:	fecf6be3          	bltu	t5,a2,a06 <func0+0x66>
 a14:	fae7e9e3          	bltu	a5,a4,9c6 <func0+0x26>
 a18:	a021                	j	a20 <func0+0x80>
 a1a:	4781                	li	a5,0
 a1c:	fae7e5e3          	bltu	a5,a4,9c6 <func0+0x26>
 a20:	00e7c633          	xor	a2,a5,a4
 a24:	00163613          	seqz	a2,a2
 a28:	006e26b3          	slt	a3,t3,t1
 a2c:	8e75                	and	a2,a2,a3
 a2e:	fe41                	bnez	a2,9c6 <func0+0x26>
 a30:	bf79                	j	9ce <func0+0x2e>
 a32:	8082                	ret
