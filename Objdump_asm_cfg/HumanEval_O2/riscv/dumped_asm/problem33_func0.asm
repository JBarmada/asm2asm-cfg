00000000000008b0 <func0>:
 8b0:	00053007          	fld	ft0,0(a0)
 8b4:	4609                	li	a2,2
 8b6:	00001697          	auipc	a3,0x1
 8ba:	7ba68693          	add	a3,a3,1978 # 2070 <__SDATA_BEGIN__+0x18>
 8be:	220000d3          	fmv.d	ft1,ft0
 8c2:	02c5ce63          	blt	a1,a2,8fe <func0+0x4e>
 8c6:	0006b107          	fld	ft2,0(a3)
 8ca:	4605                	li	a2,1
 8cc:	f20001d3          	fmv.d.x	ft3,zero
 8d0:	220000d3          	fmv.d	ft1,ft0
 8d4:	4701                	li	a4,0
 8d6:	22210253          	fmv.d	ft4,ft2
 8da:	2705                	addw	a4,a4,1
 8dc:	02071793          	sll	a5,a4,0x20
 8e0:	9381                	srl	a5,a5,0x20
 8e2:	12327253          	fmul.d	ft4,ft4,ft3
 8e6:	fec7eae3          	bltu	a5,a2,8da <func0+0x2a>
 8ea:	00361713          	sll	a4,a2,0x3
 8ee:	972a                	add	a4,a4,a0
 8f0:	00073287          	fld	ft5,0(a4)
 8f4:	0605                	add	a2,a2,1
 8f6:	0a42f0c3          	fmadd.d	ft1,ft5,ft4,ft1
 8fa:	fcb61de3          	bne	a2,a1,8d4 <func0+0x24>
 8fe:	00001617          	auipc	a2,0x1
 902:	77a60613          	add	a2,a2,1914 # 2078 <__SDATA_BEGIN__+0x20>
 906:	00063107          	fld	ft2,0(a2)
 90a:	2210a1d3          	fabs.d	ft3,ft1
 90e:	a2311653          	flt.d	a2,ft2,ft3
 912:	ca5d                	beqz	a2,9c8 <func0+0x118>
 914:	02059613          	sll	a2,a1,0x20
 918:	9201                	srl	a2,a2,0x20
 91a:	0006b187          	fld	ft3,0(a3)
 91e:	f2000253          	fmv.d.x	ft4,zero
 922:	4809                	li	a6,2
 924:	224212d3          	fneg.d	ft5,ft4
 928:	22420553          	fmv.d	fa0,ft4
 92c:	a821                	j	944 <func0+0x94>
 92e:	1a50f0d3          	fdiv.d	ft1,ft1,ft5
 932:	02157553          	fadd.d	fa0,fa0,ft1
 936:	220000d3          	fmv.d	ft1,ft0
 93a:	2210a353          	fabs.d	ft6,ft1
 93e:	a2611753          	flt.d	a4,ft2,ft6
 942:	c749                	beqz	a4,9cc <func0+0x11c>
 944:	ff05c5e3          	blt	a1,a6,92e <func0+0x7e>
 948:	4705                	li	a4,1
 94a:	22420353          	fmv.d	ft6,ft4
 94e:	a831                	j	96a <func0+0xba>
 950:	00371793          	sll	a5,a4,0x3
 954:	97aa                	add	a5,a5,a0
 956:	238c                	fld	fa1,0(a5)
 958:	d2070653          	fcvt.d.w	fa2,a4
 95c:	12c5f5d3          	fmul.d	fa1,fa1,fa2
 960:	0705                	add	a4,a4,1
 962:	3275f343          	fmadd.d	ft6,fa1,ft7,ft6
 966:	02c70263          	beq	a4,a2,98a <func0+0xda>
 96a:	223183d3          	fmv.d	ft7,ft3
 96e:	ff0761e3          	bltu	a4,a6,950 <func0+0xa0>
 972:	4785                	li	a5,1
 974:	223183d3          	fmv.d	ft7,ft3
 978:	2785                	addw	a5,a5,1
 97a:	02079693          	sll	a3,a5,0x20
 97e:	9281                	srl	a3,a3,0x20
 980:	127573d3          	fmul.d	ft7,fa0,ft7
 984:	fee6eae3          	bltu	a3,a4,978 <func0+0xc8>
 988:	b7e1                	j	950 <func0+0xa0>
 98a:	1a60f0d3          	fdiv.d	ft1,ft1,ft6
 98e:	0a157553          	fsub.d	fa0,fa0,ft1
 992:	fb05c2e3          	blt	a1,a6,936 <func0+0x86>
 996:	4705                	li	a4,1
 998:	220000d3          	fmv.d	ft1,ft0
 99c:	4781                	li	a5,0
 99e:	22318353          	fmv.d	ft6,ft3
 9a2:	2785                	addw	a5,a5,1
 9a4:	02079693          	sll	a3,a5,0x20
 9a8:	9281                	srl	a3,a3,0x20
 9aa:	12657353          	fmul.d	ft6,fa0,ft6
 9ae:	fee6eae3          	bltu	a3,a4,9a2 <func0+0xf2>
 9b2:	00371693          	sll	a3,a4,0x3
 9b6:	96aa                	add	a3,a3,a0
 9b8:	0006b387          	fld	ft7,0(a3)
 9bc:	0705                	add	a4,a4,1
 9be:	0a63f0c3          	fmadd.d	ft1,ft7,ft6,ft1
 9c2:	fcc71de3          	bne	a4,a2,99c <func0+0xec>
 9c6:	bf95                	j	93a <func0+0x8a>
 9c8:	f2000553          	fmv.d.x	fa0,zero
 9cc:	8082                	ret
