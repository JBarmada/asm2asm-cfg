0000000000001310 <func0>:
    1310:	55                   	push   %rbp
    1311:	41 57                	push   %r15
    1313:	41 56                	push   %r14
    1315:	41 55                	push   %r13
    1317:	41 54                	push   %r12
    1319:	53                   	push   %rbx
    131a:	48 83 ec 48          	sub    $0x48,%rsp
    131e:	49 89 fe             	mov    %rdi,%r14
    1321:	e8 2a fd ff ff       	call   1050 <strlen@plt>
    1326:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    132b:	48 98                	cltq   
    132d:	48 01 c0             	add    %rax,%rax
    1330:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1335:	ff c0                	inc    %eax
    1337:	48 63 f8             	movslq %eax,%rdi
    133a:	e8 41 fd ff ff       	call   1080 <malloc@plt>
    133f:	48 89 c7             	mov    %rax,%rdi
    1342:	48 85 c0             	test   %rax,%rax
    1345:	0f 84 4a 03 00 00    	je     1695 <func0+0x385>
    134b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    1350:	48 63 d0             	movslq %eax,%rdx
    1353:	85 c0                	test   %eax,%eax
    1355:	48 89 3c 24          	mov    %rdi,(%rsp)
    1359:	0f 8e 5c 02 00 00    	jle    15bb <func0+0x2ab>
    135f:	49 bd 00 00 00 00 ff 	movabs $0xffffffff00000000,%r13
    1366:	ff ff ff 
    1369:	48 89 c1             	mov    %rax,%rcx
    136c:	48 c1 e1 20          	shl    $0x20,%rcx
    1370:	4c 63 d0             	movslq %eax,%r10
    1373:	45 89 d1             	mov    %r10d,%r9d
    1376:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    137b:	4a 8d 04 29          	lea    (%rcx,%r13,1),%rax
    137f:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    1384:	4a 8d 44 17 10       	lea    0x10(%rdi,%r10,1),%rax
    1389:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    138e:	4a 8d 04 17          	lea    (%rdi,%r10,1),%rax
    1392:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1397:	45 31 ff             	xor    %r15d,%r15d
    139a:	4d 89 f4             	mov    %r14,%r12
    139d:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
    13a2:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
    13a7:	eb 32                	jmp    13db <func0+0xcb>
    13a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13b0:	4b 8d 04 17          	lea    (%r15,%r10,1),%rax
    13b4:	48 8b 3c 24          	mov    (%rsp),%rdi
    13b8:	c6 04 07 00          	movb   $0x0,(%rdi,%rax,1)
    13bc:	84 db                	test   %bl,%bl
    13be:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
    13c3:	48 89 ea             	mov    %rbp,%rdx
    13c6:	0f 84 c9 02 00 00    	je     1695 <func0+0x385>
    13cc:	49 ff c7             	inc    %r15
    13cf:	49 ff c4             	inc    %r12
    13d2:	4d 39 cf             	cmp    %r9,%r15
    13d5:	0f 84 f6 01 00 00    	je     15d1 <func0+0x2c1>
    13db:	4c 89 d1             	mov    %r10,%rcx
    13de:	4c 29 f9             	sub    %r15,%rcx
    13e1:	48 83 f9 02          	cmp    $0x2,%rcx
    13e5:	7c 49                	jl     1430 <func0+0x120>
    13e7:	89 c8                	mov    %ecx,%eax
    13e9:	c1 e8 1f             	shr    $0x1f,%eax
    13ec:	01 c8                	add    %ecx,%eax
    13ee:	d1 f8                	sar    %eax
    13f0:	4c 63 c0             	movslq %eax,%r8
    13f3:	48 8b 6c 24 30       	mov    0x30(%rsp),%rbp
    13f8:	31 db                	xor    %ebx,%ebx
    13fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1400:	41 0f b6 0c 1c       	movzbl (%r12,%rbx,1),%ecx
    1405:	48 89 ee             	mov    %rbp,%rsi
    1408:	48 c1 fe 20          	sar    $0x20,%rsi
    140c:	41 3a 0c 36          	cmp    (%r14,%rsi,1),%cl
    1410:	75 ba                	jne    13cc <func0+0xbc>
    1412:	48 ff c3             	inc    %rbx
    1415:	4c 01 ed             	add    %r13,%rbp
    1418:	48 39 d8             	cmp    %rbx,%rax
    141b:	75 e3                	jne    1400 <func0+0xf0>
    141d:	4c 39 c3             	cmp    %r8,%rbx
    1420:	0f 9c c3             	setl   %bl
    1423:	eb 0d                	jmp    1432 <func0+0x122>
    1425:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    142c:	00 00 00 00 
    1430:	31 db                	xor    %ebx,%ebx
    1432:	4c 89 f6             	mov    %r14,%rsi
    1435:	48 89 d5             	mov    %rdx,%rbp
    1438:	e8 03 fc ff ff       	call   1040 <strncpy@plt>
    143d:	4d 85 ff             	test   %r15,%r15
    1440:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
    1445:	66 0f ef db          	pxor   %xmm3,%xmm3
    1449:	0f 84 61 ff ff ff    	je     13b0 <func0+0xa0>
    144f:	49 83 ff 08          	cmp    $0x8,%r15
    1453:	73 0b                	jae    1460 <func0+0x150>
    1455:	31 c0                	xor    %eax,%eax
    1457:	e9 2c 01 00 00       	jmp    1588 <func0+0x278>
    145c:	0f 1f 40 00          	nopl   0x0(%rax)
    1460:	49 83 ff 20          	cmp    $0x20,%r15
    1464:	73 07                	jae    146d <func0+0x15d>
    1466:	31 c0                	xor    %eax,%eax
    1468:	e9 b2 00 00 00       	jmp    151f <func0+0x20f>
    146d:	4c 89 f9             	mov    %r15,%rcx
    1470:	48 83 e1 e0          	and    $0xffffffffffffffe0,%rcx
    1474:	48 f7 d9             	neg    %rcx
    1477:	4c 89 f8             	mov    %r15,%rax
    147a:	48 ba e0 ff ff ff ff 	movabs $0x7fffffffffffffe0,%rdx
    1481:	ff ff 7f 
    1484:	48 21 d0             	and    %rdx,%rax
    1487:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
    148c:	31 f6                	xor    %esi,%esi
    148e:	66 90                	xchg   %ax,%ax
    1490:	f3 41 0f 6f 44 34 e0 	movdqu -0x20(%r12,%rsi,1),%xmm0
    1497:	f3 41 0f 6f 4c 34 f0 	movdqu -0x10(%r12,%rsi,1),%xmm1
    149e:	66 0f 6f d1          	movdqa %xmm1,%xmm2
    14a2:	66 0f 60 d3          	punpcklbw %xmm3,%xmm2
    14a6:	66 0f 70 d2 4e       	pshufd $0x4e,%xmm2,%xmm2
    14ab:	f2 0f 70 d2 1b       	pshuflw $0x1b,%xmm2,%xmm2
    14b0:	f3 0f 70 d2 1b       	pshufhw $0x1b,%xmm2,%xmm2
    14b5:	66 0f 68 cb          	punpckhbw %xmm3,%xmm1
    14b9:	66 0f 70 c9 4e       	pshufd $0x4e,%xmm1,%xmm1
    14be:	f2 0f 70 c9 1b       	pshuflw $0x1b,%xmm1,%xmm1
    14c3:	f3 0f 70 c9 1b       	pshufhw $0x1b,%xmm1,%xmm1
    14c8:	66 0f 67 ca          	packuswb %xmm2,%xmm1
    14cc:	66 0f 6f d0          	movdqa %xmm0,%xmm2
    14d0:	66 0f 60 d3          	punpcklbw %xmm3,%xmm2
    14d4:	66 0f 70 d2 4e       	pshufd $0x4e,%xmm2,%xmm2
    14d9:	f2 0f 70 d2 1b       	pshuflw $0x1b,%xmm2,%xmm2
    14de:	f3 0f 70 d2 1b       	pshufhw $0x1b,%xmm2,%xmm2
    14e3:	66 0f 68 c3          	punpckhbw %xmm3,%xmm0
    14e7:	66 0f 70 c0 4e       	pshufd $0x4e,%xmm0,%xmm0
    14ec:	f2 0f 70 c0 1b       	pshuflw $0x1b,%xmm0,%xmm0
    14f1:	f3 0f 70 c0 1b       	pshufhw $0x1b,%xmm0,%xmm0
    14f6:	66 0f 67 c2          	packuswb %xmm2,%xmm0
    14fa:	f3 0f 7f 4a f0       	movdqu %xmm1,-0x10(%rdx)
    14ff:	f3 0f 7f 02          	movdqu %xmm0,(%rdx)
    1503:	48 83 c6 e0          	add    $0xffffffffffffffe0,%rsi
    1507:	48 83 c2 20          	add    $0x20,%rdx
    150b:	48 39 f1             	cmp    %rsi,%rcx
    150e:	75 80                	jne    1490 <func0+0x180>
    1510:	49 39 c7             	cmp    %rax,%r15
    1513:	0f 84 97 fe ff ff    	je     13b0 <func0+0xa0>
    1519:	41 f6 c7 18          	test   $0x18,%r15b
    151d:	74 69                	je     1588 <func0+0x278>
    151f:	48 89 c1             	mov    %rax,%rcx
    1522:	4c 89 fa             	mov    %r15,%rdx
    1525:	48 83 e2 f8          	and    $0xfffffffffffffff8,%rdx
    1529:	48 f7 da             	neg    %rdx
    152c:	48 b8 e0 ff ff ff ff 	movabs $0x7fffffffffffffe0,%rax
    1533:	ff ff 7f 
    1536:	48 83 c0 18          	add    $0x18,%rax
    153a:	4c 21 f8             	and    %r15,%rax
    153d:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    1542:	48 01 ce             	add    %rcx,%rsi
    1545:	48 f7 d9             	neg    %rcx
    1548:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    154f:	00 
    1550:	f3 41 0f 7e 44 0c f8 	movq   -0x8(%r12,%rcx,1),%xmm0
    1557:	66 0f 60 c3          	punpcklbw %xmm3,%xmm0
    155b:	66 0f 70 c0 4e       	pshufd $0x4e,%xmm0,%xmm0
    1560:	f2 0f 70 c0 1b       	pshuflw $0x1b,%xmm0,%xmm0
    1565:	f3 0f 70 c0 1b       	pshufhw $0x1b,%xmm0,%xmm0
    156a:	66 0f 67 c0          	packuswb %xmm0,%xmm0
    156e:	66 0f d6 06          	movq   %xmm0,(%rsi)
    1572:	48 83 c1 f8          	add    $0xfffffffffffffff8,%rcx
    1576:	48 83 c6 08          	add    $0x8,%rsi
    157a:	48 39 ca             	cmp    %rcx,%rdx
    157d:	75 d1                	jne    1550 <func0+0x240>
    157f:	49 39 c7             	cmp    %rax,%r15
    1582:	0f 84 28 fe ff ff    	je     13b0 <func0+0xa0>
    1588:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    158d:	48 01 c1             	add    %rax,%rcx
    1590:	48 f7 d8             	neg    %rax
    1593:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    159a:	84 00 00 00 00 00 
    15a0:	41 0f b6 54 04 ff    	movzbl -0x1(%r12,%rax,1),%edx
    15a6:	88 11                	mov    %dl,(%rcx)
    15a8:	48 ff c1             	inc    %rcx
    15ab:	48 ff c8             	dec    %rax
    15ae:	4c 89 fa             	mov    %r15,%rdx
    15b1:	48 01 c2             	add    %rax,%rdx
    15b4:	75 ea                	jne    15a0 <func0+0x290>
    15b6:	e9 f5 fd ff ff       	jmp    13b0 <func0+0xa0>
    15bb:	4c 89 f6             	mov    %r14,%rsi
    15be:	e8 7d fa ff ff       	call   1040 <strncpy@plt>
    15c3:	48 8b 3c 24          	mov    (%rsp),%rdi
    15c7:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
    15cc:	e9 bf 00 00 00       	jmp    1690 <func0+0x380>
    15d1:	4c 89 f6             	mov    %r14,%rsi
    15d4:	4c 89 cb             	mov    %r9,%rbx
    15d7:	e8 64 fa ff ff       	call   1040 <strncpy@plt>
    15dc:	48 8b 3c 24          	mov    (%rsp),%rdi
    15e0:	4c 8b 5c 24 10       	mov    0x10(%rsp),%r11
    15e5:	45 85 db             	test   %r11d,%r11d
    15e8:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
    15ed:	0f 8e 9d 00 00 00    	jle    1690 <func0+0x380>
    15f3:	4d 63 c3             	movslq %r11d,%r8
    15f6:	83 fb 08             	cmp    $0x8,%ebx
    15f9:	49 89 df             	mov    %rbx,%r15
    15fc:	0f 83 a5 00 00 00    	jae    16a7 <func0+0x397>
    1602:	45 31 d2             	xor    %r10d,%r10d
    1605:	44 89 d8             	mov    %r11d,%eax
    1608:	44 29 d0             	sub    %r10d,%eax
    160b:	49 8d 52 01          	lea    0x1(%r10),%rdx
    160f:	a8 01                	test   $0x1,%al
    1611:	74 19                	je     162c <func0+0x31c>
    1613:	44 89 d0             	mov    %r10d,%eax
    1616:	f7 d0                	not    %eax
    1618:	44 01 d8             	add    %r11d,%eax
    161b:	48 98                	cltq   
    161d:	41 0f b6 04 06       	movzbl (%r14,%rax,1),%eax
    1622:	4d 01 c2             	add    %r8,%r10
    1625:	42 88 04 17          	mov    %al,(%rdi,%r10,1)
    1629:	49 89 d2             	mov    %rdx,%r10
    162c:	49 39 d7             	cmp    %rdx,%r15
    162f:	74 5f                	je     1690 <func0+0x380>
    1631:	48 ba 00 00 00 00 fe 	movabs $0xfffffffe00000000,%rdx
    1638:	ff ff ff 
    163b:	44 89 de             	mov    %r11d,%esi
    163e:	44 29 d6             	sub    %r10d,%esi
    1641:	83 c6 fe             	add    $0xfffffffe,%esi
    1644:	48 c1 e6 20          	shl    $0x20,%rsi
    1648:	44 89 d5             	mov    %r10d,%ebp
    164b:	f7 d5                	not    %ebp
    164d:	44 01 dd             	add    %r11d,%ebp
    1650:	48 c1 e5 20          	shl    $0x20,%rbp
    1654:	49 8d 04 38          	lea    (%r8,%rdi,1),%rax
    1658:	48 ff c0             	inc    %rax
    165b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1660:	48 89 e9             	mov    %rbp,%rcx
    1663:	48 c1 f9 20          	sar    $0x20,%rcx
    1667:	41 0f b6 1c 0e       	movzbl (%r14,%rcx,1),%ebx
    166c:	42 88 5c 10 ff       	mov    %bl,-0x1(%rax,%r10,1)
    1671:	48 89 f1             	mov    %rsi,%rcx
    1674:	48 c1 f9 20          	sar    $0x20,%rcx
    1678:	41 0f b6 1c 0e       	movzbl (%r14,%rcx,1),%ebx
    167d:	42 88 1c 10          	mov    %bl,(%rax,%r10,1)
    1681:	49 83 c2 02          	add    $0x2,%r10
    1685:	48 01 d6             	add    %rdx,%rsi
    1688:	48 01 d5             	add    %rdx,%rbp
    168b:	4d 39 d7             	cmp    %r10,%r15
    168e:	75 d0                	jne    1660 <func0+0x350>
    1690:	42 c6 04 0f 00       	movb   $0x0,(%rdi,%r9,1)
    1695:	48 89 f8             	mov    %rdi,%rax
    1698:	48 83 c4 48          	add    $0x48,%rsp
    169c:	5b                   	pop    %rbx
    169d:	41 5c                	pop    %r12
    169f:	41 5d                	pop    %r13
    16a1:	41 5e                	pop    %r14
    16a3:	41 5f                	pop    %r15
    16a5:	5d                   	pop    %rbp
    16a6:	c3                   	ret    
    16a7:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
    16ab:	41 8d 73 ff          	lea    -0x1(%r11),%esi
    16af:	89 f0                	mov    %esi,%eax
    16b1:	29 d0                	sub    %edx,%eax
    16b3:	45 31 d2             	xor    %r10d,%r10d
    16b6:	39 f0                	cmp    %esi,%eax
    16b8:	0f 8f 47 ff ff ff    	jg     1605 <func0+0x2f5>
    16be:	48 c1 ea 20          	shr    $0x20,%rdx
    16c2:	0f 85 3d ff ff ff    	jne    1605 <func0+0x2f5>
    16c8:	4c 89 f8             	mov    %r15,%rax
    16cb:	83 f8 20             	cmp    $0x20,%eax
    16ce:	4d 89 fa             	mov    %r15,%r10
    16d1:	73 0b                	jae    16de <func0+0x3ce>
    16d3:	4c 89 d0             	mov    %r10,%rax
    16d6:	45 31 d2             	xor    %r10d,%r10d
    16d9:	e9 d3 00 00 00       	jmp    17b1 <func0+0x4a1>
    16de:	44 89 da             	mov    %r11d,%edx
    16e1:	83 e2 1f             	and    $0x1f,%edx
    16e4:	49 29 d2             	sub    %rdx,%r10
    16e7:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
    16ec:	4c 01 ed             	add    %r13,%rbp
    16ef:	49 8d 34 38          	lea    (%r8,%rdi,1),%rsi
    16f3:	48 83 c6 10          	add    $0x10,%rsi
    16f7:	31 c9                	xor    %ecx,%ecx
    16f9:	66 0f ef c0          	pxor   %xmm0,%xmm0
    16fd:	48 b8 00 00 00 00 e0 	movabs $0xffffffe000000000,%rax
    1704:	ff ff ff 
    1707:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    170e:	00 00 
    1710:	48 89 eb             	mov    %rbp,%rbx
    1713:	48 c1 fb 20          	sar    $0x20,%rbx
    1717:	f3 41 0f 6f 4c 1e e1 	movdqu -0x1f(%r14,%rbx,1),%xmm1
    171e:	f3 41 0f 6f 54 1e f1 	movdqu -0xf(%r14,%rbx,1),%xmm2
    1725:	66 0f 6f da          	movdqa %xmm2,%xmm3
    1729:	66 0f 60 d8          	punpcklbw %xmm0,%xmm3
    172d:	66 0f 70 db 4e       	pshufd $0x4e,%xmm3,%xmm3
    1732:	f2 0f 70 db 1b       	pshuflw $0x1b,%xmm3,%xmm3
    1737:	f3 0f 70 db 1b       	pshufhw $0x1b,%xmm3,%xmm3
    173c:	66 0f 68 d0          	punpckhbw %xmm0,%xmm2
    1740:	66 0f 70 d2 4e       	pshufd $0x4e,%xmm2,%xmm2
    1745:	f2 0f 70 d2 1b       	pshuflw $0x1b,%xmm2,%xmm2
    174a:	f3 0f 70 d2 1b       	pshufhw $0x1b,%xmm2,%xmm2
    174f:	66 0f 67 d3          	packuswb %xmm3,%xmm2
    1753:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    1757:	66 0f 60 d8          	punpcklbw %xmm0,%xmm3
    175b:	66 0f 70 db 4e       	pshufd $0x4e,%xmm3,%xmm3
    1760:	f2 0f 70 db 1b       	pshuflw $0x1b,%xmm3,%xmm3
    1765:	f3 0f 70 db 1b       	pshufhw $0x1b,%xmm3,%xmm3
    176a:	66 0f 68 c8          	punpckhbw %xmm0,%xmm1
    176e:	66 0f 70 c9 4e       	pshufd $0x4e,%xmm1,%xmm1
    1773:	f2 0f 70 c9 1b       	pshuflw $0x1b,%xmm1,%xmm1
    1778:	f3 0f 70 c9 1b       	pshufhw $0x1b,%xmm1,%xmm1
    177d:	66 0f 67 cb          	packuswb %xmm3,%xmm1
    1781:	f3 0f 7f 54 0e f0    	movdqu %xmm2,-0x10(%rsi,%rcx,1)
    1787:	f3 0f 7f 0c 0e       	movdqu %xmm1,(%rsi,%rcx,1)
    178c:	48 83 c1 20          	add    $0x20,%rcx
    1790:	48 01 c5             	add    %rax,%rbp
    1793:	49 39 ca             	cmp    %rcx,%r10
    1796:	0f 85 74 ff ff ff    	jne    1710 <func0+0x400>
    179c:	48 85 d2             	test   %rdx,%rdx
    179f:	0f 84 eb fe ff ff    	je     1690 <func0+0x380>
    17a5:	4c 89 f8             	mov    %r15,%rax
    17a8:	83 fa 08             	cmp    $0x8,%edx
    17ab:	0f 82 54 fe ff ff    	jb     1605 <func0+0x2f5>
    17b1:	4c 89 d6             	mov    %r10,%rsi
    17b4:	44 89 dd             	mov    %r11d,%ebp
    17b7:	83 e5 07             	and    $0x7,%ebp
    17ba:	49 89 c2             	mov    %rax,%r10
    17bd:	49 29 ea             	sub    %rbp,%r10
    17c0:	89 f0                	mov    %esi,%eax
    17c2:	f7 d0                	not    %eax
    17c4:	44 01 d8             	add    %r11d,%eax
    17c7:	48 c1 e0 20          	shl    $0x20,%rax
    17cb:	4a 8d 0c 07          	lea    (%rdi,%r8,1),%rcx
    17cf:	66 0f ef c0          	pxor   %xmm0,%xmm0
    17d3:	48 bb 00 00 00 00 f8 	movabs $0xfffffff800000000,%rbx
    17da:	ff ff ff 
    17dd:	0f 1f 00             	nopl   (%rax)
    17e0:	48 89 c2             	mov    %rax,%rdx
    17e3:	48 c1 fa 20          	sar    $0x20,%rdx
    17e7:	f3 41 0f 7e 4c 16 f9 	movq   -0x7(%r14,%rdx,1),%xmm1
    17ee:	66 0f 60 c8          	punpcklbw %xmm0,%xmm1
    17f2:	66 0f 70 c9 4e       	pshufd $0x4e,%xmm1,%xmm1
    17f7:	f2 0f 70 c9 1b       	pshuflw $0x1b,%xmm1,%xmm1
    17fc:	f3 0f 70 c9 1b       	pshufhw $0x1b,%xmm1,%xmm1
    1801:	66 0f 67 c9          	packuswb %xmm1,%xmm1
    1805:	66 0f d6 0c 31       	movq   %xmm1,(%rcx,%rsi,1)
    180a:	48 83 c6 08          	add    $0x8,%rsi
    180e:	48 01 d8             	add    %rbx,%rax
    1811:	49 39 f2             	cmp    %rsi,%r10
    1814:	75 ca                	jne    17e0 <func0+0x4d0>
    1816:	48 85 ed             	test   %rbp,%rbp
    1819:	0f 85 e6 fd ff ff    	jne    1605 <func0+0x2f5>
    181f:	e9 6c fe ff ff       	jmp    1690 <func0+0x380>

