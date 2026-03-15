00000000000014d0 <func0>:
    14d0:	55                   	push   %rbp
    14d1:	41 57                	push   %r15
    14d3:	41 56                	push   %r14
    14d5:	41 55                	push   %r13
    14d7:	41 54                	push   %r12
    14d9:	53                   	push   %rbx
    14da:	50                   	push   %rax
    14db:	49 89 f4             	mov    %rsi,%r12
    14de:	49 89 ff             	mov    %rdi,%r15
    14e1:	e8 4a fb ff ff       	call   1030 <strlen@plt>
    14e6:	49 89 c6             	mov    %rax,%r14
    14e9:	4c 89 e7             	mov    %r12,%rdi
    14ec:	e8 3f fb ff ff       	call   1030 <strlen@plt>
    14f1:	45 85 f6             	test   %r14d,%r14d
    14f4:	7e 1b                	jle    1511 <func0+0x41>
    14f6:	45 89 f2             	mov    %r14d,%r10d
    14f9:	45 89 f0             	mov    %r14d,%r8d
    14fc:	41 83 e0 01          	and    $0x1,%r8d
    1500:	49 83 fa 01          	cmp    $0x1,%r10
    1504:	75 14                	jne    151a <func0+0x4a>
    1506:	31 f6                	xor    %esi,%esi
    1508:	bd 01 00 00 00       	mov    $0x1,%ebp
    150d:	31 ff                	xor    %edi,%edi
    150f:	eb 63                	jmp    1574 <func0+0xa4>
    1511:	bd 01 00 00 00       	mov    $0x1,%ebp
    1516:	31 ff                	xor    %edi,%edi
    1518:	eb 7f                	jmp    1599 <func0+0xc9>
    151a:	4d 29 c2             	sub    %r8,%r10
    151d:	45 31 c9             	xor    %r9d,%r9d
    1520:	bd 01 00 00 00       	mov    $0x1,%ebp
    1525:	31 f6                	xor    %esi,%esi
    1527:	31 ff                	xor    %edi,%edi
    1529:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1530:	41 0f b6 1c 37       	movzbl (%r15,%rsi,1),%ebx
    1535:	41 0f b6 4c 37 01    	movzbl 0x1(%r15,%rsi,1),%ecx
    153b:	31 d2                	xor    %edx,%edx
    153d:	80 fb 28             	cmp    $0x28,%bl
    1540:	0f 94 c2             	sete   %dl
    1543:	01 fa                	add    %edi,%edx
    1545:	31 ff                	xor    %edi,%edi
    1547:	80 fb 29             	cmp    $0x29,%bl
    154a:	40 0f 94 c7          	sete   %dil
    154e:	29 fa                	sub    %edi,%edx
    1550:	31 ff                	xor    %edi,%edi
    1552:	80 f9 28             	cmp    $0x28,%cl
    1555:	40 0f 94 c7          	sete   %dil
    1559:	01 d7                	add    %edx,%edi
    155b:	31 db                	xor    %ebx,%ebx
    155d:	80 f9 29             	cmp    $0x29,%cl
    1560:	0f 94 c3             	sete   %bl
    1563:	29 df                	sub    %ebx,%edi
    1565:	09 fa                	or     %edi,%edx
    1567:	41 0f 48 e9          	cmovs  %r9d,%ebp
    156b:	48 83 c6 02          	add    $0x2,%rsi
    156f:	49 39 f2             	cmp    %rsi,%r10
    1572:	75 bc                	jne    1530 <func0+0x60>
    1574:	4d 85 c0             	test   %r8,%r8
    1577:	74 20                	je     1599 <func0+0xc9>
    1579:	41 0f b6 0c 37       	movzbl (%r15,%rsi,1),%ecx
    157e:	31 f6                	xor    %esi,%esi
    1580:	80 f9 28             	cmp    $0x28,%cl
    1583:	40 0f 94 c6          	sete   %sil
    1587:	01 f7                	add    %esi,%edi
    1589:	31 f6                	xor    %esi,%esi
    158b:	80 f9 29             	cmp    $0x29,%cl
    158e:	40 0f 94 c6          	sete   %sil
    1592:	31 c9                	xor    %ecx,%ecx
    1594:	29 f7                	sub    %esi,%edi
    1596:	0f 48 e9             	cmovs  %ecx,%ebp
    1599:	85 c0                	test   %eax,%eax
    159b:	0f 8e 1b 01 00 00    	jle    16bc <func0+0x1ec>
    15a1:	41 89 c0             	mov    %eax,%r8d
    15a4:	41 89 c2             	mov    %eax,%r10d
    15a7:	41 83 e2 01          	and    $0x1,%r10d
    15ab:	45 31 db             	xor    %r11d,%r11d
    15ae:	4d 89 c1             	mov    %r8,%r9
    15b1:	49 ff c9             	dec    %r9
    15b4:	0f 84 1e 01 00 00    	je     16d8 <func0+0x208>
    15ba:	4d 89 c5             	mov    %r8,%r13
    15bd:	4d 29 d5             	sub    %r10,%r13
    15c0:	31 c9                	xor    %ecx,%ecx
    15c2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    15c9:	1f 84 00 00 00 00 00 
    15d0:	41 0f b6 14 0c       	movzbl (%r12,%rcx,1),%edx
    15d5:	41 0f b6 5c 0c 01    	movzbl 0x1(%r12,%rcx,1),%ebx
    15db:	31 f6                	xor    %esi,%esi
    15dd:	80 fa 28             	cmp    $0x28,%dl
    15e0:	40 0f 94 c6          	sete   %sil
    15e4:	01 fe                	add    %edi,%esi
    15e6:	31 ff                	xor    %edi,%edi
    15e8:	80 fa 29             	cmp    $0x29,%dl
    15eb:	40 0f 94 c7          	sete   %dil
    15ef:	29 fe                	sub    %edi,%esi
    15f1:	31 ff                	xor    %edi,%edi
    15f3:	80 fb 28             	cmp    $0x28,%bl
    15f6:	40 0f 94 c7          	sete   %dil
    15fa:	01 f7                	add    %esi,%edi
    15fc:	31 d2                	xor    %edx,%edx
    15fe:	80 fb 29             	cmp    $0x29,%bl
    1601:	0f 94 c2             	sete   %dl
    1604:	29 d7                	sub    %edx,%edi
    1606:	09 fe                	or     %edi,%esi
    1608:	41 0f 48 eb          	cmovs  %r11d,%ebp
    160c:	48 83 c1 02          	add    $0x2,%rcx
    1610:	49 39 cd             	cmp    %rcx,%r13
    1613:	75 bb                	jne    15d0 <func0+0x100>
    1615:	4d 85 d2             	test   %r10,%r10
    1618:	74 1e                	je     1638 <func0+0x168>
    161a:	41 0f b6 0c 0c       	movzbl (%r12,%rcx,1),%ecx
    161f:	31 d2                	xor    %edx,%edx
    1621:	80 f9 28             	cmp    $0x28,%cl
    1624:	0f 94 c2             	sete   %dl
    1627:	01 d7                	add    %edx,%edi
    1629:	31 d2                	xor    %edx,%edx
    162b:	80 f9 29             	cmp    $0x29,%cl
    162e:	0f 94 c2             	sete   %dl
    1631:	31 c9                	xor    %ecx,%ecx
    1633:	29 d7                	sub    %edx,%edi
    1635:	0f 48 e9             	cmovs  %ecx,%ebp
    1638:	85 ff                	test   %edi,%edi
    163a:	75 08                	jne    1644 <func0+0x174>
    163c:	85 ed                	test   %ebp,%ebp
    163e:	0f 85 88 00 00 00    	jne    16cc <func0+0x1fc>
    1644:	85 c0                	test   %eax,%eax
    1646:	0f 8e 9c 00 00 00    	jle    16e8 <func0+0x218>
    164c:	83 e0 01             	and    $0x1,%eax
    164f:	4d 85 c9             	test   %r9,%r9
    1652:	0f 84 9a 00 00 00    	je     16f2 <func0+0x222>
    1658:	49 29 c0             	sub    %rax,%r8
    165b:	31 ff                	xor    %edi,%edi
    165d:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    1663:	31 d2                	xor    %edx,%edx
    1665:	31 f6                	xor    %esi,%esi
    1667:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    166e:	00 00 
    1670:	41 0f b6 1c 14       	movzbl (%r12,%rdx,1),%ebx
    1675:	41 0f b6 4c 14 01    	movzbl 0x1(%r12,%rdx,1),%ecx
    167b:	31 ed                	xor    %ebp,%ebp
    167d:	80 fb 28             	cmp    $0x28,%bl
    1680:	40 0f 94 c5          	sete   %bpl
    1684:	01 f5                	add    %esi,%ebp
    1686:	31 f6                	xor    %esi,%esi
    1688:	80 fb 29             	cmp    $0x29,%bl
    168b:	40 0f 94 c6          	sete   %sil
    168f:	29 f5                	sub    %esi,%ebp
    1691:	31 f6                	xor    %esi,%esi
    1693:	80 f9 28             	cmp    $0x28,%cl
    1696:	40 0f 94 c6          	sete   %sil
    169a:	01 ee                	add    %ebp,%esi
    169c:	31 db                	xor    %ebx,%ebx
    169e:	80 f9 29             	cmp    $0x29,%cl
    16a1:	0f 94 c3             	sete   %bl
    16a4:	29 de                	sub    %ebx,%esi
    16a6:	09 f5                	or     %esi,%ebp
    16a8:	44 0f 48 cf          	cmovs  %edi,%r9d
    16ac:	48 83 c2 02          	add    $0x2,%rdx
    16b0:	49 39 d0             	cmp    %rdx,%r8
    16b3:	75 bb                	jne    1670 <func0+0x1a0>
    16b5:	48 85 c0             	test   %rax,%rax
    16b8:	75 47                	jne    1701 <func0+0x231>
    16ba:	eb 62                	jmp    171e <func0+0x24e>
    16bc:	31 f6                	xor    %esi,%esi
    16be:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    16c4:	85 ff                	test   %edi,%edi
    16c6:	75 56                	jne    171e <func0+0x24e>
    16c8:	85 ed                	test   %ebp,%ebp
    16ca:	74 52                	je     171e <func0+0x24e>
    16cc:	48 8d 05 31 09 00 00 	lea    0x931(%rip),%rax        # 2004 <_IO_stdin_used+0x4>
    16d3:	e9 ea 00 00 00       	jmp    17c2 <func0+0x2f2>
    16d8:	31 c9                	xor    %ecx,%ecx
    16da:	4d 85 d2             	test   %r10,%r10
    16dd:	0f 85 37 ff ff ff    	jne    161a <func0+0x14a>
    16e3:	e9 50 ff ff ff       	jmp    1638 <func0+0x168>
    16e8:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    16ee:	31 f6                	xor    %esi,%esi
    16f0:	eb 2c                	jmp    171e <func0+0x24e>
    16f2:	31 d2                	xor    %edx,%edx
    16f4:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    16fa:	31 f6                	xor    %esi,%esi
    16fc:	48 85 c0             	test   %rax,%rax
    16ff:	74 1d                	je     171e <func0+0x24e>
    1701:	41 0f b6 04 14       	movzbl (%r12,%rdx,1),%eax
    1706:	31 d2                	xor    %edx,%edx
    1708:	3c 28                	cmp    $0x28,%al
    170a:	0f 94 c2             	sete   %dl
    170d:	01 d6                	add    %edx,%esi
    170f:	31 d2                	xor    %edx,%edx
    1711:	3c 29                	cmp    $0x29,%al
    1713:	0f 94 c2             	sete   %dl
    1716:	31 c0                	xor    %eax,%eax
    1718:	29 d6                	sub    %edx,%esi
    171a:	44 0f 48 c8          	cmovs  %eax,%r9d
    171e:	45 85 f6             	test   %r14d,%r14d
    1721:	0f 8e 80 00 00 00    	jle    17a7 <func0+0x2d7>
    1727:	44 89 f2             	mov    %r14d,%edx
    172a:	41 83 e6 01          	and    $0x1,%r14d
    172e:	31 ff                	xor    %edi,%edi
    1730:	48 83 fa 01          	cmp    $0x1,%rdx
    1734:	75 04                	jne    173a <func0+0x26a>
    1736:	31 c0                	xor    %eax,%eax
    1738:	eb 4b                	jmp    1785 <func0+0x2b5>
    173a:	4c 29 f2             	sub    %r14,%rdx
    173d:	31 c0                	xor    %eax,%eax
    173f:	90                   	nop
    1740:	41 0f b6 0c 07       	movzbl (%r15,%rax,1),%ecx
    1745:	41 0f b6 5c 07 01    	movzbl 0x1(%r15,%rax,1),%ebx
    174b:	31 ed                	xor    %ebp,%ebp
    174d:	80 f9 28             	cmp    $0x28,%cl
    1750:	40 0f 94 c5          	sete   %bpl
    1754:	01 f5                	add    %esi,%ebp
    1756:	31 f6                	xor    %esi,%esi
    1758:	80 f9 29             	cmp    $0x29,%cl
    175b:	40 0f 94 c6          	sete   %sil
    175f:	29 f5                	sub    %esi,%ebp
    1761:	31 f6                	xor    %esi,%esi
    1763:	80 fb 28             	cmp    $0x28,%bl
    1766:	40 0f 94 c6          	sete   %sil
    176a:	01 ee                	add    %ebp,%esi
    176c:	31 c9                	xor    %ecx,%ecx
    176e:	80 fb 29             	cmp    $0x29,%bl
    1771:	0f 94 c1             	sete   %cl
    1774:	29 ce                	sub    %ecx,%esi
    1776:	09 f5                	or     %esi,%ebp
    1778:	44 0f 48 cf          	cmovs  %edi,%r9d
    177c:	48 83 c0 02          	add    $0x2,%rax
    1780:	48 39 c2             	cmp    %rax,%rdx
    1783:	75 bb                	jne    1740 <func0+0x270>
    1785:	4d 85 f6             	test   %r14,%r14
    1788:	74 1d                	je     17a7 <func0+0x2d7>
    178a:	41 0f b6 04 07       	movzbl (%r15,%rax,1),%eax
    178f:	31 c9                	xor    %ecx,%ecx
    1791:	3c 28                	cmp    $0x28,%al
    1793:	0f 94 c1             	sete   %cl
    1796:	01 ce                	add    %ecx,%esi
    1798:	31 c9                	xor    %ecx,%ecx
    179a:	3c 29                	cmp    $0x29,%al
    179c:	0f 94 c1             	sete   %cl
    179f:	31 c0                	xor    %eax,%eax
    17a1:	29 ce                	sub    %ecx,%esi
    17a3:	44 0f 48 c8          	cmovs  %eax,%r9d
    17a7:	45 85 c9             	test   %r9d,%r9d
    17aa:	48 8d 05 53 08 00 00 	lea    0x853(%rip),%rax        # 2004 <_IO_stdin_used+0x4>
    17b1:	48 8d 0d 94 08 00 00 	lea    0x894(%rip),%rcx        # 204c <_IO_stdin_used+0x4c>
    17b8:	48 0f 44 c1          	cmove  %rcx,%rax
    17bc:	85 f6                	test   %esi,%esi
    17be:	48 0f 45 c1          	cmovne %rcx,%rax
    17c2:	48 83 c4 08          	add    $0x8,%rsp
    17c6:	5b                   	pop    %rbx
    17c7:	41 5c                	pop    %r12
    17c9:	41 5d                	pop    %r13
    17cb:	41 5e                	pop    %r14
    17cd:	41 5f                	pop    %r15
    17cf:	5d                   	pop    %rbp
    17d0:	c3                   	ret    

