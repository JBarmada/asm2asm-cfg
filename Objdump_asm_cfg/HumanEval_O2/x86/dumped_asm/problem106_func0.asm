0000000000001540 <func0>:
    1540:	55                   	push   %rbp
    1541:	41 57                	push   %r15
    1543:	41 56                	push   %r14
    1545:	41 54                	push   %r12
    1547:	53                   	push   %rbx
    1548:	49 89 d6             	mov    %rdx,%r14
    154b:	41 89 f7             	mov    %esi,%r15d
    154e:	48 89 fb             	mov    %rdi,%rbx
    1551:	45 8d 47 ff          	lea    -0x1(%r15),%r8d
    1555:	83 fe 02             	cmp    $0x2,%esi
    1558:	0f 8c a4 00 00 00    	jl     1602 <func0+0xc2>
    155e:	45 31 c9             	xor    %r9d,%r9d
    1561:	45 89 c2             	mov    %r8d,%r10d
    1564:	eb 19                	jmp    157f <func0+0x3f>
    1566:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    156d:	00 00 00 
    1570:	41 ff c1             	inc    %r9d
    1573:	41 ff ca             	dec    %r10d
    1576:	45 39 c1             	cmp    %r8d,%r9d
    1579:	0f 84 83 00 00 00    	je     1602 <func0+0xc2>
    157f:	45 89 d2             	mov    %r10d,%r10d
    1582:	44 89 c8             	mov    %r9d,%eax
    1585:	f7 d0                	not    %eax
    1587:	44 01 f8             	add    %r15d,%eax
    158a:	85 c0                	test   %eax,%eax
    158c:	7e e2                	jle    1570 <func0+0x30>
    158e:	8b 2b                	mov    (%rbx),%ebp
    1590:	41 83 fa 01          	cmp    $0x1,%r10d
    1594:	75 1a                	jne    15b0 <func0+0x70>
    1596:	31 d2                	xor    %edx,%edx
    1598:	41 f6 c2 01          	test   $0x1,%r10b
    159c:	74 d2                	je     1570 <func0+0x30>
    159e:	8b 44 93 04          	mov    0x4(%rbx,%rdx,4),%eax
    15a2:	39 c5                	cmp    %eax,%ebp
    15a4:	7e ca                	jle    1570 <func0+0x30>
    15a6:	89 04 93             	mov    %eax,(%rbx,%rdx,4)
    15a9:	89 6c 93 04          	mov    %ebp,0x4(%rbx,%rdx,4)
    15ad:	eb c1                	jmp    1570 <func0+0x30>
    15af:	90                   	nop
    15b0:	44 89 d6             	mov    %r10d,%esi
    15b3:	83 e6 fe             	and    $0xfffffffe,%esi
    15b6:	31 c0                	xor    %eax,%eax
    15b8:	eb 16                	jmp    15d0 <func0+0x90>
    15ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    15c0:	89 7c 83 04          	mov    %edi,0x4(%rbx,%rax,4)
    15c4:	89 6c 83 08          	mov    %ebp,0x8(%rbx,%rax,4)
    15c8:	48 89 d0             	mov    %rdx,%rax
    15cb:	48 39 d6             	cmp    %rdx,%rsi
    15ce:	74 c8                	je     1598 <func0+0x58>
    15d0:	8b 54 83 04          	mov    0x4(%rbx,%rax,4),%edx
    15d4:	39 d5                	cmp    %edx,%ebp
    15d6:	7e 18                	jle    15f0 <func0+0xb0>
    15d8:	89 14 83             	mov    %edx,(%rbx,%rax,4)
    15db:	89 6c 83 04          	mov    %ebp,0x4(%rbx,%rax,4)
    15df:	eb 11                	jmp    15f2 <func0+0xb2>
    15e1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    15e8:	0f 1f 84 00 00 00 00 
    15ef:	00 
    15f0:	89 d5                	mov    %edx,%ebp
    15f2:	48 8d 50 02          	lea    0x2(%rax),%rdx
    15f6:	8b 7c 83 08          	mov    0x8(%rbx,%rax,4),%edi
    15fa:	39 fd                	cmp    %edi,%ebp
    15fc:	7f c2                	jg     15c0 <func0+0x80>
    15fe:	89 fd                	mov    %edi,%ebp
    1600:	eb c6                	jmp    15c8 <func0+0x88>
    1602:	c7 01 00 00 00 00    	movl   $0x0,(%rcx)
    1608:	45 89 c4             	mov    %r8d,%r12d
    160b:	45 85 ff             	test   %r15d,%r15d
    160e:	7e 49                	jle    1659 <func0+0x119>
    1610:	49 8d 54 24 01       	lea    0x1(%r12),%rdx
    1615:	45 85 c0             	test   %r8d,%r8d
    1618:	74 43                	je     165d <func0+0x11d>
    161a:	48 89 d6             	mov    %rdx,%rsi
    161d:	48 83 e6 fe          	and    $0xfffffffffffffffe,%rsi
    1621:	31 ed                	xor    %ebp,%ebp
    1623:	4c 89 e0             	mov    %r12,%rax
    1626:	eb 12                	jmp    163a <func0+0xfa>
    1628:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    162f:	00 
    1630:	48 83 c0 fe          	add    $0xfffffffffffffffe,%rax
    1634:	48 83 c6 fe          	add    $0xfffffffffffffffe,%rsi
    1638:	74 28                	je     1662 <func0+0x122>
    163a:	8b 3c 83             	mov    (%rbx,%rax,4),%edi
    163d:	ff cf                	dec    %edi
    163f:	83 ff 08             	cmp    $0x8,%edi
    1642:	77 04                	ja     1648 <func0+0x108>
    1644:	ff c5                	inc    %ebp
    1646:	89 29                	mov    %ebp,(%rcx)
    1648:	8b 7c 83 fc          	mov    -0x4(%rbx,%rax,4),%edi
    164c:	ff cf                	dec    %edi
    164e:	83 ff 08             	cmp    $0x8,%edi
    1651:	77 dd                	ja     1630 <func0+0xf0>
    1653:	ff c5                	inc    %ebp
    1655:	89 29                	mov    %ebp,(%rcx)
    1657:	eb d7                	jmp    1630 <func0+0xf0>
    1659:	31 ed                	xor    %ebp,%ebp
    165b:	eb 18                	jmp    1675 <func0+0x135>
    165d:	31 ed                	xor    %ebp,%ebp
    165f:	4c 89 e0             	mov    %r12,%rax
    1662:	f6 c2 01             	test   $0x1,%dl
    1665:	74 0e                	je     1675 <func0+0x135>
    1667:	8b 04 83             	mov    (%rbx,%rax,4),%eax
    166a:	ff c8                	dec    %eax
    166c:	83 f8 08             	cmp    $0x8,%eax
    166f:	77 04                	ja     1675 <func0+0x135>
    1671:	ff c5                	inc    %ebp
    1673:	89 29                	mov    %ebp,(%rcx)
    1675:	48 63 fd             	movslq %ebp,%rdi
    1678:	48 c1 e7 03          	shl    $0x3,%rdi
    167c:	e8 df f9 ff ff       	call   1060 <malloc@plt>
    1681:	49 89 06             	mov    %rax,(%r14)
    1684:	45 85 ff             	test   %r15d,%r15d
    1687:	7e 42                	jle    16cb <func0+0x18b>
    1689:	85 ed                	test   %ebp,%ebp
    168b:	7e 3e                	jle    16cb <func0+0x18b>
    168d:	31 c0                	xor    %eax,%eax
    168f:	48 8d 0d c6 0a 00 00 	lea    0xac6(%rip),%rcx        # 215c <_IO_stdin_used+0x15c>
    1696:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    169d:	00 00 00 
    16a0:	42 8b 14 a3          	mov    (%rbx,%r12,4),%edx
    16a4:	8d 72 ff             	lea    -0x1(%rdx),%esi
    16a7:	83 fe 08             	cmp    $0x8,%esi
    16aa:	77 13                	ja     16bf <func0+0x17f>
    16ac:	48 63 14 91          	movslq (%rcx,%rdx,4),%rdx
    16b0:	48 01 ca             	add    %rcx,%rdx
    16b3:	49 8b 36             	mov    (%r14),%rsi
    16b6:	48 63 f8             	movslq %eax,%rdi
    16b9:	ff c0                	inc    %eax
    16bb:	48 89 14 fe          	mov    %rdx,(%rsi,%rdi,8)
    16bf:	4d 85 e4             	test   %r12,%r12
    16c2:	7e 07                	jle    16cb <func0+0x18b>
    16c4:	49 ff cc             	dec    %r12
    16c7:	39 e8                	cmp    %ebp,%eax
    16c9:	7c d5                	jl     16a0 <func0+0x160>
    16cb:	5b                   	pop    %rbx
    16cc:	41 5c                	pop    %r12
    16ce:	41 5e                	pop    %r14
    16d0:	41 5f                	pop    %r15
    16d2:	5d                   	pop    %rbp
    16d3:	c3                   	ret    

