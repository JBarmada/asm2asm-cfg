0000000000000854 <func0>:
 854:	715d                	add	sp,sp,-80
 856:	e486                	sd	ra,72(sp)
 858:	e0a2                	sd	s0,64(sp)
 85a:	fc26                	sd	s1,56(sp)
 85c:	f84a                	sd	s2,48(sp)
 85e:	f44e                	sd	s3,40(sp)
 860:	f052                	sd	s4,32(sp)
 862:	ec56                	sd	s5,24(sp)
 864:	e85a                	sd	s6,16(sp)
 866:	e45e                	sd	s7,8(sp)
 868:	89aa                	mv	s3,a0
 86a:	050a                	sll	a0,a0,0x2
 86c:	e35ff0ef          	jal	6a0 <malloc@plt>
 870:	892a                	mv	s2,a0
 872:	0019841b          	addw	s0,s3,1
 876:	00341493          	sll	s1,s0,0x3
 87a:	8526                	mv	a0,s1
 87c:	e25ff0ef          	jal	6a0 <malloc@plt>
 880:	8baa                	mv	s7,a0
 882:	8526                	mv	a0,s1
 884:	e1dff0ef          	jal	6a0 <malloc@plt>
 888:	8b2a                	mv	s6,a0
 88a:	4481                	li	s1,0
 88c:	02041a93          	sll	s5,s0,0x20
 890:	020ad413          	srl	s0,s5,0x20
 894:	450d                	li	a0,3
 896:	4591                	li	a1,4
 898:	e29ff0ef          	jal	6c0 <calloc@plt>
 89c:	009b85b3          	add	a1,s7,s1
 8a0:	e188                	sd	a0,0(a1)
 8a2:	450d                	li	a0,3
 8a4:	4591                	li	a1,4
 8a6:	e1bff0ef          	jal	6c0 <calloc@plt>
 8aa:	009b05b3          	add	a1,s6,s1
 8ae:	e188                	sd	a0,0(a1)
 8b0:	147d                	add	s0,s0,-1
 8b2:	04a1                	add	s1,s1,8
 8b4:	f065                	bnez	s0,894 <func0+0x40>
 8b6:	000bb603          	ld	a2,0(s7)
 8ba:	000b3503          	ld	a0,0(s6)
 8be:	00062423          	sw	zero,8(a2)
 8c2:	00062223          	sw	zero,4(a2)
 8c6:	00062023          	sw	zero,0(a2)
 8ca:	00052423          	sw	zero,8(a0)
 8ce:	00052223          	sw	zero,4(a0)
 8d2:	00052023          	sw	zero,0(a0)
 8d6:	07305063          	blez	s3,936 <func0+0xe2>
 8da:	020ad813          	srl	a6,s5,0x20
 8de:	008b8593          	add	a1,s7,8
 8e2:	4685                	li	a3,1
 8e4:	55555737          	lui	a4,0x55555
 8e8:	5567089b          	addw	a7,a4,1366 # 55555556 <__global_pointer$+0x55552d56>
 8ec:	87ca                	mv	a5,s2
 8ee:	4485                	li	s1,1
 8f0:	02d6843b          	mulw	s0,a3,a3
 8f4:	9c05                	subw	s0,s0,s1
 8f6:	2405                	addw	s0,s0,1
 8f8:	03140533          	mul	a0,s0,a7
 8fc:	03f55713          	srl	a4,a0,0x3f
 900:	9101                	srl	a0,a0,0x20
 902:	9d39                	addw	a0,a0,a4
 904:	0015171b          	sllw	a4,a0,0x1
 908:	9d39                	addw	a0,a0,a4
 90a:	40a4053b          	subw	a0,s0,a0
 90e:	c388                	sw	a0,0(a5)
 910:	6198                	ld	a4,0(a1)
 912:	4200                	lw	s0,0(a2)
 914:	c300                	sw	s0,0(a4)
 916:	4240                	lw	s0,4(a2)
 918:	c340                	sw	s0,4(a4)
 91a:	4610                	lw	a2,8(a2)
 91c:	c710                	sw	a2,8(a4)
 91e:	050a                	sll	a0,a0,0x2
 920:	953a                	add	a0,a0,a4
 922:	4110                	lw	a2,0(a0)
 924:	2605                	addw	a2,a2,1
 926:	c110                	sw	a2,0(a0)
 928:	0685                	add	a3,a3,1
 92a:	2485                	addw	s1,s1,1
 92c:	0791                	add	a5,a5,4
 92e:	05a1                	add	a1,a1,8
 930:	863a                	mv	a2,a4
 932:	fad81fe3          	bne	a6,a3,8f0 <func0+0x9c>
 936:	020ad393          	srl	t2,s5,0x20
 93a:	008b0293          	add	t0,s6,8
 93e:	fff38313          	add	t1,t2,-1
 942:	4885                	li	a7,1
 944:	4809                	li	a6,2
 946:	55555537          	lui	a0,0x55555
 94a:	55650e9b          	addw	t4,a0,1366 # 55555556 <__global_pointer$+0x55552d56>
 94e:	4e05                	li	t3,1
 950:	a021                	j	958 <func0+0x104>
 952:	110e7763          	bgeu	t3,a6,a60 <func0+0x20c>
 956:	2e05                	addw	t3,t3,1
 958:	0b305363          	blez	s3,9fe <func0+0x1aa>
 95c:	000b3503          	ld	a0,0(s6)
 960:	8f9a                	mv	t6,t1
 962:	8a16                	mv	s4,t0
 964:	84de                	mv	s1,s7
 966:	86ca                	mv	a3,s2
 968:	000a3403          	ld	s0,0(s4)
 96c:	4118                	lw	a4,0(a0)
 96e:	c018                	sw	a4,0(s0)
 970:	4158                	lw	a4,4(a0)
 972:	c058                	sw	a4,4(s0)
 974:	4508                	lw	a0,8(a0)
 976:	c408                	sw	a0,8(s0)
 978:	6088                	ld	a0,0(s1)
 97a:	4298                	lw	a4,0(a3)
 97c:	00052f03          	lw	t5,0(a0)
 980:	03d707b3          	mul	a5,a4,t4
 984:	03f7d613          	srl	a2,a5,0x3f
 988:	9381                	srl	a5,a5,0x20
 98a:	9e3d                	addw	a2,a2,a5
 98c:	0016179b          	sllw	a5,a2,0x1
 990:	9e3d                	addw	a2,a2,a5
 992:	40c7063b          	subw	a2,a4,a2
 996:	060a                	sll	a2,a2,0x2
 998:	9622                	add	a2,a2,s0
 99a:	421c                	lw	a5,0(a2)
 99c:	01e787bb          	addw	a5,a5,t5
 9a0:	c21c                	sw	a5,0(a2)
 9a2:	00452f03          	lw	t5,4(a0)
 9a6:	0017079b          	addw	a5,a4,1
 9aa:	03d78633          	mul	a2,a5,t4
 9ae:	03f65593          	srl	a1,a2,0x3f
 9b2:	9201                	srl	a2,a2,0x20
 9b4:	9db1                	addw	a1,a1,a2
 9b6:	0015961b          	sllw	a2,a1,0x1
 9ba:	9db1                	addw	a1,a1,a2
 9bc:	40b785bb          	subw	a1,a5,a1
 9c0:	058a                	sll	a1,a1,0x2
 9c2:	95a2                	add	a1,a1,s0
 9c4:	4190                	lw	a2,0(a1)
 9c6:	01e6063b          	addw	a2,a2,t5
 9ca:	c190                	sw	a2,0(a1)
 9cc:	4508                	lw	a0,8(a0)
 9ce:	0027059b          	addw	a1,a4,2
 9d2:	03d58633          	mul	a2,a1,t4
 9d6:	03f65713          	srl	a4,a2,0x3f
 9da:	9201                	srl	a2,a2,0x20
 9dc:	9e39                	addw	a2,a2,a4
 9de:	0016171b          	sllw	a4,a2,0x1
 9e2:	9e39                	addw	a2,a2,a4
 9e4:	9d91                	subw	a1,a1,a2
 9e6:	058a                	sll	a1,a1,0x2
 9e8:	95a2                	add	a1,a1,s0
 9ea:	4190                	lw	a2,0(a1)
 9ec:	9d31                	addw	a0,a0,a2
 9ee:	c188                	sw	a0,0(a1)
 9f0:	0691                	add	a3,a3,4
 9f2:	04a1                	add	s1,s1,8
 9f4:	1ffd                	add	t6,t6,-1
 9f6:	0a21                	add	s4,s4,8
 9f8:	8522                	mv	a0,s0
 9fa:	f60f97e3          	bnez	t6,968 <func0+0x114>
 9fe:	851e                	mv	a0,t2
 a00:	85da                	mv	a1,s6
 a02:	865e                	mv	a2,s7
 a04:	f409c7e3          	bltz	s3,952 <func0+0xfe>
 a08:	6194                	ld	a3,0(a1)
 a0a:	6218                	ld	a4,0(a2)
 a0c:	429c                	lw	a5,0(a3)
 a0e:	c31c                	sw	a5,0(a4)
 a10:	42dc                	lw	a5,4(a3)
 a12:	0006a023          	sw	zero,0(a3)
 a16:	c35c                	sw	a5,4(a4)
 a18:	469c                	lw	a5,8(a3)
 a1a:	0006a223          	sw	zero,4(a3)
 a1e:	c71c                	sw	a5,8(a4)
 a20:	0006a423          	sw	zero,8(a3)
 a24:	0621                	add	a2,a2,8
 a26:	157d                	add	a0,a0,-1
 a28:	05a1                	add	a1,a1,8
 a2a:	fd79                	bnez	a0,a08 <func0+0x1b4>
 a2c:	f3c8f5e3          	bgeu	a7,t3,956 <func0+0x102>
 a30:	00399513          	sll	a0,s3,0x3
 a34:	955e                	add	a0,a0,s7
 a36:	6108                	ld	a0,0(a0)
 a38:	00052a03          	lw	s4,0(a0)
 a3c:	0209c863          	bltz	s3,a6c <func0+0x218>
 a40:	020ad993          	srl	s3,s5,0x20
 a44:	84de                	mv	s1,s7
 a46:	845a                	mv	s0,s6
 a48:	6088                	ld	a0,0(s1)
 a4a:	c87ff0ef          	jal	6d0 <free@plt>
 a4e:	6008                	ld	a0,0(s0)
 a50:	c81ff0ef          	jal	6d0 <free@plt>
 a54:	0421                	add	s0,s0,8
 a56:	19fd                	add	s3,s3,-1
 a58:	04a1                	add	s1,s1,8
 a5a:	fe0997e3          	bnez	s3,a48 <func0+0x1f4>
 a5e:	a039                	j	a6c <func0+0x218>
 a60:	00399513          	sll	a0,s3,0x3
 a64:	955e                	add	a0,a0,s7
 a66:	6108                	ld	a0,0(a0)
 a68:	00052a03          	lw	s4,0(a0)
 a6c:	855e                	mv	a0,s7
 a6e:	c63ff0ef          	jal	6d0 <free@plt>
 a72:	855a                	mv	a0,s6
 a74:	c5dff0ef          	jal	6d0 <free@plt>
 a78:	854a                	mv	a0,s2
 a7a:	c57ff0ef          	jal	6d0 <free@plt>
 a7e:	8552                	mv	a0,s4
 a80:	60a6                	ld	ra,72(sp)
 a82:	6406                	ld	s0,64(sp)
 a84:	74e2                	ld	s1,56(sp)
 a86:	7942                	ld	s2,48(sp)
 a88:	79a2                	ld	s3,40(sp)
 a8a:	7a02                	ld	s4,32(sp)
 a8c:	6ae2                	ld	s5,24(sp)
 a8e:	6b42                	ld	s6,16(sp)
 a90:	6ba2                	ld	s7,8(sp)
 a92:	6161                	add	sp,sp,80
 a94:	8082                	ret
