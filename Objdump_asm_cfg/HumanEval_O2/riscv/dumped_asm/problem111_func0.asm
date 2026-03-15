000000000000095c <func0>:
 95c:	4801                	li	a6,0
 95e:	00b05c63          	blez	a1,976 <func0+0x1a>
 962:	87ae                	mv	a5,a1
 964:	4118                	lw	a4,0(a0)
 966:	fff74713          	not	a4,a4
 96a:	8b05                	and	a4,a4,1
 96c:	0107083b          	addw	a6,a4,a6
 970:	17fd                	add	a5,a5,-1
 972:	0511                	add	a0,a0,4
 974:	fbe5                	bnez	a5,964 <func0+0x8>
 976:	00d05b63          	blez	a3,98c <func0+0x30>
 97a:	4208                	lw	a0,0(a2)
 97c:	fff54513          	not	a0,a0
 980:	8905                	and	a0,a0,1
 982:	0105083b          	addw	a6,a0,a6
 986:	16fd                	add	a3,a3,-1
 988:	0611                	add	a2,a2,4
 98a:	fae5                	bnez	a3,97a <func0+0x1e>
 98c:	00b84763          	blt	a6,a1,99a <func0+0x3e>
 990:	00000517          	auipc	a0,0x0
 994:	01850513          	add	a0,a0,24 # 9a8 <_IO_stdin_used+0x4>
 998:	8082                	ret
 99a:	00000517          	auipc	a0,0x0
 99e:	07950513          	add	a0,a0,121 # a13 <_IO_stdin_used+0x6f>
 9a2:	8082                	ret
