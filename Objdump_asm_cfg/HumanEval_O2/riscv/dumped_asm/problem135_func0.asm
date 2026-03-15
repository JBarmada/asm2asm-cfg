000000000000092c <func0>:
 92c:	7179                	add	sp,sp,-48
 92e:	f406                	sd	ra,40(sp)
 930:	f022                	sd	s0,32(sp)
 932:	ec26                	sd	s1,24(sp)
 934:	e84a                	sd	s2,16(sp)
 936:	e44e                	sd	s3,8(sp)
 938:	842a                	mv	s0,a0
 93a:	d37ff0ef          	jal	670 <strlen@plt>
 93e:	0005049b          	sext.w	s1,a0
 942:	c8a9                	beqz	s1,994 <func0+0x68>
 944:	02051913          	sll	s2,a0,0x20
 948:	557d                	li	a0,-1
 94a:	1502                	sll	a0,a0,0x20
 94c:	954a                	add	a0,a0,s2
 94e:	9501                	sra	a0,a0,0x20
 950:	9522                	add	a0,a0,s0
 952:	00054983          	lbu	s3,0(a0)
 956:	d3bff0ef          	jal	690 <__ctype_b_loc@plt>
 95a:	610c                	ld	a1,0(a0)
 95c:	00199513          	sll	a0,s3,0x1
 960:	952e                	add	a0,a0,a1
 962:	00154503          	lbu	a0,1(a0)
 966:	00457613          	and	a2,a0,4
 96a:	4501                	li	a0,0
 96c:	c60d                	beqz	a2,996 <func0+0x6a>
 96e:	4505                	li	a0,1
 970:	02a48363          	beq	s1,a0,996 <func0+0x6a>
 974:	557d                	li	a0,-1
 976:	1506                	sll	a0,a0,0x21
 978:	954a                	add	a0,a0,s2
 97a:	9501                	sra	a0,a0,0x20
 97c:	9522                	add	a0,a0,s0
 97e:	00054503          	lbu	a0,0(a0)
 982:	0506                	sll	a0,a0,0x1
 984:	952e                	add	a0,a0,a1
 986:	00055503          	lhu	a0,0(a0)
 98a:	40057513          	and	a0,a0,1024
 98e:	00153513          	seqz	a0,a0
 992:	a011                	j	996 <func0+0x6a>
 994:	4501                	li	a0,0
 996:	70a2                	ld	ra,40(sp)
 998:	7402                	ld	s0,32(sp)
 99a:	64e2                	ld	s1,24(sp)
 99c:	6942                	ld	s2,16(sp)
 99e:	69a2                	ld	s3,8(sp)
 9a0:	6145                	add	sp,sp,48
 9a2:	8082                	ret
