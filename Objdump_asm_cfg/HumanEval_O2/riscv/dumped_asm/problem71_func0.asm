0000000000000a60 <func0>:
 a60:	4689                	li	a3,2
 a62:	fff5889b          	addw	a7,a1,-1
 a66:	04d5c763          	blt	a1,a3,ab4 <func0+0x54>
 a6a:	4281                	li	t0,0
 a6c:	02089693          	sll	a3,a7,0x20
 a70:	0206d813          	srl	a6,a3,0x20
 a74:	00450313          	add	t1,a0,4
 a78:	4385                	li	t2,1
 a7a:	a029                	j	a84 <func0+0x24>
 a7c:	0385                	add	t2,t2,1
 a7e:	0311                	add	t1,t1,4
 a80:	03028a63          	beq	t0,a6,ab4 <func0+0x54>
 a84:	8696                	mv	a3,t0
 a86:	0285                	add	t0,t0,1
 a88:	feb2fae3          	bgeu	t0,a1,a7c <func0+0x1c>
 a8c:	068a                	sll	a3,a3,0x2
 a8e:	00d50e33          	add	t3,a0,a3
 a92:	87ae                	mv	a5,a1
 a94:	871a                	mv	a4,t1
 a96:	a029                	j	aa0 <func0+0x40>
 a98:	17fd                	add	a5,a5,-1
 a9a:	0711                	add	a4,a4,4
 a9c:	fef380e3          	beq	t2,a5,a7c <func0+0x1c>
 aa0:	000e2e83          	lw	t4,0(t3)
 aa4:	4314                	lw	a3,0(a4)
 aa6:	ffd6d9e3          	bge	a3,t4,a98 <func0+0x38>
 aaa:	00de2023          	sw	a3,0(t3)
 aae:	01d72023          	sw	t4,0(a4)
 ab2:	b7dd                	j	a98 <func0+0x38>
 ab4:	04b05563          	blez	a1,afe <func0+0x9e>
 ab8:	4681                	li	a3,0
 aba:	587d                	li	a6,-1
 abc:	872a                	mv	a4,a0
 abe:	a029                	j	ac8 <func0+0x68>
 ac0:	0711                	add	a4,a4,4
 ac2:	8696                	mv	a3,t0
 ac4:	03185d63          	bge	a6,a7,afe <func0+0x9e>
 ac8:	0805                	add	a6,a6,1
 aca:	02089793          	sll	a5,a7,0x20
 ace:	0207d313          	srl	t1,a5,0x20
 ad2:	431c                	lw	a5,0(a4)
 ad4:	0016829b          	addw	t0,a3,1
 ad8:	00269593          	sll	a1,a3,0x2
 adc:	95b2                	add	a1,a1,a2
 ade:	c19c                	sw	a5,0(a1)
 ae0:	fe6800e3          	beq	a6,t1,ac0 <func0+0x60>
 ae4:	00289593          	sll	a1,a7,0x2
 ae8:	38fd                	addw	a7,a7,-1
 aea:	95aa                	add	a1,a1,a0
 aec:	418c                	lw	a1,0(a1)
 aee:	00229793          	sll	a5,t0,0x2
 af2:	0026829b          	addw	t0,a3,2
 af6:	00f606b3          	add	a3,a2,a5
 afa:	c28c                	sw	a1,0(a3)
 afc:	b7d1                	j	ac0 <func0+0x60>
 afe:	8082                	ret
