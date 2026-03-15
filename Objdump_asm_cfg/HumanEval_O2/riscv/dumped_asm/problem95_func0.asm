00000000000009b4 <func0>:
 9b4:	06b05963          	blez	a1,a26 <func0+0x72>
 9b8:	4681                	li	a3,0
 9ba:	4281                	li	t0,0
 9bc:	4889                	li	a7,2
 9be:	4811                	li	a6,4
 9c0:	a029                	j	9ca <func0+0x16>
 9c2:	82b2                	mv	t0,a2
 9c4:	0685                	add	a3,a3,1
 9c6:	02b68763          	beq	a3,a1,9f4 <func0+0x40>
 9ca:	00269613          	sll	a2,a3,0x2
 9ce:	962a                	add	a2,a2,a0
 9d0:	4210                	lw	a2,0(a2)
 9d2:	ff1649e3          	blt	a2,a7,9c4 <func0+0x10>
 9d6:	01066b63          	bltu	a2,a6,9ec <func0+0x38>
 9da:	4709                	li	a4,2
 9dc:	02e667bb          	remw	a5,a2,a4
 9e0:	d3f5                	beqz	a5,9c4 <func0+0x10>
 9e2:	2705                	addw	a4,a4,1
 9e4:	02e707bb          	mulw	a5,a4,a4
 9e8:	fef65ae3          	bge	a2,a5,9dc <func0+0x28>
 9ec:	fcc2cbe3          	blt	t0,a2,9c2 <func0+0xe>
 9f0:	8616                	mv	a2,t0
 9f2:	bfc1                	j	9c2 <func0+0xe>
 9f4:	4501                	li	a0,0
 9f6:	02505763          	blez	t0,a24 <func0+0x70>
 9fa:	ccccd5b7          	lui	a1,0xccccd
 9fe:	ccd5859b          	addw	a1,a1,-819 # ffffffffcccccccd <__global_pointer$+0xffffffffcccca4cd>
 a02:	1582                	sll	a1,a1,0x20
 a04:	4629                	li	a2,10
 a06:	46a5                	li	a3,9
 a08:	8716                	mv	a4,t0
 a0a:	02029793          	sll	a5,t0,0x20
 a0e:	02b7b7b3          	mulhu	a5,a5,a1
 a12:	0237d293          	srl	t0,a5,0x23
 a16:	02c287bb          	mulw	a5,t0,a2
 a1a:	40f707bb          	subw	a5,a4,a5
 a1e:	9d3d                	addw	a0,a0,a5
 a20:	fee6e4e3          	bltu	a3,a4,a08 <func0+0x54>
 a24:	8082                	ret
 a26:	4501                	li	a0,0
 a28:	8082                	ret
