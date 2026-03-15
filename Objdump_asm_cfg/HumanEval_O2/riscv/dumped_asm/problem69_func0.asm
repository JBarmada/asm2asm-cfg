0000000000000920 <func0>:
 920:	04b05c63          	blez	a1,978 <func0+0x58>
 924:	8832                	mv	a6,a2
 926:	4701                	li	a4,0
 928:	58fd                	li	a7,-1
 92a:	80000637          	lui	a2,0x80000
 92e:	fff6029b          	addw	t0,a2,-1 # 7fffffff <__global_pointer$+0x7fffd7ff>
 932:	a039                	j	940 <func0+0x20>
 934:	82be                	mv	t0,a5
 936:	88b6                	mv	a7,a3
 938:	0705                	add	a4,a4,1
 93a:	0511                	add	a0,a0,4
 93c:	02e58363          	beq	a1,a4,962 <func0+0x42>
 940:	411c                	lw	a5,0(a0)
 942:	0017f693          	and	a3,a5,1
 946:	faed                	bnez	a3,938 <func0+0x18>
 948:	0057a6b3          	slt	a3,a5,t0
 94c:	0008861b          	sext.w	a2,a7
 950:	0605                	add	a2,a2,1
 952:	00163613          	seqz	a2,a2
 956:	8e55                	or	a2,a2,a3
 958:	86ba                	mv	a3,a4
 95a:	fe69                	bnez	a2,934 <func0+0x14>
 95c:	8796                	mv	a5,t0
 95e:	86c6                	mv	a3,a7
 960:	bfd1                	j	934 <func0+0x14>
 962:	0008851b          	sext.w	a0,a7
 966:	55fd                	li	a1,-1
 968:	00b50863          	beq	a0,a1,978 <func0+0x58>
 96c:	00582023          	sw	t0,0(a6)
 970:	01182223          	sw	a7,4(a6)
 974:	8542                	mv	a0,a6
 976:	8082                	ret
 978:	4501                	li	a0,0
 97a:	8082                	ret
