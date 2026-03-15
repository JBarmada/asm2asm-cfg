0000000000000954 <func0>:
 954:	882a                	mv	a6,a0
 956:	4529                	li	a0,10
 958:	04b05463          	blez	a1,9a0 <func0+0x4c>
 95c:	4881                	li	a7,0
 95e:	00480293          	add	t0,a6,4
 962:	4705                	li	a4,1
 964:	a029                	j	96e <func0+0x1a>
 966:	0705                	add	a4,a4,1
 968:	0291                	add	t0,t0,4
 96a:	02b88b63          	beq	a7,a1,9a0 <func0+0x4c>
 96e:	8646                	mv	a2,a7
 970:	0885                	add	a7,a7,1
 972:	feb8fae3          	bgeu	a7,a1,966 <func0+0x12>
 976:	060a                	sll	a2,a2,0x2
 978:	9642                	add	a2,a2,a6
 97a:	00062007          	flw	ft0,0(a2)
 97e:	862e                	mv	a2,a1
 980:	8696                	mv	a3,t0
 982:	0006a087          	flw	ft1,0(a3)
 986:	081070d3          	fsub.s	ft1,ft0,ft1
 98a:	2010a0d3          	fabs.s	ft1,ft1
 98e:	a0a097d3          	flt.s	a5,ft1,fa0
 992:	e791                	bnez	a5,99e <func0+0x4a>
 994:	167d                	add	a2,a2,-1
 996:	0691                	add	a3,a3,4
 998:	fec715e3          	bne	a4,a2,982 <func0+0x2e>
 99c:	b7e9                	j	966 <func0+0x12>
 99e:	4505                	li	a0,1
 9a0:	8082                	ret
