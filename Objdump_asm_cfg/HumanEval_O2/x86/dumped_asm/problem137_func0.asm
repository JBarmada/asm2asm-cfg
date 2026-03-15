0000000000001560 <func0>:
    1560:	85 f6                	test   %esi,%esi
    1562:	7e 53                	jle    15b7 <func0+0x57>
    1564:	41 89 f0             	mov    %esi,%r8d
    1567:	31 f6                	xor    %esi,%esi
    1569:	45 31 d2             	xor    %r10d,%r10d
    156c:	45 31 c9             	xor    %r9d,%r9d
    156f:	eb 29                	jmp    159a <func0+0x3a>
    1571:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1578:	0f 1f 84 00 00 00 00 
    157f:	00 
    1580:	44 39 c9             	cmp    %r9d,%ecx
    1583:	44 89 c8             	mov    %r9d,%eax
    1586:	0f 4f c1             	cmovg  %ecx,%eax
    1589:	45 85 c9             	test   %r9d,%r9d
    158c:	0f 44 c1             	cmove  %ecx,%eax
    158f:	41 89 c1             	mov    %eax,%r9d
    1592:	48 ff c6             	inc    %rsi
    1595:	49 39 f0             	cmp    %rsi,%r8
    1598:	74 23                	je     15bd <func0+0x5d>
    159a:	8b 0c b7             	mov    (%rdi,%rsi,4),%ecx
    159d:	85 c9                	test   %ecx,%ecx
    159f:	78 df                	js     1580 <func0+0x20>
    15a1:	74 ef                	je     1592 <func0+0x32>
    15a3:	44 39 d1             	cmp    %r10d,%ecx
    15a6:	44 89 d0             	mov    %r10d,%eax
    15a9:	0f 4c c1             	cmovl  %ecx,%eax
    15ac:	45 85 d2             	test   %r10d,%r10d
    15af:	0f 44 c1             	cmove  %ecx,%eax
    15b2:	41 89 c2             	mov    %eax,%r10d
    15b5:	eb db                	jmp    1592 <func0+0x32>
    15b7:	45 31 c9             	xor    %r9d,%r9d
    15ba:	45 31 d2             	xor    %r10d,%r10d
    15bd:	44 89 0a             	mov    %r9d,(%rdx)
    15c0:	44 89 52 04          	mov    %r10d,0x4(%rdx)
    15c4:	c3                   	ret    

