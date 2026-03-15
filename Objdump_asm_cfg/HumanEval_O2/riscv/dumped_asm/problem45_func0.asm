0000000000000a7c <func0>:
 a7c:	7179                	add	sp,sp,-48
 a7e:	06a05363          	blez	a0,ae4 <func0+0x68>
 a82:	4681                	li	a3,0
 a84:	4705                	li	a4,1
 a86:	00f10813          	add	a6,sp,15
 a8a:	88ba                	mv	a7,a4
 a8c:	02b547bb          	divw	a5,a0,a1
 a90:	02b7873b          	mulw	a4,a5,a1
 a94:	9d19                	subw	a0,a0,a4
 a96:	0305051b          	addw	a0,a0,48
 a9a:	00d80733          	add	a4,a6,a3
 a9e:	0685                	add	a3,a3,1
 aa0:	00a70023          	sb	a0,0(a4)
 aa4:	0018871b          	addw	a4,a7,1
 aa8:	853e                	mv	a0,a5
 aaa:	fef040e3          	bgtz	a5,a8a <func0+0xe>
 aae:	0006851b          	sext.w	a0,a3
 ab2:	02a05963          	blez	a0,ae4 <func0+0x68>
 ab6:	02089513          	sll	a0,a7,0x20
 aba:	9101                	srl	a0,a0,0x20
 abc:	00f10813          	add	a6,sp,15
 ac0:	8732                	mv	a4,a2
 ac2:	87b6                	mv	a5,a3
 ac4:	37fd                	addw	a5,a5,-1
 ac6:	02079593          	sll	a1,a5,0x20
 aca:	9181                	srl	a1,a1,0x20
 acc:	95c2                	add	a1,a1,a6
 ace:	00058583          	lb	a1,0(a1)
 ad2:	00b70023          	sb	a1,0(a4)
 ad6:	157d                	add	a0,a0,-1
 ad8:	0705                	add	a4,a4,1
 ada:	f56d                	bnez	a0,ac4 <func0+0x48>
 adc:	02069513          	sll	a0,a3,0x20
 ae0:	9101                	srl	a0,a0,0x20
 ae2:	a011                	j	ae6 <func0+0x6a>
 ae4:	4501                	li	a0,0
 ae6:	9532                	add	a0,a0,a2
 ae8:	00050023          	sb	zero,0(a0)
 aec:	6145                	add	sp,sp,48
 aee:	8082                	ret
