0000000000000a80 <func0>:
 a80:	7179                	add	sp,sp,-48
 a82:	f406                	sd	ra,40(sp)
 a84:	f022                	sd	s0,32(sp)
 a86:	ec26                	sd	s1,24(sp)
 a88:	e84a                	sd	s2,16(sp)
 a8a:	e44e                	sd	s3,8(sp)
 a8c:	e052                	sd	s4,0(sp)
 a8e:	8932                	mv	s2,a2
 a90:	8a2a                	mv	s4,a0
 a92:	4509                	li	a0,2
 a94:	fff5889b          	addw	a7,a1,-1
 a98:	04a5c363          	blt	a1,a0,ade <func0+0x5e>
 a9c:	4601                	li	a2,0
 a9e:	004a0813          	add	a6,s4,4
 aa2:	87c6                	mv	a5,a7
 aa4:	a029                	j	aae <func0+0x2e>
 aa6:	2605                	addw	a2,a2,1
 aa8:	37fd                	addw	a5,a5,-1
 aaa:	03165a63          	bge	a2,a7,ade <func0+0x5e>
 aae:	fff64513          	not	a0,a2
 ab2:	9d2d                	addw	a0,a0,a1
 ab4:	fea059e3          	blez	a0,aa6 <func0+0x26>
 ab8:	000a2503          	lw	a0,0(s4)
 abc:	02079713          	sll	a4,a5,0x20
 ac0:	02075413          	srl	s0,a4,0x20
 ac4:	8742                	mv	a4,a6
 ac6:	a039                	j	ad4 <func0+0x54>
 ac8:	fe972e23          	sw	s1,-4(a4)
 acc:	c308                	sw	a0,0(a4)
 ace:	147d                	add	s0,s0,-1
 ad0:	0711                	add	a4,a4,4
 ad2:	d871                	beqz	s0,aa6 <func0+0x26>
 ad4:	4304                	lw	s1,0(a4)
 ad6:	fea4c9e3          	blt	s1,a0,ac8 <func0+0x48>
 ada:	8526                	mv	a0,s1
 adc:	bfcd                	j	ace <func0+0x4e>
 ade:	0006a023          	sw	zero,0(a3)
 ae2:	02089993          	sll	s3,a7,0x20
 ae6:	4401                	li	s0,0
 ae8:	02b05563          	blez	a1,b12 <func0+0x92>
 aec:	0209d513          	srl	a0,s3,0x20
 af0:	0505                	add	a0,a0,1
 af2:	01e9d613          	srl	a2,s3,0x1e
 af6:	9652                	add	a2,a2,s4
 af8:	4721                	li	a4,8
 afa:	a029                	j	b04 <func0+0x84>
 afc:	157d                	add	a0,a0,-1
 afe:	1671                	add	a2,a2,-4
 b00:	00a05963          	blez	a0,b12 <func0+0x92>
 b04:	421c                	lw	a5,0(a2)
 b06:	37fd                	addw	a5,a5,-1
 b08:	fef76ae3          	bltu	a4,a5,afc <func0+0x7c>
 b0c:	2405                	addw	s0,s0,1
 b0e:	c280                	sw	s0,0(a3)
 b10:	b7f5                	j	afc <func0+0x7c>
 b12:	00b024b3          	sgtz	s1,a1
 b16:	00341513          	sll	a0,s0,0x3
 b1a:	b87ff0ef          	jal	6a0 <malloc@plt>
 b1e:	008025b3          	sgtz	a1,s0
 b22:	8de5                	and	a1,a1,s1
 b24:	00a93023          	sd	a0,0(s2)
 b28:	c5b9                	beqz	a1,b76 <func0+0xf6>
 b2a:	4701                	li	a4,0
 b2c:	0209d513          	srl	a0,s3,0x20
 b30:	01e9d593          	srl	a1,s3,0x1e
 b34:	95d2                	add	a1,a1,s4
 b36:	4821                	li	a6,8
 b38:	00000697          	auipc	a3,0x0
 b3c:	19868693          	add	a3,a3,408 # cd0 <_IO_stdin_used+0x148>
 b40:	a809                	j	b52 <func0+0xd2>
 b42:	00a02633          	sgtz	a2,a0
 b46:	008727b3          	slt	a5,a4,s0
 b4a:	8e7d                	and	a2,a2,a5
 b4c:	157d                	add	a0,a0,-1
 b4e:	15f1                	add	a1,a1,-4
 b50:	c21d                	beqz	a2,b76 <func0+0xf6>
 b52:	0005e783          	lwu	a5,0(a1)
 b56:	fff7849b          	addw	s1,a5,-1
 b5a:	fe9864e3          	bltu	a6,s1,b42 <func0+0xc2>
 b5e:	078a                	sll	a5,a5,0x2
 b60:	97b6                	add	a5,a5,a3
 b62:	439c                	lw	a5,0(a5)
 b64:	00093483          	ld	s1,0(s2)
 b68:	97b6                	add	a5,a5,a3
 b6a:	00371613          	sll	a2,a4,0x3
 b6e:	2705                	addw	a4,a4,1
 b70:	9626                	add	a2,a2,s1
 b72:	e21c                	sd	a5,0(a2)
 b74:	b7f9                	j	b42 <func0+0xc2>
 b76:	70a2                	ld	ra,40(sp)
 b78:	7402                	ld	s0,32(sp)
 b7a:	64e2                	ld	s1,24(sp)
 b7c:	6942                	ld	s2,16(sp)
 b7e:	69a2                	ld	s3,8(sp)
 b80:	6a02                	ld	s4,0(sp)
 b82:	6145                	add	sp,sp,48
 b84:	8082                	ret
