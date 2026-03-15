00000000000014e0 <func0>:
    14e0:	55                   	push   %rbp
    14e1:	41 57                	push   %r15
    14e3:	41 56                	push   %r14
    14e5:	53                   	push   %rbx
    14e6:	50                   	push   %rax
    14e7:	49 89 d6             	mov    %rdx,%r14
    14ea:	41 89 f7             	mov    %esi,%r15d
    14ed:	48 89 fb             	mov    %rdi,%rbx
    14f0:	48 63 ee             	movslq %esi,%rbp
    14f3:	48 8d 3c ad 00 00 00 	lea    0x0(,%rbp,4),%rdi
    14fa:	00 
    14fb:	e8 50 fb ff ff       	call   1050 <malloc@plt>
    1500:	41 c7 06 00 00 00 00 	movl   $0x0,(%r14)
    1507:	85 ed                	test   %ebp,%ebp
    1509:	7e 2d                	jle    1538 <func0+0x58>
    150b:	44 89 f9             	mov    %r15d,%ecx
    150e:	41 83 ff 01          	cmp    $0x1,%r15d
    1512:	75 2f                	jne    1543 <func0+0x63>
    1514:	31 d2                	xor    %edx,%edx
    1516:	31 f6                	xor    %esi,%esi
    1518:	f6 c1 01             	test   $0x1,%cl
    151b:	74 1b                	je     1538 <func0+0x58>
    151d:	f3 0f 10 04 b3       	movss  (%rbx,%rsi,4),%xmm0
    1522:	0f 57 c9             	xorps  %xmm1,%xmm1
    1525:	0f 2e c1             	ucomiss %xmm1,%xmm0
    1528:	76 0e                	jbe    1538 <func0+0x58>
    152a:	8d 4a 01             	lea    0x1(%rdx),%ecx
    152d:	41 89 0e             	mov    %ecx,(%r14)
    1530:	48 63 ca             	movslq %edx,%rcx
    1533:	f3 0f 11 04 88       	movss  %xmm0,(%rax,%rcx,4)
    1538:	48 83 c4 08          	add    $0x8,%rsp
    153c:	5b                   	pop    %rbx
    153d:	41 5e                	pop    %r14
    153f:	41 5f                	pop    %r15
    1541:	5d                   	pop    %rbp
    1542:	c3                   	ret    
    1543:	89 cf                	mov    %ecx,%edi
    1545:	83 e7 fe             	and    $0xfffffffe,%edi
    1548:	31 d2                	xor    %edx,%edx
    154a:	0f 57 c0             	xorps  %xmm0,%xmm0
    154d:	31 f6                	xor    %esi,%esi
    154f:	eb 18                	jmp    1569 <func0+0x89>
    1551:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1558:	0f 1f 84 00 00 00 00 
    155f:	00 
    1560:	48 83 c6 02          	add    $0x2,%rsi
    1564:	48 39 f7             	cmp    %rsi,%rdi
    1567:	74 af                	je     1518 <func0+0x38>
    1569:	f3 0f 10 0c b3       	movss  (%rbx,%rsi,4),%xmm1
    156e:	0f 2e c8             	ucomiss %xmm0,%xmm1
    1571:	76 0d                	jbe    1580 <func0+0xa0>
    1573:	48 63 ea             	movslq %edx,%rbp
    1576:	ff c2                	inc    %edx
    1578:	41 89 16             	mov    %edx,(%r14)
    157b:	f3 0f 11 0c a8       	movss  %xmm1,(%rax,%rbp,4)
    1580:	f3 0f 10 4c b3 04    	movss  0x4(%rbx,%rsi,4),%xmm1
    1586:	0f 2e c8             	ucomiss %xmm0,%xmm1
    1589:	76 d5                	jbe    1560 <func0+0x80>
    158b:	48 63 ea             	movslq %edx,%rbp
    158e:	ff c2                	inc    %edx
    1590:	41 89 16             	mov    %edx,(%r14)
    1593:	f3 0f 11 0c a8       	movss  %xmm1,(%rax,%rbp,4)
    1598:	eb c6                	jmp    1560 <func0+0x80>

