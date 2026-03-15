000000000000090c <func0>:
 90c:	4601                	li	a2,0
 90e:	4681                	li	a3,0
 910:	41f5571b          	sraw	a4,a0,0x1f
 914:	8d39                	xor	a0,a0,a4
 916:	40e507bb          	subw	a5,a0,a4
 91a:	66666537          	lui	a0,0x66666
 91e:	6675089b          	addw	a7,a0,1639 # 66666667 <__global_pointer$+0x66663e67>
 922:	4825                	li	a6,9
 924:	82be                	mv	t0,a5
 926:	031787b3          	mul	a5,a5,a7
 92a:	03f7d513          	srl	a0,a5,0x3f
 92e:	9789                	sra	a5,a5,0x22
 930:	9fa9                	addw	a5,a5,a0
 932:	0012f513          	and	a0,t0,1
 936:	00154713          	xor	a4,a0,1
 93a:	9e39                	addw	a2,a2,a4
 93c:	9ea9                	addw	a3,a3,a0
 93e:	fe5843e3          	blt	a6,t0,924 <func0+0x18>
 942:	c190                	sw	a2,0(a1)
 944:	c1d4                	sw	a3,4(a1)
 946:	8082                	ret
