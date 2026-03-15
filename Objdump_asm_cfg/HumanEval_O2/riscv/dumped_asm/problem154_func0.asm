0000000000000da4 <func0>:
 da4:	8836                	mv	a6,a3
 da6:	88aa                	mv	a7,a0
 da8:	06c05363          	blez	a2,e0e <func0+0x6a>
 dac:	4381                	li	t2,0
 dae:	4281                	li	t0,0
 db0:	c1800313          	li	t1,-1000
 db4:	a031                	j	dc0 <func0+0x1c>
 db6:	0385                	add	t2,t2,1
 db8:	8372                	mv	t1,t3
 dba:	82b6                	mv	t0,a3
 dbc:	04c38a63          	beq	t2,a2,e10 <func0+0x6c>
 dc0:	00339513          	sll	a0,t2,0x3
 dc4:	952e                	add	a0,a0,a1
 dc6:	6114                	ld	a3,0(a0)
 dc8:	0006c703          	lbu	a4,0(a3)
 dcc:	cb1d                	beqz	a4,e02 <func0+0x5e>
 dce:	4e01                	li	t3,0
 dd0:	00168513          	add	a0,a3,1
 dd4:	fbf7079b          	addw	a5,a4,-65
 dd8:	0ff7f793          	zext.b	a5,a5
 ddc:	01a7b793          	sltiu	a5,a5,26
 de0:	00fe0e3b          	addw	t3,t3,a5
 de4:	f9f7079b          	addw	a5,a4,-97
 de8:	00054703          	lbu	a4,0(a0)
 dec:	0ff7f793          	zext.b	a5,a5
 df0:	01a7b793          	sltiu	a5,a5,26
 df4:	40fe0e3b          	subw	t3,t3,a5
 df8:	0505                	add	a0,a0,1
 dfa:	ff69                	bnez	a4,dd4 <func0+0x30>
 dfc:	fbc34de3          	blt	t1,t3,db6 <func0+0x12>
 e00:	a021                	j	e08 <func0+0x64>
 e02:	4e01                	li	t3,0
 e04:	fbc349e3          	blt	t1,t3,db6 <func0+0x12>
 e08:	8696                	mv	a3,t0
 e0a:	8e1a                	mv	t3,t1
 e0c:	b76d                	j	db6 <func0+0x12>
 e0e:	4681                	li	a3,0
 e10:	00000597          	auipc	a1,0x0
 e14:	2bd58593          	add	a1,a1,701 # 10cd <_IO_stdin_used+0x2ad>
 e18:	8542                	mv	a0,a6
 e1a:	8646                	mv	a2,a7
 e1c:	be15                	j	950 <sprintf@plt>
