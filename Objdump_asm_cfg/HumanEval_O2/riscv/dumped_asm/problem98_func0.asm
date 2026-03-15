0000000000000828 <func0>:
 828:	41f5561b          	sraw	a2,a0,0x1f
 82c:	8d31                	xor	a0,a0,a2
 82e:	9d11                	subw	a0,a0,a2
 830:	02051613          	sll	a2,a0,0x20
 834:	9201                	srl	a2,a2,0x20
 836:	000cd6b7          	lui	a3,0xcd
 83a:	ccd6869b          	addw	a3,a3,-819 # ccccd <__global_pointer$+0xca4cd>
 83e:	06b2                	sll	a3,a3,0xc
 840:	ccd68693          	add	a3,a3,-819
 844:	02d60633          	mul	a2,a2,a3
 848:	920d                	srl	a2,a2,0x23
 84a:	4729                	li	a4,10
 84c:	02e6063b          	mulw	a2,a2,a4
 850:	9d11                	subw	a0,a0,a2
 852:	41f5d61b          	sraw	a2,a1,0x1f
 856:	8db1                	xor	a1,a1,a2
 858:	9d91                	subw	a1,a1,a2
 85a:	02059613          	sll	a2,a1,0x20
 85e:	9201                	srl	a2,a2,0x20
 860:	02d60633          	mul	a2,a2,a3
 864:	920d                	srl	a2,a2,0x23
 866:	02e6063b          	mulw	a2,a2,a4
 86a:	9d91                	subw	a1,a1,a2
 86c:	02a5853b          	mulw	a0,a1,a0
 870:	1502                	sll	a0,a0,0x20
 872:	9101                	srl	a0,a0,0x20
 874:	8082                	ret
