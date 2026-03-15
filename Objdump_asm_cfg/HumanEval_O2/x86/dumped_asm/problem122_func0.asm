0000000000001340 <func0>:
    1340:	85 f6                	test   %esi,%esi
    1342:	7e 16                	jle    135a <func0+0x1a>
    1344:	ff ce                	dec    %esi
    1346:	45 31 c9             	xor    %r9d,%r9d
    1349:	83 fe 10             	cmp    $0x10,%esi
    134c:	73 0f                	jae    135d <func0+0x1d>
    134e:	31 d2                	xor    %edx,%edx
    1350:	45 31 c0             	xor    %r8d,%r8d
    1353:	31 c0                	xor    %eax,%eax
    1355:	e9 a8 00 00 00       	jmp    1402 <func0+0xc2>
    135a:	31 c0                	xor    %eax,%eax
    135c:	c3                   	ret    
    135d:	89 f2                	mov    %esi,%edx
    135f:	d1 ea                	shr    %edx
    1361:	ff c2                	inc    %edx
    1363:	41 89 d0             	mov    %edx,%r8d
    1366:	41 83 e0 07          	and    $0x7,%r8d
    136a:	b8 08 00 00 00       	mov    $0x8,%eax
    136f:	49 0f 45 c0          	cmovne %r8,%rax
    1373:	48 29 c2             	sub    %rax,%rdx
    1376:	4c 8d 04 12          	lea    (%rdx,%rdx,1),%r8
    137a:	66 0f ef c0          	pxor   %xmm0,%xmm0
    137e:	31 c0                	xor    %eax,%eax
    1380:	0f 28 15 a9 0d 00 00 	movaps 0xda9(%rip),%xmm2        # 2130 <_IO_stdin_used+0x130>
    1387:	66 0f 6f 1d b1 0d 00 	movdqa 0xdb1(%rip),%xmm3        # 2140 <_IO_stdin_used+0x140>
    138e:	00 
    138f:	66 0f ef c9          	pxor   %xmm1,%xmm1
    1393:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    139a:	84 00 00 00 00 00 
    13a0:	0f 10 24 c7          	movups (%rdi,%rax,8),%xmm4
    13a4:	0f 10 6c c7 10       	movups 0x10(%rdi,%rax,8),%xmm5
    13a9:	0f c6 e5 88          	shufps $0x88,%xmm5,%xmm4
    13ad:	0f 10 6c c7 20       	movups 0x20(%rdi,%rax,8),%xmm5
    13b2:	0f 10 74 c7 30       	movups 0x30(%rdi,%rax,8),%xmm6
    13b7:	0f c6 ee 88          	shufps $0x88,%xmm6,%xmm5
    13bb:	0f 28 f4             	movaps %xmm4,%xmm6
    13be:	0f 54 f2             	andps  %xmm2,%xmm6
    13c1:	0f 28 fd             	movaps %xmm5,%xmm7
    13c4:	0f 54 fa             	andps  %xmm2,%xmm7
    13c7:	66 0f 76 f3          	pcmpeqd %xmm3,%xmm6
    13cb:	66 0f 76 fb          	pcmpeqd %xmm3,%xmm7
    13cf:	66 0f db f4          	pand   %xmm4,%xmm6
    13d3:	66 0f fe c6          	paddd  %xmm6,%xmm0
    13d7:	66 0f db fd          	pand   %xmm5,%xmm7
    13db:	66 0f fe cf          	paddd  %xmm7,%xmm1
    13df:	48 83 c0 08          	add    $0x8,%rax
    13e3:	48 39 c2             	cmp    %rax,%rdx
    13e6:	75 b8                	jne    13a0 <func0+0x60>
    13e8:	66 0f fe c8          	paddd  %xmm0,%xmm1
    13ec:	66 0f 70 c1 ee       	pshufd $0xee,%xmm1,%xmm0
    13f1:	66 0f fe c1          	paddd  %xmm1,%xmm0
    13f5:	66 0f 70 c8 55       	pshufd $0x55,%xmm0,%xmm1
    13fa:	66 0f fe c8          	paddd  %xmm0,%xmm1
    13fe:	66 0f 7e c8          	movd   %xmm1,%eax
    1402:	89 f6                	mov    %esi,%esi
    1404:	48 d1 ee             	shr    %rsi
    1407:	48 29 d6             	sub    %rdx,%rsi
    140a:	48 ff c6             	inc    %rsi
    140d:	4e 8d 04 87          	lea    (%rdi,%r8,4),%r8
    1411:	31 ff                	xor    %edi,%edi
    1413:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    141a:	84 00 00 00 00 00 
    1420:	41 8b 14 f8          	mov    (%r8,%rdi,8),%edx
    1424:	89 d1                	mov    %edx,%ecx
    1426:	81 e1 01 00 00 80    	and    $0x80000001,%ecx
    142c:	83 f9 01             	cmp    $0x1,%ecx
    142f:	41 0f 45 d1          	cmovne %r9d,%edx
    1433:	01 d0                	add    %edx,%eax
    1435:	48 ff c7             	inc    %rdi
    1438:	48 39 fe             	cmp    %rdi,%rsi
    143b:	75 e3                	jne    1420 <func0+0xe0>
    143d:	c3                   	ret    

