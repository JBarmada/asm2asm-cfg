0000000000000830 <func0>:
 830:	08a05063          	blez	a0,8b0 <func0+0x80>
 834:	4f01                	li	t5,0
 836:	4581                	li	a1,0
 838:	ba2e9637          	lui	a2,0xba2e9
 83c:	ba36081b          	addw	a6,a2,-1117 # ffffffffba2e8ba3 <__global_pointer$+0xffffffffba2e63a3>
 840:	1745d637          	lui	a2,0x1745d
 844:	1746089b          	addw	a7,a2,372 # 1745d174 <__global_pointer$+0x1745a974>
 848:	c4ec5637          	lui	a2,0xc4ec5
 84c:	ec56029b          	addw	t0,a2,-315 # ffffffffc4ec4ec5 <__global_pointer$+0xffffffffc4ec26c5>
 850:	13b14637          	lui	a2,0x13b14
 854:	b136031b          	addw	t1,a2,-1261 # 13b13b13 <__global_pointer$+0x13b11313>
 858:	ccccd637          	lui	a2,0xccccd
 85c:	ccd6061b          	addw	a2,a2,-819 # ffffffffcccccccd <__global_pointer$+0xffffffffcccca4cd>
 860:	02061713          	sll	a4,a2,0x20
 864:	43a9                	li	t2,10
 866:	4ea5                	li	t4,9
 868:	a021                	j	870 <func0+0x40>
 86a:	2f05                	addw	t5,t5,1
 86c:	04af5363          	bge	t5,a0,8b2 <func0+0x82>
 870:	030f063b          	mulw	a2,t5,a6
 874:	00c8be33          	sltu	t3,a7,a2
 878:	025f063b          	mulw	a2,t5,t0
 87c:	00c33633          	sltu	a2,t1,a2
 880:	00ce7e33          	and	t3,t3,a2
 884:	001f3613          	seqz	a2,t5
 888:	00ce6633          	or	a2,t3,a2
 88c:	fe79                	bnez	a2,86a <func0+0x3a>
 88e:	867a                	mv	a2,t5
 890:	86b2                	mv	a3,a2
 892:	1602                	sll	a2,a2,0x20
 894:	02e63633          	mulhu	a2,a2,a4
 898:	920d                	srl	a2,a2,0x23
 89a:	027607bb          	mulw	a5,a2,t2
 89e:	40f687bb          	subw	a5,a3,a5
 8a2:	17e5                	add	a5,a5,-7
 8a4:	0017b793          	seqz	a5,a5
 8a8:	9dbd                	addw	a1,a1,a5
 8aa:	fedee3e3          	bltu	t4,a3,890 <func0+0x60>
 8ae:	bf75                	j	86a <func0+0x3a>
 8b0:	4581                	li	a1,0
 8b2:	852e                	mv	a0,a1
 8b4:	8082                	ret
