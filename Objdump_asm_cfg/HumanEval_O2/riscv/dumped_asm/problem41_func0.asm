00000000000008cc <func0>:
 8cc:	1141                	add	sp,sp,-16
 8ce:	e422                	sd	s0,8(sp)
 8d0:	06b05863          	blez	a1,940 <func0+0x74>
 8d4:	4e01                	li	t3,0
 8d6:	00850293          	add	t0,a0,8
 8da:	4305                	li	t1,1
 8dc:	438d                	li	t2,3
 8de:	4805                	li	a6,1
 8e0:	a801                	j	8f0 <func0+0x24>
 8e2:	00be3833          	sltu	a6,t3,a1
 8e6:	0305                	add	t1,t1,1
 8e8:	0291                	add	t0,t0,4
 8ea:	2385                	addw	t2,t2,1
 8ec:	04be0b63          	beq	t3,a1,942 <func0+0x76>
 8f0:	8672                	mv	a2,t3
 8f2:	0e05                	add	t3,t3,1
 8f4:	febe77e3          	bgeu	t3,a1,8e2 <func0+0x16>
 8f8:	060a                	sll	a2,a2,0x2
 8fa:	00c508b3          	add	a7,a0,a2
 8fe:	8e9e                	mv	t4,t2
 900:	8f16                	mv	t5,t0
 902:	8f9a                	mv	t6,t1
 904:	a031                	j	910 <func0+0x44>
 906:	0f85                	add	t6,t6,1
 908:	0f11                	add	t5,t5,4
 90a:	2e85                	addw	t4,t4,1
 90c:	fcbf8be3          	beq	t6,a1,8e2 <func0+0x16>
 910:	001f861b          	addw	a2,t6,1
 914:	feb659e3          	bge	a2,a1,906 <func0+0x3a>
 918:	0008a603          	lw	a2,0(a7)
 91c:	002f9693          	sll	a3,t6,0x2
 920:	96aa                	add	a3,a3,a0
 922:	4294                	lw	a3,0(a3)
 924:	9e35                	addw	a2,a2,a3
 926:	86f6                	mv	a3,t4
 928:	877a                	mv	a4,t5
 92a:	431c                	lw	a5,0(a4)
 92c:	40f0043b          	negw	s0,a5
 930:	00860963          	beq	a2,s0,942 <func0+0x76>
 934:	87b6                	mv	a5,a3
 936:	0711                	add	a4,a4,4
 938:	2685                	addw	a3,a3,1
 93a:	feb7c8e3          	blt	a5,a1,92a <func0+0x5e>
 93e:	b7e1                	j	906 <func0+0x3a>
 940:	4801                	li	a6,0
 942:	00187513          	and	a0,a6,1
 946:	6422                	ld	s0,8(sp)
 948:	0141                	add	sp,sp,16
 94a:	8082                	ret
