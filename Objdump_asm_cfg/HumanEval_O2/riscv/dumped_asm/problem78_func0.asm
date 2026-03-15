0000000000000860 <func0>:
 860:	4581                	li	a1,0
 862:	41f5561b          	sraw	a2,a0,0x1f
 866:	8d31                	xor	a0,a0,a2
 868:	9d11                	subw	a0,a0,a2
 86a:	02b5863b          	mulw	a2,a1,a1
 86e:	02b6063b          	mulw	a2,a2,a1
 872:	2585                	addw	a1,a1,1
 874:	fea66be3          	bltu	a2,a0,86a <func0+0xa>
 878:	00c53533          	sltu	a0,a0,a2
 87c:	00154513          	xor	a0,a0,1
 880:	8082                	ret
