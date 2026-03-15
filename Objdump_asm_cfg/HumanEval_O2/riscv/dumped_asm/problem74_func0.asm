000000000000089c <func0>:
 89c:	4609                	li	a2,2
 89e:	02c5ca63          	blt	a1,a2,8d2 <func0+0x36>
 8a2:	4681                	li	a3,0
 8a4:	4601                	li	a2,0
 8a6:	0015d81b          	srlw	a6,a1,0x1
 8aa:	87aa                	mv	a5,a0
 8ac:	0007a883          	lw	a7,0(a5)
 8b0:	fff6c713          	not	a4,a3
 8b4:	9f2d                	addw	a4,a4,a1
 8b6:	070a                	sll	a4,a4,0x2
 8b8:	972a                	add	a4,a4,a0
 8ba:	4318                	lw	a4,0(a4)
 8bc:	00e8c733          	xor	a4,a7,a4
 8c0:	00e03733          	snez	a4,a4
 8c4:	9e39                	addw	a2,a2,a4
 8c6:	0685                	add	a3,a3,1
 8c8:	0791                	add	a5,a5,4
 8ca:	fed811e3          	bne	a6,a3,8ac <func0+0x10>
 8ce:	8532                	mv	a0,a2
 8d0:	8082                	ret
 8d2:	4601                	li	a2,0
 8d4:	8532                	mv	a0,a2
 8d6:	8082                	ret
