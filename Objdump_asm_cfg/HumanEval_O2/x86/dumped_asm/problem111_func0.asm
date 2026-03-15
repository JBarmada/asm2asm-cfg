00000000000014a0 <func0>:
    14a0:	85 f6                	test   %esi,%esi
    14a2:	7e 13                	jle    14b7 <func0+0x17>
    14a4:	41 89 f0             	mov    %esi,%r8d
    14a7:	83 fe 08             	cmp    $0x8,%esi
    14aa:	73 13                	jae    14bf <func0+0x1f>
    14ac:	45 31 c9             	xor    %r9d,%r9d
    14af:	45 31 d2             	xor    %r10d,%r10d
    14b2:	e9 e9 00 00 00       	jmp    15a0 <func0+0x100>
    14b7:	45 31 d2             	xor    %r10d,%r10d
    14ba:	e9 f5 00 00 00       	jmp    15b4 <func0+0x114>
    14bf:	45 89 c1             	mov    %r8d,%r9d
    14c2:	41 83 e1 f8          	and    $0xfffffff8,%r9d
    14c6:	49 8d 41 f8          	lea    -0x8(%r9),%rax
    14ca:	49 89 c2             	mov    %rax,%r10
    14cd:	49 c1 ea 03          	shr    $0x3,%r10
    14d1:	49 ff c2             	inc    %r10
    14d4:	48 85 c0             	test   %rax,%rax
    14d7:	0f 84 fc 01 00 00    	je     16d9 <func0+0x239>
    14dd:	4d 89 d3             	mov    %r10,%r11
    14e0:	49 83 e3 fe          	and    $0xfffffffffffffffe,%r11
    14e4:	66 0f ef db          	pxor   %xmm3,%xmm3
    14e8:	31 c0                	xor    %eax,%eax
    14ea:	66 0f 6f 15 ae 0d 00 	movdqa 0xdae(%rip),%xmm2        # 22a0 <_IO_stdin_used+0x2a0>
    14f1:	00 
    14f2:	66 0f ef e4          	pxor   %xmm4,%xmm4
    14f6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    14fd:	00 00 00 
    1500:	f3 0f 6f 2c 87       	movdqu (%rdi,%rax,4),%xmm5
    1505:	f3 0f 6f 74 87 10    	movdqu 0x10(%rdi,%rax,4),%xmm6
    150b:	f3 0f 6f 44 87 20    	movdqu 0x20(%rdi,%rax,4),%xmm0
    1511:	f3 0f 6f 4c 87 30    	movdqu 0x30(%rdi,%rax,4),%xmm1
    1517:	66 0f df ea          	pandn  %xmm2,%xmm5
    151b:	66 0f fe eb          	paddd  %xmm3,%xmm5
    151f:	66 0f df f2          	pandn  %xmm2,%xmm6
    1523:	66 0f fe f4          	paddd  %xmm4,%xmm6
    1527:	66 0f df c2          	pandn  %xmm2,%xmm0
    152b:	66 0f fe c5          	paddd  %xmm5,%xmm0
    152f:	66 0f df ca          	pandn  %xmm2,%xmm1
    1533:	66 0f fe ce          	paddd  %xmm6,%xmm1
    1537:	48 83 c0 10          	add    $0x10,%rax
    153b:	66 0f 6f d8          	movdqa %xmm0,%xmm3
    153f:	66 0f 6f e1          	movdqa %xmm1,%xmm4
    1543:	49 83 c3 fe          	add    $0xfffffffffffffffe,%r11
    1547:	75 b7                	jne    1500 <func0+0x60>
    1549:	41 f6 c2 01          	test   $0x1,%r10b
    154d:	74 23                	je     1572 <func0+0xd2>
    154f:	f3 0f 6f 14 87       	movdqu (%rdi,%rax,4),%xmm2
    1554:	f3 0f 6f 5c 87 10    	movdqu 0x10(%rdi,%rax,4),%xmm3
    155a:	66 0f 6f 25 3e 0d 00 	movdqa 0xd3e(%rip),%xmm4        # 22a0 <_IO_stdin_used+0x2a0>
    1561:	00 
    1562:	66 0f df d4          	pandn  %xmm4,%xmm2
    1566:	66 0f fe c2          	paddd  %xmm2,%xmm0
    156a:	66 0f df dc          	pandn  %xmm4,%xmm3
    156e:	66 0f fe cb          	paddd  %xmm3,%xmm1
    1572:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1576:	66 0f 70 c8 ee       	pshufd $0xee,%xmm0,%xmm1
    157b:	66 0f fe c8          	paddd  %xmm0,%xmm1
    157f:	66 0f 70 c1 55       	pshufd $0x55,%xmm1,%xmm0
    1584:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1588:	66 41 0f 7e c2       	movd   %xmm0,%r10d
    158d:	4d 39 c1             	cmp    %r8,%r9
    1590:	74 22                	je     15b4 <func0+0x114>
    1592:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1599:	1f 84 00 00 00 00 00 
    15a0:	42 8b 04 8f          	mov    (%rdi,%r9,4),%eax
    15a4:	f7 d0                	not    %eax
    15a6:	83 e0 01             	and    $0x1,%eax
    15a9:	41 01 c2             	add    %eax,%r10d
    15ac:	49 ff c1             	inc    %r9
    15af:	4d 39 c8             	cmp    %r9,%r8
    15b2:	75 ec                	jne    15a0 <func0+0x100>
    15b4:	85 c9                	test   %ecx,%ecx
    15b6:	0f 8e 07 01 00 00    	jle    16c3 <func0+0x223>
    15bc:	41 89 c9             	mov    %ecx,%r9d
    15bf:	83 f9 08             	cmp    $0x8,%ecx
    15c2:	73 07                	jae    15cb <func0+0x12b>
    15c4:	31 c9                	xor    %ecx,%ecx
    15c6:	e9 e5 00 00 00       	jmp    16b0 <func0+0x210>
    15cb:	44 89 c9             	mov    %r9d,%ecx
    15ce:	83 e1 f8             	and    $0xfffffff8,%ecx
    15d1:	66 41 0f 6e c2       	movd   %r10d,%xmm0
    15d6:	48 8d 41 f8          	lea    -0x8(%rcx),%rax
    15da:	49 89 c0             	mov    %rax,%r8
    15dd:	49 c1 e8 03          	shr    $0x3,%r8
    15e1:	49 ff c0             	inc    %r8
    15e4:	48 85 c0             	test   %rax,%rax
    15e7:	0f 84 05 01 00 00    	je     16f2 <func0+0x252>
    15ed:	4c 89 c7             	mov    %r8,%rdi
    15f0:	48 83 e7 fe          	and    $0xfffffffffffffffe,%rdi
    15f4:	66 0f ef db          	pxor   %xmm3,%xmm3
    15f8:	31 c0                	xor    %eax,%eax
    15fa:	66 0f 6f 15 9e 0c 00 	movdqa 0xc9e(%rip),%xmm2        # 22a0 <_IO_stdin_used+0x2a0>
    1601:	00 
    1602:	66 0f 6f e0          	movdqa %xmm0,%xmm4
    1606:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    160d:	00 00 00 
    1610:	f3 0f 6f 2c 82       	movdqu (%rdx,%rax,4),%xmm5
    1615:	f3 0f 6f 74 82 10    	movdqu 0x10(%rdx,%rax,4),%xmm6
    161b:	f3 0f 6f 44 82 20    	movdqu 0x20(%rdx,%rax,4),%xmm0
    1621:	f3 0f 6f 4c 82 30    	movdqu 0x30(%rdx,%rax,4),%xmm1
    1627:	66 0f df ea          	pandn  %xmm2,%xmm5
    162b:	66 0f fe ec          	paddd  %xmm4,%xmm5
    162f:	66 0f df f2          	pandn  %xmm2,%xmm6
    1633:	66 0f fe f3          	paddd  %xmm3,%xmm6
    1637:	66 0f df c2          	pandn  %xmm2,%xmm0
    163b:	66 0f fe c5          	paddd  %xmm5,%xmm0
    163f:	66 0f df ca          	pandn  %xmm2,%xmm1
    1643:	66 0f fe ce          	paddd  %xmm6,%xmm1
    1647:	48 83 c0 10          	add    $0x10,%rax
    164b:	66 0f 6f e0          	movdqa %xmm0,%xmm4
    164f:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    1653:	48 83 c7 fe          	add    $0xfffffffffffffffe,%rdi
    1657:	75 b7                	jne    1610 <func0+0x170>
    1659:	41 f6 c0 01          	test   $0x1,%r8b
    165d:	74 23                	je     1682 <func0+0x1e2>
    165f:	f3 0f 6f 14 82       	movdqu (%rdx,%rax,4),%xmm2
    1664:	f3 0f 6f 5c 82 10    	movdqu 0x10(%rdx,%rax,4),%xmm3
    166a:	66 0f 6f 25 2e 0c 00 	movdqa 0xc2e(%rip),%xmm4        # 22a0 <_IO_stdin_used+0x2a0>
    1671:	00 
    1672:	66 0f df d4          	pandn  %xmm4,%xmm2
    1676:	66 0f fe c2          	paddd  %xmm2,%xmm0
    167a:	66 0f df dc          	pandn  %xmm4,%xmm3
    167e:	66 0f fe cb          	paddd  %xmm3,%xmm1
    1682:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1686:	66 0f 70 c8 ee       	pshufd $0xee,%xmm0,%xmm1
    168b:	66 0f fe c8          	paddd  %xmm0,%xmm1
    168f:	66 0f 70 c1 55       	pshufd $0x55,%xmm1,%xmm0
    1694:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1698:	66 41 0f 7e c2       	movd   %xmm0,%r10d
    169d:	4c 39 c9             	cmp    %r9,%rcx
    16a0:	74 21                	je     16c3 <func0+0x223>
    16a2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    16a9:	1f 84 00 00 00 00 00 
    16b0:	8b 04 8a             	mov    (%rdx,%rcx,4),%eax
    16b3:	f7 d0                	not    %eax
    16b5:	83 e0 01             	and    $0x1,%eax
    16b8:	41 01 c2             	add    %eax,%r10d
    16bb:	48 ff c1             	inc    %rcx
    16be:	49 39 c9             	cmp    %rcx,%r9
    16c1:	75 ed                	jne    16b0 <func0+0x210>
    16c3:	41 39 f2             	cmp    %esi,%r10d
    16c6:	48 8d 0d df 09 00 00 	lea    0x9df(%rip),%rcx        # 20ac <_IO_stdin_used+0xac>
    16cd:	48 8d 05 6c 09 00 00 	lea    0x96c(%rip),%rax        # 2040 <_IO_stdin_used+0x40>
    16d4:	48 0f 4c c1          	cmovl  %rcx,%rax
    16d8:	c3                   	ret    
    16d9:	66 0f ef c0          	pxor   %xmm0,%xmm0
    16dd:	31 c0                	xor    %eax,%eax
    16df:	66 0f ef c9          	pxor   %xmm1,%xmm1
    16e3:	41 f6 c2 01          	test   $0x1,%r10b
    16e7:	0f 85 62 fe ff ff    	jne    154f <func0+0xaf>
    16ed:	e9 80 fe ff ff       	jmp    1572 <func0+0xd2>
    16f2:	66 0f ef c9          	pxor   %xmm1,%xmm1
    16f6:	31 c0                	xor    %eax,%eax
    16f8:	41 f6 c0 01          	test   $0x1,%r8b
    16fc:	0f 85 5d ff ff ff    	jne    165f <func0+0x1bf>
    1702:	e9 7b ff ff ff       	jmp    1682 <func0+0x1e2>

