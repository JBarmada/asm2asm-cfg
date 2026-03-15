00000000000014d0 <func0>:
    14d0:	85 f6                	test   %esi,%esi
    14d2:	0f 8e 9a 00 00 00    	jle    1572 <func0+0xa2>
    14d8:	41 89 f0             	mov    %esi,%r8d
    14db:	45 31 d2             	xor    %r10d,%r10d
    14de:	45 31 c9             	xor    %r9d,%r9d
    14e1:	eb 1c                	jmp    14ff <func0+0x2f>
    14e3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    14ea:	84 00 00 00 00 00 
    14f0:	44 39 c9             	cmp    %r9d,%ecx
    14f3:	44 0f 4f c9          	cmovg  %ecx,%r9d
    14f7:	49 ff c2             	inc    %r10
    14fa:	4d 39 c2             	cmp    %r8,%r10
    14fd:	74 37                	je     1536 <func0+0x66>
    14ff:	42 8b 0c 97          	mov    (%rdi,%r10,4),%ecx
    1503:	83 f9 02             	cmp    $0x2,%ecx
    1506:	7c ef                	jl     14f7 <func0+0x27>
    1508:	83 f9 04             	cmp    $0x4,%ecx
    150b:	72 e3                	jb     14f0 <func0+0x20>
    150d:	be 02 00 00 00       	mov    $0x2,%esi
    1512:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1519:	1f 84 00 00 00 00 00 
    1520:	89 c8                	mov    %ecx,%eax
    1522:	99                   	cltd   
    1523:	f7 fe                	idiv   %esi
    1525:	85 d2                	test   %edx,%edx
    1527:	74 ce                	je     14f7 <func0+0x27>
    1529:	ff c6                	inc    %esi
    152b:	89 f0                	mov    %esi,%eax
    152d:	0f af c6             	imul   %esi,%eax
    1530:	39 c8                	cmp    %ecx,%eax
    1532:	7e ec                	jle    1520 <func0+0x50>
    1534:	eb ba                	jmp    14f0 <func0+0x20>
    1536:	31 c0                	xor    %eax,%eax
    1538:	45 85 c9             	test   %r9d,%r9d
    153b:	7e 34                	jle    1571 <func0+0xa1>
    153d:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    1542:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1549:	1f 84 00 00 00 00 00 
    1550:	44 89 ca             	mov    %r9d,%edx
    1553:	48 0f af d1          	imul   %rcx,%rdx
    1557:	48 c1 ea 23          	shr    $0x23,%rdx
    155b:	8d 34 12             	lea    (%rdx,%rdx,1),%esi
    155e:	8d 34 b6             	lea    (%rsi,%rsi,4),%esi
    1561:	44 89 cf             	mov    %r9d,%edi
    1564:	29 f7                	sub    %esi,%edi
    1566:	01 f8                	add    %edi,%eax
    1568:	41 83 f9 09          	cmp    $0x9,%r9d
    156c:	41 89 d1             	mov    %edx,%r9d
    156f:	77 df                	ja     1550 <func0+0x80>
    1571:	c3                   	ret    
    1572:	31 c0                	xor    %eax,%eax
    1574:	c3                   	ret    

