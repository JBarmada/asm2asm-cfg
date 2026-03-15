00000000000014c0 <func0>:
    14c0:	83 fe 02             	cmp    $0x2,%esi
    14c3:	0f 8c 87 01 00 00    	jl     1650 <func0+0x190>
    14c9:	41 89 f2             	mov    %esi,%r10d
    14cc:	4d 8d 42 ff          	lea    -0x1(%r10),%r8
    14d0:	b9 01 00 00 00       	mov    $0x1,%ecx
    14d5:	49 83 f8 08          	cmp    $0x8,%r8
    14d9:	0f 82 17 01 00 00    	jb     15f6 <func0+0x136>
    14df:	48 89 d0             	mov    %rdx,%rax
    14e2:	48 29 f8             	sub    %rdi,%rax
    14e5:	48 83 c0 fc          	add    $0xfffffffffffffffc,%rax
    14e9:	48 83 f8 20          	cmp    $0x20,%rax
    14ed:	0f 82 03 01 00 00    	jb     15f6 <func0+0x136>
    14f3:	4c 89 c1             	mov    %r8,%rcx
    14f6:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    14fa:	48 8d 41 f8          	lea    -0x8(%rcx),%rax
    14fe:	49 89 c1             	mov    %rax,%r9
    1501:	49 c1 e9 03          	shr    $0x3,%r9
    1505:	49 ff c1             	inc    %r9
    1508:	48 85 c0             	test   %rax,%rax
    150b:	0f 84 40 01 00 00    	je     1651 <func0+0x191>
    1511:	4c 89 c8             	mov    %r9,%rax
    1514:	48 83 e0 fe          	and    $0xfffffffffffffffe,%rax
    1518:	66 0f 6f 05 20 0c 00 	movdqa 0xc20(%rip),%xmm0        # 2140 <_IO_stdin_used+0x140>
    151f:	00 
    1520:	31 f6                	xor    %esi,%esi
    1522:	66 0f 6f 0d 26 0c 00 	movdqa 0xc26(%rip),%xmm1        # 2150 <_IO_stdin_used+0x150>
    1529:	00 
    152a:	66 0f 6f 15 2e 0c 00 	movdqa 0xc2e(%rip),%xmm2        # 2160 <_IO_stdin_used+0x160>
    1531:	00 
    1532:	66 0f 6f 1d 36 0c 00 	movdqa 0xc36(%rip),%xmm3        # 2170 <_IO_stdin_used+0x170>
    1539:	00 
    153a:	66 0f 6f 25 3e 0c 00 	movdqa 0xc3e(%rip),%xmm4        # 2180 <_IO_stdin_used+0x180>
    1541:	00 
    1542:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1549:	1f 84 00 00 00 00 00 
    1550:	66 0f 6f e8          	movdqa %xmm0,%xmm5
    1554:	66 0f fe e9          	paddd  %xmm1,%xmm5
    1558:	0f 5b f0             	cvtdq2ps %xmm0,%xmm6
    155b:	0f 5b ed             	cvtdq2ps %xmm5,%xmm5
    155e:	0f 10 7c b7 04       	movups 0x4(%rdi,%rsi,4),%xmm7
    1563:	0f 59 fe             	mulps  %xmm6,%xmm7
    1566:	0f 10 74 b7 14       	movups 0x14(%rdi,%rsi,4),%xmm6
    156b:	0f 59 f5             	mulps  %xmm5,%xmm6
    156e:	0f 11 3c b2          	movups %xmm7,(%rdx,%rsi,4)
    1572:	0f 11 74 b2 10       	movups %xmm6,0x10(%rdx,%rsi,4)
    1577:	66 0f 6f e8          	movdqa %xmm0,%xmm5
    157b:	66 0f fe ea          	paddd  %xmm2,%xmm5
    157f:	66 0f 6f f0          	movdqa %xmm0,%xmm6
    1583:	66 0f fe f3          	paddd  %xmm3,%xmm6
    1587:	0f 5b ed             	cvtdq2ps %xmm5,%xmm5
    158a:	0f 5b f6             	cvtdq2ps %xmm6,%xmm6
    158d:	0f 10 7c b7 24       	movups 0x24(%rdi,%rsi,4),%xmm7
    1592:	0f 59 fd             	mulps  %xmm5,%xmm7
    1595:	0f 10 6c b7 34       	movups 0x34(%rdi,%rsi,4),%xmm5
    159a:	0f 59 ee             	mulps  %xmm6,%xmm5
    159d:	0f 11 7c b2 20       	movups %xmm7,0x20(%rdx,%rsi,4)
    15a2:	0f 11 6c b2 30       	movups %xmm5,0x30(%rdx,%rsi,4)
    15a7:	48 83 c6 10          	add    $0x10,%rsi
    15ab:	66 0f fe c4          	paddd  %xmm4,%xmm0
    15af:	48 83 c0 fe          	add    $0xfffffffffffffffe,%rax
    15b3:	75 9b                	jne    1550 <func0+0x90>
    15b5:	41 f6 c1 01          	test   $0x1,%r9b
    15b9:	74 32                	je     15ed <func0+0x12d>
    15bb:	0f 5b c8             	cvtdq2ps %xmm0,%xmm1
    15be:	66 0f fe 05 8a 0b 00 	paddd  0xb8a(%rip),%xmm0        # 2150 <_IO_stdin_used+0x150>
    15c5:	00 
    15c6:	0f 5b c0             	cvtdq2ps %xmm0,%xmm0
    15c9:	48 8d 04 b5 00 00 00 	lea    0x0(,%rsi,4),%rax
    15d0:	00 
    15d1:	48 83 c8 04          	or     $0x4,%rax
    15d5:	0f 10 14 07          	movups (%rdi,%rax,1),%xmm2
    15d9:	0f 59 d1             	mulps  %xmm1,%xmm2
    15dc:	0f 10 4c 07 10       	movups 0x10(%rdi,%rax,1),%xmm1
    15e1:	0f 59 c8             	mulps  %xmm0,%xmm1
    15e4:	0f 11 14 b2          	movups %xmm2,(%rdx,%rsi,4)
    15e8:	0f 11 4c b2 10       	movups %xmm1,0x10(%rdx,%rsi,4)
    15ed:	49 39 c8             	cmp    %rcx,%r8
    15f0:	74 5e                	je     1650 <func0+0x190>
    15f2:	48 83 c9 01          	or     $0x1,%rcx
    15f6:	48 89 c8             	mov    %rcx,%rax
    15f9:	48 f7 d0             	not    %rax
    15fc:	41 f6 c2 01          	test   $0x1,%r10b
    1600:	75 15                	jne    1617 <func0+0x157>
    1602:	0f 57 c0             	xorps  %xmm0,%xmm0
    1605:	f3 0f 2a c1          	cvtsi2ss %ecx,%xmm0
    1609:	f3 0f 59 04 8f       	mulss  (%rdi,%rcx,4),%xmm0
    160e:	f3 0f 11 44 8a fc    	movss  %xmm0,-0x4(%rdx,%rcx,4)
    1614:	48 ff c1             	inc    %rcx
    1617:	4c 01 d0             	add    %r10,%rax
    161a:	74 34                	je     1650 <func0+0x190>
    161c:	0f 1f 40 00          	nopl   0x0(%rax)
    1620:	0f 57 c0             	xorps  %xmm0,%xmm0
    1623:	f3 0f 2a c1          	cvtsi2ss %ecx,%xmm0
    1627:	f3 0f 59 04 8f       	mulss  (%rdi,%rcx,4),%xmm0
    162c:	8d 41 01             	lea    0x1(%rcx),%eax
    162f:	0f 57 c9             	xorps  %xmm1,%xmm1
    1632:	f3 0f 2a c8          	cvtsi2ss %eax,%xmm1
    1636:	f3 0f 11 44 8a fc    	movss  %xmm0,-0x4(%rdx,%rcx,4)
    163c:	f3 0f 59 4c 8f 04    	mulss  0x4(%rdi,%rcx,4),%xmm1
    1642:	f3 0f 11 0c 8a       	movss  %xmm1,(%rdx,%rcx,4)
    1647:	48 83 c1 02          	add    $0x2,%rcx
    164b:	4c 39 d1             	cmp    %r10,%rcx
    164e:	75 d0                	jne    1620 <func0+0x160>
    1650:	c3                   	ret    
    1651:	66 0f 6f 05 e7 0a 00 	movdqa 0xae7(%rip),%xmm0        # 2140 <_IO_stdin_used+0x140>
    1658:	00 
    1659:	31 f6                	xor    %esi,%esi
    165b:	41 f6 c1 01          	test   $0x1,%r9b
    165f:	0f 85 56 ff ff ff    	jne    15bb <func0+0xfb>
    1665:	eb 86                	jmp    15ed <func0+0x12d>

