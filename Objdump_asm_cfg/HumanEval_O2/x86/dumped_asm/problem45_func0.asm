00000000000014c0 <func0>:
    14c0:	53                   	push   %rbx
    14c1:	49 89 d2             	mov    %rdx,%r10
    14c4:	85 ff                	test   %edi,%edi
    14c6:	0f 8e c9 00 00 00    	jle    1595 <func0+0xd5>
    14cc:	89 f8                	mov    %edi,%eax
    14ce:	31 ff                	xor    %edi,%edi
    14d0:	99                   	cltd   
    14d1:	f7 fe                	idiv   %esi
    14d3:	80 c2 30             	add    $0x30,%dl
    14d6:	88 54 3c d0          	mov    %dl,-0x30(%rsp,%rdi,1)
    14da:	48 ff c7             	inc    %rdi
    14dd:	85 c0                	test   %eax,%eax
    14df:	7f ef                	jg     14d0 <func0+0x10>
    14e1:	85 ff                	test   %edi,%edi
    14e3:	0f 8e ac 00 00 00    	jle    1595 <func0+0xd5>
    14e9:	41 89 f8             	mov    %edi,%r8d
    14ec:	49 83 f8 08          	cmp    $0x8,%r8
    14f0:	0f 83 a8 00 00 00    	jae    159e <func0+0xde>
    14f6:	31 c0                	xor    %eax,%eax
    14f8:	4c 89 c3             	mov    %r8,%rbx
    14fb:	89 f9                	mov    %edi,%ecx
    14fd:	29 c1                	sub    %eax,%ecx
    14ff:	48 89 c6             	mov    %rax,%rsi
    1502:	48 f7 d6             	not    %rsi
    1505:	49 01 f0             	add    %rsi,%r8
    1508:	f6 c1 03             	test   $0x3,%cl
    150b:	74 29                	je     1536 <func0+0x76>
    150d:	89 f9                	mov    %edi,%ecx
    150f:	28 c1                	sub    %al,%cl
    1511:	0f b6 c9             	movzbl %cl,%ecx
    1514:	83 e1 03             	and    $0x3,%ecx
    1517:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    151e:	00 00 
    1520:	48 ff cb             	dec    %rbx
    1523:	89 de                	mov    %ebx,%esi
    1525:	0f b6 54 34 d0       	movzbl -0x30(%rsp,%rsi,1),%edx
    152a:	41 88 14 02          	mov    %dl,(%r10,%rax,1)
    152e:	48 ff c0             	inc    %rax
    1531:	48 ff c9             	dec    %rcx
    1534:	75 ea                	jne    1520 <func0+0x60>
    1536:	49 83 f8 03          	cmp    $0x3,%r8
    153a:	72 55                	jb     1591 <func0+0xd1>
    153c:	41 b8 fe ff ff ff    	mov    $0xfffffffe,%r8d
    1542:	89 fe                	mov    %edi,%esi
    1544:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    154b:	00 00 00 00 00 
    1550:	4a 8d 14 03          	lea    (%rbx,%r8,1),%rdx
    1554:	8d 4a 01             	lea    0x1(%rdx),%ecx
    1557:	0f b6 4c 0c d0       	movzbl -0x30(%rsp,%rcx,1),%ecx
    155c:	41 88 0c 02          	mov    %cl,(%r10,%rax,1)
    1560:	89 d1                	mov    %edx,%ecx
    1562:	0f b6 4c 0c d0       	movzbl -0x30(%rsp,%rcx,1),%ecx
    1567:	41 88 4c 02 01       	mov    %cl,0x1(%r10,%rax,1)
    156c:	ff ca                	dec    %edx
    156e:	0f b6 4c 14 d0       	movzbl -0x30(%rsp,%rdx,1),%ecx
    1573:	41 88 4c 02 02       	mov    %cl,0x2(%r10,%rax,1)
    1578:	48 83 c3 fc          	add    $0xfffffffffffffffc,%rbx
    157c:	89 d9                	mov    %ebx,%ecx
    157e:	0f b6 4c 0c d0       	movzbl -0x30(%rsp,%rcx,1),%ecx
    1583:	41 88 4c 02 03       	mov    %cl,0x3(%r10,%rax,1)
    1588:	48 83 c0 04          	add    $0x4,%rax
    158c:	48 39 c6             	cmp    %rax,%rsi
    158f:	75 bf                	jne    1550 <func0+0x90>
    1591:	89 f8                	mov    %edi,%eax
    1593:	eb 02                	jmp    1597 <func0+0xd7>
    1595:	31 c0                	xor    %eax,%eax
    1597:	41 c6 04 02 00       	movb   $0x0,(%r10,%rax,1)
    159c:	5b                   	pop    %rbx
    159d:	c3                   	ret    
    159e:	49 8d 48 ff          	lea    -0x1(%r8),%rcx
    15a2:	8d 57 ff             	lea    -0x1(%rdi),%edx
    15a5:	31 c0                	xor    %eax,%eax
    15a7:	39 ca                	cmp    %ecx,%edx
    15a9:	0f 82 49 ff ff ff    	jb     14f8 <func0+0x38>
    15af:	48 c1 e9 20          	shr    $0x20,%rcx
    15b3:	4c 89 c3             	mov    %r8,%rbx
    15b6:	0f 85 3f ff ff ff    	jne    14fb <func0+0x3b>
    15bc:	41 83 f8 20          	cmp    $0x20,%r8d
    15c0:	73 07                	jae    15c9 <func0+0x109>
    15c2:	31 c0                	xor    %eax,%eax
    15c4:	e9 c2 00 00 00       	jmp    168b <func0+0x1cb>
    15c9:	4c 8d 5f ff          	lea    -0x1(%rdi),%r11
    15cd:	41 89 f9             	mov    %edi,%r9d
    15d0:	89 fb                	mov    %edi,%ebx
    15d2:	83 e3 1f             	and    $0x1f,%ebx
    15d5:	4c 89 c0             	mov    %r8,%rax
    15d8:	48 29 d8             	sub    %rbx,%rax
    15db:	49 29 d9             	sub    %rbx,%r9
    15de:	31 c9                	xor    %ecx,%ecx
    15e0:	66 0f ef c0          	pxor   %xmm0,%xmm0
    15e4:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    15eb:	00 00 00 00 00 
    15f0:	44 89 de             	mov    %r11d,%esi
    15f3:	f3 0f 6f 4c 34 b1    	movdqu -0x4f(%rsp,%rsi,1),%xmm1
    15f9:	f3 0f 6f 54 34 c1    	movdqu -0x3f(%rsp,%rsi,1),%xmm2
    15ff:	66 0f 6f da          	movdqa %xmm2,%xmm3
    1603:	66 0f 60 d8          	punpcklbw %xmm0,%xmm3
    1607:	66 0f 70 db 4e       	pshufd $0x4e,%xmm3,%xmm3
    160c:	f2 0f 70 db 1b       	pshuflw $0x1b,%xmm3,%xmm3
    1611:	f3 0f 70 db 1b       	pshufhw $0x1b,%xmm3,%xmm3
    1616:	66 0f 68 d0          	punpckhbw %xmm0,%xmm2
    161a:	66 0f 70 d2 4e       	pshufd $0x4e,%xmm2,%xmm2
    161f:	f2 0f 70 d2 1b       	pshuflw $0x1b,%xmm2,%xmm2
    1624:	f3 0f 70 d2 1b       	pshufhw $0x1b,%xmm2,%xmm2
    1629:	66 0f 67 d3          	packuswb %xmm3,%xmm2
    162d:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    1631:	66 0f 60 d8          	punpcklbw %xmm0,%xmm3
    1635:	66 0f 70 db 4e       	pshufd $0x4e,%xmm3,%xmm3
    163a:	f2 0f 70 db 1b       	pshuflw $0x1b,%xmm3,%xmm3
    163f:	f3 0f 70 db 1b       	pshufhw $0x1b,%xmm3,%xmm3
    1644:	66 0f 68 c8          	punpckhbw %xmm0,%xmm1
    1648:	66 0f 70 c9 4e       	pshufd $0x4e,%xmm1,%xmm1
    164d:	f2 0f 70 c9 1b       	pshuflw $0x1b,%xmm1,%xmm1
    1652:	f3 0f 70 c9 1b       	pshufhw $0x1b,%xmm1,%xmm1
    1657:	66 0f 67 cb          	packuswb %xmm3,%xmm1
    165b:	f3 41 0f 7f 14 0a    	movdqu %xmm2,(%r10,%rcx,1)
    1661:	f3 41 0f 7f 4c 0a 10 	movdqu %xmm1,0x10(%r10,%rcx,1)
    1668:	48 83 c1 20          	add    $0x20,%rcx
    166c:	49 83 c3 e0          	add    $0xffffffffffffffe0,%r11
    1670:	49 39 c9             	cmp    %rcx,%r9
    1673:	0f 85 77 ff ff ff    	jne    15f0 <func0+0x130>
    1679:	48 85 db             	test   %rbx,%rbx
    167c:	0f 84 0f ff ff ff    	je     1591 <func0+0xd1>
    1682:	83 fb 08             	cmp    $0x8,%ebx
    1685:	0f 82 70 fe ff ff    	jb     14fb <func0+0x3b>
    168b:	49 89 c3             	mov    %rax,%r11
    168e:	41 89 f9             	mov    %edi,%r9d
    1691:	89 fb                	mov    %edi,%ebx
    1693:	83 e3 07             	and    $0x7,%ebx
    1696:	4c 89 c0             	mov    %r8,%rax
    1699:	48 29 d8             	sub    %rbx,%rax
    169c:	4c 89 d9             	mov    %r11,%rcx
    169f:	48 f7 d1             	not    %rcx
    16a2:	48 01 f9             	add    %rdi,%rcx
    16a5:	49 29 d9             	sub    %rbx,%r9
    16a8:	66 0f ef c0          	pxor   %xmm0,%xmm0
    16ac:	0f 1f 40 00          	nopl   0x0(%rax)
    16b0:	89 ce                	mov    %ecx,%esi
    16b2:	f3 0f 7e 4c 34 c9    	movq   -0x37(%rsp,%rsi,1),%xmm1
    16b8:	66 0f 60 c8          	punpcklbw %xmm0,%xmm1
    16bc:	66 0f 70 c9 4e       	pshufd $0x4e,%xmm1,%xmm1
    16c1:	f2 0f 70 c9 1b       	pshuflw $0x1b,%xmm1,%xmm1
    16c6:	f3 0f 70 c9 1b       	pshufhw $0x1b,%xmm1,%xmm1
    16cb:	66 0f 67 c9          	packuswb %xmm1,%xmm1
    16cf:	66 43 0f d6 0c 1a    	movq   %xmm1,(%r10,%r11,1)
    16d5:	49 83 c3 08          	add    $0x8,%r11
    16d9:	48 83 c1 f8          	add    $0xfffffffffffffff8,%rcx
    16dd:	4d 39 d9             	cmp    %r11,%r9
    16e0:	75 ce                	jne    16b0 <func0+0x1f0>
    16e2:	48 85 db             	test   %rbx,%rbx
    16e5:	0f 85 10 fe ff ff    	jne    14fb <func0+0x3b>
    16eb:	e9 a1 fe ff ff       	jmp    1591 <func0+0xd1>

