0000000000000904 <func0>:
 904:	715d                	add	sp,sp,-80
 906:	e486                	sd	ra,72(sp)
 908:	e0a2                	sd	s0,64(sp)
 90a:	fc26                	sd	s1,56(sp)
 90c:	f84a                	sd	s2,48(sp)
 90e:	f44e                	sd	s3,40(sp)
 910:	f052                	sd	s4,32(sp)
 912:	ac22                	fsd	fs0,24(sp)
 914:	a826                	fsd	fs1,16(sp)
 916:	a44a                	fsd	fs2,8(sp)
 918:	a04e                	fsd	fs3,0(sp)
 91a:	06b05363          	blez	a1,980 <func0+0x7c>
 91e:	842e                	mv	s0,a1
 920:	84aa                	mv	s1,a0
 922:	4901                	li	s2,0
 924:	00001517          	auipc	a0,0x1
 928:	73450513          	add	a0,a0,1844 # 2058 <__SDATA_BEGIN__>
 92c:	2104                	fld	fs1,0(a0)
 92e:	f0000953          	fmv.w.x	fs2,zero
 932:	80000537          	lui	a0,0x80000
 936:	0015099b          	addw	s3,a0,1 # ffffffff80000001 <__global_pointer$+0xffffffff7fffd801>
 93a:	4a05                	li	s4,1
 93c:	a021                	j	944 <func0+0x40>
 93e:	147d                	add	s0,s0,-1
 940:	0491                	add	s1,s1,4
 942:	c021                	beqz	s0,982 <func0+0x7e>
 944:	0004a987          	flw	fs3,0(s1)
 948:	42098453          	fcvt.d.s	fs0,fs3
 94c:	22840553          	fmv.d	fa0,fs0
 950:	cf1ff0ef          	jal	640 <round@plt>
 954:	0aa47053          	fsub.d	ft0,fs0,fa0
 958:	22002053          	fabs.d	ft0,ft0
 95c:	a2901553          	flt.d	a0,ft0,fs1
 960:	a13915d3          	flt.s	a1,fs2,fs3
 964:	8d6d                	and	a0,a0,a1
 966:	dd61                	beqz	a0,93e <func0+0x3a>
 968:	c2051553          	fcvt.w.d	a0,fa0,rtz
 96c:	013575b3          	and	a1,a0,s3
 970:	fd4597e3          	bne	a1,s4,93e <func0+0x3a>
 974:	02a5053b          	mulw	a0,a0,a0
 978:	1502                	sll	a0,a0,0x20
 97a:	9101                	srl	a0,a0,0x20
 97c:	992a                	add	s2,s2,a0
 97e:	b7c1                	j	93e <func0+0x3a>
 980:	4901                	li	s2,0
 982:	854a                	mv	a0,s2
 984:	60a6                	ld	ra,72(sp)
 986:	6406                	ld	s0,64(sp)
 988:	74e2                	ld	s1,56(sp)
 98a:	7942                	ld	s2,48(sp)
 98c:	79a2                	ld	s3,40(sp)
 98e:	7a02                	ld	s4,32(sp)
 990:	2462                	fld	fs0,24(sp)
 992:	24c2                	fld	fs1,16(sp)
 994:	2922                	fld	fs2,8(sp)
 996:	2982                	fld	fs3,0(sp)
 998:	6161                	add	sp,sp,80
 99a:	8082                	ret
