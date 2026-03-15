0000000000001520 <func0>:
    1520:	85 f6                	test   %esi,%esi
    1522:	74 61                	je     1585 <func0+0x65>
    1524:	53                   	push   %rbx
    1525:	83 fe 02             	cmp    $0x2,%esi
    1528:	7c 60                	jl     158a <func0+0x6a>
    152a:	44 8b 0f             	mov    (%rdi),%r9d
    152d:	44 8b 57 04          	mov    0x4(%rdi),%r10d
    1531:	b0 01                	mov    $0x1,%al
    1533:	45 39 ca             	cmp    %r9d,%r10d
    1536:	7c 54                	jl     158c <func0+0x6c>
    1538:	41 89 f0             	mov    %esi,%r8d
    153b:	ba 01 00 00 00       	mov    $0x1,%edx
    1540:	b0 01                	mov    $0x1,%al
    1542:	be 02 00 00 00       	mov    $0x2,%esi
    1547:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    154c:	0f 1f 40 00          	nopl   0x0(%rax)
    1550:	45 89 d3             	mov    %r10d,%r11d
    1553:	48 83 fa 02          	cmp    $0x2,%rdx
    1557:	72 0d                	jb     1566 <func0+0x46>
    1559:	45 39 cb             	cmp    %r9d,%r11d
    155c:	75 08                	jne    1566 <func0+0x46>
    155e:	89 d9                	mov    %ebx,%ecx
    1560:	44 3b 0c 8f          	cmp    (%rdi,%rcx,4),%r9d
    1564:	74 26                	je     158c <func0+0x6c>
    1566:	4c 39 c6             	cmp    %r8,%rsi
    1569:	0f 92 c0             	setb   %al
    156c:	74 1e                	je     158c <func0+0x6c>
    156e:	44 8b 14 b7          	mov    (%rdi,%rsi,4),%r10d
    1572:	48 ff c6             	inc    %rsi
    1575:	48 ff c3             	inc    %rbx
    1578:	48 ff c2             	inc    %rdx
    157b:	45 89 d9             	mov    %r11d,%r9d
    157e:	45 39 da             	cmp    %r11d,%r10d
    1581:	7d cd                	jge    1550 <func0+0x30>
    1583:	eb 07                	jmp    158c <func0+0x6c>
    1585:	b0 01                	mov    $0x1,%al
    1587:	24 01                	and    $0x1,%al
    1589:	c3                   	ret    
    158a:	31 c0                	xor    %eax,%eax
    158c:	34 01                	xor    $0x1,%al
    158e:	5b                   	pop    %rbx
    158f:	24 01                	and    $0x1,%al
    1591:	c3                   	ret    

