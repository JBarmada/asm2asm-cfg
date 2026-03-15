0000000000000958 <func0>:
 958:	7139                	add	sp,sp,-64
 95a:	fc06                	sd	ra,56(sp)
 95c:	f822                	sd	s0,48(sp)
 95e:	f426                	sd	s1,40(sp)
 960:	f04a                	sd	s2,32(sp)
 962:	ec4e                	sd	s3,24(sp)
 964:	e852                	sd	s4,16(sp)
 966:	e456                	sd	s5,8(sp)
 968:	8ab2                	mv	s5,a2
 96a:	862e                	mv	a2,a1
 96c:	4905                	li	s2,1
 96e:	012aa023          	sw	s2,0(s5)
 972:	0125a023          	sw	s2,0(a1)
 976:	07250263          	beq	a0,s2,9da <func0+0x82>
 97a:	84aa                	mv	s1,a0
 97c:	49a9                	li	s3,10
 97e:	80000537          	lui	a0,0x80000
 982:	00150a1b          	addw	s4,a0,1 # ffffffff80000001 <__global_pointer$+0xffffffff7fffd801>
 986:	a801                	j	996 <func0+0x3e>
 988:	01f4d51b          	srlw	a0,s1,0x1f
 98c:	9d25                	addw	a0,a0,s1
 98e:	4015549b          	sraw	s1,a0,0x1
 992:	05248463          	beq	s1,s2,9da <func0+0x82>
 996:	0144f533          	and	a0,s1,s4
 99a:	2501                	sext.w	a0,a0
 99c:	ff2516e3          	bne	a0,s2,988 <func0+0x30>
 9a0:	000aa583          	lw	a1,0(s5)
 9a4:	0135cc63          	blt	a1,s3,9bc <func0+0x64>
 9a8:	0019999b          	sllw	s3,s3,0x1
 9ac:	00299593          	sll	a1,s3,0x2
 9b0:	8532                	mv	a0,a2
 9b2:	d0fff0ef          	jal	6c0 <realloc@plt>
 9b6:	000aa583          	lw	a1,0(s5)
 9ba:	862a                	mv	a2,a0
 9bc:	0015851b          	addw	a0,a1,1
 9c0:	00aaa023          	sw	a0,0(s5)
 9c4:	00259513          	sll	a0,a1,0x2
 9c8:	9532                	add	a0,a0,a2
 9ca:	c104                	sw	s1,0(a0)
 9cc:	0014951b          	sllw	a0,s1,0x1
 9d0:	9d25                	addw	a0,a0,s1
 9d2:	0015049b          	addw	s1,a0,1
 9d6:	fd2490e3          	bne	s1,s2,996 <func0+0x3e>
 9da:	000aa503          	lw	a0,0(s5)
 9de:	4589                	li	a1,2
 9e0:	04b54e63          	blt	a0,a1,a3c <func0+0xe4>
 9e4:	4801                	li	a6,0
 9e6:	557d                	li	a0,-1
 9e8:	02055593          	srl	a1,a0,0x20
 9ec:	00460893          	add	a7,a2,4
 9f0:	4705                	li	a4,1
 9f2:	4785                	li	a5,1
 9f4:	a821                	j	a0c <func0+0xb4>
 9f6:	2505                	addw	a0,a0,1
 9f8:	050a                	sll	a0,a0,0x2
 9fa:	9532                	add	a0,a0,a2
 9fc:	c104                	sw	s1,0(a0)
 9fe:	000aa503          	lw	a0,0(s5)
 a02:	0785                	add	a5,a5,1
 a04:	0805                	add	a6,a6,1
 a06:	0891                	add	a7,a7,4
 a08:	02a7da63          	bge	a5,a0,a3c <func0+0xe4>
 a0c:	00279513          	sll	a0,a5,0x2
 a10:	9532                	add	a0,a0,a2
 a12:	4104                	lw	s1,0(a0)
 a14:	86c6                	mv	a3,a7
 a16:	8542                	mv	a0,a6
 a18:	00a58433          	add	s0,a1,a0
 a1c:	0405                	add	s0,s0,1
 a1e:	8c6d                	and	s0,s0,a1
 a20:	040a                	sll	s0,s0,0x2
 a22:	9432                	add	s0,s0,a2
 a24:	4000                	lw	s0,0(s0)
 a26:	fc84d8e3          	bge	s1,s0,9f6 <func0+0x9e>
 a2a:	c280                	sw	s0,0(a3)
 a2c:	00150413          	add	s0,a0,1
 a30:	157d                	add	a0,a0,-1
 a32:	16f1                	add	a3,a3,-4
 a34:	fe8742e3          	blt	a4,s0,a18 <func0+0xc0>
 a38:	4501                	li	a0,0
 a3a:	bf7d                	j	9f8 <func0+0xa0>
 a3c:	70e2                	ld	ra,56(sp)
 a3e:	7442                	ld	s0,48(sp)
 a40:	74a2                	ld	s1,40(sp)
 a42:	7902                	ld	s2,32(sp)
 a44:	69e2                	ld	s3,24(sp)
 a46:	6a42                	ld	s4,16(sp)
 a48:	6aa2                	ld	s5,8(sp)
 a4a:	6121                	add	sp,sp,64
 a4c:	8082                	ret
