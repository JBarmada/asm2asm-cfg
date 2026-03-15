0000000000001570 <func0>:
    1570:	48 8b 07             	mov    (%rdi),%rax
    1573:	83 fe 02             	cmp    $0x2,%esi
    1576:	0f 8c 8f 00 00 00    	jl     160b <func0+0x9b>
    157c:	41 89 f0             	mov    %esi,%r8d
    157f:	49 ff c8             	dec    %r8
    1582:	83 fe 02             	cmp    $0x2,%esi
    1585:	75 0a                	jne    1591 <func0+0x21>
    1587:	ba 01 00 00 00       	mov    $0x1,%edx
    158c:	48 89 c6             	mov    %rax,%rsi
    158f:	eb 5c                	jmp    15ed <func0+0x7d>
    1591:	4d 89 c1             	mov    %r8,%r9
    1594:	49 83 e1 fe          	and    $0xfffffffffffffffe,%r9
    1598:	49 f7 d9             	neg    %r9
    159b:	ba 01 00 00 00       	mov    $0x1,%edx
    15a0:	48 89 c6             	mov    %rax,%rsi
    15a3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    15aa:	84 00 00 00 00 00 
    15b0:	48 89 f1             	mov    %rsi,%rcx
    15b3:	48 c1 f9 3f          	sar    $0x3f,%rcx
    15b7:	48 21 f1             	and    %rsi,%rcx
    15ba:	48 03 0c d7          	add    (%rdi,%rdx,8),%rcx
    15be:	48 39 c1             	cmp    %rax,%rcx
    15c1:	48 0f 4c c1          	cmovl  %rcx,%rax
    15c5:	48 89 ce             	mov    %rcx,%rsi
    15c8:	48 c1 fe 3f          	sar    $0x3f,%rsi
    15cc:	48 21 ce             	and    %rcx,%rsi
    15cf:	48 03 74 d7 08       	add    0x8(%rdi,%rdx,8),%rsi
    15d4:	48 39 c6             	cmp    %rax,%rsi
    15d7:	48 0f 4c c6          	cmovl  %rsi,%rax
    15db:	49 8d 0c 11          	lea    (%r9,%rdx,1),%rcx
    15df:	48 83 c1 02          	add    $0x2,%rcx
    15e3:	48 83 c2 02          	add    $0x2,%rdx
    15e7:	48 83 f9 01          	cmp    $0x1,%rcx
    15eb:	75 c3                	jne    15b0 <func0+0x40>
    15ed:	41 f6 c0 01          	test   $0x1,%r8b
    15f1:	74 18                	je     160b <func0+0x9b>
    15f3:	48 89 f1             	mov    %rsi,%rcx
    15f6:	48 c1 f9 3f          	sar    $0x3f,%rcx
    15fa:	48 21 f1             	and    %rsi,%rcx
    15fd:	48 03 0c d7          	add    (%rdi,%rdx,8),%rcx
    1601:	48 39 c1             	cmp    %rax,%rcx
    1604:	48 0f 4d c8          	cmovge %rax,%rcx
    1608:	48 89 c8             	mov    %rcx,%rax
    160b:	c3                   	ret    

