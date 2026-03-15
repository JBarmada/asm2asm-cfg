0000000000001570 <func0>:
    1570:	55                   	push   %rbp
    1571:	41 57                	push   %r15
    1573:	41 56                	push   %r14
    1575:	41 55                	push   %r13
    1577:	41 54                	push   %r12
    1579:	53                   	push   %rbx
    157a:	48 83 ec 18          	sub    $0x18,%rsp
    157e:	41 89 f6             	mov    %esi,%r14d
    1581:	48 89 fb             	mov    %rdi,%rbx
    1584:	4c 63 fe             	movslq %esi,%r15
    1587:	4a 8d 3c bd 00 00 00 	lea    0x0(,%r15,4),%rdi
    158e:	00 
    158f:	e8 dc fa ff ff       	call   1070 <malloc@plt>
    1594:	48 89 c5             	mov    %rax,%rbp
    1597:	45 85 ff             	test   %r15d,%r15d
    159a:	0f 8e 2b 02 00 00    	jle    17cb <func0+0x25b>
    15a0:	45 89 f5             	mov    %r14d,%r13d
    15a3:	4c 8d 64 24 0c       	lea    0xc(%rsp),%r12
    15a8:	45 31 ff             	xor    %r15d,%r15d
    15ab:	eb 2c                	jmp    15d9 <func0+0x69>
    15ad:	0f 1f 00             	nopl   (%rax)
    15b0:	0f be 44 24 0c       	movsbl 0xc(%rsp),%eax
    15b5:	89 d1                	mov    %edx,%ecx
    15b7:	29 c1                	sub    %eax,%ecx
    15b9:	83 c1 30             	add    $0x30,%ecx
    15bc:	42 83 3c bb 00       	cmpl   $0x0,(%rbx,%r15,4)
    15c1:	8d 44 02 d0          	lea    -0x30(%rdx,%rax,1),%eax
    15c5:	0f 4e c1             	cmovle %ecx,%eax
    15c8:	42 89 44 bd 00       	mov    %eax,0x0(%rbp,%r15,4)
    15cd:	49 ff c7             	inc    %r15
    15d0:	4d 39 ef             	cmp    %r13,%r15
    15d3:	0f 84 93 01 00 00    	je     176c <func0+0x1fc>
    15d9:	42 8b 04 bb          	mov    (%rbx,%r15,4),%eax
    15dd:	89 c2                	mov    %eax,%edx
    15df:	f7 da                	neg    %edx
    15e1:	0f 48 d0             	cmovs  %eax,%edx
    15e4:	4c 89 e7             	mov    %r12,%rdi
    15e7:	48 8d 35 12 0c 00 00 	lea    0xc12(%rip),%rsi        # 2200 <_IO_stdin_used+0x200>
    15ee:	31 c0                	xor    %eax,%eax
    15f0:	e8 8b fa ff ff       	call   1080 <sprintf@plt>
    15f5:	4c 89 e7             	mov    %r12,%rdi
    15f8:	e8 53 fa ff ff       	call   1050 <strlen@plt>
    15fd:	ba 00 00 00 00       	mov    $0x0,%edx
    1602:	83 f8 02             	cmp    $0x2,%eax
    1605:	7c a9                	jl     15b0 <func0+0x40>
    1607:	89 c0                	mov    %eax,%eax
    1609:	4c 8d 40 ff          	lea    -0x1(%rax),%r8
    160d:	49 83 f8 08          	cmp    $0x8,%r8
    1611:	73 0d                	jae    1620 <func0+0xb0>
    1613:	31 d2                	xor    %edx,%edx
    1615:	b9 01 00 00 00       	mov    $0x1,%ecx
    161a:	e9 21 01 00 00       	jmp    1740 <func0+0x1d0>
    161f:	90                   	nop
    1620:	4c 89 c1             	mov    %r8,%rcx
    1623:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    1627:	48 8d 71 f8          	lea    -0x8(%rcx),%rsi
    162b:	48 89 f2             	mov    %rsi,%rdx
    162e:	48 c1 ea 03          	shr    $0x3,%rdx
    1632:	48 ff c2             	inc    %rdx
    1635:	48 85 f6             	test   %rsi,%rsi
    1638:	66 0f 6f 25 a0 0b 00 	movdqa 0xba0(%rip),%xmm4        # 21e0 <_IO_stdin_used+0x1e0>
    163f:	00 
    1640:	0f 84 11 01 00 00    	je     1757 <func0+0x1e7>
    1646:	48 89 d6             	mov    %rdx,%rsi
    1649:	48 83 e6 fe          	and    $0xfffffffffffffffe,%rsi
    164d:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1651:	31 ff                	xor    %edi,%edi
    1653:	66 0f ef c9          	pxor   %xmm1,%xmm1
    1657:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    165e:	00 00 
    1660:	66 0f 6e 54 3c 0d    	movd   0xd(%rsp,%rdi,1),%xmm2
    1666:	66 0f 60 d2          	punpcklbw %xmm2,%xmm2
    166a:	66 0f 61 d2          	punpcklwd %xmm2,%xmm2
    166e:	66 0f 6e 5c 3c 11    	movd   0x11(%rsp,%rdi,1),%xmm3
    1674:	66 0f 60 db          	punpcklbw %xmm3,%xmm3
    1678:	66 0f 61 db          	punpcklwd %xmm3,%xmm3
    167c:	66 0f 72 e2 18       	psrad  $0x18,%xmm2
    1681:	66 0f fe d0          	paddd  %xmm0,%xmm2
    1685:	66 0f 72 e3 18       	psrad  $0x18,%xmm3
    168a:	66 0f fe d9          	paddd  %xmm1,%xmm3
    168e:	66 0f 6e 44 3c 15    	movd   0x15(%rsp,%rdi,1),%xmm0
    1694:	66 0f 60 c0          	punpcklbw %xmm0,%xmm0
    1698:	66 0f 61 c0          	punpcklwd %xmm0,%xmm0
    169c:	66 0f 72 e0 18       	psrad  $0x18,%xmm0
    16a1:	66 0f 6e 4c 3c 19    	movd   0x19(%rsp,%rdi,1),%xmm1
    16a7:	66 0f 60 c9          	punpcklbw %xmm1,%xmm1
    16ab:	66 0f 61 c9          	punpcklwd %xmm1,%xmm1
    16af:	66 0f 72 e1 18       	psrad  $0x18,%xmm1
    16b4:	66 0f fe c4          	paddd  %xmm4,%xmm0
    16b8:	66 0f fe c2          	paddd  %xmm2,%xmm0
    16bc:	66 0f fe cc          	paddd  %xmm4,%xmm1
    16c0:	66 0f fe cb          	paddd  %xmm3,%xmm1
    16c4:	48 83 c7 10          	add    $0x10,%rdi
    16c8:	48 83 c6 fe          	add    $0xfffffffffffffffe,%rsi
    16cc:	75 92                	jne    1660 <func0+0xf0>
    16ce:	f6 c2 01             	test   $0x1,%dl
    16d1:	74 42                	je     1715 <func0+0x1a5>
    16d3:	48 83 cf 01          	or     $0x1,%rdi
    16d7:	66 0f 6e 54 3c 0c    	movd   0xc(%rsp,%rdi,1),%xmm2
    16dd:	66 0f 60 d2          	punpcklbw %xmm2,%xmm2
    16e1:	66 0f 61 d2          	punpcklwd %xmm2,%xmm2
    16e5:	66 0f 6e 5c 3c 10    	movd   0x10(%rsp,%rdi,1),%xmm3
    16eb:	66 0f 60 db          	punpcklbw %xmm3,%xmm3
    16ef:	66 0f 61 db          	punpcklwd %xmm3,%xmm3
    16f3:	66 0f 72 e2 18       	psrad  $0x18,%xmm2
    16f8:	66 0f fe c2          	paddd  %xmm2,%xmm0
    16fc:	66 0f 72 e3 18       	psrad  $0x18,%xmm3
    1701:	66 0f fe cb          	paddd  %xmm3,%xmm1
    1705:	66 0f 6f 15 e3 0a 00 	movdqa 0xae3(%rip),%xmm2        # 21f0 <_IO_stdin_used+0x1f0>
    170c:	00 
    170d:	66 0f fe c2          	paddd  %xmm2,%xmm0
    1711:	66 0f fe ca          	paddd  %xmm2,%xmm1
    1715:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1719:	66 0f 70 c8 ee       	pshufd $0xee,%xmm0,%xmm1
    171e:	66 0f fe c8          	paddd  %xmm0,%xmm1
    1722:	66 0f 70 c1 55       	pshufd $0x55,%xmm1,%xmm0
    1727:	66 0f fe c1          	paddd  %xmm1,%xmm0
    172b:	66 0f 7e c2          	movd   %xmm0,%edx
    172f:	49 39 c8             	cmp    %rcx,%r8
    1732:	0f 84 78 fe ff ff    	je     15b0 <func0+0x40>
    1738:	48 83 c9 01          	or     $0x1,%rcx
    173c:	0f 1f 40 00          	nopl   0x0(%rax)
    1740:	0f be 74 0c 0c       	movsbl 0xc(%rsp,%rcx,1),%esi
    1745:	01 f2                	add    %esi,%edx
    1747:	83 c2 d0             	add    $0xffffffd0,%edx
    174a:	48 ff c1             	inc    %rcx
    174d:	48 39 c8             	cmp    %rcx,%rax
    1750:	75 ee                	jne    1740 <func0+0x1d0>
    1752:	e9 59 fe ff ff       	jmp    15b0 <func0+0x40>
    1757:	66 0f ef c0          	pxor   %xmm0,%xmm0
    175b:	31 ff                	xor    %edi,%edi
    175d:	66 0f ef c9          	pxor   %xmm1,%xmm1
    1761:	f6 c2 01             	test   $0x1,%dl
    1764:	0f 85 69 ff ff ff    	jne    16d3 <func0+0x163>
    176a:	eb a9                	jmp    1715 <func0+0x1a5>
    176c:	45 85 f6             	test   %r14d,%r14d
    176f:	7e 5a                	jle    17cb <func0+0x25b>
    1771:	49 ff cd             	dec    %r13
    1774:	31 c0                	xor    %eax,%eax
    1776:	eb 0f                	jmp    1787 <func0+0x217>
    1778:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    177f:	00 
    1780:	ff c0                	inc    %eax
    1782:	44 39 f0             	cmp    %r14d,%eax
    1785:	74 44                	je     17cb <func0+0x25b>
    1787:	41 83 fe 01          	cmp    $0x1,%r14d
    178b:	74 f3                	je     1780 <func0+0x210>
    178d:	8b 4d 00             	mov    0x0(%rbp),%ecx
    1790:	31 d2                	xor    %edx,%edx
    1792:	eb 2b                	jmp    17bf <func0+0x24f>
    1794:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    179b:	00 00 00 00 00 
    17a0:	89 4c 95 04          	mov    %ecx,0x4(%rbp,%rdx,4)
    17a4:	89 74 95 00          	mov    %esi,0x0(%rbp,%rdx,4)
    17a8:	f3 0f 7e 04 93       	movq   (%rbx,%rdx,4),%xmm0
    17ad:	66 0f 70 c0 e1       	pshufd $0xe1,%xmm0,%xmm0
    17b2:	66 0f d6 04 93       	movq   %xmm0,(%rbx,%rdx,4)
    17b7:	48 ff c2             	inc    %rdx
    17ba:	49 39 d5             	cmp    %rdx,%r13
    17bd:	74 c1                	je     1780 <func0+0x210>
    17bf:	8b 74 95 04          	mov    0x4(%rbp,%rdx,4),%esi
    17c3:	39 f1                	cmp    %esi,%ecx
    17c5:	7f d9                	jg     17a0 <func0+0x230>
    17c7:	89 f1                	mov    %esi,%ecx
    17c9:	eb ec                	jmp    17b7 <func0+0x247>
    17cb:	48 89 ef             	mov    %rbp,%rdi
    17ce:	e8 5d f8 ff ff       	call   1030 <free@plt>
    17d3:	48 89 d8             	mov    %rbx,%rax
    17d6:	48 83 c4 18          	add    $0x18,%rsp
    17da:	5b                   	pop    %rbx
    17db:	41 5c                	pop    %r12
    17dd:	41 5d                	pop    %r13
    17df:	41 5e                	pop    %r14
    17e1:	41 5f                	pop    %r15
    17e3:	5d                   	pop    %rbp
    17e4:	c3                   	ret    

