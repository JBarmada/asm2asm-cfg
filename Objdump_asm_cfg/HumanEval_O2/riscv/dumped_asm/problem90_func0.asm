0000000000000914 <func0>:
 914:	00054783          	lbu	a5,0(a0)
 918:	c7a9                	beqz	a5,962 <func0+0x4e>
 91a:	4701                	li	a4,0
 91c:	00150893          	add	a7,a0,1
 920:	6615                	lui	a2,0x5
 922:	ec56061b          	addw	a2,a2,-315 # 4ec5 <__global_pointer$+0x26c5>
 926:	4869                	li	a6,26
 928:	0ff7f693          	zext.b	a3,a5
 92c:	fa368693          	add	a3,a3,-93
 930:	02c687b3          	mul	a5,a3,a2
 934:	01f7d51b          	srlw	a0,a5,0x1f
 938:	83cd                	srl	a5,a5,0x13
 93a:	9d3d                	addw	a0,a0,a5
 93c:	0305053b          	mulw	a0,a0,a6
 940:	40a6853b          	subw	a0,a3,a0
 944:	0615051b          	addw	a0,a0,97
 948:	00e586b3          	add	a3,a1,a4
 94c:	00a68023          	sb	a0,0(a3)
 950:	00e88533          	add	a0,a7,a4
 954:	00054783          	lbu	a5,0(a0)
 958:	00170693          	add	a3,a4,1
 95c:	8736                	mv	a4,a3
 95e:	f7e9                	bnez	a5,928 <func0+0x14>
 960:	a011                	j	964 <func0+0x50>
 962:	4681                	li	a3,0
 964:	00d58533          	add	a0,a1,a3
 968:	00050023          	sb	zero,0(a0)
 96c:	8082                	ret
