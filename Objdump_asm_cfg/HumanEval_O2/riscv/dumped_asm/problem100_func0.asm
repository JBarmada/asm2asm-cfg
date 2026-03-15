00000000000008b0 <func0>:
 8b0:	1141                	add	sp,sp,-16
 8b2:	e406                	sd	ra,8(sp)
 8b4:	4581                	li	a1,0
 8b6:	e3bff0ef          	jal	6f0 <strtod@plt>
 8ba:	f2000053          	fmv.d.x	ft0,zero
 8be:	a2051553          	flt.d	a0,fa0,ft0
 8c2:	cd01                	beqz	a0,8da <func0+0x2a>
 8c4:	00001517          	auipc	a0,0x1
 8c8:	7ac50513          	add	a0,a0,1964 # 2070 <__SDATA_BEGIN__+0x8>
 8cc:	00053007          	fld	ft0,0(a0)
 8d0:	02057553          	fadd.d	fa0,fa0,ft0
 8d4:	dedff0ef          	jal	6c0 <ceil@plt>
 8d8:	a819                	j	8ee <func0+0x3e>
 8da:	00001517          	auipc	a0,0x1
 8de:	78e50513          	add	a0,a0,1934 # 2068 <__SDATA_BEGIN__>
 8e2:	00053007          	fld	ft0,0(a0)
 8e6:	02057553          	fadd.d	fa0,fa0,ft0
 8ea:	de7ff0ef          	jal	6d0 <floor@plt>
 8ee:	c2051553          	fcvt.w.d	a0,fa0,rtz
 8f2:	60a2                	ld	ra,8(sp)
 8f4:	0141                	add	sp,sp,16
 8f6:	8082                	ret
