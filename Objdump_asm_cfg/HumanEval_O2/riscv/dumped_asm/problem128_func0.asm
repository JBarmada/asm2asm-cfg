00000000000008d4 <func0>:
 8d4:	00a64363          	blt	a2,a0,8da <func0+0x6>
 8d8:	8532                	mv	a0,a2
 8da:	00d5c363          	blt	a1,a3,8e0 <func0+0xc>
 8de:	85b6                	mv	a1,a3
 8e0:	9d89                	subw	a1,a1,a0
 8e2:	4609                	li	a2,2
 8e4:	00000517          	auipc	a0,0x0
 8e8:	03c50513          	add	a0,a0,60 # 920 <_IO_stdin_used+0x4>
 8ec:	00c5d363          	bge	a1,a2,8f2 <func0+0x1e>
 8f0:	8082                	ret
 8f2:	4691                	li	a3,4
 8f4:	00000617          	auipc	a2,0x0
 8f8:	09760613          	add	a2,a2,151 # 98b <_IO_stdin_used+0x6f>
 8fc:	00d5f463          	bgeu	a1,a3,904 <func0+0x30>
 900:	8532                	mv	a0,a2
 902:	8082                	ret
 904:	4689                	li	a3,2
 906:	02d5e73b          	remw	a4,a1,a3
 90a:	d37d                	beqz	a4,8f0 <func0+0x1c>
 90c:	2685                	addw	a3,a3,1
 90e:	02d6873b          	mulw	a4,a3,a3
 912:	fee5dae3          	bge	a1,a4,906 <func0+0x32>
 916:	8532                	mv	a0,a2
 918:	8082                	ret
