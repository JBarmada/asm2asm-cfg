00000000000013a0 <func0>:
    13a0:	41 56                	push   %r14
    13a2:	53                   	push   %rbx
    13a3:	31 c0                	xor    %eax,%eax
    13a5:	83 fe 02             	cmp    $0x2,%esi
    13a8:	0f 8c 3d 01 00 00    	jl     14eb <func0+0x14b>
    13ae:	41 89 f0             	mov    %esi,%r8d
    13b1:	41 d1 e8             	shr    %r8d
    13b4:	83 fe 18             	cmp    $0x18,%esi
    13b7:	73 7e                	jae    1437 <func0+0x97>
    13b9:	45 31 f6             	xor    %r14d,%r14d
    13bc:	31 c0                	xor    %eax,%eax
    13be:	4d 89 f2             	mov    %r14,%r10
    13c1:	49 f7 d2             	not    %r10
    13c4:	41 f6 c0 01          	test   $0x1,%r8b
    13c8:	74 1d                	je     13e7 <func0+0x47>
    13ca:	46 8b 0c b7          	mov    (%rdi,%r14,4),%r9d
    13ce:	44 89 f1             	mov    %r14d,%ecx
    13d1:	f7 d1                	not    %ecx
    13d3:	01 f1                	add    %esi,%ecx
    13d5:	4c 63 d9             	movslq %ecx,%r11
    13d8:	31 c9                	xor    %ecx,%ecx
    13da:	46 3b 0c 9f          	cmp    (%rdi,%r11,4),%r9d
    13de:	0f 95 c1             	setne  %cl
    13e1:	01 c8                	add    %ecx,%eax
    13e3:	49 83 ce 01          	or     $0x1,%r14
    13e7:	4d 01 c2             	add    %r8,%r10
    13ea:	0f 84 fb 00 00 00    	je     14eb <func0+0x14b>
    13f0:	44 89 f1             	mov    %r14d,%ecx
    13f3:	f7 d1                	not    %ecx
    13f5:	01 f1                	add    %esi,%ecx
    13f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    13fe:	00 00 
    1400:	48 63 c9             	movslq %ecx,%rcx
    1403:	42 8b 34 b7          	mov    (%rdi,%r14,4),%esi
    1407:	42 8b 54 b7 04       	mov    0x4(%rdi,%r14,4),%edx
    140c:	31 db                	xor    %ebx,%ebx
    140e:	3b 34 8f             	cmp    (%rdi,%rcx,4),%esi
    1411:	0f 95 c3             	setne  %bl
    1414:	01 c3                	add    %eax,%ebx
    1416:	8d 41 ff             	lea    -0x1(%rcx),%eax
    1419:	48 63 f0             	movslq %eax,%rsi
    141c:	31 c0                	xor    %eax,%eax
    141e:	3b 14 b7             	cmp    (%rdi,%rsi,4),%edx
    1421:	0f 95 c0             	setne  %al
    1424:	01 d8                	add    %ebx,%eax
    1426:	49 83 c6 02          	add    $0x2,%r14
    142a:	83 c1 fe             	add    $0xfffffffe,%ecx
    142d:	4d 39 f0             	cmp    %r14,%r8
    1430:	75 ce                	jne    1400 <func0+0x60>
    1432:	e9 b4 00 00 00       	jmp    14eb <func0+0x14b>
    1437:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
    143b:	8d 4e ff             	lea    -0x1(%rsi),%ecx
    143e:	89 c8                	mov    %ecx,%eax
    1440:	44 29 c8             	sub    %r9d,%eax
    1443:	45 31 f6             	xor    %r14d,%r14d
    1446:	39 c8                	cmp    %ecx,%eax
    1448:	0f 8f 6e ff ff ff    	jg     13bc <func0+0x1c>
    144e:	49 c1 e9 20          	shr    $0x20,%r9
    1452:	b8 00 00 00 00       	mov    $0x0,%eax
    1457:	0f 85 61 ff ff ff    	jne    13be <func0+0x1e>
    145d:	45 89 c6             	mov    %r8d,%r14d
    1460:	41 83 e6 f8          	and    $0xfffffff8,%r14d
    1464:	41 89 f1             	mov    %esi,%r9d
    1467:	41 83 e1 f0          	and    $0xfffffff0,%r9d
    146b:	4d 01 c9             	add    %r9,%r9
    146e:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1472:	31 c0                	xor    %eax,%eax
    1474:	66 0f 76 d2          	pcmpeqd %xmm2,%xmm2
    1478:	66 0f ef c9          	pxor   %xmm1,%xmm1
    147c:	0f 1f 40 00          	nopl   0x0(%rax)
    1480:	f3 0f 6f 1c 07       	movdqu (%rdi,%rax,1),%xmm3
    1485:	f3 0f 6f 64 07 10    	movdqu 0x10(%rdi,%rax,1),%xmm4
    148b:	48 63 c9             	movslq %ecx,%rcx
    148e:	f3 0f 6f 6c 8f e4    	movdqu -0x1c(%rdi,%rcx,4),%xmm5
    1494:	f3 0f 6f 74 8f f4    	movdqu -0xc(%rdi,%rcx,4),%xmm6
    149a:	66 0f 70 f6 1b       	pshufd $0x1b,%xmm6,%xmm6
    149f:	66 0f 76 f3          	pcmpeqd %xmm3,%xmm6
    14a3:	66 0f fe c6          	paddd  %xmm6,%xmm0
    14a7:	66 0f 70 dd 1b       	pshufd $0x1b,%xmm5,%xmm3
    14ac:	66 0f 76 dc          	pcmpeqd %xmm4,%xmm3
    14b0:	66 0f fe cb          	paddd  %xmm3,%xmm1
    14b4:	66 0f fa c2          	psubd  %xmm2,%xmm0
    14b8:	66 0f fa ca          	psubd  %xmm2,%xmm1
    14bc:	48 83 c0 20          	add    $0x20,%rax
    14c0:	83 c1 f8             	add    $0xfffffff8,%ecx
    14c3:	49 39 c1             	cmp    %rax,%r9
    14c6:	75 b8                	jne    1480 <func0+0xe0>
    14c8:	66 0f fe c8          	paddd  %xmm0,%xmm1
    14cc:	66 0f 70 c1 ee       	pshufd $0xee,%xmm1,%xmm0
    14d1:	66 0f fe c1          	paddd  %xmm1,%xmm0
    14d5:	66 0f 70 c8 55       	pshufd $0x55,%xmm0,%xmm1
    14da:	66 0f fe c8          	paddd  %xmm0,%xmm1
    14de:	66 0f 7e c8          	movd   %xmm1,%eax
    14e2:	4d 39 c6             	cmp    %r8,%r14
    14e5:	0f 85 d3 fe ff ff    	jne    13be <func0+0x1e>
    14eb:	5b                   	pop    %rbx
    14ec:	41 5e                	pop    %r14
    14ee:	c3                   	ret    

