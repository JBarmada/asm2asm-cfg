00000000000008b8 <func0>:
 8b8:	04b05563          	blez	a1,902 <func0+0x4a>
 8bc:	4801                	li	a6,0
 8be:	00450893          	add	a7,a0,4
 8c2:	4285                	li	t0,1
 8c4:	a029                	j	8ce <func0+0x16>
 8c6:	0285                	add	t0,t0,1
 8c8:	0891                	add	a7,a7,4
 8ca:	02b80c63          	beq	a6,a1,902 <func0+0x4a>
 8ce:	8642                	mv	a2,a6
 8d0:	0805                	add	a6,a6,1
 8d2:	feb87ae3          	bgeu	a6,a1,8c6 <func0+0xe>
 8d6:	060a                	sll	a2,a2,0x2
 8d8:	00c507b3          	add	a5,a0,a2
 8dc:	872e                	mv	a4,a1
 8de:	8646                	mv	a2,a7
 8e0:	a029                	j	8ea <func0+0x32>
 8e2:	177d                	add	a4,a4,-1
 8e4:	0611                	add	a2,a2,4
 8e6:	fee280e3          	beq	t0,a4,8c6 <func0+0xe>
 8ea:	0007a007          	flw	ft0,0(a5)
 8ee:	00062087          	flw	ft1,0(a2)
 8f2:	a00096d3          	flt.s	a3,ft1,ft0
 8f6:	d6f5                	beqz	a3,8e2 <func0+0x2a>
 8f8:	0017a027          	fsw	ft1,0(a5)
 8fc:	00062027          	fsw	ft0,0(a2)
 900:	b7cd                	j	8e2 <func0+0x2a>
 902:	80000637          	lui	a2,0x80000
 906:	2605                	addw	a2,a2,1 # ffffffff80000001 <__global_pointer$+0xffffffff7fffd801>
 908:	8e6d                	and	a2,a2,a1
 90a:	4685                	li	a3,1
 90c:	00d61963          	bne	a2,a3,91e <func0+0x66>
 910:	0015d59b          	srlw	a1,a1,0x1
 914:	058a                	sll	a1,a1,0x2
 916:	952e                	add	a0,a0,a1
 918:	00052507          	flw	fa0,0(a0)
 91c:	8082                	ret
 91e:	01f5d61b          	srlw	a2,a1,0x1f
 922:	9db1                	addw	a1,a1,a2
 924:	0586                	sll	a1,a1,0x1
 926:	99f1                	and	a1,a1,-4
 928:	952e                	add	a0,a0,a1
 92a:	00052007          	flw	ft0,0(a0)
 92e:	ffc52087          	flw	ft1,-4(a0)
 932:	00001517          	auipc	a0,0x1
 936:	74a50513          	add	a0,a0,1866 # 207c <__SDATA_BEGIN__+0x2c>
 93a:	00052107          	flw	ft2,0(a0)
 93e:	00107053          	fadd.s	ft0,ft0,ft1
 942:	10207553          	fmul.s	fa0,ft0,ft2
 946:	8082                	ret
