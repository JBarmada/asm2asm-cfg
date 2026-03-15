00000000000012f0 <func0>:
    12f0:	41 57                	push   %r15
    12f2:	41 56                	push   %r14
    12f4:	53                   	push   %rbx
    12f5:	48 89 f3             	mov    %rsi,%rbx
    12f8:	49 89 fe             	mov    %rdi,%r14
    12fb:	e8 30 fd ff ff       	call   1030 <strlen@plt>
    1300:	49 89 c7             	mov    %rax,%r15
    1303:	48 89 df             	mov    %rbx,%rdi
    1306:	e8 25 fd ff ff       	call   1030 <strlen@plt>
    130b:	45 85 ff             	test   %r15d,%r15d
    130e:	7e 4b                	jle    135b <func0+0x6b>
    1310:	4d 63 cf             	movslq %r15d,%r9
    1313:	45 89 c8             	mov    %r9d,%r8d
    1316:	89 c6                	mov    %eax,%esi
    1318:	41 b2 01             	mov    $0x1,%r10b
    131b:	31 ff                	xor    %edi,%edi
    131d:	85 c0                	test   %eax,%eax
    131f:	7e 36                	jle    1357 <func0+0x67>
    1321:	41 0f b6 0c 3e       	movzbl (%r14,%rdi,1),%ecx
    1326:	31 d2                	xor    %edx,%edx
    1328:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    132f:	00 
    1330:	3a 0c 13             	cmp    (%rbx,%rdx,1),%cl
    1333:	74 0b                	je     1340 <func0+0x50>
    1335:	48 ff c2             	inc    %rdx
    1338:	48 39 d6             	cmp    %rdx,%rsi
    133b:	75 f3                	jne    1330 <func0+0x40>
    133d:	eb 12                	jmp    1351 <func0+0x61>
    133f:	90                   	nop
    1340:	48 ff c7             	inc    %rdi
    1343:	4c 39 cf             	cmp    %r9,%rdi
    1346:	41 0f 9c c2          	setl   %r10b
    134a:	4c 39 c7             	cmp    %r8,%rdi
    134d:	75 ce                	jne    131d <func0+0x2d>
    134f:	eb 0a                	jmp    135b <func0+0x6b>
    1351:	41 f6 c2 01          	test   $0x1,%r10b
    1355:	74 04                	je     135b <func0+0x6b>
    1357:	31 c0                	xor    %eax,%eax
    1359:	eb 49                	jmp    13a4 <func0+0xb4>
    135b:	85 c0                	test   %eax,%eax
    135d:	7e 41                	jle    13a0 <func0+0xb0>
    135f:	4c 63 c8             	movslq %eax,%r9
    1362:	45 89 c8             	mov    %r9d,%r8d
    1365:	44 89 fe             	mov    %r15d,%esi
    1368:	31 ff                	xor    %edi,%edi
    136a:	b0 01                	mov    $0x1,%al
    136c:	45 85 ff             	test   %r15d,%r15d
    136f:	7e 3b                	jle    13ac <func0+0xbc>
    1371:	0f b6 14 3b          	movzbl (%rbx,%rdi,1),%edx
    1375:	31 c9                	xor    %ecx,%ecx
    1377:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    137e:	00 00 
    1380:	41 3a 14 0e          	cmp    (%r14,%rcx,1),%dl
    1384:	74 0a                	je     1390 <func0+0xa0>
    1386:	48 ff c1             	inc    %rcx
    1389:	48 39 ce             	cmp    %rcx,%rsi
    138c:	75 f2                	jne    1380 <func0+0x90>
    138e:	eb 12                	jmp    13a2 <func0+0xb2>
    1390:	48 ff c7             	inc    %rdi
    1393:	4c 39 cf             	cmp    %r9,%rdi
    1396:	0f 9c c0             	setl   %al
    1399:	4c 39 c7             	cmp    %r8,%rdi
    139c:	75 ce                	jne    136c <func0+0x7c>
    139e:	eb 02                	jmp    13a2 <func0+0xb2>
    13a0:	31 c0                	xor    %eax,%eax
    13a2:	34 01                	xor    $0x1,%al
    13a4:	24 01                	and    $0x1,%al
    13a6:	5b                   	pop    %rbx
    13a7:	41 5e                	pop    %r14
    13a9:	41 5f                	pop    %r15
    13ab:	c3                   	ret    
    13ac:	b0 01                	mov    $0x1,%al
    13ae:	eb f2                	jmp    13a2 <func0+0xb2>

