0000000000001630 <func0>:
    1630:	55                   	push   %rbp
    1631:	41 57                	push   %r15
    1633:	41 56                	push   %r14
    1635:	41 55                	push   %r13
    1637:	41 54                	push   %r12
    1639:	53                   	push   %rbx
    163a:	48 83 ec 28          	sub    $0x28,%rsp
    163e:	c7 02 00 00 00 00    	movl   $0x0,(%rdx)
    1644:	85 f6                	test   %esi,%esi
    1646:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    164b:	0f 8e fb 00 00 00    	jle    174c <func0+0x11c>
    1651:	49 89 d7             	mov    %rdx,%r15
    1654:	48 89 fb             	mov    %rdi,%rbx
    1657:	41 89 f4             	mov    %esi,%r12d
    165a:	45 31 ed             	xor    %r13d,%r13d
    165d:	31 ed                	xor    %ebp,%ebp
    165f:	eb 17                	jmp    1678 <func0+0x48>
    1661:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1668:	0f 1f 84 00 00 00 00 
    166f:	00 
    1670:	48 ff c5             	inc    %rbp
    1673:	49 39 ec             	cmp    %rbp,%r12
    1676:	74 1f                	je     1697 <func0+0x67>
    1678:	4c 8b 34 eb          	mov    (%rbx,%rbp,8),%r14
    167c:	4c 89 f7             	mov    %r14,%rdi
    167f:	e8 cc f9 ff ff       	call   1050 <strlen@plt>
    1684:	a8 01                	test   $0x1,%al
    1686:	75 e8                	jne    1670 <func0+0x40>
    1688:	4d 63 ed             	movslq %r13d,%r13
    168b:	4e 89 34 eb          	mov    %r14,(%rbx,%r13,8)
    168f:	41 ff c5             	inc    %r13d
    1692:	45 89 2f             	mov    %r13d,(%r15)
    1695:	eb d9                	jmp    1670 <func0+0x40>
    1697:	41 83 fd 02          	cmp    $0x2,%r13d
    169b:	0f 8c b5 00 00 00    	jl     1756 <func0+0x126>
    16a1:	4c 89 6c 24 18       	mov    %r13,0x18(%rsp)
    16a6:	41 8d 45 ff          	lea    -0x1(%r13),%eax
    16aa:	31 c9                	xor    %ecx,%ecx
    16ac:	89 44 24 14          	mov    %eax,0x14(%rsp)
    16b0:	41 89 c5             	mov    %eax,%r13d
    16b3:	eb 1f                	jmp    16d4 <func0+0xa4>
    16b5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    16bc:	00 00 00 00 
    16c0:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    16c5:	ff c1                	inc    %ecx
    16c7:	41 ff cd             	dec    %r13d
    16ca:	3b 4c 24 14          	cmp    0x14(%rsp),%ecx
    16ce:	0f 84 7d 00 00 00    	je     1751 <func0+0x121>
    16d4:	45 89 ed             	mov    %r13d,%r13d
    16d7:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    16dc:	89 c8                	mov    %ecx,%eax
    16de:	f7 d0                	not    %eax
    16e0:	03 44 24 18          	add    0x18(%rsp),%eax
    16e4:	85 c0                	test   %eax,%eax
    16e6:	7e d8                	jle    16c0 <func0+0x90>
    16e8:	4c 8b 3b             	mov    (%rbx),%r15
    16eb:	45 31 f6             	xor    %r14d,%r14d
    16ee:	eb 16                	jmp    1706 <func0+0xd6>
    16f0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    16f5:	48 89 1c e8          	mov    %rbx,(%rax,%rbp,8)
    16f9:	48 89 c3             	mov    %rax,%rbx
    16fc:	4c 89 7c e8 08       	mov    %r15,0x8(%rax,%rbp,8)
    1701:	4d 39 f5             	cmp    %r14,%r13
    1704:	74 ba                	je     16c0 <func0+0x90>
    1706:	4c 89 f5             	mov    %r14,%rbp
    1709:	4c 89 ff             	mov    %r15,%rdi
    170c:	e8 3f f9 ff ff       	call   1050 <strlen@plt>
    1711:	49 89 c4             	mov    %rax,%r12
    1714:	49 ff c6             	inc    %r14
    1717:	48 8b 5c eb 08       	mov    0x8(%rbx,%rbp,8),%rbx
    171c:	48 89 df             	mov    %rbx,%rdi
    171f:	e8 2c f9 ff ff       	call   1050 <strlen@plt>
    1724:	49 39 c4             	cmp    %rax,%r12
    1727:	77 c7                	ja     16f0 <func0+0xc0>
    1729:	75 0f                	jne    173a <func0+0x10a>
    172b:	4c 89 ff             	mov    %r15,%rdi
    172e:	48 89 de             	mov    %rbx,%rsi
    1731:	e8 3a f9 ff ff       	call   1070 <strcmp@plt>
    1736:	85 c0                	test   %eax,%eax
    1738:	7f b6                	jg     16f0 <func0+0xc0>
    173a:	49 89 df             	mov    %rbx,%r15
    173d:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    1742:	4d 39 f5             	cmp    %r14,%r13
    1745:	75 bf                	jne    1706 <func0+0xd6>
    1747:	e9 74 ff ff ff       	jmp    16c0 <func0+0x90>
    174c:	45 31 ed             	xor    %r13d,%r13d
    174f:	eb 05                	jmp    1756 <func0+0x126>
    1751:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
    1756:	49 63 ed             	movslq %r13d,%rbp
    1759:	48 8d 3c ed 00 00 00 	lea    0x0(,%rbp,8),%rdi
    1760:	00 
    1761:	e8 2a f9 ff ff       	call   1090 <malloc@plt>
    1766:	48 89 c3             	mov    %rax,%rbx
    1769:	85 ed                	test   %ebp,%ebp
    176b:	7e 14                	jle    1781 <func0+0x151>
    176d:	44 89 ea             	mov    %r13d,%edx
    1770:	48 c1 e2 03          	shl    $0x3,%rdx
    1774:	48 89 df             	mov    %rbx,%rdi
    1777:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    177c:	e8 ff f8 ff ff       	call   1080 <memcpy@plt>
    1781:	48 89 d8             	mov    %rbx,%rax
    1784:	48 83 c4 28          	add    $0x28,%rsp
    1788:	5b                   	pop    %rbx
    1789:	41 5c                	pop    %r12
    178b:	41 5d                	pop    %r13
    178d:	41 5e                	pop    %r14
    178f:	41 5f                	pop    %r15
    1791:	5d                   	pop    %rbp
    1792:	c3                   	ret    

