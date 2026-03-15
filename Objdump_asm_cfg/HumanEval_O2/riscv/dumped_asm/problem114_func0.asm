0000000000000a24 <func0>:
 a24:	715d                	add	sp,sp,-80
 a26:	e486                	sd	ra,72(sp)
 a28:	e0a2                	sd	s0,64(sp)
 a2a:	fc26                	sd	s1,56(sp)
 a2c:	f84a                	sd	s2,48(sp)
 a2e:	f44e                	sd	s3,40(sp)
 a30:	f052                	sd	s4,32(sp)
 a32:	ec56                	sd	s5,24(sp)
 a34:	e85a                	sd	s6,16(sp)
 a36:	e45e                	sd	s7,8(sp)
 a38:	e062                	sd	s8,0(sp)
 a3a:	89ae                	mv	s3,a1
 a3c:	892a                	mv	s2,a0
 a3e:	00359513          	sll	a0,a1,0x3
 a42:	d1fff0ef          	jal	760 <malloc@plt>
 a46:	8a2a                	mv	s4,a0
 a48:	07305d63          	blez	s3,ac2 <func0+0x9e>
 a4c:	4b01                	li	s6,0
 a4e:	00000a97          	auipc	s5,0x0
 a52:	259a8a93          	add	s5,s5,601 # ca7 <_IO_stdin_used+0x1cb>
 a56:	4ba5                	li	s7,9
 a58:	80000537          	lui	a0,0x80000
 a5c:	0015041b          	addw	s0,a0,1 # ffffffff80000001 <__global_pointer$+0xffffffff7fffd801>
 a60:	a015                	j	a84 <func0+0x60>
 a62:	4481                	li	s1,0
 a64:	06400513          	li	a0,100
 a68:	cf9ff0ef          	jal	760 <malloc@plt>
 a6c:	018a05b3          	add	a1,s4,s8
 a70:	e188                	sd	a0,0(a1)
 a72:	85d6                	mv	a1,s5
 a74:	8626                	mv	a2,s1
 a76:	86a6                	mv	a3,s1
 a78:	8726                	mv	a4,s1
 a7a:	d07ff0ef          	jal	780 <sprintf@plt>
 a7e:	0b05                	add	s6,s6,1
 a80:	053b0163          	beq	s6,s3,ac2 <func0+0x9e>
 a84:	003b1c13          	sll	s8,s6,0x3
 a88:	01890533          	add	a0,s2,s8
 a8c:	6108                	ld	a0,0(a0)
 a8e:	00054583          	lbu	a1,0(a0)
 a92:	d9e1                	beqz	a1,a62 <func0+0x3e>
 a94:	4481                	li	s1,0
 a96:	0505                	add	a0,a0,1
 a98:	a029                	j	aa2 <func0+0x7e>
 a9a:	00054583          	lbu	a1,0(a0)
 a9e:	0505                	add	a0,a0,1
 aa0:	d1f1                	beqz	a1,a64 <func0+0x40>
 aa2:	fd05861b          	addw	a2,a1,-48
 aa6:	0ff67613          	zext.b	a2,a2
 aaa:	fecbe8e3          	bltu	s7,a2,a9a <func0+0x76>
 aae:	0ff5f593          	zext.b	a1,a1
 ab2:	fd058593          	add	a1,a1,-48
 ab6:	8de1                	and	a1,a1,s0
 ab8:	15fd                	add	a1,a1,-1
 aba:	0015b593          	seqz	a1,a1
 abe:	9cad                	addw	s1,s1,a1
 ac0:	bfe9                	j	a9a <func0+0x76>
 ac2:	8552                	mv	a0,s4
 ac4:	60a6                	ld	ra,72(sp)
 ac6:	6406                	ld	s0,64(sp)
 ac8:	74e2                	ld	s1,56(sp)
 aca:	7942                	ld	s2,48(sp)
 acc:	79a2                	ld	s3,40(sp)
 ace:	7a02                	ld	s4,32(sp)
 ad0:	6ae2                	ld	s5,24(sp)
 ad2:	6b42                	ld	s6,16(sp)
 ad4:	6ba2                	ld	s7,8(sp)
 ad6:	6c02                	ld	s8,0(sp)
 ad8:	6161                	add	sp,sp,80
 ada:	8082                	ret
