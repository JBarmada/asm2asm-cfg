0000000000000870 <func0>:
 870:	04b05663          	blez	a1,8bc <func0+0x4c>
 874:	4301                	li	t1,0
 876:	4881                	li	a7,0
 878:	482d                	li	a6,11
 87a:	ccccd637          	lui	a2,0xccccd
 87e:	ccd6061b          	addw	a2,a2,-819 # ffffffffcccccccd <__global_pointer$+0xffffffffcccca4cd>
 882:	02061793          	sll	a5,a2,0x20
 886:	06300713          	li	a4,99
 88a:	a021                	j	892 <func0+0x22>
 88c:	0305                	add	t1,t1,1
 88e:	02b30863          	beq	t1,a1,8be <func0+0x4e>
 892:	00231613          	sll	a2,t1,0x2
 896:	962a                	add	a2,a2,a0
 898:	00062283          	lw	t0,0(a2)
 89c:	ff02c8e3          	blt	t0,a6,88c <func0+0x1c>
 8a0:	8616                	mv	a2,t0
 8a2:	86b2                	mv	a3,a2
 8a4:	1602                	sll	a2,a2,0x20
 8a6:	02f63633          	mulhu	a2,a2,a5
 8aa:	920d                	srl	a2,a2,0x23
 8ac:	fed76be3          	bltu	a4,a3,8a2 <func0+0x32>
 8b0:	00567633          	and	a2,a2,t0
 8b4:	8a05                	and	a2,a2,1
 8b6:	00c888bb          	addw	a7,a7,a2
 8ba:	bfc9                	j	88c <func0+0x1c>
 8bc:	4881                	li	a7,0
 8be:	8546                	mv	a0,a7
 8c0:	8082                	ret
