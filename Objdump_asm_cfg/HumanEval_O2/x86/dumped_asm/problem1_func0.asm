00000000000013b0 <func0>:
    13b0:	b8 0a 00 00 00       	mov    $0xa,%eax
    13b5:	85 f6                	test   %esi,%esi
    13b7:	7e 66                	jle    141f <func0+0x6f>
    13b9:	41 89 f0             	mov    %esi,%r8d
    13bc:	45 31 c9             	xor    %r9d,%r9d
    13bf:	0f 28 0d da 0d 00 00 	movaps 0xdda(%rip),%xmm1        # 21a0 <_IO_stdin_used+0x1a0>
    13c6:	4c 89 c2             	mov    %r8,%rdx
    13c9:	48 89 f9             	mov    %rdi,%rcx
    13cc:	eb 0e                	jmp    13dc <func0+0x2c>
    13ce:	66 90                	xchg   %ax,%ax
    13d0:	48 83 c1 04          	add    $0x4,%rcx
    13d4:	48 ff ca             	dec    %rdx
    13d7:	4d 39 c1             	cmp    %r8,%r9
    13da:	74 43                	je     141f <func0+0x6f>
    13dc:	4c 89 ce             	mov    %r9,%rsi
    13df:	49 ff c1             	inc    %r9
    13e2:	4d 39 c1             	cmp    %r8,%r9
    13e5:	73 e9                	jae    13d0 <func0+0x20>
    13e7:	f3 0f 10 14 b7       	movss  (%rdi,%rsi,4),%xmm2
    13ec:	be 01 00 00 00       	mov    $0x1,%esi
    13f1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    13f8:	0f 1f 84 00 00 00 00 
    13ff:	00 
    1400:	0f 28 da             	movaps %xmm2,%xmm3
    1403:	f3 0f 5c 1c b1       	subss  (%rcx,%rsi,4),%xmm3
    1408:	0f 54 d9             	andps  %xmm1,%xmm3
    140b:	0f 2e c3             	ucomiss %xmm3,%xmm0
    140e:	77 0a                	ja     141a <func0+0x6a>
    1410:	48 ff c6             	inc    %rsi
    1413:	48 39 f2             	cmp    %rsi,%rdx
    1416:	75 e8                	jne    1400 <func0+0x50>
    1418:	eb b6                	jmp    13d0 <func0+0x20>
    141a:	b8 01 00 00 00       	mov    $0x1,%eax
    141f:	c3                   	ret    

