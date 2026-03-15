00000000000009a0 <func0>:
 9a0:	00d05f63          	blez	a3,9be <func0+0x1e>
 9a4:	4118                	lw	a4,0(a0)
 9a6:	419c                	lw	a5,0(a1)
 9a8:	9f1d                	subw	a4,a4,a5
 9aa:	41f7579b          	sraw	a5,a4,0x1f
 9ae:	8f3d                	xor	a4,a4,a5
 9b0:	9f1d                	subw	a4,a4,a5
 9b2:	c218                	sw	a4,0(a2)
 9b4:	0611                	add	a2,a2,4
 9b6:	0591                	add	a1,a1,4
 9b8:	16fd                	add	a3,a3,-1
 9ba:	0511                	add	a0,a0,4
 9bc:	f6e5                	bnez	a3,9a4 <func0+0x4>
 9be:	8082                	ret
