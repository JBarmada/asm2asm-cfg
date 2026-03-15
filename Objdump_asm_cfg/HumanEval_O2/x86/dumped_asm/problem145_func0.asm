0000000000001450 <func0>:
    1450:	55                   	push   %rbp
    1451:	41 57                	push   %r15
    1453:	41 56                	push   %r14
    1455:	41 55                	push   %r13
    1457:	41 54                	push   %r12
    1459:	53                   	push   %rbx
    145a:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
    1461:	49 89 f5             	mov    %rsi,%r13
    1464:	49 89 ff             	mov    %rdi,%r15
    1467:	0f b6 0f             	movzbl (%rdi),%ecx
    146a:	31 c0                	xor    %eax,%eax
    146c:	80 f9 2f             	cmp    $0x2f,%cl
    146f:	74 21                	je     1492 <func0+0x42>
    1471:	31 c0                	xor    %eax,%eax
    1473:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    147a:	84 00 00 00 00 00 
    1480:	88 4c 04 70          	mov    %cl,0x70(%rsp,%rax,1)
    1484:	41 0f b6 4c 07 01    	movzbl 0x1(%r15,%rax,1),%ecx
    148a:	48 ff c0             	inc    %rax
    148d:	80 f9 2f             	cmp    $0x2f,%cl
    1490:	75 ee                	jne    1480 <func0+0x30>
    1492:	89 c5                	mov    %eax,%ebp
    1494:	c6 44 2c 70 00       	movb   $0x0,0x70(%rsp,%rbp,1)
    1499:	31 db                	xor    %ebx,%ebx
    149b:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
    14a0:	31 f6                	xor    %esi,%esi
    14a2:	ba 0a 00 00 00       	mov    $0xa,%edx
    14a7:	e8 94 fb ff ff       	call   1040 <strtol@plt>
    14ac:	49 89 c6             	mov    %rax,%r14
    14af:	42 0f b6 44 3d 01    	movzbl 0x1(%rbp,%r15,1),%eax
    14b5:	b9 00 00 00 00       	mov    $0x0,%ecx
    14ba:	84 c0                	test   %al,%al
    14bc:	74 22                	je     14e0 <func0+0x90>
    14be:	49 8d 14 2f          	lea    (%r15,%rbp,1),%rdx
    14c2:	48 83 c2 02          	add    $0x2,%rdx
    14c6:	31 c9                	xor    %ecx,%ecx
    14c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    14cf:	00 
    14d0:	88 04 0c             	mov    %al,(%rsp,%rcx,1)
    14d3:	0f b6 04 0a          	movzbl (%rdx,%rcx,1),%eax
    14d7:	48 ff c1             	inc    %rcx
    14da:	84 c0                	test   %al,%al
    14dc:	75 f2                	jne    14d0 <func0+0x80>
    14de:	89 c9                	mov    %ecx,%ecx
    14e0:	c6 04 0c 00          	movb   $0x0,(%rsp,%rcx,1)
    14e4:	48 89 e7             	mov    %rsp,%rdi
    14e7:	31 f6                	xor    %esi,%esi
    14e9:	ba 0a 00 00 00       	mov    $0xa,%edx
    14ee:	e8 4d fb ff ff       	call   1040 <strtol@plt>
    14f3:	49 89 c7             	mov    %rax,%r15
    14f6:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
    14fb:	3c 2f                	cmp    $0x2f,%al
    14fd:	74 22                	je     1521 <func0+0xd1>
    14ff:	31 db                	xor    %ebx,%ebx
    1501:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1508:	0f 1f 84 00 00 00 00 
    150f:	00 
    1510:	88 44 1c 70          	mov    %al,0x70(%rsp,%rbx,1)
    1514:	41 0f b6 44 1d 01    	movzbl 0x1(%r13,%rbx,1),%eax
    151a:	48 ff c3             	inc    %rbx
    151d:	3c 2f                	cmp    $0x2f,%al
    151f:	75 ef                	jne    1510 <func0+0xc0>
    1521:	89 dd                	mov    %ebx,%ebp
    1523:	c6 44 2c 70 00       	movb   $0x0,0x70(%rsp,%rbp,1)
    1528:	31 db                	xor    %ebx,%ebx
    152a:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
    152f:	31 f6                	xor    %esi,%esi
    1531:	ba 0a 00 00 00       	mov    $0xa,%edx
    1536:	e8 05 fb ff ff       	call   1040 <strtol@plt>
    153b:	49 89 c4             	mov    %rax,%r12
    153e:	42 0f b6 44 2d 01    	movzbl 0x1(%rbp,%r13,1),%eax
    1544:	84 c0                	test   %al,%al
    1546:	74 28                	je     1570 <func0+0x120>
    1548:	4a 8d 14 2d 02 00 00 	lea    0x2(,%r13,1),%rdx
    154f:	00 
    1550:	48 01 ea             	add    %rbp,%rdx
    1553:	31 c9                	xor    %ecx,%ecx
    1555:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    155c:	00 00 00 00 
    1560:	88 04 0c             	mov    %al,(%rsp,%rcx,1)
    1563:	0f b6 04 0a          	movzbl (%rdx,%rcx,1),%eax
    1567:	48 ff c1             	inc    %rcx
    156a:	84 c0                	test   %al,%al
    156c:	75 f2                	jne    1560 <func0+0x110>
    156e:	89 cb                	mov    %ecx,%ebx
    1570:	c6 04 1c 00          	movb   $0x0,(%rsp,%rbx,1)
    1574:	48 89 e7             	mov    %rsp,%rdi
    1577:	31 f6                	xor    %esi,%esi
    1579:	ba 0a 00 00 00       	mov    $0xa,%edx
    157e:	e8 bd fa ff ff       	call   1040 <strtol@plt>
    1583:	48 89 c1             	mov    %rax,%rcx
    1586:	45 0f af f4          	imul   %r12d,%r14d
    158a:	41 0f af cf          	imul   %r15d,%ecx
    158e:	44 89 f0             	mov    %r14d,%eax
    1591:	99                   	cltd   
    1592:	f7 f9                	idiv   %ecx
    1594:	31 c0                	xor    %eax,%eax
    1596:	85 d2                	test   %edx,%edx
    1598:	0f 94 c0             	sete   %al
    159b:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
    15a2:	5b                   	pop    %rbx
    15a3:	41 5c                	pop    %r12
    15a5:	41 5d                	pop    %r13
    15a7:	41 5e                	pop    %r14
    15a9:	41 5f                	pop    %r15
    15ab:	5d                   	pop    %rbp
    15ac:	c3                   	ret    

