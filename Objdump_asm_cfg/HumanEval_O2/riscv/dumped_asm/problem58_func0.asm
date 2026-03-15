0000000000000894 <func0>:
 894:	4689                	li	a3,2
 896:	4605                	li	a2,1
 898:	04d5c263          	blt	a1,a3,8dc <func0+0x48>
 89c:	00052007          	flw	ft0,0(a0)
 8a0:	4601                	li	a2,0
 8a2:	4781                	li	a5,0
 8a4:	0511                	add	a0,a0,4
 8a6:	15fd                	add	a1,a1,-1
 8a8:	a801                	j	8b8 <func0+0x24>
 8aa:	15fd                	add	a1,a1,-1
 8ac:	0511                	add	a0,a0,4
 8ae:	20108053          	fmv.s	ft0,ft1
 8b2:	8642                	mv	a2,a6
 8b4:	87ba                	mv	a5,a4
 8b6:	cd91                	beqz	a1,8d2 <func0+0x3e>
 8b8:	00052087          	flw	ft1,0(a0)
 8bc:	a01016d3          	flt.s	a3,ft0,ft1
 8c0:	4805                	li	a6,1
 8c2:	4705                	li	a4,1
 8c4:	e291                	bnez	a3,8c8 <func0+0x34>
 8c6:	873e                	mv	a4,a5
 8c8:	a00096d3          	flt.s	a3,ft1,ft0
 8cc:	fef9                	bnez	a3,8aa <func0+0x16>
 8ce:	8832                	mv	a6,a2
 8d0:	bfe9                	j	8aa <func0+0x16>
 8d2:	00e8053b          	addw	a0,a6,a4
 8d6:	1579                	add	a0,a0,-2
 8d8:	00a03633          	snez	a2,a0
 8dc:	8532                	mv	a0,a2
 8de:	8082                	ret
