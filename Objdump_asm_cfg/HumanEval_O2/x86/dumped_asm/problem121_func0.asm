0000000000001630 <func0>:
    1630:	55                   	push   %rbp
    1631:	41 56                	push   %r14
    1633:	53                   	push   %rbx
    1634:	83 fe 02             	cmp    $0x2,%esi
    1637:	0f 8c b8 00 00 00    	jl     16f5 <func0+0xc5>
    163d:	44 8d 46 ff          	lea    -0x1(%rsi),%r8d
    1641:	45 31 c9             	xor    %r9d,%r9d
    1644:	45 89 c2             	mov    %r8d,%r10d
    1647:	eb 16                	jmp    165f <func0+0x2f>
    1649:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1650:	41 ff c1             	inc    %r9d
    1653:	41 ff ca             	dec    %r10d
    1656:	45 39 c1             	cmp    %r8d,%r9d
    1659:	0f 84 96 00 00 00    	je     16f5 <func0+0xc5>
    165f:	45 89 d2             	mov    %r10d,%r10d
    1662:	44 89 c8             	mov    %r9d,%eax
    1665:	f7 d0                	not    %eax
    1667:	01 f0                	add    %esi,%eax
    1669:	85 c0                	test   %eax,%eax
    166b:	7e e3                	jle    1650 <func0+0x20>
    166d:	44 8b 37             	mov    (%rdi),%r14d
    1670:	41 83 fa 01          	cmp    $0x1,%r10d
    1674:	75 2a                	jne    16a0 <func0+0x70>
    1676:	31 c0                	xor    %eax,%eax
    1678:	41 f6 c2 01          	test   $0x1,%r10b
    167c:	74 d2                	je     1650 <func0+0x20>
    167e:	8b 6c 87 04          	mov    0x4(%rdi,%rax,4),%ebp
    1682:	41 39 ee             	cmp    %ebp,%r14d
    1685:	7e c9                	jle    1650 <func0+0x20>
    1687:	89 2c 87             	mov    %ebp,(%rdi,%rax,4)
    168a:	44 89 74 87 04       	mov    %r14d,0x4(%rdi,%rax,4)
    168f:	eb bf                	jmp    1650 <func0+0x20>
    1691:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1698:	0f 1f 84 00 00 00 00 
    169f:	00 
    16a0:	45 89 d3             	mov    %r10d,%r11d
    16a3:	41 83 e3 fe          	and    $0xfffffffe,%r11d
    16a7:	31 db                	xor    %ebx,%ebx
    16a9:	eb 16                	jmp    16c1 <func0+0x91>
    16ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    16b0:	89 6c 9f 04          	mov    %ebp,0x4(%rdi,%rbx,4)
    16b4:	44 89 74 9f 08       	mov    %r14d,0x8(%rdi,%rbx,4)
    16b9:	48 89 c3             	mov    %rax,%rbx
    16bc:	49 39 c3             	cmp    %rax,%r11
    16bf:	74 b7                	je     1678 <func0+0x48>
    16c1:	8b 44 9f 04          	mov    0x4(%rdi,%rbx,4),%eax
    16c5:	41 39 c6             	cmp    %eax,%r14d
    16c8:	7e 16                	jle    16e0 <func0+0xb0>
    16ca:	89 04 9f             	mov    %eax,(%rdi,%rbx,4)
    16cd:	44 89 74 9f 04       	mov    %r14d,0x4(%rdi,%rbx,4)
    16d2:	eb 0f                	jmp    16e3 <func0+0xb3>
    16d4:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    16db:	00 00 00 00 00 
    16e0:	41 89 c6             	mov    %eax,%r14d
    16e3:	48 8d 43 02          	lea    0x2(%rbx),%rax
    16e7:	8b 6c 9f 08          	mov    0x8(%rdi,%rbx,4),%ebp
    16eb:	41 39 ee             	cmp    %ebp,%r14d
    16ee:	7f c0                	jg     16b0 <func0+0x80>
    16f0:	41 89 ee             	mov    %ebp,%r14d
    16f3:	eb c4                	jmp    16b9 <func0+0x89>
    16f5:	85 d2                	test   %edx,%edx
    16f7:	0f 8e 29 01 00 00    	jle    1826 <func0+0x1f6>
    16fd:	29 d6                	sub    %edx,%esi
    16ff:	4c 63 c6             	movslq %esi,%r8
    1702:	41 89 d2             	mov    %edx,%r10d
    1705:	83 fa 08             	cmp    $0x8,%edx
    1708:	72 14                	jb     171e <func0+0xee>
    170a:	4a 8d 04 87          	lea    (%rdi,%r8,4),%rax
    170e:	48 89 ca             	mov    %rcx,%rdx
    1711:	48 29 c2             	sub    %rax,%rdx
    1714:	48 83 fa 20          	cmp    $0x20,%rdx
    1718:	0f 83 7e 00 00 00    	jae    179c <func0+0x16c>
    171e:	31 d2                	xor    %edx,%edx
    1720:	48 89 d6             	mov    %rdx,%rsi
    1723:	48 f7 d6             	not    %rsi
    1726:	4c 01 d6             	add    %r10,%rsi
    1729:	4c 89 d0             	mov    %r10,%rax
    172c:	48 83 e0 03          	and    $0x3,%rax
    1730:	74 1d                	je     174f <func0+0x11f>
    1732:	4a 8d 2c 87          	lea    (%rdi,%r8,4),%rbp
    1736:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    173d:	00 00 00 
    1740:	8b 5c 95 00          	mov    0x0(%rbp,%rdx,4),%ebx
    1744:	89 1c 91             	mov    %ebx,(%rcx,%rdx,4)
    1747:	48 ff c2             	inc    %rdx
    174a:	48 ff c8             	dec    %rax
    174d:	75 f1                	jne    1740 <func0+0x110>
    174f:	48 83 fe 03          	cmp    $0x3,%rsi
    1753:	0f 82 cd 00 00 00    	jb     1826 <func0+0x1f6>
    1759:	4a 8d 04 87          	lea    (%rdi,%r8,4),%rax
    175d:	48 83 c0 0c          	add    $0xc,%rax
    1761:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1768:	0f 1f 84 00 00 00 00 
    176f:	00 
    1770:	8b 74 90 f4          	mov    -0xc(%rax,%rdx,4),%esi
    1774:	89 34 91             	mov    %esi,(%rcx,%rdx,4)
    1777:	8b 74 90 f8          	mov    -0x8(%rax,%rdx,4),%esi
    177b:	89 74 91 04          	mov    %esi,0x4(%rcx,%rdx,4)
    177f:	8b 74 90 fc          	mov    -0x4(%rax,%rdx,4),%esi
    1783:	89 74 91 08          	mov    %esi,0x8(%rcx,%rdx,4)
    1787:	8b 34 90             	mov    (%rax,%rdx,4),%esi
    178a:	89 74 91 0c          	mov    %esi,0xc(%rcx,%rdx,4)
    178e:	48 83 c2 04          	add    $0x4,%rdx
    1792:	49 39 d2             	cmp    %rdx,%r10
    1795:	75 d9                	jne    1770 <func0+0x140>
    1797:	e9 8a 00 00 00       	jmp    1826 <func0+0x1f6>
    179c:	44 89 d2             	mov    %r10d,%edx
    179f:	83 e2 f8             	and    $0xfffffff8,%edx
    17a2:	48 8d 42 f8          	lea    -0x8(%rdx),%rax
    17a6:	49 89 c1             	mov    %rax,%r9
    17a9:	49 c1 e9 03          	shr    $0x3,%r9
    17ad:	49 ff c1             	inc    %r9
    17b0:	48 85 c0             	test   %rax,%rax
    17b3:	74 76                	je     182b <func0+0x1fb>
    17b5:	4a 8d 04 85 00 00 00 	lea    0x0(,%r8,4),%rax
    17bc:	00 
    17bd:	4c 89 cb             	mov    %r9,%rbx
    17c0:	48 83 e3 fe          	and    $0xfffffffffffffffe,%rbx
    17c4:	48 8d 2c 38          	lea    (%rax,%rdi,1),%rbp
    17c8:	48 83 c5 30          	add    $0x30,%rbp
    17cc:	31 f6                	xor    %esi,%esi
    17ce:	66 90                	xchg   %ax,%ax
    17d0:	0f 10 44 b5 d0       	movups -0x30(%rbp,%rsi,4),%xmm0
    17d5:	0f 10 4c b5 e0       	movups -0x20(%rbp,%rsi,4),%xmm1
    17da:	0f 11 04 b1          	movups %xmm0,(%rcx,%rsi,4)
    17de:	0f 11 4c b1 10       	movups %xmm1,0x10(%rcx,%rsi,4)
    17e3:	0f 10 44 b5 f0       	movups -0x10(%rbp,%rsi,4),%xmm0
    17e8:	0f 10 4c b5 00       	movups 0x0(%rbp,%rsi,4),%xmm1
    17ed:	0f 11 44 b1 20       	movups %xmm0,0x20(%rcx,%rsi,4)
    17f2:	0f 11 4c b1 30       	movups %xmm1,0x30(%rcx,%rsi,4)
    17f7:	48 83 c6 10          	add    $0x10,%rsi
    17fb:	48 83 c3 fe          	add    $0xfffffffffffffffe,%rbx
    17ff:	75 cf                	jne    17d0 <func0+0x1a0>
    1801:	41 f6 c1 01          	test   $0x1,%r9b
    1805:	74 16                	je     181d <func0+0x1ed>
    1807:	4a 8d 04 06          	lea    (%rsi,%r8,1),%rax
    180b:	0f 10 04 87          	movups (%rdi,%rax,4),%xmm0
    180f:	0f 10 4c 87 10       	movups 0x10(%rdi,%rax,4),%xmm1
    1814:	0f 11 04 b1          	movups %xmm0,(%rcx,%rsi,4)
    1818:	0f 11 4c b1 10       	movups %xmm1,0x10(%rcx,%rsi,4)
    181d:	4c 39 d2             	cmp    %r10,%rdx
    1820:	0f 85 fa fe ff ff    	jne    1720 <func0+0xf0>
    1826:	5b                   	pop    %rbx
    1827:	41 5e                	pop    %r14
    1829:	5d                   	pop    %rbp
    182a:	c3                   	ret    
    182b:	31 f6                	xor    %esi,%esi
    182d:	41 f6 c1 01          	test   $0x1,%r9b
    1831:	75 d4                	jne    1807 <func0+0x1d7>
    1833:	eb e8                	jmp    181d <func0+0x1ed>

