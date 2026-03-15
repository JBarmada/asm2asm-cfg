0000000000000a88 <func0>:
 a88:	7179                	add	sp,sp,-48
 a8a:	f406                	sd	ra,40(sp)
 a8c:	f022                	sd	s0,32(sp)
 a8e:	ec26                	sd	s1,24(sp)
 a90:	e84a                	sd	s2,16(sp)
 a92:	e44e                	sd	s3,8(sp)
 a94:	e052                	sd	s4,0(sp)
 a96:	8a32                	mv	s4,a2
 a98:	892e                	mv	s2,a1
 a9a:	89aa                	mv	s3,a0
 a9c:	55555537          	lui	a0,0x55555
 aa0:	5565051b          	addw	a0,a0,1366 # 55555556 <__global_pointer$+0x55552d56>
 aa4:	02a58533          	mul	a0,a1,a0
 aa8:	03f55593          	srl	a1,a0,0x3f
 aac:	9101                	srl	a0,a0,0x20
 aae:	9d2d                	addw	a0,a0,a1
 ab0:	2505                	addw	a0,a0,1
 ab2:	050a                	sll	a0,a0,0x2
 ab4:	bedff0ef          	jal	6a0 <malloc@plt>
 ab8:	0d205a63          	blez	s2,b8c <func0+0x104>
 abc:	fff9059b          	addw	a1,s2,-1
 ac0:	aaaab637          	lui	a2,0xaaaab
 ac4:	aab6061b          	addw	a2,a2,-1365 # ffffffffaaaaaaab <__global_pointer$+0xffffffffaaaa82ab>
 ac8:	1602                	sll	a2,a2,0x20
 aca:	1582                	sll	a1,a1,0x20
 acc:	02c5b5b3          	mulhu	a1,a1,a2
 ad0:	0215d813          	srl	a6,a1,0x21
 ad4:	00180593          	add	a1,a6,1
 ad8:	864e                	mv	a2,s3
 ada:	86aa                	mv	a3,a0
 adc:	4218                	lw	a4,0(a2)
 ade:	c298                	sw	a4,0(a3)
 ae0:	0691                	add	a3,a3,4
 ae2:	15fd                	add	a1,a1,-1
 ae4:	0631                	add	a2,a2,12
 ae6:	f9fd                	bnez	a1,adc <func0+0x54>
 ae8:	07005263          	blez	a6,b4c <func0+0xc4>
 aec:	4881                	li	a7,0
 aee:	00450313          	add	t1,a0,4
 af2:	4705                	li	a4,1
 af4:	87c2                	mv	a5,a6
 af6:	a031                	j	b02 <func0+0x7a>
 af8:	0705                	add	a4,a4,1
 afa:	0311                	add	t1,t1,4
 afc:	17fd                	add	a5,a5,-1
 afe:	05088763          	beq	a7,a6,b4c <func0+0xc4>
 b02:	4481                	li	s1,0
 b04:	82c6                	mv	t0,a7
 b06:	0885                	add	a7,a7,1
 b08:	869a                	mv	a3,t1
 b0a:	8596                	mv	a1,t0
 b0c:	a029                	j	b16 <func0+0x8e>
 b0e:	0485                	add	s1,s1,1
 b10:	0691                	add	a3,a3,4
 b12:	00978d63          	beq	a5,s1,b2c <func0+0xa4>
 b16:	4290                	lw	a2,0(a3)
 b18:	0005841b          	sext.w	s0,a1
 b1c:	040a                	sll	s0,s0,0x2
 b1e:	942a                	add	s0,s0,a0
 b20:	4000                	lw	s0,0(s0)
 b22:	fe8656e3          	bge	a2,s0,b0e <func0+0x86>
 b26:	009705b3          	add	a1,a4,s1
 b2a:	b7d5                	j	b0e <func0+0x86>
 b2c:	02059613          	sll	a2,a1,0x20
 b30:	9201                	srl	a2,a2,0x20
 b32:	fcc283e3          	beq	t0,a2,af8 <func0+0x70>
 b36:	00229613          	sll	a2,t0,0x2
 b3a:	962a                	add	a2,a2,a0
 b3c:	2581                	sext.w	a1,a1
 b3e:	058a                	sll	a1,a1,0x2
 b40:	95aa                	add	a1,a1,a0
 b42:	4194                	lw	a3,0(a1)
 b44:	4204                	lw	s1,0(a2)
 b46:	c214                	sw	a3,0(a2)
 b48:	c184                	sw	s1,0(a1)
 b4a:	b77d                	j	af8 <func0+0x70>
 b4c:	05205063          	blez	s2,b8c <func0+0x104>
 b50:	4581                	li	a1,0
 b52:	aaaab637          	lui	a2,0xaaaab
 b56:	aab6061b          	addw	a2,a2,-1365 # ffffffffaaaaaaab <__global_pointer$+0xffffffffaaaa82ab>
 b5a:	1602                	sll	a2,a2,0x20
 b5c:	a811                	j	b70 <func0+0xe8>
 b5e:	86ce                	mv	a3,s3
 b60:	4294                	lw	a3,0(a3)
 b62:	00da2023          	sw	a3,0(s4)
 b66:	0585                	add	a1,a1,1
 b68:	0a11                	add	s4,s4,4
 b6a:	0991                	add	s3,s3,4
 b6c:	02b90063          	beq	s2,a1,b8c <func0+0x104>
 b70:	02059693          	sll	a3,a1,0x20
 b74:	02c6b6b3          	mulhu	a3,a3,a2
 b78:	9285                	srl	a3,a3,0x21
 b7a:	0016971b          	sllw	a4,a3,0x1
 b7e:	9f35                	addw	a4,a4,a3
 b80:	40e5873b          	subw	a4,a1,a4
 b84:	ff69                	bnez	a4,b5e <func0+0xd6>
 b86:	068a                	sll	a3,a3,0x2
 b88:	96aa                	add	a3,a3,a0
 b8a:	bfd9                	j	b60 <func0+0xd8>
 b8c:	70a2                	ld	ra,40(sp)
 b8e:	7402                	ld	s0,32(sp)
 b90:	64e2                	ld	s1,24(sp)
 b92:	6942                	ld	s2,16(sp)
 b94:	69a2                	ld	s3,8(sp)
 b96:	6a02                	ld	s4,0(sp)
 b98:	6145                	add	sp,sp,48
 b9a:	be1d                	j	6d0 <free@plt>
