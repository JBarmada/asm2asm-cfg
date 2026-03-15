0000000000001650 <func0>:
    1650:	55                   	push   %rbp
    1651:	41 57                	push   %r15
    1653:	41 56                	push   %r14
    1655:	41 55                	push   %r13
    1657:	41 54                	push   %r12
    1659:	53                   	push   %rbx
    165a:	50                   	push   %rax
    165b:	41 89 d6             	mov    %edx,%r14d
    165e:	85 f6                	test   %esi,%esi
    1660:	0f 8e 0e 01 00 00    	jle    1774 <func0+0x124>
    1666:	41 89 f1             	mov    %esi,%r9d
    1669:	4d 8d 41 ff          	lea    -0x1(%r9),%r8
    166d:	45 89 ca             	mov    %r9d,%r10d
    1670:	41 83 e2 03          	and    $0x3,%r10d
    1674:	45 89 cb             	mov    %r9d,%r11d
    1677:	41 83 e3 fc          	and    $0xfffffffc,%r11d
    167b:	45 31 ff             	xor    %r15d,%r15d
    167e:	eb 0c                	jmp    168c <func0+0x3c>
    1680:	49 ff c7             	inc    %r15
    1683:	4d 39 cf             	cmp    %r9,%r15
    1686:	0f 84 8d 00 00 00    	je     1719 <func0+0xc9>
    168c:	4e 8b 24 ff          	mov    (%rdi,%r15,8),%r12
    1690:	31 ed                	xor    %ebp,%ebp
    1692:	49 83 f8 03          	cmp    $0x3,%r8
    1696:	72 51                	jb     16e9 <func0+0x99>
    1698:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    169f:	00 
    16a0:	8d 5d 01             	lea    0x1(%rbp),%ebx
    16a3:	41 83 3c ac 01       	cmpl   $0x1,(%r12,%rbp,4)
    16a8:	0f 44 c5             	cmove  %ebp,%eax
    16ab:	41 0f 44 d7          	cmove  %r15d,%edx
    16af:	41 83 7c ac 04 01    	cmpl   $0x1,0x4(%r12,%rbp,4)
    16b5:	0f 44 c3             	cmove  %ebx,%eax
    16b8:	41 0f 44 d7          	cmove  %r15d,%edx
    16bc:	41 83 7c ac 08 01    	cmpl   $0x1,0x8(%r12,%rbp,4)
    16c2:	44 8d 6d 02          	lea    0x2(%rbp),%r13d
    16c6:	89 c3                	mov    %eax,%ebx
    16c8:	41 0f 44 dd          	cmove  %r13d,%ebx
    16cc:	41 0f 44 d7          	cmove  %r15d,%edx
    16d0:	8d 45 03             	lea    0x3(%rbp),%eax
    16d3:	41 83 7c ac 0c 01    	cmpl   $0x1,0xc(%r12,%rbp,4)
    16d9:	41 0f 44 d7          	cmove  %r15d,%edx
    16dd:	0f 45 c3             	cmovne %ebx,%eax
    16e0:	48 83 c5 04          	add    $0x4,%rbp
    16e4:	4c 39 dd             	cmp    %r11,%rbp
    16e7:	75 b7                	jne    16a0 <func0+0x50>
    16e9:	4d 85 d2             	test   %r10,%r10
    16ec:	74 92                	je     1680 <func0+0x30>
    16ee:	4c 89 d3             	mov    %r10,%rbx
    16f1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    16f8:	0f 1f 84 00 00 00 00 
    16ff:	00 
    1700:	41 83 3c ac 01       	cmpl   $0x1,(%r12,%rbp,4)
    1705:	41 0f 44 d7          	cmove  %r15d,%edx
    1709:	0f 44 c5             	cmove  %ebp,%eax
    170c:	48 ff c5             	inc    %rbp
    170f:	48 ff cb             	dec    %rbx
    1712:	75 ec                	jne    1700 <func0+0xb0>
    1714:	e9 67 ff ff ff       	jmp    1680 <func0+0x30>
    1719:	89 f5                	mov    %esi,%ebp
    171b:	0f af ee             	imul   %esi,%ebp
    171e:	4c 63 c0             	movslq %eax,%r8
    1721:	85 d2                	test   %edx,%edx
    1723:	7e 10                	jle    1735 <func0+0xe5>
    1725:	8d 5a ff             	lea    -0x1(%rdx),%ebx
    1728:	48 8b 1c df          	mov    (%rdi,%rbx,8),%rbx
    172c:	42 8b 1c 83          	mov    (%rbx,%r8,4),%ebx
    1730:	39 eb                	cmp    %ebp,%ebx
    1732:	0f 4c eb             	cmovl  %ebx,%ebp
    1735:	ff ce                	dec    %esi
    1737:	48 63 da             	movslq %edx,%rbx
    173a:	39 f2                	cmp    %esi,%edx
    173c:	7d 0e                	jge    174c <func0+0xfc>
    173e:	48 8b 54 df 08       	mov    0x8(%rdi,%rbx,8),%rdx
    1743:	42 8b 14 82          	mov    (%rdx,%r8,4),%edx
    1747:	39 ea                	cmp    %ebp,%edx
    1749:	0f 4c ea             	cmovl  %edx,%ebp
    174c:	85 c0                	test   %eax,%eax
    174e:	7e 10                	jle    1760 <func0+0x110>
    1750:	4c 8b 0c df          	mov    (%rdi,%rbx,8),%r9
    1754:	8d 50 ff             	lea    -0x1(%rax),%edx
    1757:	41 8b 14 91          	mov    (%r9,%rdx,4),%edx
    175b:	39 ea                	cmp    %ebp,%edx
    175d:	0f 4c ea             	cmovl  %edx,%ebp
    1760:	39 f0                	cmp    %esi,%eax
    1762:	7d 15                	jge    1779 <func0+0x129>
    1764:	48 8b 04 df          	mov    (%rdi,%rbx,8),%rax
    1768:	42 8b 44 80 04       	mov    0x4(%rax,%r8,4),%eax
    176d:	39 e8                	cmp    %ebp,%eax
    176f:	0f 4c e8             	cmovl  %eax,%ebp
    1772:	eb 05                	jmp    1779 <func0+0x129>
    1774:	0f af f6             	imul   %esi,%esi
    1777:	89 f5                	mov    %esi,%ebp
    1779:	44 89 31             	mov    %r14d,(%rcx)
    177c:	49 63 de             	movslq %r14d,%rbx
    177f:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
    1786:	00 
    1787:	e8 c4 f8 ff ff       	call   1050 <malloc@plt>
    178c:	85 db                	test   %ebx,%ebx
    178e:	0f 8e 3f 01 00 00    	jle    18d3 <func0+0x283>
    1794:	44 89 f1             	mov    %r14d,%ecx
    1797:	41 83 fe 08          	cmp    $0x8,%r14d
    179b:	73 07                	jae    17a4 <func0+0x154>
    179d:	31 d2                	xor    %edx,%edx
    179f:	e9 16 01 00 00       	jmp    18ba <func0+0x26a>
    17a4:	89 ca                	mov    %ecx,%edx
    17a6:	83 e2 f8             	and    $0xfffffff8,%edx
    17a9:	66 0f 6e c5          	movd   %ebp,%xmm0
    17ad:	66 44 0f 70 c0 00    	pshufd $0x0,%xmm0,%xmm8
    17b3:	48 8d 72 f8          	lea    -0x8(%rdx),%rsi
    17b7:	48 89 f3             	mov    %rsi,%rbx
    17ba:	48 c1 eb 03          	shr    $0x3,%rbx
    17be:	48 ff c3             	inc    %rbx
    17c1:	48 85 f6             	test   %rsi,%rsi
    17c4:	0f 84 18 01 00 00    	je     18e2 <func0+0x292>
    17ca:	48 89 df             	mov    %rbx,%rdi
    17cd:	48 83 e7 fe          	and    $0xfffffffffffffffe,%rdi
    17d1:	66 0f 6f 2d 57 0a 00 	movdqa 0xa57(%rip),%xmm5        # 2230 <_IO_stdin_used+0x230>
    17d8:	00 
    17d9:	66 0f 6f 05 3f 0a 00 	movdqa 0xa3f(%rip),%xmm0        # 2220 <_IO_stdin_used+0x220>
    17e0:	00 
    17e1:	31 f6                	xor    %esi,%esi
    17e3:	66 44 0f 6f 0d 54 0a 	movdqa 0xa54(%rip),%xmm9        # 2240 <_IO_stdin_used+0x240>
    17ea:	00 00 
    17ec:	66 45 0f ef d2       	pxor   %xmm10,%xmm10
    17f1:	66 0f 6f 3d 57 0a 00 	movdqa 0xa57(%rip),%xmm7        # 2250 <_IO_stdin_used+0x250>
    17f8:	00 
    17f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1800:	66 0f 6f dd          	movdqa %xmm5,%xmm3
    1804:	66 41 0f db d9       	pand   %xmm9,%xmm3
    1809:	66 0f 6f e0          	movdqa %xmm0,%xmm4
    180d:	66 41 0f db e1       	pand   %xmm9,%xmm4
    1812:	66 0f 6f cc          	movdqa %xmm4,%xmm1
    1816:	66 41 0f 76 ca       	pcmpeqd %xmm10,%xmm1
    181b:	66 0f 6f d3          	movdqa %xmm3,%xmm2
    181f:	66 41 0f 76 d2       	pcmpeqd %xmm10,%xmm2
    1824:	66 0f 6f f1          	movdqa %xmm1,%xmm6
    1828:	0f c6 f2 dd          	shufps $0xdd,%xmm2,%xmm6
    182c:	0f c6 ca 88          	shufps $0x88,%xmm2,%xmm1
    1830:	0f 54 ce             	andps  %xmm6,%xmm1
    1833:	0f 28 d1             	movaps %xmm1,%xmm2
    1836:	41 0f 55 d0          	andnps %xmm8,%xmm2
    183a:	0f 28 f2             	movaps %xmm2,%xmm6
    183d:	66 0f fa f1          	psubd  %xmm1,%xmm6
    1841:	66 0f 72 d1 1f       	psrld  $0x1f,%xmm1
    1846:	66 0f eb ca          	por    %xmm2,%xmm1
    184a:	f3 0f 7f 34 b0       	movdqu %xmm6,(%rax,%rsi,4)
    184f:	f3 0f 7f 4c b0 10    	movdqu %xmm1,0x10(%rax,%rsi,4)
    1855:	f3 0f 7f 74 b0 20    	movdqu %xmm6,0x20(%rax,%rsi,4)
    185b:	f3 0f 7f 4c b0 30    	movdqu %xmm1,0x30(%rax,%rsi,4)
    1861:	48 83 c6 10          	add    $0x10,%rsi
    1865:	66 0f d4 c7          	paddq  %xmm7,%xmm0
    1869:	66 0f d4 ef          	paddq  %xmm7,%xmm5
    186d:	48 83 c7 fe          	add    $0xfffffffffffffffe,%rdi
    1871:	75 8d                	jne    1800 <func0+0x1b0>
    1873:	f6 c3 01             	test   $0x1,%bl
    1876:	74 3d                	je     18b5 <func0+0x265>
    1878:	66 0f ef c0          	pxor   %xmm0,%xmm0
    187c:	66 0f 76 e0          	pcmpeqd %xmm0,%xmm4
    1880:	66 0f 76 d8          	pcmpeqd %xmm0,%xmm3
    1884:	66 0f 6f c4          	movdqa %xmm4,%xmm0
    1888:	0f c6 c3 dd          	shufps $0xdd,%xmm3,%xmm0
    188c:	0f c6 e3 88          	shufps $0x88,%xmm3,%xmm4
    1890:	0f 54 e0             	andps  %xmm0,%xmm4
    1893:	0f 28 c4             	movaps %xmm4,%xmm0
    1896:	41 0f 55 c0          	andnps %xmm8,%xmm0
    189a:	0f 28 c8             	movaps %xmm0,%xmm1
    189d:	66 0f fa cc          	psubd  %xmm4,%xmm1
    18a1:	66 0f 72 d4 1f       	psrld  $0x1f,%xmm4
    18a6:	66 0f eb e0          	por    %xmm0,%xmm4
    18aa:	f3 0f 7f 0c b0       	movdqu %xmm1,(%rax,%rsi,4)
    18af:	f3 0f 7f 64 b0 10    	movdqu %xmm4,0x10(%rax,%rsi,4)
    18b5:	48 39 ca             	cmp    %rcx,%rdx
    18b8:	74 19                	je     18d3 <func0+0x283>
    18ba:	be 01 00 00 00       	mov    $0x1,%esi
    18bf:	90                   	nop
    18c0:	f6 c2 01             	test   $0x1,%dl
    18c3:	89 ef                	mov    %ebp,%edi
    18c5:	0f 44 fe             	cmove  %esi,%edi
    18c8:	89 3c 90             	mov    %edi,(%rax,%rdx,4)
    18cb:	48 ff c2             	inc    %rdx
    18ce:	48 39 d1             	cmp    %rdx,%rcx
    18d1:	75 ed                	jne    18c0 <func0+0x270>
    18d3:	48 83 c4 08          	add    $0x8,%rsp
    18d7:	5b                   	pop    %rbx
    18d8:	41 5c                	pop    %r12
    18da:	41 5d                	pop    %r13
    18dc:	41 5e                	pop    %r14
    18de:	41 5f                	pop    %r15
    18e0:	5d                   	pop    %rbp
    18e1:	c3                   	ret    
    18e2:	66 0f 6f 25 36 09 00 	movdqa 0x936(%rip),%xmm4        # 2220 <_IO_stdin_used+0x220>
    18e9:	00 
    18ea:	31 f6                	xor    %esi,%esi
    18ec:	66 0f 6f dc          	movdqa %xmm4,%xmm3
    18f0:	f6 c3 01             	test   $0x1,%bl
    18f3:	75 83                	jne    1878 <func0+0x228>
    18f5:	eb be                	jmp    18b5 <func0+0x265>

