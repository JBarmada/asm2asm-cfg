00000000000014d0 <func0>:
    14d0:	41 57                	push   %r15
    14d2:	41 56                	push   %r14
    14d4:	41 55                	push   %r13
    14d6:	41 54                	push   %r12
    14d8:	53                   	push   %rbx
    14d9:	49 89 d6             	mov    %rdx,%r14
    14dc:	41 89 f7             	mov    %esi,%r15d
    14df:	49 89 fc             	mov    %rdi,%r12
    14e2:	48 63 de             	movslq %esi,%rbx
    14e5:	48 69 c3 56 55 55 55 	imul   $0x55555556,%rbx,%rax
    14ec:	48 89 c1             	mov    %rax,%rcx
    14ef:	48 c1 e9 3f          	shr    $0x3f,%rcx
    14f3:	48 c1 e8 20          	shr    $0x20,%rax
    14f7:	01 c8                	add    %ecx,%eax
    14f9:	48 98                	cltq   
    14fb:	48 8d 3c 85 04 00 00 	lea    0x4(,%rax,4),%rdi
    1502:	00 
    1503:	e8 58 fb ff ff       	call   1060 <malloc@plt>
    1508:	85 db                	test   %ebx,%ebx
    150a:	0f 8e 79 01 00 00    	jle    1689 <func0+0x1b9>
    1510:	41 8d 77 ff          	lea    -0x1(%r15),%esi
    1514:	b9 ab aa aa aa       	mov    $0xaaaaaaab,%ecx
    1519:	48 0f af ce          	imul   %rsi,%rcx
    151d:	48 c1 e9 21          	shr    $0x21,%rcx
    1521:	8d 51 01             	lea    0x1(%rcx),%edx
    1524:	83 fe 17             	cmp    $0x17,%esi
    1527:	77 07                	ja     1530 <func0+0x60>
    1529:	31 f6                	xor    %esi,%esi
    152b:	45 31 c0             	xor    %r8d,%r8d
    152e:	eb 6f                	jmp    159f <func0+0xcf>
    1530:	89 d6                	mov    %edx,%esi
    1532:	83 e6 07             	and    $0x7,%esi
    1535:	bf 08 00 00 00       	mov    $0x8,%edi
    153a:	48 0f 45 fe          	cmovne %rsi,%rdi
    153e:	48 89 d6             	mov    %rdx,%rsi
    1541:	48 29 fe             	sub    %rdi,%rsi
    1544:	4c 8d 04 76          	lea    (%rsi,%rsi,2),%r8
    1548:	31 ff                	xor    %edi,%edi
    154a:	4c 89 e3             	mov    %r12,%rbx
    154d:	0f 1f 00             	nopl   (%rax)
    1550:	f3 0f 10 43 24       	movss  0x24(%rbx),%xmm0
    1555:	f3 0f 10 4b 18       	movss  0x18(%rbx),%xmm1
    155a:	0f 14 c8             	unpcklps %xmm0,%xmm1
    155d:	f3 0f 10 43 0c       	movss  0xc(%rbx),%xmm0
    1562:	f3 0f 10 13          	movss  (%rbx),%xmm2
    1566:	0f 14 d0             	unpcklps %xmm0,%xmm2
    1569:	0f 16 d1             	movlhps %xmm1,%xmm2
    156c:	f3 0f 10 43 54       	movss  0x54(%rbx),%xmm0
    1571:	f3 0f 10 4b 48       	movss  0x48(%rbx),%xmm1
    1576:	0f 14 c8             	unpcklps %xmm0,%xmm1
    1579:	f3 0f 10 43 3c       	movss  0x3c(%rbx),%xmm0
    157e:	f3 0f 10 5b 30       	movss  0x30(%rbx),%xmm3
    1583:	0f 14 d8             	unpcklps %xmm0,%xmm3
    1586:	0f 16 d9             	movlhps %xmm1,%xmm3
    1589:	0f 11 14 b8          	movups %xmm2,(%rax,%rdi,4)
    158d:	0f 11 5c b8 10       	movups %xmm3,0x10(%rax,%rdi,4)
    1592:	48 83 c7 08          	add    $0x8,%rdi
    1596:	48 83 c3 60          	add    $0x60,%rbx
    159a:	48 39 fe             	cmp    %rdi,%rsi
    159d:	75 b1                	jne    1550 <func0+0x80>
    159f:	4b 8d 3c 84          	lea    (%r12,%r8,4),%rdi
    15a3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    15aa:	84 00 00 00 00 00 
    15b0:	8b 1f                	mov    (%rdi),%ebx
    15b2:	89 1c b0             	mov    %ebx,(%rax,%rsi,4)
    15b5:	48 ff c6             	inc    %rsi
    15b8:	48 83 c7 0c          	add    $0xc,%rdi
    15bc:	48 39 f2             	cmp    %rsi,%rdx
    15bf:	75 ef                	jne    15b0 <func0+0xe0>
    15c1:	85 c9                	test   %ecx,%ecx
    15c3:	0f 8e 81 00 00 00    	jle    164a <func0+0x17a>
    15c9:	41 89 c8             	mov    %ecx,%r8d
    15cc:	4d 89 c5             	mov    %r8,%r13
    15cf:	49 f7 dd             	neg    %r13
    15d2:	41 bb 01 00 00 00    	mov    $0x1,%r11d
    15d8:	45 31 c9             	xor    %r9d,%r9d
    15db:	eb 0b                	jmp    15e8 <func0+0x118>
    15dd:	0f 1f 00             	nopl   (%rax)
    15e0:	49 ff c3             	inc    %r11
    15e3:	4d 39 c1             	cmp    %r8,%r9
    15e6:	74 62                	je     164a <func0+0x17a>
    15e8:	4d 89 ca             	mov    %r9,%r10
    15eb:	49 ff c1             	inc    %r9
    15ee:	4c 89 de             	mov    %r11,%rsi
    15f1:	44 89 d1             	mov    %r10d,%ecx
    15f4:	eb 1c                	jmp    1612 <func0+0x142>
    15f6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    15fd:	00 00 00 
    1600:	4a 8d 14 2e          	lea    (%rsi,%r13,1),%rdx
    1604:	48 ff c2             	inc    %rdx
    1607:	48 ff c6             	inc    %rsi
    160a:	89 f9                	mov    %edi,%ecx
    160c:	48 83 fa 01          	cmp    $0x1,%rdx
    1610:	74 1e                	je     1630 <func0+0x160>
    1612:	8b 1c b0             	mov    (%rax,%rsi,4),%ebx
    1615:	48 63 d1             	movslq %ecx,%rdx
    1618:	89 f7                	mov    %esi,%edi
    161a:	3b 1c 90             	cmp    (%rax,%rdx,4),%ebx
    161d:	7c e1                	jl     1600 <func0+0x130>
    161f:	89 cf                	mov    %ecx,%edi
    1621:	eb dd                	jmp    1600 <func0+0x130>
    1623:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    162a:	84 00 00 00 00 00 
    1630:	89 f9                	mov    %edi,%ecx
    1632:	49 39 ca             	cmp    %rcx,%r10
    1635:	74 a9                	je     15e0 <func0+0x110>
    1637:	42 8b 0c 90          	mov    (%rax,%r10,4),%ecx
    163b:	48 63 d7             	movslq %edi,%rdx
    163e:	8b 34 90             	mov    (%rax,%rdx,4),%esi
    1641:	42 89 34 90          	mov    %esi,(%rax,%r10,4)
    1645:	89 0c 90             	mov    %ecx,(%rax,%rdx,4)
    1648:	eb 96                	jmp    15e0 <func0+0x110>
    164a:	45 85 ff             	test   %r15d,%r15d
    164d:	7e 3a                	jle    1689 <func0+0x1b9>
    164f:	44 89 f9             	mov    %r15d,%ecx
    1652:	31 d2                	xor    %edx,%edx
    1654:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
    1659:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1660:	89 d7                	mov    %edx,%edi
    1662:	48 0f af fe          	imul   %rsi,%rdi
    1666:	48 c1 ef 21          	shr    $0x21,%rdi
    166a:	8d 1c 7f             	lea    (%rdi,%rdi,2),%ebx
    166d:	39 da                	cmp    %ebx,%edx
    166f:	48 8d 3c b8          	lea    (%rax,%rdi,4),%rdi
    1673:	49 0f 45 fc          	cmovne %r12,%rdi
    1677:	8b 3f                	mov    (%rdi),%edi
    1679:	41 89 3c 96          	mov    %edi,(%r14,%rdx,4)
    167d:	48 ff c2             	inc    %rdx
    1680:	49 83 c4 04          	add    $0x4,%r12
    1684:	48 39 d1             	cmp    %rdx,%rcx
    1687:	75 d7                	jne    1660 <func0+0x190>
    1689:	48 89 c7             	mov    %rax,%rdi
    168c:	5b                   	pop    %rbx
    168d:	41 5c                	pop    %r12
    168f:	41 5d                	pop    %r13
    1691:	41 5e                	pop    %r14
    1693:	41 5f                	pop    %r15
    1695:	e9 96 f9 ff ff       	jmp    1030 <free@plt>

