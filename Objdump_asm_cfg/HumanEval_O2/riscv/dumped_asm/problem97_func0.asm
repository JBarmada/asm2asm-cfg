0000000000000b3c <func0>:
 b3c:	1101                	add	sp,sp,-32
 b3e:	ec06                	sd	ra,24(sp)
 b40:	e822                	sd	s0,16(sp)
 b42:	e426                	sd	s1,8(sp)
 b44:	e04a                	sd	s2,0(sp)
 b46:	892e                	mv	s2,a1
 b48:	84aa                	mv	s1,a0
 b4a:	050a                	sll	a0,a0,0x2
 b4c:	b15ff0ef          	jal	660 <malloc@plt>
 b50:	458d                	li	a1,3
 b52:	00092023          	sw	zero,0(s2)
 b56:	02b4cf63          	blt	s1,a1,b94 <func0+0x58>
 b5a:	4581                	li	a1,0
 b5c:	4609                	li	a2,2
 b5e:	a819                	j	b74 <func0+0x38>
 b60:	00259693          	sll	a3,a1,0x2
 b64:	96aa                	add	a3,a3,a0
 b66:	c290                	sw	a2,0(a3)
 b68:	2585                	addw	a1,a1,1
 b6a:	00b92023          	sw	a1,0(s2)
 b6e:	2605                	addw	a2,a2,1
 b70:	02965263          	bge	a2,s1,b94 <func0+0x58>
 b74:	feb056e3          	blez	a1,b60 <func0+0x24>
 b78:	86ae                	mv	a3,a1
 b7a:	872a                	mv	a4,a0
 b7c:	431c                	lw	a5,0(a4)
 b7e:	02f7843b          	mulw	s0,a5,a5
 b82:	fc866fe3          	bltu	a2,s0,b60 <func0+0x24>
 b86:	02f667bb          	remw	a5,a2,a5
 b8a:	d3f5                	beqz	a5,b6e <func0+0x32>
 b8c:	16fd                	add	a3,a3,-1
 b8e:	0711                	add	a4,a4,4
 b90:	f6f5                	bnez	a3,b7c <func0+0x40>
 b92:	b7f9                	j	b60 <func0+0x24>
 b94:	60e2                	ld	ra,24(sp)
 b96:	6442                	ld	s0,16(sp)
 b98:	64a2                	ld	s1,8(sp)
 b9a:	6902                	ld	s2,0(sp)
 b9c:	6105                	add	sp,sp,32
 b9e:	8082                	ret
