00000000000008dc <func0>:
 8dc:	04b05463          	blez	a1,924 <func0+0x48>
 8e0:	4881                	li	a7,0
 8e2:	00450293          	add	t0,a0,4
 8e6:	4305                	li	t1,1
 8e8:	4805                	li	a6,1
 8ea:	a039                	j	8f8 <func0+0x1c>
 8ec:	00b8b833          	sltu	a6,a7,a1
 8f0:	0305                	add	t1,t1,1
 8f2:	0291                	add	t0,t0,4
 8f4:	02b88563          	beq	a7,a1,91e <func0+0x42>
 8f8:	8646                	mv	a2,a7
 8fa:	0885                	add	a7,a7,1
 8fc:	feb8f8e3          	bgeu	a7,a1,8ec <func0+0x10>
 900:	060a                	sll	a2,a2,0x2
 902:	962a                	add	a2,a2,a0
 904:	4210                	lw	a2,0(a2)
 906:	87ae                	mv	a5,a1
 908:	8696                	mv	a3,t0
 90a:	4298                	lw	a4,0(a3)
 90c:	40e0073b          	negw	a4,a4
 910:	00e60763          	beq	a2,a4,91e <func0+0x42>
 914:	17fd                	add	a5,a5,-1
 916:	0691                	add	a3,a3,4
 918:	fef319e3          	bne	t1,a5,90a <func0+0x2e>
 91c:	bfc1                	j	8ec <func0+0x10>
 91e:	00187513          	and	a0,a6,1
 922:	8082                	ret
 924:	00107513          	and	a0,zero,1
 928:	8082                	ret
