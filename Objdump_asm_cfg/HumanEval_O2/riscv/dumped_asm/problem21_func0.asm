00000000000009d8 <func0>:
 9d8:	00052087          	flw	ft1,0(a0)
 9dc:	00162027          	fsw	ft1,0(a2)
 9e0:	00452007          	flw	ft0,4(a0)
 9e4:	00062227          	fsw	ft0,4(a2)
 9e8:	06b05563          	blez	a1,a52 <func0+0x7a>
 9ec:	00001697          	auipc	a3,0x1
 9f0:	6b068693          	add	a3,a3,1712 # 209c <__SDATA_BEGIN__+0x4c>
 9f4:	0006a107          	flw	ft2,0(a3)
 9f8:	4801                	li	a6,0
 9fa:	00450893          	add	a7,a0,4
 9fe:	4285                	li	t0,1
 a00:	a029                	j	a0a <func0+0x32>
 a02:	0285                	add	t0,t0,1
 a04:	0891                	add	a7,a7,4
 a06:	04b80663          	beq	a6,a1,a52 <func0+0x7a>
 a0a:	86c2                	mv	a3,a6
 a0c:	0805                	add	a6,a6,1
 a0e:	feb87ae3          	bgeu	a6,a1,a02 <func0+0x2a>
 a12:	068a                	sll	a3,a3,0x2
 a14:	00d50333          	add	t1,a0,a3
 a18:	86ae                	mv	a3,a1
 a1a:	8746                	mv	a4,a7
 a1c:	a029                	j	a26 <func0+0x4e>
 a1e:	16fd                	add	a3,a3,-1
 a20:	0711                	add	a4,a4,4
 a22:	fed280e3          	beq	t0,a3,a02 <func0+0x2a>
 a26:	00032187          	flw	ft3,0(t1)
 a2a:	00072207          	flw	ft4,0(a4)
 a2e:	0841f253          	fsub.s	ft4,ft3,ft4
 a32:	20422253          	fabs.s	ft4,ft4
 a36:	a02217d3          	flt.s	a5,ft4,ft2
 a3a:	d3f5                	beqz	a5,a1e <func0+0x46>
 a3c:	00362027          	fsw	ft3,0(a2)
 a40:	00072007          	flw	ft0,0(a4)
 a44:	00062227          	fsw	ft0,4(a2)
 a48:	203180d3          	fmv.s	ft1,ft3
 a4c:	20420153          	fmv.s	ft2,ft4
 a50:	b7f9                	j	a1e <func0+0x46>
 a52:	a0101553          	flt.s	a0,ft0,ft1
 a56:	c509                	beqz	a0,a60 <func0+0x88>
 a58:	00062027          	fsw	ft0,0(a2)
 a5c:	00162227          	fsw	ft1,4(a2)
 a60:	8082                	ret
