0000000000000a74 <func0>:
 a74:	1101                	add	sp,sp,-32
 a76:	ec06                	sd	ra,24(sp)
 a78:	e822                	sd	s0,16(sp)
 a7a:	e426                	sd	s1,8(sp)
 a7c:	e04a                	sd	s2,0(sp)
 a7e:	8932                	mv	s2,a2
 a80:	84ae                	mv	s1,a1
 a82:	842a                	mv	s0,a0
 a84:	00259513          	sll	a0,a1,0x2
 a88:	bd9ff0ef          	jal	660 <malloc@plt>
 a8c:	00092023          	sw	zero,0(s2)
 a90:	02905763          	blez	s1,abe <func0+0x4a>
 a94:	4581                	li	a1,0
 a96:	f0000053          	fmv.w.x	ft0,zero
 a9a:	a021                	j	aa2 <func0+0x2e>
 a9c:	14fd                	add	s1,s1,-1
 a9e:	0411                	add	s0,s0,4 # 40c00004 <__global_pointer$+0x40bfd804>
 aa0:	cc99                	beqz	s1,abe <func0+0x4a>
 aa2:	00042087          	flw	ft1,0(s0)
 aa6:	a0101653          	flt.s	a2,ft0,ft1
 aaa:	da6d                	beqz	a2,a9c <func0+0x28>
 aac:	00259613          	sll	a2,a1,0x2
 ab0:	2585                	addw	a1,a1,1
 ab2:	00b92023          	sw	a1,0(s2)
 ab6:	962a                	add	a2,a2,a0
 ab8:	00162027          	fsw	ft1,0(a2) # 40a00000 <__global_pointer$+0x409fd800>
 abc:	b7c5                	j	a9c <func0+0x28>
 abe:	60e2                	ld	ra,24(sp)
 ac0:	6442                	ld	s0,16(sp)
 ac2:	64a2                	ld	s1,8(sp)
 ac4:	6902                	ld	s2,0(sp)
 ac6:	6105                	add	sp,sp,32
 ac8:	8082                	ret
