0000000000000a8c <func0>:
 a8c:	1101                	add	sp,sp,-32
 a8e:	ec06                	sd	ra,24(sp)
 a90:	e822                	sd	s0,16(sp)
 a92:	e426                	sd	s1,8(sp)
 a94:	e04a                	sd	s2,0(sp)
 a96:	842e                	mv	s0,a1
 a98:	84aa                	mv	s1,a0
 a9a:	00359513          	sll	a0,a1,0x3
 a9e:	c03ff0ef          	jal	6a0 <malloc@plt>
 aa2:	18805b63          	blez	s0,c38 <func0+0x1ac>
 aa6:	00001597          	auipc	a1,0x1
 aaa:	5ca58593          	add	a1,a1,1482 # 2070 <__SDATA_BEGIN__+0x8>
 aae:	0005b007          	fld	ft0,0(a1)
 ab2:	00001597          	auipc	a1,0x1
 ab6:	5c658593          	add	a1,a1,1478 # 2078 <__SDATA_BEGIN__+0x10>
 aba:	0005b087          	fld	ft1,0(a1)
 abe:	00000597          	auipc	a1,0x0
 ac2:	29c58593          	add	a1,a1,668 # d5a <_IO_stdin_used+0x116>
 ac6:	00001617          	auipc	a2,0x1
 aca:	5ba60613          	add	a2,a2,1466 # 2080 <__SDATA_BEGIN__+0x18>
 ace:	00063107          	fld	ft2,0(a2)
 ad2:	00000617          	auipc	a2,0x0
 ad6:	1a860613          	add	a2,a2,424 # c7a <_IO_stdin_used+0x36>
 ada:	00001697          	auipc	a3,0x1
 ade:	5ae68693          	add	a3,a3,1454 # 2088 <__SDATA_BEGIN__+0x20>
 ae2:	0006b187          	fld	ft3,0(a3)
 ae6:	00000917          	auipc	s2,0x0
 aea:	23590913          	add	s2,s2,565 # d1b <_IO_stdin_used+0xd7>
 aee:	00001717          	auipc	a4,0x1
 af2:	5a270713          	add	a4,a4,1442 # 2090 <__SDATA_BEGIN__+0x28>
 af6:	00073207          	fld	ft4,0(a4)
 afa:	00000f97          	auipc	t6,0x0
 afe:	179f8f93          	add	t6,t6,377 # c73 <_IO_stdin_used+0x2f>
 b02:	00001717          	auipc	a4,0x1
 b06:	59670713          	add	a4,a4,1430 # 2098 <__SDATA_BEGIN__+0x30>
 b0a:	00073287          	fld	ft5,0(a4)
 b0e:	00000f17          	auipc	t5,0x0
 b12:	24ef0f13          	add	t5,t5,590 # d5c <_IO_stdin_used+0x118>
 b16:	00001717          	auipc	a4,0x1
 b1a:	58a70713          	add	a4,a4,1418 # 20a0 <__SDATA_BEGIN__+0x38>
 b1e:	00073307          	fld	ft6,0(a4)
 b22:	00000817          	auipc	a6,0x0
 b26:	23d80813          	add	a6,a6,573 # d5f <_IO_stdin_used+0x11b>
 b2a:	00001717          	auipc	a4,0x1
 b2e:	57e70713          	add	a4,a4,1406 # 20a8 <__SDATA_BEGIN__+0x40>
 b32:	00073387          	fld	ft7,0(a4)
 b36:	00000897          	auipc	a7,0x0
 b3a:	14288893          	add	a7,a7,322 # c78 <_IO_stdin_used+0x34>
 b3e:	00001717          	auipc	a4,0x1
 b42:	57270713          	add	a4,a4,1394 # 20b0 <__SDATA_BEGIN__+0x48>
 b46:	2308                	fld	fa0,0(a4)
 b48:	00000297          	auipc	t0,0x0
 b4c:	12d28293          	add	t0,t0,301 # c75 <_IO_stdin_used+0x31>
 b50:	00001717          	auipc	a4,0x1
 b54:	56870713          	add	a4,a4,1384 # 20b8 <__SDATA_BEGIN__+0x50>
 b58:	230c                	fld	fa1,0(a4)
 b5a:	00000317          	auipc	t1,0x0
 b5e:	15d30313          	add	t1,t1,349 # cb7 <_IO_stdin_used+0x73>
 b62:	00001717          	auipc	a4,0x1
 b66:	55e70713          	add	a4,a4,1374 # 20c0 <__SDATA_BEGIN__+0x58>
 b6a:	2310                	fld	fa2,0(a4)
 b6c:	00000397          	auipc	t2,0x0
 b70:	1ad38393          	add	t2,t2,429 # d19 <_IO_stdin_used+0xd5>
 b74:	00001717          	auipc	a4,0x1
 b78:	55470713          	add	a4,a4,1364 # 20c8 <__SDATA_BEGIN__+0x60>
 b7c:	2314                	fld	fa3,0(a4)
 b7e:	00000e17          	auipc	t3,0x0
 b82:	15ae0e13          	add	t3,t3,346 # cd8 <_IO_stdin_used+0x94>
 b86:	00000e97          	auipc	t4,0x0
 b8a:	173e8e93          	add	t4,t4,371 # cf9 <_IO_stdin_used+0xb5>
 b8e:	00000797          	auipc	a5,0x0
 b92:	0e278793          	add	a5,a5,226 # c70 <_IO_stdin_used+0x2c>
 b96:	872a                	mv	a4,a0
 b98:	a031                	j	ba4 <func0+0x118>
 b9a:	e31c                	sd	a5,0(a4)
 b9c:	0721                	add	a4,a4,8
 b9e:	147d                	add	s0,s0,-1
 ba0:	0491                	add	s1,s1,4
 ba2:	c859                	beqz	s0,c38 <func0+0x1ac>
 ba4:	0004a707          	flw	fa4,0(s1)
 ba8:	42070753          	fcvt.d.s	fa4,fa4
 bac:	a2e006d3          	fle.d	a3,ft0,fa4
 bb0:	f6ed                	bnez	a3,b9a <func0+0x10e>
 bb2:	a2e096d3          	flt.d	a3,ft1,fa4
 bb6:	c299                	beqz	a3,bbc <func0+0x130>
 bb8:	e30c                	sd	a1,0(a4)
 bba:	b7cd                	j	b9c <func0+0x110>
 bbc:	a2e116d3          	flt.d	a3,ft2,fa4
 bc0:	c299                	beqz	a3,bc6 <func0+0x13a>
 bc2:	e310                	sd	a2,0(a4)
 bc4:	bfe1                	j	b9c <func0+0x110>
 bc6:	a2e196d3          	flt.d	a3,ft3,fa4
 bca:	c681                	beqz	a3,bd2 <func0+0x146>
 bcc:	01273023          	sd	s2,0(a4)
 bd0:	b7f1                	j	b9c <func0+0x110>
 bd2:	a2e216d3          	flt.d	a3,ft4,fa4
 bd6:	c681                	beqz	a3,bde <func0+0x152>
 bd8:	01f73023          	sd	t6,0(a4)
 bdc:	b7c1                	j	b9c <func0+0x110>
 bde:	a2e296d3          	flt.d	a3,ft5,fa4
 be2:	c681                	beqz	a3,bea <func0+0x15e>
 be4:	01e73023          	sd	t5,0(a4)
 be8:	bf55                	j	b9c <func0+0x110>
 bea:	a2e316d3          	flt.d	a3,ft6,fa4
 bee:	c681                	beqz	a3,bf6 <func0+0x16a>
 bf0:	01073023          	sd	a6,0(a4)
 bf4:	b765                	j	b9c <func0+0x110>
 bf6:	a2e396d3          	flt.d	a3,ft7,fa4
 bfa:	c681                	beqz	a3,c02 <func0+0x176>
 bfc:	01173023          	sd	a7,0(a4)
 c00:	bf71                	j	b9c <func0+0x110>
 c02:	a2e516d3          	flt.d	a3,fa0,fa4
 c06:	c681                	beqz	a3,c0e <func0+0x182>
 c08:	00573023          	sd	t0,0(a4)
 c0c:	bf41                	j	b9c <func0+0x110>
 c0e:	a2e596d3          	flt.d	a3,fa1,fa4
 c12:	c681                	beqz	a3,c1a <func0+0x18e>
 c14:	00673023          	sd	t1,0(a4)
 c18:	b751                	j	b9c <func0+0x110>
 c1a:	a2e616d3          	flt.d	a3,fa2,fa4
 c1e:	c681                	beqz	a3,c26 <func0+0x19a>
 c20:	00773023          	sd	t2,0(a4)
 c24:	bfa5                	j	b9c <func0+0x110>
 c26:	a2e696d3          	flt.d	a3,fa3,fa4
 c2a:	c681                	beqz	a3,c32 <func0+0x1a6>
 c2c:	01c73023          	sd	t3,0(a4)
 c30:	b7b5                	j	b9c <func0+0x110>
 c32:	01d73023          	sd	t4,0(a4)
 c36:	b79d                	j	b9c <func0+0x110>
 c38:	60e2                	ld	ra,24(sp)
 c3a:	6442                	ld	s0,16(sp)
 c3c:	64a2                	ld	s1,8(sp)
 c3e:	6902                	ld	s2,0(sp)
 c40:	6105                	add	sp,sp,32
 c42:	8082                	ret
