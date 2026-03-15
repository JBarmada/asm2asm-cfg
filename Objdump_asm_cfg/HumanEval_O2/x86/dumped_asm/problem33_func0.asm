0000000000001410 <func0>:
    1410:	f2 0f 10 0f          	movsd  (%rdi),%xmm1
    1414:	41 89 f1             	mov    %esi,%r9d
    1417:	66 0f 28 d1          	movapd %xmm1,%xmm2
    141b:	83 fe 02             	cmp    $0x2,%esi
    141e:	0f 8c 87 00 00 00    	jl     14ab <func0+0x9b>
    1424:	ba 01 00 00 00       	mov    $0x1,%edx
    1429:	45 31 c0             	xor    %r8d,%r8d
    142c:	f2 0f 10 05 d4 0b 00 	movsd  0xbd4(%rip),%xmm0        # 2008 <_IO_stdin_used+0x8>
    1433:	00 
    1434:	66 0f 57 db          	xorpd  %xmm3,%xmm3
    1438:	66 0f 28 d1          	movapd %xmm1,%xmm2
    143c:	eb 16                	jmp    1454 <func0+0x44>
    143e:	66 90                	xchg   %ax,%ax
    1440:	f2 0f 59 24 d7       	mulsd  (%rdi,%rdx,8),%xmm4
    1445:	f2 0f 58 d4          	addsd  %xmm4,%xmm2
    1449:	48 ff c2             	inc    %rdx
    144c:	49 ff c0             	inc    %r8
    144f:	4c 39 ca             	cmp    %r9,%rdx
    1452:	74 57                	je     14ab <func0+0x9b>
    1454:	66 0f 28 e0          	movapd %xmm0,%xmm4
    1458:	49 83 f8 07          	cmp    $0x7,%r8
    145c:	72 38                	jb     1496 <func0+0x86>
    145e:	48 89 d1             	mov    %rdx,%rcx
    1461:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    1465:	66 0f 28 e0          	movapd %xmm0,%xmm4
    1469:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1470:	f2 0f 59 e3          	mulsd  %xmm3,%xmm4
    1474:	f2 0f 59 e3          	mulsd  %xmm3,%xmm4
    1478:	f2 0f 59 e3          	mulsd  %xmm3,%xmm4
    147c:	f2 0f 59 e3          	mulsd  %xmm3,%xmm4
    1480:	f2 0f 59 e3          	mulsd  %xmm3,%xmm4
    1484:	f2 0f 59 e3          	mulsd  %xmm3,%xmm4
    1488:	f2 0f 59 e3          	mulsd  %xmm3,%xmm4
    148c:	f2 0f 59 e3          	mulsd  %xmm3,%xmm4
    1490:	48 83 c1 f8          	add    $0xfffffffffffffff8,%rcx
    1494:	75 da                	jne    1470 <func0+0x60>
    1496:	f6 c2 07             	test   $0x7,%dl
    1499:	74 a5                	je     1440 <func0+0x30>
    149b:	89 d0                	mov    %edx,%eax
    149d:	83 e0 07             	and    $0x7,%eax
    14a0:	f2 0f 59 e3          	mulsd  %xmm3,%xmm4
    14a4:	48 ff c8             	dec    %rax
    14a7:	75 f7                	jne    14a0 <func0+0x90>
    14a9:	eb 95                	jmp    1440 <func0+0x30>
    14ab:	66 0f 28 1d 6d 0b 00 	movapd 0xb6d(%rip),%xmm3        # 2020 <_IO_stdin_used+0x20>
    14b2:	00 
    14b3:	66 0f 54 da          	andpd  %xmm2,%xmm3
    14b7:	66 0f 57 c0          	xorpd  %xmm0,%xmm0
    14bb:	66 0f 2e 1d c5 0b 00 	ucomisd 0xbc5(%rip),%xmm3        # 2088 <_IO_stdin_used+0x88>
    14c2:	00 
    14c3:	0f 86 92 01 00 00    	jbe    165b <func0+0x24b>
    14c9:	66 0f 57 c0          	xorpd  %xmm0,%xmm0
    14cd:	f2 0f 10 35 33 0b 00 	movsd  0xb33(%rip),%xmm6        # 2008 <_IO_stdin_used+0x8>
    14d4:	00 
    14d5:	66 44 0f 28 0d 42 0b 	movapd 0xb42(%rip),%xmm9        # 2020 <_IO_stdin_used+0x20>
    14dc:	00 00 
    14de:	f2 0f 10 2d a2 0b 00 	movsd  0xba2(%rip),%xmm5        # 2088 <_IO_stdin_used+0x88>
    14e5:	00 
    14e6:	f2 44 0f 10 05 a1 0b 	movsd  0xba1(%rip),%xmm8        # 2090 <_IO_stdin_used+0x90>
    14ed:	00 00 
    14ef:	eb 2f                	jmp    1520 <func0+0x110>
    14f1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    14f8:	0f 1f 84 00 00 00 00 
    14ff:	00 
    1500:	f2 41 0f 5e d0       	divsd  %xmm8,%xmm2
    1505:	f2 0f 58 c2          	addsd  %xmm2,%xmm0
    1509:	66 0f 28 d1          	movapd %xmm1,%xmm2
    150d:	66 0f 28 da          	movapd %xmm2,%xmm3
    1511:	66 41 0f 54 d9       	andpd  %xmm9,%xmm3
    1516:	66 0f 2e dd          	ucomisd %xmm5,%xmm3
    151a:	0f 86 3b 01 00 00    	jbe    165b <func0+0x24b>
    1520:	83 fe 02             	cmp    $0x2,%esi
    1523:	7c db                	jl     1500 <func0+0xf0>
    1525:	66 0f 57 ff          	xorpd  %xmm7,%xmm7
    1529:	b9 01 00 00 00       	mov    $0x1,%ecx
    152e:	31 c0                	xor    %eax,%eax
    1530:	eb 2d                	jmp    155f <func0+0x14f>
    1532:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1539:	1f 84 00 00 00 00 00 
    1540:	0f 57 e4             	xorps  %xmm4,%xmm4
    1543:	f2 0f 2a e1          	cvtsi2sd %ecx,%xmm4
    1547:	f2 0f 59 24 cf       	mulsd  (%rdi,%rcx,8),%xmm4
    154c:	f2 0f 59 e3          	mulsd  %xmm3,%xmm4
    1550:	f2 0f 58 fc          	addsd  %xmm4,%xmm7
    1554:	48 ff c1             	inc    %rcx
    1557:	48 ff c0             	inc    %rax
    155a:	4c 39 c9             	cmp    %r9,%rcx
    155d:	74 71                	je     15d0 <func0+0x1c0>
    155f:	66 0f 28 de          	movapd %xmm6,%xmm3
    1563:	48 83 f9 02          	cmp    $0x2,%rcx
    1567:	72 d7                	jb     1540 <func0+0x130>
    1569:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    156d:	66 0f 28 de          	movapd %xmm6,%xmm3
    1571:	48 83 fa 07          	cmp    $0x7,%rdx
    1575:	72 3f                	jb     15b6 <func0+0x1a6>
    1577:	48 89 c2             	mov    %rax,%rdx
    157a:	48 83 e2 f8          	and    $0xfffffffffffffff8,%rdx
    157e:	66 0f 28 de          	movapd %xmm6,%xmm3
    1582:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1589:	1f 84 00 00 00 00 00 
    1590:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    1594:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    1598:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    159c:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    15a0:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    15a4:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    15a8:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    15ac:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    15b0:	48 83 c2 f8          	add    $0xfffffffffffffff8,%rdx
    15b4:	75 da                	jne    1590 <func0+0x180>
    15b6:	a8 07                	test   $0x7,%al
    15b8:	74 86                	je     1540 <func0+0x130>
    15ba:	89 c2                	mov    %eax,%edx
    15bc:	83 e2 07             	and    $0x7,%edx
    15bf:	90                   	nop
    15c0:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    15c4:	48 ff ca             	dec    %rdx
    15c7:	75 f7                	jne    15c0 <func0+0x1b0>
    15c9:	e9 72 ff ff ff       	jmp    1540 <func0+0x130>
    15ce:	66 90                	xchg   %ax,%ax
    15d0:	f2 0f 5e d7          	divsd  %xmm7,%xmm2
    15d4:	f2 0f 5c c2          	subsd  %xmm2,%xmm0
    15d8:	83 fe 02             	cmp    $0x2,%esi
    15db:	0f 8c 28 ff ff ff    	jl     1509 <func0+0xf9>
    15e1:	b9 01 00 00 00       	mov    $0x1,%ecx
    15e6:	31 d2                	xor    %edx,%edx
    15e8:	66 0f 28 d1          	movapd %xmm1,%xmm2
    15ec:	eb 1a                	jmp    1608 <func0+0x1f8>
    15ee:	66 90                	xchg   %ax,%ax
    15f0:	f2 0f 59 1c cf       	mulsd  (%rdi,%rcx,8),%xmm3
    15f5:	f2 0f 58 d3          	addsd  %xmm3,%xmm2
    15f9:	48 ff c1             	inc    %rcx
    15fc:	48 ff c2             	inc    %rdx
    15ff:	4c 39 c9             	cmp    %r9,%rcx
    1602:	0f 84 05 ff ff ff    	je     150d <func0+0xfd>
    1608:	66 0f 28 de          	movapd %xmm6,%xmm3
    160c:	48 83 fa 07          	cmp    $0x7,%rdx
    1610:	72 34                	jb     1646 <func0+0x236>
    1612:	48 89 c8             	mov    %rcx,%rax
    1615:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
    1619:	66 0f 28 de          	movapd %xmm6,%xmm3
    161d:	0f 1f 00             	nopl   (%rax)
    1620:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    1624:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    1628:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    162c:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    1630:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    1634:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    1638:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    163c:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    1640:	48 83 c0 f8          	add    $0xfffffffffffffff8,%rax
    1644:	75 da                	jne    1620 <func0+0x210>
    1646:	f6 c1 07             	test   $0x7,%cl
    1649:	74 a5                	je     15f0 <func0+0x1e0>
    164b:	89 c8                	mov    %ecx,%eax
    164d:	83 e0 07             	and    $0x7,%eax
    1650:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
    1654:	48 ff c8             	dec    %rax
    1657:	75 f7                	jne    1650 <func0+0x240>
    1659:	eb 95                	jmp    15f0 <func0+0x1e0>
    165b:	c3                   	ret    

