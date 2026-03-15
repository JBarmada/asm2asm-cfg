0000000000000924 <func0>:
 924:	1101                	add	sp,sp,-32
 926:	ec06                	sd	ra,24(sp)
 928:	e822                	sd	s0,16(sp)
 92a:	862a                	mv	a2,a0
 92c:	00000597          	auipc	a1,0x0
 930:	17958593          	add	a1,a1,377 # aa5 <_IO_stdin_used+0xbd>
 934:	00a10513          	add	a0,sp,10
 938:	dc9ff0ef          	jal	700 <sprintf@plt>
 93c:	00a14503          	lbu	a0,10(sp)
 940:	c159                	beqz	a0,9c6 <func0+0xa2>
 942:	4401                	li	s0,0
 944:	00b10593          	add	a1,sp,11
 948:	0ff57613          	zext.b	a2,a0
 94c:	0005c503          	lbu	a0,0(a1)
 950:	9e21                	addw	a2,a2,s0
 952:	fd06041b          	addw	s0,a2,-48
 956:	0585                	add	a1,a1,1
 958:	f965                	bnez	a0,948 <func0+0x24>
 95a:	02100513          	li	a0,33
 95e:	d83ff0ef          	jal	6e0 <malloc@plt>
 962:	c435                	beqz	s0,9ce <func0+0xaa>
 964:	4581                	li	a1,0
 966:	06805963          	blez	s0,9d8 <func0+0xb4>
 96a:	4609                	li	a2,2
 96c:	86a2                	mv	a3,s0
 96e:	00147713          	and	a4,s0,1
 972:	03076713          	or	a4,a4,48
 976:	00b507b3          	add	a5,a0,a1
 97a:	0585                	add	a1,a1,1
 97c:	00e78023          	sb	a4,0(a5)
 980:	0014541b          	srlw	s0,s0,0x1
 984:	fec6f4e3          	bgeu	a3,a2,96c <func0+0x48>
 988:	00b50633          	add	a2,a0,a1
 98c:	4685                	li	a3,1
 98e:	1682                	sll	a3,a3,0x20
 990:	16f9                	add	a3,a3,-2
 992:	8eed                	and	a3,a3,a1
 994:	00060023          	sb	zero,0(a2)
 998:	c2b9                	beqz	a3,9de <func0+0xba>
 99a:	4601                	li	a2,0
 99c:	fff58693          	add	a3,a1,-1
 9a0:	0015d813          	srl	a6,a1,0x1
 9a4:	00c50733          	add	a4,a0,a2
 9a8:	00d507b3          	add	a5,a0,a3
 9ac:	00078403          	lb	s0,0(a5)
 9b0:	00070583          	lb	a1,0(a4)
 9b4:	00870023          	sb	s0,0(a4)
 9b8:	00b78023          	sb	a1,0(a5)
 9bc:	0605                	add	a2,a2,1
 9be:	16fd                	add	a3,a3,-1
 9c0:	fec812e3          	bne	a6,a2,9a4 <func0+0x80>
 9c4:	a829                	j	9de <func0+0xba>
 9c6:	02100513          	li	a0,33
 9ca:	d17ff0ef          	jal	6e0 <malloc@plt>
 9ce:	03000593          	li	a1,48
 9d2:	00b50023          	sb	a1,0(a0)
 9d6:	4585                	li	a1,1
 9d8:	95aa                	add	a1,a1,a0
 9da:	00058023          	sb	zero,0(a1)
 9de:	60e2                	ld	ra,24(sp)
 9e0:	6442                	ld	s0,16(sp)
 9e2:	6105                	add	sp,sp,32
 9e4:	8082                	ret
