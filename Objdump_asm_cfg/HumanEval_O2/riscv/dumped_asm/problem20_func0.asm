0000000000000950 <func0>:
 950:	7131                	add	sp,sp,-192
 952:	fd06                	sd	ra,184(sp)
 954:	f922                	sd	s0,176(sp)
 956:	f526                	sd	s1,168(sp)
 958:	f14a                	sd	s2,160(sp)
 95a:	ed4e                	sd	s3,152(sp)
 95c:	e952                	sd	s4,144(sp)
 95e:	e556                	sd	s5,136(sp)
 960:	e15a                	sd	s6,128(sp)
 962:	fcde                	sd	s7,120(sp)
 964:	f8e2                	sd	s8,112(sp)
 966:	f4e6                	sd	s9,104(sp)
 968:	f0ea                	sd	s10,96(sp)
 96a:	ecee                	sd	s11,88(sp)
 96c:	842a                	mv	s0,a0
 96e:	e882                	sd	zero,80(sp)
 970:	e482                	sd	zero,72(sp)
 972:	e082                	sd	zero,64(sp)
 974:	fc02                	sd	zero,56(sp)
 976:	f802                	sd	zero,48(sp)
 978:	00054503          	lbu	a0,0(a0)
 97c:	1a050263          	beqz	a0,b20 <func0+0x1d0>
 980:	02000c93          	li	s9,32
 984:	02a10493          	add	s1,sp,42
 988:	00000c17          	auipc	s8,0x0
 98c:	3a4c0c13          	add	s8,s8,932 # d2c <_IO_stdin_used+0x164>
 990:	03010d13          	add	s10,sp,48
 994:	00657537          	lui	a0,0x657
 998:	e6f50d9b          	addw	s11,a0,-401 # 656e6f <__global_pointer$+0x65466f>
 99c:	006f7537          	lui	a0,0x6f7
 9a0:	77450b9b          	addw	s7,a0,1908 # 6f7774 <__global_pointer$+0x6f4f74>
 9a4:	00000917          	auipc	s2,0x0
 9a8:	25f90913          	add	s2,s2,607 # c03 <_IO_stdin_used+0x3b>
 9ac:	00000997          	auipc	s3,0x0
 9b0:	40998993          	add	s3,s3,1033 # db5 <_IO_stdin_used+0x1ed>
 9b4:	00000a17          	auipc	s4,0x0
 9b8:	406a0a13          	add	s4,s4,1030 # dba <_IO_stdin_used+0x1f2>
 9bc:	00787537          	lui	a0,0x787
 9c0:	9735051b          	addw	a0,a0,-1677 # 786973 <__global_pointer$+0x784173>
 9c4:	f02a                	sd	a0,32(sp)
 9c6:	00000517          	auipc	a0,0x0
 9ca:	3f950513          	add	a0,a0,1017 # dbf <_IO_stdin_used+0x1f7>
 9ce:	ec2a                	sd	a0,24(sp)
 9d0:	00000517          	auipc	a0,0x0
 9d4:	2c150513          	add	a0,a0,705 # c91 <_IO_stdin_used+0xc9>
 9d8:	e82a                	sd	a0,16(sp)
 9da:	00000517          	auipc	a0,0x0
 9de:	25f50513          	add	a0,a0,607 # c39 <_IO_stdin_used+0x71>
 9e2:	e42a                	sd	a0,8(sp)
 9e4:	4a81                	li	s5,0
 9e6:	01540533          	add	a0,s0,s5
 9ea:	00054583          	lbu	a1,0(a0)
 9ee:	0205e613          	or	a2,a1,32
 9f2:	01548533          	add	a0,s1,s5
 9f6:	01960663          	beq	a2,s9,a02 <func0+0xb2>
 9fa:	00b50023          	sb	a1,0(a0)
 9fe:	0a85                	add	s5,s5,1
 a00:	b7dd                	j	9e6 <func0+0x96>
 a02:	00050023          	sb	zero,0(a0)
 a06:	02a10513          	add	a0,sp,42
 a0a:	4615                	li	a2,5
 a0c:	85e2                	mv	a1,s8
 a0e:	d53ff0ef          	jal	760 <bcmp@plt>
 a12:	2501                	sext.w	a0,a0
 a14:	c961                	beqz	a0,ae4 <func0+0x194>
 a16:	02b14503          	lbu	a0,43(sp)
 a1a:	02a14583          	lbu	a1,42(sp)
 a1e:	02d10603          	lb	a2,45(sp)
 a22:	02c14683          	lbu	a3,44(sp)
 a26:	0522                	sll	a0,a0,0x8
 a28:	8d4d                	or	a0,a0,a1
 a2a:	00861593          	sll	a1,a2,0x8
 a2e:	8dd5                	or	a1,a1,a3
 a30:	05c2                	sll	a1,a1,0x10
 a32:	8d4d                	or	a0,a0,a1
 a34:	0bb50a63          	beq	a0,s11,ae8 <func0+0x198>
 a38:	02b14503          	lbu	a0,43(sp)
 a3c:	02a14583          	lbu	a1,42(sp)
 a40:	02d10603          	lb	a2,45(sp)
 a44:	02c14683          	lbu	a3,44(sp)
 a48:	0522                	sll	a0,a0,0x8
 a4a:	8d4d                	or	a0,a0,a1
 a4c:	00861593          	sll	a1,a2,0x8
 a50:	8dd5                	or	a1,a1,a3
 a52:	05c2                	sll	a1,a1,0x10
 a54:	8d4d                	or	a0,a0,a1
 a56:	09750b63          	beq	a0,s7,aec <func0+0x19c>
 a5a:	02a10513          	add	a0,sp,42
 a5e:	4619                	li	a2,6
 a60:	85ca                	mv	a1,s2
 a62:	cffff0ef          	jal	760 <bcmp@plt>
 a66:	2501                	sext.w	a0,a0
 a68:	c541                	beqz	a0,af0 <func0+0x1a0>
 a6a:	02a10513          	add	a0,sp,42
 a6e:	4615                	li	a2,5
 a70:	85ce                	mv	a1,s3
 a72:	cefff0ef          	jal	760 <bcmp@plt>
 a76:	2501                	sext.w	a0,a0
 a78:	cd35                	beqz	a0,af4 <func0+0x1a4>
 a7a:	02a10513          	add	a0,sp,42
 a7e:	4615                	li	a2,5
 a80:	4b15                	li	s6,5
 a82:	85d2                	mv	a1,s4
 a84:	cddff0ef          	jal	760 <bcmp@plt>
 a88:	2501                	sext.w	a0,a0
 a8a:	cd25                	beqz	a0,b02 <func0+0x1b2>
 a8c:	02b14503          	lbu	a0,43(sp)
 a90:	02a14583          	lbu	a1,42(sp)
 a94:	02d10603          	lb	a2,45(sp)
 a98:	02c14683          	lbu	a3,44(sp)
 a9c:	0522                	sll	a0,a0,0x8
 a9e:	8d4d                	or	a0,a0,a1
 aa0:	00861593          	sll	a1,a2,0x8
 aa4:	8dd5                	or	a1,a1,a3
 aa6:	05c2                	sll	a1,a1,0x10
 aa8:	8d4d                	or	a0,a0,a1
 aaa:	7582                	ld	a1,32(sp)
 aac:	04b50663          	beq	a0,a1,af8 <func0+0x1a8>
 ab0:	02a10513          	add	a0,sp,42
 ab4:	4619                	li	a2,6
 ab6:	65e2                	ld	a1,24(sp)
 ab8:	ca9ff0ef          	jal	760 <bcmp@plt>
 abc:	2501                	sext.w	a0,a0
 abe:	cd1d                	beqz	a0,afc <func0+0x1ac>
 ac0:	02a10513          	add	a0,sp,42
 ac4:	4619                	li	a2,6
 ac6:	65c2                	ld	a1,16(sp)
 ac8:	c99ff0ef          	jal	760 <bcmp@plt>
 acc:	2501                	sext.w	a0,a0
 ace:	c90d                	beqz	a0,b00 <func0+0x1b0>
 ad0:	02a10513          	add	a0,sp,42
 ad4:	4615                	li	a2,5
 ad6:	65a2                	ld	a1,8(sp)
 ad8:	c89ff0ef          	jal	760 <bcmp@plt>
 adc:	2501                	sext.w	a0,a0
 ade:	e905                	bnez	a0,b0e <func0+0x1be>
 ae0:	4b25                	li	s6,9
 ae2:	a005                	j	b02 <func0+0x1b2>
 ae4:	4b01                	li	s6,0
 ae6:	a831                	j	b02 <func0+0x1b2>
 ae8:	4b05                	li	s6,1
 aea:	a821                	j	b02 <func0+0x1b2>
 aec:	4b09                	li	s6,2
 aee:	a811                	j	b02 <func0+0x1b2>
 af0:	4b0d                	li	s6,3
 af2:	a801                	j	b02 <func0+0x1b2>
 af4:	4b11                	li	s6,4
 af6:	a031                	j	b02 <func0+0x1b2>
 af8:	4b19                	li	s6,6
 afa:	a021                	j	b02 <func0+0x1b2>
 afc:	4b1d                	li	s6,7
 afe:	a011                	j	b02 <func0+0x1b2>
 b00:	4b21                	li	s6,8
 b02:	002b1513          	sll	a0,s6,0x2
 b06:	956a                	add	a0,a0,s10
 b08:	410c                	lw	a1,0(a0)
 b0a:	2585                	addw	a1,a1,1
 b0c:	c10c                	sw	a1,0(a0)
 b0e:	001a851b          	addw	a0,s5,1
 b12:	1502                	sll	a0,a0,0x20
 b14:	9101                	srl	a0,a0,0x20
 b16:	942a                	add	s0,s0,a0
 b18:	fff44503          	lbu	a0,-1(s0)
 b1c:	ec0514e3          	bnez	a0,9e4 <func0+0x94>
 b20:	4301                	li	t1,0
 b22:	4581                	li	a1,0
 b24:	03010813          	add	a6,sp,48
 b28:	00001297          	auipc	t0,0x1
 b2c:	28828293          	add	t0,t0,648 # 1db0 <__do_global_dtors_aux_fini_array_entry+0x8>
 b30:	00001517          	auipc	a0,0x1
 b34:	53150513          	add	a0,a0,1329 # 2061 <func0.out>
 b38:	02000393          	li	t2,32
 b3c:	48a9                	li	a7,10
 b3e:	a021                	j	b46 <func0+0x1f6>
 b40:	0305                	add	t1,t1,1
 b42:	05130963          	beq	t1,a7,b94 <func0+0x244>
 b46:	00231613          	sll	a2,t1,0x2
 b4a:	9642                	add	a2,a2,a6
 b4c:	4204                	lw	s1,0(a2)
 b4e:	fe9059e3          	blez	s1,b40 <func0+0x1f0>
 b52:	00331613          	sll	a2,t1,0x3
 b56:	9616                	add	a2,a2,t0
 b58:	6200                	ld	s0,0(a2)
 b5a:	4601                	li	a2,0
 b5c:	00140e13          	add	t3,s0,1
 b60:	86ae                	mv	a3,a1
 b62:	a819                	j	b78 <func0+0x228>
 b64:	0016859b          	addw	a1,a3,1
 b68:	2681                	sext.w	a3,a3
 b6a:	96aa                	add	a3,a3,a0
 b6c:	2605                	addw	a2,a2,1
 b6e:	00768023          	sb	t2,0(a3)
 b72:	86ae                	mv	a3,a1
 b74:	fc9656e3          	bge	a2,s1,b40 <func0+0x1f0>
 b78:	00044583          	lbu	a1,0(s0)
 b7c:	d5e5                	beqz	a1,b64 <func0+0x214>
 b7e:	87f2                	mv	a5,t3
 b80:	00d50733          	add	a4,a0,a3
 b84:	00b70023          	sb	a1,0(a4)
 b88:	0007c583          	lbu	a1,0(a5)
 b8c:	0685                	add	a3,a3,1
 b8e:	0785                	add	a5,a5,1
 b90:	f9e5                	bnez	a1,b80 <func0+0x230>
 b92:	bfc9                	j	b64 <func0+0x214>
 b94:	00b04463          	bgtz	a1,b9c <func0+0x24c>
 b98:	85aa                	mv	a1,a0
 b9a:	a029                	j	ba4 <func0+0x254>
 b9c:	35fd                	addw	a1,a1,-1
 b9e:	1582                	sll	a1,a1,0x20
 ba0:	9181                	srl	a1,a1,0x20
 ba2:	95aa                	add	a1,a1,a0
 ba4:	00058023          	sb	zero,0(a1)
 ba8:	70ea                	ld	ra,184(sp)
 baa:	744a                	ld	s0,176(sp)
 bac:	74aa                	ld	s1,168(sp)
 bae:	790a                	ld	s2,160(sp)
 bb0:	69ea                	ld	s3,152(sp)
 bb2:	6a4a                	ld	s4,144(sp)
 bb4:	6aaa                	ld	s5,136(sp)
 bb6:	6b0a                	ld	s6,128(sp)
 bb8:	7be6                	ld	s7,120(sp)
 bba:	7c46                	ld	s8,112(sp)
 bbc:	7ca6                	ld	s9,104(sp)
 bbe:	7d06                	ld	s10,96(sp)
 bc0:	6de6                	ld	s11,88(sp)
 bc2:	6129                	add	sp,sp,192
 bc4:	8082                	ret
