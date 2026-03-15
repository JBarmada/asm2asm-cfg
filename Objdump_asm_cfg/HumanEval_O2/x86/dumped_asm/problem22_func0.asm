0000000000001550 <func0>:
    1550:	f3 0f 10 17          	movss  (%rdi),%xmm2
    1554:	41 89 f0             	mov    %esi,%r8d
    1557:	83 fe 02             	cmp    $0x2,%esi
    155a:	7c 1d                	jl     1579 <func0+0x29>
    155c:	49 8d 48 ff          	lea    -0x1(%r8),%rcx
    1560:	49 8d 50 fe          	lea    -0x2(%r8),%rdx
    1564:	89 c8                	mov    %ecx,%eax
    1566:	83 e0 03             	and    $0x3,%eax
    1569:	48 83 fa 03          	cmp    $0x3,%rdx
    156d:	73 15                	jae    1584 <func0+0x34>
    156f:	ba 01 00 00 00       	mov    $0x1,%edx
    1574:	0f 28 da             	movaps %xmm2,%xmm3
    1577:	eb 67                	jmp    15e0 <func0+0x90>
    1579:	0f 28 c2             	movaps %xmm2,%xmm0
    157c:	0f 28 ca             	movaps %xmm2,%xmm1
    157f:	e9 9a 00 00 00       	jmp    161e <func0+0xce>
    1584:	48 83 e1 fc          	and    $0xfffffffffffffffc,%rcx
    1588:	31 d2                	xor    %edx,%edx
    158a:	0f 28 da             	movaps %xmm2,%xmm3
    158d:	0f 1f 00             	nopl   (%rax)
    1590:	f3 0f 10 44 97 04    	movss  0x4(%rdi,%rdx,4),%xmm0
    1596:	f3 0f 10 4c 97 08    	movss  0x8(%rdi,%rdx,4),%xmm1
    159c:	0f 28 e0             	movaps %xmm0,%xmm4
    159f:	f3 0f 5d e3          	minss  %xmm3,%xmm4
    15a3:	f3 0f 5f c2          	maxss  %xmm2,%xmm0
    15a7:	0f 28 d1             	movaps %xmm1,%xmm2
    15aa:	f3 0f 5d d4          	minss  %xmm4,%xmm2
    15ae:	f3 0f 5f c8          	maxss  %xmm0,%xmm1
    15b2:	f3 0f 10 44 97 0c    	movss  0xc(%rdi,%rdx,4),%xmm0
    15b8:	0f 28 e0             	movaps %xmm0,%xmm4
    15bb:	f3 0f 5d e2          	minss  %xmm2,%xmm4
    15bf:	f3 0f 5f c1          	maxss  %xmm1,%xmm0
    15c3:	f3 0f 10 54 97 10    	movss  0x10(%rdi,%rdx,4),%xmm2
    15c9:	0f 28 da             	movaps %xmm2,%xmm3
    15cc:	f3 0f 5d dc          	minss  %xmm4,%xmm3
    15d0:	f3 0f 5f d0          	maxss  %xmm0,%xmm2
    15d4:	48 83 c2 04          	add    $0x4,%rdx
    15d8:	48 39 d1             	cmp    %rdx,%rcx
    15db:	75 b3                	jne    1590 <func0+0x40>
    15dd:	48 ff c2             	inc    %rdx
    15e0:	0f 28 c3             	movaps %xmm3,%xmm0
    15e3:	0f 28 ca             	movaps %xmm2,%xmm1
    15e6:	48 85 c0             	test   %rax,%rax
    15e9:	74 33                	je     161e <func0+0xce>
    15eb:	48 8d 0c 97          	lea    (%rdi,%rdx,4),%rcx
    15ef:	31 d2                	xor    %edx,%edx
    15f1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    15f8:	0f 1f 84 00 00 00 00 
    15ff:	00 
    1600:	f3 0f 10 0c 91       	movss  (%rcx,%rdx,4),%xmm1
    1605:	0f 28 c1             	movaps %xmm1,%xmm0
    1608:	f3 0f 5d c3          	minss  %xmm3,%xmm0
    160c:	f3 0f 5f ca          	maxss  %xmm2,%xmm1
    1610:	48 ff c2             	inc    %rdx
    1613:	0f 28 d1             	movaps %xmm1,%xmm2
    1616:	0f 28 d8             	movaps %xmm0,%xmm3
    1619:	48 39 d0             	cmp    %rdx,%rax
    161c:	75 e2                	jne    1600 <func0+0xb0>
    161e:	85 f6                	test   %esi,%esi
    1620:	0f 8e a4 00 00 00    	jle    16ca <func0+0x17a>
    1626:	f3 0f 5c c8          	subss  %xmm0,%xmm1
    162a:	83 fe 04             	cmp    $0x4,%esi
    162d:	73 04                	jae    1633 <func0+0xe3>
    162f:	31 c9                	xor    %ecx,%ecx
    1631:	eb 7d                	jmp    16b0 <func0+0x160>
    1633:	44 89 c1             	mov    %r8d,%ecx
    1636:	83 e1 fc             	and    $0xfffffffc,%ecx
    1639:	0f 28 d0             	movaps %xmm0,%xmm2
    163c:	0f c6 d0 00          	shufps $0x0,%xmm0,%xmm2
    1640:	0f 28 d9             	movaps %xmm1,%xmm3
    1643:	0f c6 d9 00          	shufps $0x0,%xmm1,%xmm3
    1647:	48 8d 51 fc          	lea    -0x4(%rcx),%rdx
    164b:	48 89 d0             	mov    %rdx,%rax
    164e:	48 c1 e8 02          	shr    $0x2,%rax
    1652:	48 ff c0             	inc    %rax
    1655:	48 85 d2             	test   %rdx,%rdx
    1658:	74 71                	je     16cb <func0+0x17b>
    165a:	48 89 c6             	mov    %rax,%rsi
    165d:	48 83 e6 fe          	and    $0xfffffffffffffffe,%rsi
    1661:	31 d2                	xor    %edx,%edx
    1663:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    166a:	84 00 00 00 00 00 
    1670:	0f 10 24 97          	movups (%rdi,%rdx,4),%xmm4
    1674:	0f 10 6c 97 10       	movups 0x10(%rdi,%rdx,4),%xmm5
    1679:	0f 5c e2             	subps  %xmm2,%xmm4
    167c:	0f 5e e3             	divps  %xmm3,%xmm4
    167f:	0f 11 24 97          	movups %xmm4,(%rdi,%rdx,4)
    1683:	0f 5c ea             	subps  %xmm2,%xmm5
    1686:	0f 5e eb             	divps  %xmm3,%xmm5
    1689:	0f 11 6c 97 10       	movups %xmm5,0x10(%rdi,%rdx,4)
    168e:	48 83 c2 08          	add    $0x8,%rdx
    1692:	48 83 c6 fe          	add    $0xfffffffffffffffe,%rsi
    1696:	75 d8                	jne    1670 <func0+0x120>
    1698:	a8 01                	test   $0x1,%al
    169a:	74 0e                	je     16aa <func0+0x15a>
    169c:	0f 10 24 97          	movups (%rdi,%rdx,4),%xmm4
    16a0:	0f 5c e2             	subps  %xmm2,%xmm4
    16a3:	0f 5e e3             	divps  %xmm3,%xmm4
    16a6:	0f 11 24 97          	movups %xmm4,(%rdi,%rdx,4)
    16aa:	4c 39 c1             	cmp    %r8,%rcx
    16ad:	74 1b                	je     16ca <func0+0x17a>
    16af:	90                   	nop
    16b0:	f3 0f 10 14 8f       	movss  (%rdi,%rcx,4),%xmm2
    16b5:	f3 0f 5c d0          	subss  %xmm0,%xmm2
    16b9:	f3 0f 5e d1          	divss  %xmm1,%xmm2
    16bd:	f3 0f 11 14 8f       	movss  %xmm2,(%rdi,%rcx,4)
    16c2:	48 ff c1             	inc    %rcx
    16c5:	49 39 c8             	cmp    %rcx,%r8
    16c8:	75 e6                	jne    16b0 <func0+0x160>
    16ca:	c3                   	ret    
    16cb:	31 d2                	xor    %edx,%edx
    16cd:	a8 01                	test   $0x1,%al
    16cf:	75 cb                	jne    169c <func0+0x14c>
    16d1:	eb d7                	jmp    16aa <func0+0x15a>

