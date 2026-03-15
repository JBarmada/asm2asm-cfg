0000000000001550 <func0>:
    1550:	55                   	push   %rbp
    1551:	41 56                	push   %r14
    1553:	53                   	push   %rbx
    1554:	49 89 f6             	mov    %rsi,%r14
    1557:	89 fd                	mov    %edi,%ebp
    1559:	bf 00 01 00 00       	mov    $0x100,%edi
    155e:	e8 ed fa ff ff       	call   1050 <malloc@plt>
    1563:	48 89 c1             	mov    %rax,%rcx
    1566:	41 c7 06 00 00 00 00 	movl   $0x0,(%r14)
    156d:	31 f6                	xor    %esi,%esi
    156f:	83 fd 04             	cmp    $0x4,%ebp
    1572:	7d 19                	jge    158d <func0+0x3d>
    1574:	83 fd 01             	cmp    $0x1,%ebp
    1577:	7e 0c                	jle    1585 <func0+0x35>
    1579:	8d 46 01             	lea    0x1(%rsi),%eax
    157c:	41 89 06             	mov    %eax,(%r14)
    157f:	48 63 c6             	movslq %esi,%rax
    1582:	89 2c 81             	mov    %ebp,(%rcx,%rax,4)
    1585:	48 89 c8             	mov    %rcx,%rax
    1588:	5b                   	pop    %rbx
    1589:	41 5e                	pop    %r14
    158b:	5d                   	pop    %rbp
    158c:	c3                   	ret    
    158d:	bf 02 00 00 00       	mov    $0x2,%edi
    1592:	31 f6                	xor    %esi,%esi
    1594:	eb 15                	jmp    15ab <func0+0x5b>
    1596:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    159d:	00 00 00 
    15a0:	ff c7                	inc    %edi
    15a2:	89 f8                	mov    %edi,%eax
    15a4:	0f af c7             	imul   %edi,%eax
    15a7:	39 e8                	cmp    %ebp,%eax
    15a9:	7f c9                	jg     1574 <func0+0x24>
    15ab:	89 e8                	mov    %ebp,%eax
    15ad:	99                   	cltd   
    15ae:	f7 ff                	idiv   %edi
    15b0:	85 d2                	test   %edx,%edx
    15b2:	75 ec                	jne    15a0 <func0+0x50>
    15b4:	48 63 c6             	movslq %esi,%rax
    15b7:	48 8d 1c 81          	lea    (%rcx,%rax,4),%rbx
    15bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    15c0:	89 e8                	mov    %ebp,%eax
    15c2:	99                   	cltd   
    15c3:	f7 ff                	idiv   %edi
    15c5:	89 3b                	mov    %edi,(%rbx)
    15c7:	89 c5                	mov    %eax,%ebp
    15c9:	99                   	cltd   
    15ca:	f7 ff                	idiv   %edi
    15cc:	48 83 c3 04          	add    $0x4,%rbx
    15d0:	ff c6                	inc    %esi
    15d2:	85 d2                	test   %edx,%edx
    15d4:	74 ea                	je     15c0 <func0+0x70>
    15d6:	41 89 36             	mov    %esi,(%r14)
    15d9:	eb c5                	jmp    15a0 <func0+0x50>

