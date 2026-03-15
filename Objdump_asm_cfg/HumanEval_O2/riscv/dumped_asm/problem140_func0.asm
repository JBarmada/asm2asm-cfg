0000000000000780 <func0>:
 780:	02a05163          	blez	a0,7a2 <func0+0x22>
 784:	2505                	addw	a0,a0,1
 786:	1502                	sll	a0,a0,0x20
 788:	02055593          	srl	a1,a0,0x20
 78c:	4605                	li	a2,1
 78e:	4505                	li	a0,1
 790:	4685                	li	a3,1
 792:	02c686b3          	mul	a3,a3,a2
 796:	0605                	add	a2,a2,1
 798:	02a68533          	mul	a0,a3,a0
 79c:	fec59be3          	bne	a1,a2,792 <func0+0x12>
 7a0:	8082                	ret
 7a2:	4505                	li	a0,1
 7a4:	8082                	ret
