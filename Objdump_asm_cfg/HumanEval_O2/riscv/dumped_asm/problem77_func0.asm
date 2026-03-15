000000000000097c <func0>:
 97c:	02a05263          	blez	a0,9a0 <func0+0x24>
 980:	4701                	li	a4,0
 982:	4805                	li	a6,1
 984:	4685                	li	a3,1
 986:	00a68e63          	beq	a3,a0,9a2 <func0+0x26>
 98a:	02b686bb          	mulw	a3,a3,a1
 98e:	06373793          	sltiu	a5,a4,99
 992:	2705                	addw	a4,a4,1
 994:	00d52633          	slt	a2,a0,a3
 998:	00164613          	xor	a2,a2,1
 99c:	8e7d                	and	a2,a2,a5
 99e:	f665                	bnez	a2,986 <func0+0xa>
 9a0:	4801                	li	a6,0
 9a2:	8542                	mv	a0,a6
 9a4:	8082                	ret
