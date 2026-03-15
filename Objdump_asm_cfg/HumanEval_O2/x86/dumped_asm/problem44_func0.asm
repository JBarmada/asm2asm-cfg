0000000000001400 <func0>:
    1400:	53                   	push   %rbx
    1401:	85 f6                	test   %esi,%esi
    1403:	7e 61                	jle    1466 <func0+0x66>
    1405:	41 89 f0             	mov    %esi,%r8d
    1408:	b0 01                	mov    $0x1,%al
    140a:	45 31 d2             	xor    %r10d,%r10d
    140d:	4d 89 c3             	mov    %r8,%r11
    1410:	48 89 fe             	mov    %rdi,%rsi
    1413:	eb 17                	jmp    142c <func0+0x2c>
    1415:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    141c:	00 00 00 00 
    1420:	48 83 c6 04          	add    $0x4,%rsi
    1424:	49 ff cb             	dec    %r11
    1427:	4d 39 c2             	cmp    %r8,%r10
    142a:	74 3c                	je     1468 <func0+0x68>
    142c:	41 89 c1             	mov    %eax,%r9d
    142f:	4c 89 d1             	mov    %r10,%rcx
    1432:	49 ff c2             	inc    %r10
    1435:	4d 39 c2             	cmp    %r8,%r10
    1438:	0f 92 c0             	setb   %al
    143b:	73 e3                	jae    1420 <func0+0x20>
    143d:	8b 0c 8f             	mov    (%rdi,%rcx,4),%ecx
    1440:	ba 01 00 00 00       	mov    $0x1,%edx
    1445:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    144c:	00 00 00 00 
    1450:	8b 1c 96             	mov    (%rsi,%rdx,4),%ebx
    1453:	01 cb                	add    %ecx,%ebx
    1455:	74 0a                	je     1461 <func0+0x61>
    1457:	48 ff c2             	inc    %rdx
    145a:	49 39 d3             	cmp    %rdx,%r11
    145d:	75 f1                	jne    1450 <func0+0x50>
    145f:	eb bf                	jmp    1420 <func0+0x20>
    1461:	44 89 c8             	mov    %r9d,%eax
    1464:	eb 02                	jmp    1468 <func0+0x68>
    1466:	31 c0                	xor    %eax,%eax
    1468:	24 01                	and    $0x1,%al
    146a:	5b                   	pop    %rbx
    146b:	c3                   	ret    

