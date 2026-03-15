0000000000000b04 <func0>:
 b04:	7139                	add	sp,sp,-64
 b06:	fc06                	sd	ra,56(sp)
 b08:	f822                	sd	s0,48(sp)
 b0a:	f426                	sd	s1,40(sp)
 b0c:	f04a                	sd	s2,32(sp)
 b0e:	ec4e                	sd	s3,24(sp)
 b10:	e852                	sd	s4,16(sp)
 b12:	e456                	sd	s5,8(sp)
 b14:	e05a                	sd	s6,0(sp)
 b16:	8a32                	mv	s4,a2
 b18:	c28c                	sw	a1,0(a3)
 b1a:	c9d1                	beqz	a1,bae <func0+0xaa>
 b1c:	8b2e                	mv	s6,a1
 b1e:	892a                	mv	s2,a0
 b20:	00259993          	sll	s3,a1,0x2
 b24:	854e                	mv	a0,s3
 b26:	bbbff0ef          	jal	6e0 <malloc@plt>
 b2a:	00aa3023          	sd	a0,0(s4)
 b2e:	cd41                	beqz	a0,bc6 <func0+0xc2>
 b30:	8aaa                	mv	s5,a0
 b32:	01605763          	blez	s6,b40 <func0+0x3c>
 b36:	8556                	mv	a0,s5
 b38:	85ca                	mv	a1,s2
 b3a:	864e                	mv	a2,s3
 b3c:	bb5ff0ef          	jal	6f0 <memcpy@plt>
 b40:	4509                	li	a0,2
 b42:	06ab4863          	blt	s6,a0,bb2 <func0+0xae>
 b46:	00092503          	lw	a0,0(s2)
 b4a:	fffb059b          	addw	a1,s6,-1
 b4e:	00259613          	sll	a2,a1,0x2
 b52:	964a                	add	a2,a2,s2
 b54:	4210                	lw	a2,0(a2)
 b56:	4881                	li	a7,0
 b58:	9d31                	addw	a0,a0,a2
 b5a:	80000637          	lui	a2,0x80000
 b5e:	2605                	addw	a2,a2,1 # ffffffff80000001 <__global_pointer$+0xffffffff7fffd801>
 b60:	8d71                	and	a0,a0,a2
 b62:	1582                	sll	a1,a1,0x20
 b64:	0205d813          	srl	a6,a1,0x20
 b68:	004a8293          	add	t0,s5,4
 b6c:	4705                	li	a4,1
 b6e:	4785                	li	a5,1
 b70:	a029                	j	b7a <func0+0x76>
 b72:	0785                	add	a5,a5,1
 b74:	0291                	add	t0,t0,4
 b76:	03088e63          	beq	a7,a6,bb2 <func0+0xae>
 b7a:	85c6                	mv	a1,a7
 b7c:	0885                	add	a7,a7,1
 b7e:	ff68dae3          	bge	a7,s6,b72 <func0+0x6e>
 b82:	058a                	sll	a1,a1,0x2
 b84:	00ba84b3          	add	s1,s5,a1
 b88:	845a                	mv	s0,s6
 b8a:	8696                	mv	a3,t0
 b8c:	a039                	j	b9a <func0+0x96>
 b8e:	c090                	sw	a2,0(s1)
 b90:	c28c                	sw	a1,0(a3)
 b92:	147d                	add	s0,s0,-1
 b94:	0691                	add	a3,a3,4
 b96:	fc878ee3          	beq	a5,s0,b72 <func0+0x6e>
 b9a:	408c                	lw	a1,0(s1)
 b9c:	4290                	lw	a2,0(a3)
 b9e:	00e51563          	bne	a0,a4,ba8 <func0+0xa4>
 ba2:	feb646e3          	blt	a2,a1,b8e <func0+0x8a>
 ba6:	b7f5                	j	b92 <func0+0x8e>
 ba8:	fec5c3e3          	blt	a1,a2,b8e <func0+0x8a>
 bac:	b7dd                	j	b92 <func0+0x8e>
 bae:	000a3023          	sd	zero,0(s4)
 bb2:	70e2                	ld	ra,56(sp)
 bb4:	7442                	ld	s0,48(sp)
 bb6:	74a2                	ld	s1,40(sp)
 bb8:	7902                	ld	s2,32(sp)
 bba:	69e2                	ld	s3,24(sp)
 bbc:	6a42                	ld	s4,16(sp)
 bbe:	6aa2                	ld	s5,8(sp)
 bc0:	6b02                	ld	s6,0(sp)
 bc2:	6121                	add	sp,sp,64
 bc4:	8082                	ret
 bc6:	4505                	li	a0,1
 bc8:	b49ff0ef          	jal	710 <exit@plt>
