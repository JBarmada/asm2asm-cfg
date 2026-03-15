0000000000001590 <func0>:
    1590:	55                   	push   %rbp
    1591:	41 57                	push   %r15
    1593:	41 56                	push   %r14
    1595:	41 55                	push   %r13
    1597:	41 54                	push   %r12
    1599:	53                   	push   %rbx
    159a:	50                   	push   %rax
    159b:	49 89 d7             	mov    %rdx,%r15
    159e:	89 31                	mov    %esi,(%rcx)
    15a0:	85 f6                	test   %esi,%esi
    15a2:	0f 84 ae 00 00 00    	je     1656 <func0+0xc6>
    15a8:	41 89 f4             	mov    %esi,%r12d
    15ab:	49 89 fe             	mov    %rdi,%r14
    15ae:	4c 63 ee             	movslq %esi,%r13
    15b1:	4a 8d 3c ad 00 00 00 	lea    0x0(,%r13,4),%rdi
    15b8:	00 
    15b9:	e8 a2 fa ff ff       	call   1060 <malloc@plt>
    15be:	49 89 07             	mov    %rax,(%r15)
    15c1:	48 85 c0             	test   %rax,%rax
    15c4:	0f 84 a2 00 00 00    	je     166c <func0+0xdc>
    15ca:	48 89 c3             	mov    %rax,%rbx
    15cd:	44 89 e5             	mov    %r12d,%ebp
    15d0:	45 85 e4             	test   %r12d,%r12d
    15d3:	7e 13                	jle    15e8 <func0+0x58>
    15d5:	48 8d 14 ad 00 00 00 	lea    0x0(,%rbp,4),%rdx
    15dc:	00 
    15dd:	48 89 df             	mov    %rbx,%rdi
    15e0:	4c 89 f6             	mov    %r14,%rsi
    15e3:	e8 68 fa ff ff       	call   1050 <memcpy@plt>
    15e8:	41 83 fc 02          	cmp    $0x2,%r12d
    15ec:	7c 6f                	jl     165d <func0+0xcd>
    15ee:	41 ff cc             	dec    %r12d
    15f1:	47 8b 54 ae fc       	mov    -0x4(%r14,%r13,4),%r10d
    15f6:	45 03 16             	add    (%r14),%r10d
    15f9:	41 81 e2 01 00 00 80 	and    $0x80000001,%r10d
    1600:	45 89 e0             	mov    %r12d,%r8d
    1603:	45 31 c9             	xor    %r9d,%r9d
    1606:	48 89 da             	mov    %rbx,%rdx
    1609:	eb 11                	jmp    161c <func0+0x8c>
    160b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1610:	48 83 c2 04          	add    $0x4,%rdx
    1614:	48 ff cd             	dec    %rbp
    1617:	4d 39 c1             	cmp    %r8,%r9
    161a:	74 41                	je     165d <func0+0xcd>
    161c:	4c 89 cf             	mov    %r9,%rdi
    161f:	49 ff c1             	inc    %r9
    1622:	4d 39 e9             	cmp    %r13,%r9
    1625:	7d e9                	jge    1610 <func0+0x80>
    1627:	b9 01 00 00 00       	mov    $0x1,%ecx
    162c:	eb 10                	jmp    163e <func0+0xae>
    162e:	66 90                	xchg   %ax,%ax
    1630:	89 04 bb             	mov    %eax,(%rbx,%rdi,4)
    1633:	89 34 8a             	mov    %esi,(%rdx,%rcx,4)
    1636:	48 ff c1             	inc    %rcx
    1639:	48 39 cd             	cmp    %rcx,%rbp
    163c:	74 d2                	je     1610 <func0+0x80>
    163e:	8b 34 bb             	mov    (%rbx,%rdi,4),%esi
    1641:	8b 04 8a             	mov    (%rdx,%rcx,4),%eax
    1644:	41 83 fa 01          	cmp    $0x1,%r10d
    1648:	75 06                	jne    1650 <func0+0xc0>
    164a:	39 c6                	cmp    %eax,%esi
    164c:	7f e2                	jg     1630 <func0+0xa0>
    164e:	eb e6                	jmp    1636 <func0+0xa6>
    1650:	39 c6                	cmp    %eax,%esi
    1652:	7c dc                	jl     1630 <func0+0xa0>
    1654:	eb e0                	jmp    1636 <func0+0xa6>
    1656:	49 c7 07 00 00 00 00 	movq   $0x0,(%r15)
    165d:	48 83 c4 08          	add    $0x8,%rsp
    1661:	5b                   	pop    %rbx
    1662:	41 5c                	pop    %r12
    1664:	41 5d                	pop    %r13
    1666:	41 5e                	pop    %r14
    1668:	41 5f                	pop    %r15
    166a:	5d                   	pop    %rbp
    166b:	c3                   	ret    
    166c:	bf 01 00 00 00       	mov    $0x1,%edi
    1671:	e8 fa f9 ff ff       	call   1070 <exit@plt>

