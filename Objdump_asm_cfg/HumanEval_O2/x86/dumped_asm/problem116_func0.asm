0000000000001510 <func0>:
    1510:	55                   	push   %rbp
    1511:	41 57                	push   %r15
    1513:	41 56                	push   %r14
    1515:	41 55                	push   %r13
    1517:	41 54                	push   %r12
    1519:	53                   	push   %rbx
    151a:	85 f6                	test   %esi,%esi
    151c:	0f 8e 80 01 00 00    	jle    16a2 <func0+0x192>
    1522:	41 89 d0             	mov    %edx,%r8d
    1525:	8d 41 ff             	lea    -0x1(%rcx),%eax
    1528:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
    152c:	41 89 f3             	mov    %esi,%r11d
    152f:	89 d6                	mov    %edx,%esi
    1531:	41 89 f5             	mov    %esi,%r13d
    1534:	41 83 e5 f8          	and    $0xfffffff8,%r13d
    1538:	4d 8d 4d f8          	lea    -0x8(%r13),%r9
    153c:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
    1541:	49 c1 e9 03          	shr    $0x3,%r9
    1545:	49 ff c1             	inc    %r9
    1548:	45 89 ce             	mov    %r9d,%r14d
    154b:	41 83 e6 03          	and    $0x3,%r14d
    154f:	49 83 e1 fc          	and    $0xfffffffffffffffc,%r9
    1553:	4d 89 f4             	mov    %r14,%r12
    1556:	49 c1 e4 05          	shl    $0x5,%r12
    155a:	31 ed                	xor    %ebp,%ebp
    155c:	45 31 d2             	xor    %r10d,%r10d
    155f:	eb 1b                	jmp    157c <func0+0x6c>
    1561:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1568:	0f 1f 84 00 00 00 00 
    156f:	00 
    1570:	48 ff c5             	inc    %rbp
    1573:	4c 39 dd             	cmp    %r11,%rbp
    1576:	0f 84 29 01 00 00    	je     16a5 <func0+0x195>
    157c:	45 85 c0             	test   %r8d,%r8d
    157f:	7e ef                	jle    1570 <func0+0x60>
    1581:	48 8b 14 ef          	mov    (%rdi,%rbp,8),%rdx
    1585:	41 83 f8 08          	cmp    $0x8,%r8d
    1589:	73 15                	jae    15a0 <func0+0x90>
    158b:	31 db                	xor    %ebx,%ebx
    158d:	31 c0                	xor    %eax,%eax
    158f:	e9 ec 00 00 00       	jmp    1680 <func0+0x170>
    1594:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    159b:	00 00 00 00 00 
    15a0:	48 83 7c 24 f8 18    	cmpq   $0x18,-0x8(%rsp)
    15a6:	73 0c                	jae    15b4 <func0+0xa4>
    15a8:	66 0f ef c0          	pxor   %xmm0,%xmm0
    15ac:	31 c0                	xor    %eax,%eax
    15ae:	66 0f ef c9          	pxor   %xmm1,%xmm1
    15b2:	eb 75                	jmp    1629 <func0+0x119>
    15b4:	66 0f ef c0          	pxor   %xmm0,%xmm0
    15b8:	4d 89 cf             	mov    %r9,%r15
    15bb:	31 c0                	xor    %eax,%eax
    15bd:	66 0f ef c9          	pxor   %xmm1,%xmm1
    15c1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    15c8:	0f 1f 84 00 00 00 00 
    15cf:	00 
    15d0:	f3 0f 6f 14 82       	movdqu (%rdx,%rax,4),%xmm2
    15d5:	66 0f fe d0          	paddd  %xmm0,%xmm2
    15d9:	f3 0f 6f 44 82 10    	movdqu 0x10(%rdx,%rax,4),%xmm0
    15df:	66 0f fe c1          	paddd  %xmm1,%xmm0
    15e3:	f3 0f 6f 4c 82 20    	movdqu 0x20(%rdx,%rax,4),%xmm1
    15e9:	f3 0f 6f 5c 82 30    	movdqu 0x30(%rdx,%rax,4),%xmm3
    15ef:	f3 0f 6f 64 82 40    	movdqu 0x40(%rdx,%rax,4),%xmm4
    15f5:	66 0f fe e1          	paddd  %xmm1,%xmm4
    15f9:	66 0f fe e2          	paddd  %xmm2,%xmm4
    15fd:	f3 0f 6f 54 82 50    	movdqu 0x50(%rdx,%rax,4),%xmm2
    1603:	66 0f fe d3          	paddd  %xmm3,%xmm2
    1607:	66 0f fe d0          	paddd  %xmm0,%xmm2
    160b:	f3 0f 6f 44 82 60    	movdqu 0x60(%rdx,%rax,4),%xmm0
    1611:	66 0f fe c4          	paddd  %xmm4,%xmm0
    1615:	f3 0f 6f 4c 82 70    	movdqu 0x70(%rdx,%rax,4),%xmm1
    161b:	66 0f fe ca          	paddd  %xmm2,%xmm1
    161f:	48 83 c0 20          	add    $0x20,%rax
    1623:	49 83 c7 fc          	add    $0xfffffffffffffffc,%r15
    1627:	75 a7                	jne    15d0 <func0+0xc0>
    1629:	4d 85 f6             	test   %r14,%r14
    162c:	74 2e                	je     165c <func0+0x14c>
    162e:	48 8d 04 82          	lea    (%rdx,%rax,4),%rax
    1632:	48 83 c0 10          	add    $0x10,%rax
    1636:	31 db                	xor    %ebx,%ebx
    1638:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    163f:	00 
    1640:	f3 0f 6f 54 18 f0    	movdqu -0x10(%rax,%rbx,1),%xmm2
    1646:	66 0f fe c2          	paddd  %xmm2,%xmm0
    164a:	f3 0f 6f 14 18       	movdqu (%rax,%rbx,1),%xmm2
    164f:	66 0f fe ca          	paddd  %xmm2,%xmm1
    1653:	48 83 c3 20          	add    $0x20,%rbx
    1657:	49 39 dc             	cmp    %rbx,%r12
    165a:	75 e4                	jne    1640 <func0+0x130>
    165c:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1660:	66 0f 70 c8 ee       	pshufd $0xee,%xmm0,%xmm1
    1665:	66 0f fe c8          	paddd  %xmm0,%xmm1
    1669:	66 0f 70 c1 55       	pshufd $0x55,%xmm1,%xmm0
    166e:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1672:	66 0f 7e c0          	movd   %xmm0,%eax
    1676:	4c 89 eb             	mov    %r13,%rbx
    1679:	49 39 f5             	cmp    %rsi,%r13
    167c:	74 0d                	je     168b <func0+0x17b>
    167e:	66 90                	xchg   %ax,%ax
    1680:	03 04 9a             	add    (%rdx,%rbx,4),%eax
    1683:	48 ff c3             	inc    %rbx
    1686:	48 39 de             	cmp    %rbx,%rsi
    1689:	75 f5                	jne    1680 <func0+0x170>
    168b:	85 c0                	test   %eax,%eax
    168d:	0f 8e dd fe ff ff    	jle    1570 <func0+0x60>
    1693:	03 44 24 f4          	add    -0xc(%rsp),%eax
    1697:	99                   	cltd   
    1698:	f7 f9                	idiv   %ecx
    169a:	41 01 c2             	add    %eax,%r10d
    169d:	e9 ce fe ff ff       	jmp    1570 <func0+0x60>
    16a2:	45 31 d2             	xor    %r10d,%r10d
    16a5:	44 89 d0             	mov    %r10d,%eax
    16a8:	5b                   	pop    %rbx
    16a9:	41 5c                	pop    %r12
    16ab:	41 5d                	pop    %r13
    16ad:	41 5e                	pop    %r14
    16af:	41 5f                	pop    %r15
    16b1:	5d                   	pop    %rbp
    16b2:	c3                   	ret    

