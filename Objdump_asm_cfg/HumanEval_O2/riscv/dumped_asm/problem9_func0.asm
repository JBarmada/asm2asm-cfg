0000000000000830 <func0>:
 830:	4701                	li	a4,0
 832:	4685                	li	a3,1
 834:	00b05963          	blez	a1,846 <func0+0x16>
 838:	411c                	lw	a5,0(a0)
 83a:	9f3d                	addw	a4,a4,a5
 83c:	02d786bb          	mulw	a3,a5,a3
 840:	15fd                	add	a1,a1,-1
 842:	0511                	add	a0,a0,4
 844:	f9f5                	bnez	a1,838 <func0+0x8>
 846:	c218                	sw	a4,0(a2)
 848:	c254                	sw	a3,4(a2)
 84a:	8082                	ret
