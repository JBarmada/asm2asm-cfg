00000000000008a4 <func0>:
 8a4:	04b05f63          	blez	a1,902 <func0+0x5e>
 8a8:	4e01                	li	t3,0
 8aa:	4301                	li	t1,0
 8ac:	5859                	li	a6,-10
 8ae:	ccccd637          	lui	a2,0xccccd
 8b2:	ccd6061b          	addw	a2,a2,-819 # ffffffffcccccccd <__global_pointer$+0xffffffffcccca4cd>
 8b6:	02061393          	sll	t2,a2,0x20
 8ba:	48a9                	li	a7,10
 8bc:	06300293          	li	t0,99
 8c0:	a801                	j	8d0 <func0+0x2c>
 8c2:	00c72633          	slt	a2,a4,a2
 8c6:	0e05                	add	t3,t3,1
 8c8:	00c3033b          	addw	t1,t1,a2
 8cc:	02be0c63          	beq	t3,a1,904 <func0+0x60>
 8d0:	002e1613          	sll	a2,t3,0x2
 8d4:	962a                	add	a2,a2,a0
 8d6:	421c                	lw	a5,0(a2)
 8d8:	4605                	li	a2,1
 8da:	fef046e3          	bgtz	a5,8c6 <func0+0x22>
 8de:	40f0073b          	negw	a4,a5
 8e2:	4601                	li	a2,0
 8e4:	fcf84fe3          	blt	a6,a5,8c2 <func0+0x1e>
 8e8:	87ba                	mv	a5,a4
 8ea:	1702                	sll	a4,a4,0x20
 8ec:	02773733          	mulhu	a4,a4,t2
 8f0:	930d                	srl	a4,a4,0x23
 8f2:	031706bb          	mulw	a3,a4,a7
 8f6:	40d786bb          	subw	a3,a5,a3
 8fa:	9e35                	addw	a2,a2,a3
 8fc:	fef2e6e3          	bltu	t0,a5,8e8 <func0+0x44>
 900:	b7c9                	j	8c2 <func0+0x1e>
 902:	4301                	li	t1,0
 904:	851a                	mv	a0,t1
 906:	8082                	ret
