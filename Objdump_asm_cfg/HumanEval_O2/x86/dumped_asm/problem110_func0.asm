00000000000012a0 <func0>:
    12a0:	85 f6                	test   %esi,%esi
    12a2:	74 26                	je     12ca <func0+0x2a>
    12a4:	53                   	push   %rbx
    12a5:	83 fe 01             	cmp    $0x1,%esi
    12a8:	7e 23                	jle    12cd <func0+0x2d>
    12aa:	41 89 f2             	mov    %esi,%r10d
    12ad:	44 8b 07             	mov    (%rdi),%r8d
    12b0:	4d 8d 4a ff          	lea    -0x1(%r10),%r9
    12b4:	49 83 f9 08          	cmp    $0x8,%r9
    12b8:	73 1d                	jae    12d7 <func0+0x37>
    12ba:	31 db                	xor    %ebx,%ebx
    12bc:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    12c2:	44 89 c2             	mov    %r8d,%edx
    12c5:	e9 96 00 00 00       	jmp    1360 <func0+0xc0>
    12ca:	b0 01                	mov    $0x1,%al
    12cc:	c3                   	ret    
    12cd:	44 8b 07             	mov    (%rdi),%r8d
    12d0:	31 db                	xor    %ebx,%ebx
    12d2:	e9 a0 00 00 00       	jmp    1377 <func0+0xd7>
    12d7:	4c 89 c9             	mov    %r9,%rcx
    12da:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    12de:	4c 8d 59 01          	lea    0x1(%rcx),%r11
    12e2:	66 41 0f 6e c0       	movd   %r8d,%xmm0
    12e7:	66 0f 70 d0 00       	pshufd $0x0,%xmm0,%xmm2
    12ec:	66 0f ef c0          	pxor   %xmm0,%xmm0
    12f0:	31 c0                	xor    %eax,%eax
    12f2:	66 0f ef c9          	pxor   %xmm1,%xmm1
    12f6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    12fd:	00 00 00 
    1300:	0f 10 5c 87 04       	movups 0x4(%rdi,%rax,4),%xmm3
    1305:	0f c6 d3 03          	shufps $0x3,%xmm3,%xmm2
    1309:	0f c6 d3 98          	shufps $0x98,%xmm3,%xmm2
    130d:	66 0f 66 d3          	pcmpgtd %xmm3,%xmm2
    1311:	66 0f fa c2          	psubd  %xmm2,%xmm0
    1315:	0f 10 54 87 14       	movups 0x14(%rdi,%rax,4),%xmm2
    131a:	0f c6 da 03          	shufps $0x3,%xmm2,%xmm3
    131e:	0f c6 da 98          	shufps $0x98,%xmm2,%xmm3
    1322:	66 0f 66 da          	pcmpgtd %xmm2,%xmm3
    1326:	66 0f fa cb          	psubd  %xmm3,%xmm1
    132a:	48 83 c0 08          	add    $0x8,%rax
    132e:	48 39 c1             	cmp    %rax,%rcx
    1331:	75 cd                	jne    1300 <func0+0x60>
    1333:	66 0f fe c8          	paddd  %xmm0,%xmm1
    1337:	66 0f 70 c1 ee       	pshufd $0xee,%xmm1,%xmm0
    133c:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1340:	66 0f 70 c8 55       	pshufd $0x55,%xmm0,%xmm1
    1345:	66 0f fe c8          	paddd  %xmm0,%xmm1
    1349:	66 0f 7e cb          	movd   %xmm1,%ebx
    134d:	49 39 c9             	cmp    %rcx,%r9
    1350:	74 25                	je     1377 <func0+0xd7>
    1352:	66 0f 70 c2 ff       	pshufd $0xff,%xmm2,%xmm0
    1357:	66 0f 7e c2          	movd   %xmm0,%edx
    135b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1360:	42 8b 0c 9f          	mov    (%rdi,%r11,4),%ecx
    1364:	31 c0                	xor    %eax,%eax
    1366:	39 d1                	cmp    %edx,%ecx
    1368:	0f 9c c0             	setl   %al
    136b:	01 c3                	add    %eax,%ebx
    136d:	49 ff c3             	inc    %r11
    1370:	89 ca                	mov    %ecx,%edx
    1372:	4d 39 da             	cmp    %r11,%r10
    1375:	75 e9                	jne    1360 <func0+0xc0>
    1377:	48 63 ce             	movslq %esi,%rcx
    137a:	31 d2                	xor    %edx,%edx
    137c:	44 39 44 8f fc       	cmp    %r8d,-0x4(%rdi,%rcx,4)
    1381:	0f 9f c2             	setg   %dl
    1384:	01 da                	add    %ebx,%edx
    1386:	83 fa 02             	cmp    $0x2,%edx
    1389:	0f 92 c0             	setb   %al
    138c:	5b                   	pop    %rbx
    138d:	c3                   	ret    

