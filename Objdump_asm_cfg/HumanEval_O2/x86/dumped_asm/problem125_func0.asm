00000000000014a0 <func0>:
    14a0:	41 56                	push   %r14
    14a2:	53                   	push   %rbx
    14a3:	50                   	push   %rax
    14a4:	48 89 fb             	mov    %rdi,%rbx
    14a7:	e8 84 fb ff ff       	call   1030 <strlen@plt>
    14ac:	45 31 f6             	xor    %r14d,%r14d
    14af:	48 83 f8 0a          	cmp    $0xa,%rax
    14b3:	0f 85 17 01 00 00    	jne    15d0 <func0+0x130>
    14b9:	0f b6 03             	movzbl (%rbx),%eax
    14bc:	8d 48 c6             	lea    -0x3a(%rax),%ecx
    14bf:	80 f9 f6             	cmp    $0xf6,%cl
    14c2:	0f 82 08 01 00 00    	jb     15d0 <func0+0x130>
    14c8:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
    14cc:	8d 51 c6             	lea    -0x3a(%rcx),%edx
    14cf:	80 fa f6             	cmp    $0xf6,%dl
    14d2:	0f 82 f8 00 00 00    	jb     15d0 <func0+0x130>
    14d8:	80 7b 02 2d          	cmpb   $0x2d,0x2(%rbx)
    14dc:	0f 85 ee 00 00 00    	jne    15d0 <func0+0x130>
    14e2:	44 0f b6 43 03       	movzbl 0x3(%rbx),%r8d
    14e7:	41 8d 70 c6          	lea    -0x3a(%r8),%esi
    14eb:	40 80 fe f6          	cmp    $0xf6,%sil
    14ef:	0f 82 db 00 00 00    	jb     15d0 <func0+0x130>
    14f5:	0f b6 73 04          	movzbl 0x4(%rbx),%esi
    14f9:	8d 7e c6             	lea    -0x3a(%rsi),%edi
    14fc:	40 80 ff f6          	cmp    $0xf6,%dil
    1500:	0f 82 ca 00 00 00    	jb     15d0 <func0+0x130>
    1506:	80 7b 05 2d          	cmpb   $0x2d,0x5(%rbx)
    150a:	0f 85 c0 00 00 00    	jne    15d0 <func0+0x130>
    1510:	0f b6 53 06          	movzbl 0x6(%rbx),%edx
    1514:	80 c2 c6             	add    $0xc6,%dl
    1517:	80 fa f6             	cmp    $0xf6,%dl
    151a:	0f 82 b0 00 00 00    	jb     15d0 <func0+0x130>
    1520:	0f b6 53 07          	movzbl 0x7(%rbx),%edx
    1524:	80 c2 c6             	add    $0xc6,%dl
    1527:	80 fa f6             	cmp    $0xf6,%dl
    152a:	0f 82 a0 00 00 00    	jb     15d0 <func0+0x130>
    1530:	0f b6 53 08          	movzbl 0x8(%rbx),%edx
    1534:	80 c2 c6             	add    $0xc6,%dl
    1537:	80 fa f6             	cmp    $0xf6,%dl
    153a:	0f 82 90 00 00 00    	jb     15d0 <func0+0x130>
    1540:	0f b6 53 09          	movzbl 0x9(%rbx),%edx
    1544:	80 c2 c6             	add    $0xc6,%dl
    1547:	80 fa f6             	cmp    $0xf6,%dl
    154a:	0f 82 80 00 00 00    	jb     15d0 <func0+0x130>
    1550:	88 44 24 05          	mov    %al,0x5(%rsp)
    1554:	88 4c 24 06          	mov    %cl,0x6(%rsp)
    1558:	c6 44 24 07 00       	movb   $0x0,0x7(%rsp)
    155d:	44 88 44 24 02       	mov    %r8b,0x2(%rsp)
    1562:	40 88 74 24 03       	mov    %sil,0x3(%rsp)
    1567:	c6 44 24 04 00       	movb   $0x0,0x4(%rsp)
    156c:	45 31 f6             	xor    %r14d,%r14d
    156f:	48 8d 7c 24 05       	lea    0x5(%rsp),%rdi
    1574:	31 f6                	xor    %esi,%esi
    1576:	ba 0a 00 00 00       	mov    $0xa,%edx
    157b:	e8 d0 fa ff ff       	call   1050 <strtol@plt>
    1580:	48 89 c3             	mov    %rax,%rbx
    1583:	48 8d 7c 24 02       	lea    0x2(%rsp),%rdi
    1588:	31 f6                	xor    %esi,%esi
    158a:	ba 0a 00 00 00       	mov    $0xa,%edx
    158f:	e8 bc fa ff ff       	call   1050 <strtol@plt>
    1594:	8d 4b f3             	lea    -0xd(%rbx),%ecx
    1597:	83 f9 f4             	cmp    $0xfffffff4,%ecx
    159a:	72 34                	jb     15d0 <func0+0x130>
    159c:	8d 48 e0             	lea    -0x20(%rax),%ecx
    159f:	83 f9 e1             	cmp    $0xffffffe1,%ecx
    15a2:	72 2c                	jb     15d0 <func0+0x130>
    15a4:	89 d9                	mov    %ebx,%ecx
    15a6:	83 e1 fd             	and    $0xfffffffd,%ecx
    15a9:	83 f9 04             	cmp    $0x4,%ecx
    15ac:	0f 95 c2             	setne  %dl
    15af:	83 f9 09             	cmp    $0x9,%ecx
    15b2:	0f 95 c1             	setne  %cl
    15b5:	84 ca                	test   %cl,%dl
    15b7:	75 05                	jne    15be <func0+0x11e>
    15b9:	83 f8 1f             	cmp    $0x1f,%eax
    15bc:	74 12                	je     15d0 <func0+0x130>
    15be:	83 fb 02             	cmp    $0x2,%ebx
    15c1:	0f 95 c1             	setne  %cl
    15c4:	83 f8 1e             	cmp    $0x1e,%eax
    15c7:	0f 92 c0             	setb   %al
    15ca:	08 c8                	or     %cl,%al
    15cc:	44 0f b6 f0          	movzbl %al,%r14d
    15d0:	44 89 f0             	mov    %r14d,%eax
    15d3:	48 83 c4 08          	add    $0x8,%rsp
    15d7:	5b                   	pop    %rbx
    15d8:	41 5e                	pop    %r14
    15da:	c3                   	ret    

