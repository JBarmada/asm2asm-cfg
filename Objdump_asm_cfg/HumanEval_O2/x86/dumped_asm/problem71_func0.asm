0000000000001560 <func0>:
    1560:	55                   	push   %rbp
    1561:	41 57                	push   %r15
    1563:	41 56                	push   %r14
    1565:	53                   	push   %rbx
    1566:	44 8d 56 ff          	lea    -0x1(%rsi),%r10d
    156a:	83 fe 02             	cmp    $0x2,%esi
    156d:	7c 4d                	jl     15bc <func0+0x5c>
    156f:	41 89 f1             	mov    %esi,%r9d
    1572:	45 89 d0             	mov    %r10d,%r8d
    1575:	45 31 db             	xor    %r11d,%r11d
    1578:	4d 89 ce             	mov    %r9,%r14
    157b:	49 89 ff             	mov    %rdi,%r15
    157e:	eb 0c                	jmp    158c <func0+0x2c>
    1580:	49 83 c7 04          	add    $0x4,%r15
    1584:	49 ff ce             	dec    %r14
    1587:	4d 39 c3             	cmp    %r8,%r11
    158a:	74 30                	je     15bc <func0+0x5c>
    158c:	4c 89 db             	mov    %r11,%rbx
    158f:	49 ff c3             	inc    %r11
    1592:	4d 39 cb             	cmp    %r9,%r11
    1595:	73 e9                	jae    1580 <func0+0x20>
    1597:	b9 01 00 00 00       	mov    $0x1,%ecx
    159c:	eb 0a                	jmp    15a8 <func0+0x48>
    159e:	66 90                	xchg   %ax,%ax
    15a0:	48 ff c1             	inc    %rcx
    15a3:	49 39 ce             	cmp    %rcx,%r14
    15a6:	74 d8                	je     1580 <func0+0x20>
    15a8:	8b 2c 9f             	mov    (%rdi,%rbx,4),%ebp
    15ab:	41 8b 04 8f          	mov    (%r15,%rcx,4),%eax
    15af:	39 c5                	cmp    %eax,%ebp
    15b1:	7e ed                	jle    15a0 <func0+0x40>
    15b3:	89 04 9f             	mov    %eax,(%rdi,%rbx,4)
    15b6:	41 89 2c 8f          	mov    %ebp,(%r15,%rcx,4)
    15ba:	eb e4                	jmp    15a0 <func0+0x40>
    15bc:	85 f6                	test   %esi,%esi
    15be:	7e 4e                	jle    160e <func0+0xae>
    15c0:	31 c9                	xor    %ecx,%ecx
    15c2:	31 c0                	xor    %eax,%eax
    15c4:	eb 1c                	jmp    15e2 <func0+0x82>
    15c6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    15cd:	00 00 00 
    15d0:	48 8d 71 01          	lea    0x1(%rcx),%rsi
    15d4:	49 63 ea             	movslq %r10d,%rbp
    15d7:	44 89 c0             	mov    %r8d,%eax
    15da:	48 39 e9             	cmp    %rbp,%rcx
    15dd:	48 89 f1             	mov    %rsi,%rcx
    15e0:	7d 2c                	jge    160e <func0+0xae>
    15e2:	44 89 d5             	mov    %r10d,%ebp
    15e5:	44 8d 40 01          	lea    0x1(%rax),%r8d
    15e9:	8b 1c 8f             	mov    (%rdi,%rcx,4),%ebx
    15ec:	48 63 f0             	movslq %eax,%rsi
    15ef:	89 1c b2             	mov    %ebx,(%rdx,%rsi,4)
    15f2:	48 39 e9             	cmp    %rbp,%rcx
    15f5:	74 d9                	je     15d0 <func0+0x70>
    15f7:	49 63 f2             	movslq %r10d,%rsi
    15fa:	41 ff ca             	dec    %r10d
    15fd:	8b 34 b7             	mov    (%rdi,%rsi,4),%esi
    1600:	83 c0 02             	add    $0x2,%eax
    1603:	49 63 e8             	movslq %r8d,%rbp
    1606:	89 34 aa             	mov    %esi,(%rdx,%rbp,4)
    1609:	41 89 c0             	mov    %eax,%r8d
    160c:	eb c2                	jmp    15d0 <func0+0x70>
    160e:	5b                   	pop    %rbx
    160f:	41 5e                	pop    %r14
    1611:	41 5f                	pop    %r15
    1613:	5d                   	pop    %rbp
    1614:	c3                   	ret    

