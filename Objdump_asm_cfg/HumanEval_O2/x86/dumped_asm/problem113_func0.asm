0000000000001530 <func0>:
    1530:	55                   	push   %rbp
    1531:	41 57                	push   %r15
    1533:	41 56                	push   %r14
    1535:	41 55                	push   %r13
    1537:	41 54                	push   %r12
    1539:	53                   	push   %rbx
    153a:	50                   	push   %rax
    153b:	49 89 ce             	mov    %rcx,%r14
    153e:	49 89 d7             	mov    %rdx,%r15
    1541:	49 89 f5             	mov    %rsi,%r13
    1544:	48 89 fd             	mov    %rdi,%rbp
    1547:	e8 04 fb ff ff       	call   1050 <strlen@plt>
    154c:	ff c0                	inc    %eax
    154e:	48 63 f8             	movslq %eax,%rdi
    1551:	e8 1a fb ff ff       	call   1070 <malloc@plt>
    1556:	49 89 c4             	mov    %rax,%r12
    1559:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
    155d:	84 d2                	test   %dl,%dl
    155f:	74 3f                	je     15a0 <func0+0x70>
    1561:	41 0f b6 5d 00       	movzbl 0x0(%r13),%ebx
    1566:	49 ff c5             	inc    %r13
    1569:	31 f6                	xor    %esi,%esi
    156b:	31 c9                	xor    %ecx,%ecx
    156d:	eb 16                	jmp    1585 <func0+0x55>
    156f:	90                   	nop
    1570:	48 63 c1             	movslq %ecx,%rax
    1573:	ff c1                	inc    %ecx
    1575:	41 88 14 04          	mov    %dl,(%r12,%rax,1)
    1579:	0f b6 54 35 01       	movzbl 0x1(%rbp,%rsi,1),%edx
    157e:	48 ff c6             	inc    %rsi
    1581:	84 d2                	test   %dl,%dl
    1583:	74 1d                	je     15a2 <func0+0x72>
    1585:	4c 89 ef             	mov    %r13,%rdi
    1588:	89 d8                	mov    %ebx,%eax
    158a:	84 db                	test   %bl,%bl
    158c:	74 e2                	je     1570 <func0+0x40>
    158e:	66 90                	xchg   %ax,%ax
    1590:	38 c2                	cmp    %al,%dl
    1592:	74 e5                	je     1579 <func0+0x49>
    1594:	0f b6 07             	movzbl (%rdi),%eax
    1597:	48 ff c7             	inc    %rdi
    159a:	84 c0                	test   %al,%al
    159c:	75 f2                	jne    1590 <func0+0x60>
    159e:	eb d0                	jmp    1570 <func0+0x40>
    15a0:	31 c9                	xor    %ecx,%ecx
    15a2:	48 63 c1             	movslq %ecx,%rax
    15a5:	41 c6 04 04 00       	movb   $0x0,(%r12,%rax,1)
    15aa:	4c 89 e7             	mov    %r12,%rdi
    15ad:	e8 9e fa ff ff       	call   1050 <strlen@plt>
    15b2:	48 8d 2d 18 0b 00 00 	lea    0xb18(%rip),%rbp        # 20d1 <_IO_stdin_used+0xd1>
    15b9:	83 f8 02             	cmp    $0x2,%eax
    15bc:	7c 44                	jl     1602 <func0+0xd2>
    15be:	48 b9 00 00 00 00 ff 	movabs $0xffffffff00000000,%rcx
    15c5:	ff ff ff 
    15c8:	89 c2                	mov    %eax,%edx
    15ca:	d1 ea                	shr    %edx
    15cc:	48 c1 e0 20          	shl    $0x20,%rax
    15d0:	48 01 c8             	add    %rcx,%rax
    15d3:	31 f6                	xor    %esi,%esi
    15d5:	4c 8d 05 31 0a 00 00 	lea    0xa31(%rip),%r8        # 200d <_IO_stdin_used+0xd>
    15dc:	0f 1f 40 00          	nopl   0x0(%rax)
    15e0:	41 0f b6 1c 34       	movzbl (%r12,%rsi,1),%ebx
    15e5:	48 89 c7             	mov    %rax,%rdi
    15e8:	48 c1 ff 20          	sar    $0x20,%rdi
    15ec:	41 3a 1c 3c          	cmp    (%r12,%rdi,1),%bl
    15f0:	75 0d                	jne    15ff <func0+0xcf>
    15f2:	48 ff c6             	inc    %rsi
    15f5:	48 01 c8             	add    %rcx,%rax
    15f8:	48 39 f2             	cmp    %rsi,%rdx
    15fb:	75 e3                	jne    15e0 <func0+0xb0>
    15fd:	eb 03                	jmp    1602 <func0+0xd2>
    15ff:	4c 89 c5             	mov    %r8,%rbp
    1602:	4c 89 ff             	mov    %r15,%rdi
    1605:	4c 89 e6             	mov    %r12,%rsi
    1608:	e8 33 fa ff ff       	call   1040 <strcpy@plt>
    160d:	4c 89 f7             	mov    %r14,%rdi
    1610:	48 89 ee             	mov    %rbp,%rsi
    1613:	e8 28 fa ff ff       	call   1040 <strcpy@plt>
    1618:	4c 89 e7             	mov    %r12,%rdi
    161b:	48 83 c4 08          	add    $0x8,%rsp
    161f:	5b                   	pop    %rbx
    1620:	41 5c                	pop    %r12
    1622:	41 5d                	pop    %r13
    1624:	41 5e                	pop    %r14
    1626:	41 5f                	pop    %r15
    1628:	5d                   	pop    %rbp
    1629:	e9 02 fa ff ff       	jmp    1030 <free@plt>

