0000000000001370 <func0>:
    1370:	55                   	push   %rbp
    1371:	41 57                	push   %r15
    1373:	41 56                	push   %r14
    1375:	41 55                	push   %r13
    1377:	41 54                	push   %r12
    1379:	53                   	push   %rbx
    137a:	50                   	push   %rax
    137b:	49 89 f6             	mov    %rsi,%r14
    137e:	49 89 fc             	mov    %rdi,%r12
    1381:	31 db                	xor    %ebx,%ebx
    1383:	31 ed                	xor    %ebp,%ebp
    1385:	45 31 ff             	xor    %r15d,%r15d
    1388:	eb 1c                	jmp    13a6 <func0+0x36>
    138a:	4d 63 ff             	movslq %r15d,%r15
    138d:	4b 8d 3c 3e          	lea    (%r14,%r15,1),%rdi
    1391:	48 63 d5             	movslq %ebp,%rdx
    1394:	48 29 d6             	sub    %rdx,%rsi
    1397:	e8 a4 fc ff ff       	call   1040 <memcpy@plt>
    139c:	41 01 ef             	add    %ebp,%r15d
    139f:	90                   	nop
    13a0:	48 ff c3             	inc    %rbx
    13a3:	44 89 ed             	mov    %r13d,%ebp
    13a6:	49 8d 34 1c          	lea    (%r12,%rbx,1),%rsi
    13aa:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
    13af:	83 f8 20             	cmp    $0x20,%eax
    13b2:	74 0c                	je     13c0 <func0+0x50>
    13b4:	85 c0                	test   %eax,%eax
    13b6:	74 4e                	je     1406 <func0+0x96>
    13b8:	ff c5                	inc    %ebp
    13ba:	41 89 ed             	mov    %ebp,%r13d
    13bd:	eb e1                	jmp    13a0 <func0+0x30>
    13bf:	90                   	nop
    13c0:	45 31 ed             	xor    %r13d,%r13d
    13c3:	83 fd 02             	cmp    $0x2,%ebp
    13c6:	7c d8                	jl     13a0 <func0+0x30>
    13c8:	83 fd 04             	cmp    $0x4,%ebp
    13cb:	72 27                	jb     13f4 <func0+0x84>
    13cd:	b9 02 00 00 00       	mov    $0x2,%ecx
    13d2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    13d9:	1f 84 00 00 00 00 00 
    13e0:	89 e8                	mov    %ebp,%eax
    13e2:	99                   	cltd   
    13e3:	f7 f9                	idiv   %ecx
    13e5:	85 d2                	test   %edx,%edx
    13e7:	74 b7                	je     13a0 <func0+0x30>
    13e9:	ff c1                	inc    %ecx
    13eb:	89 c8                	mov    %ecx,%eax
    13ed:	0f af c1             	imul   %ecx,%eax
    13f0:	39 e8                	cmp    %ebp,%eax
    13f2:	7e ec                	jle    13e0 <func0+0x70>
    13f4:	45 85 ff             	test   %r15d,%r15d
    13f7:	7e 91                	jle    138a <func0+0x1a>
    13f9:	44 89 f8             	mov    %r15d,%eax
    13fc:	41 ff c7             	inc    %r15d
    13ff:	41 c6 04 06 20       	movb   $0x20,(%r14,%rax,1)
    1404:	eb 84                	jmp    138a <func0+0x1a>
    1406:	83 fd 02             	cmp    $0x2,%ebp
    1409:	7c 4e                	jl     1459 <func0+0xe9>
    140b:	83 fd 04             	cmp    $0x4,%ebp
    140e:	72 24                	jb     1434 <func0+0xc4>
    1410:	b9 02 00 00 00       	mov    $0x2,%ecx
    1415:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    141c:	00 00 00 00 
    1420:	89 e8                	mov    %ebp,%eax
    1422:	99                   	cltd   
    1423:	f7 f9                	idiv   %ecx
    1425:	85 d2                	test   %edx,%edx
    1427:	74 30                	je     1459 <func0+0xe9>
    1429:	ff c1                	inc    %ecx
    142b:	89 c8                	mov    %ecx,%eax
    142d:	0f af c1             	imul   %ecx,%eax
    1430:	39 e8                	cmp    %ebp,%eax
    1432:	7e ec                	jle    1420 <func0+0xb0>
    1434:	45 85 ff             	test   %r15d,%r15d
    1437:	7e 0b                	jle    1444 <func0+0xd4>
    1439:	44 89 f8             	mov    %r15d,%eax
    143c:	41 ff c7             	inc    %r15d
    143f:	41 c6 04 06 20       	movb   $0x20,(%r14,%rax,1)
    1444:	4d 63 ff             	movslq %r15d,%r15
    1447:	4b 8d 3c 3e          	lea    (%r14,%r15,1),%rdi
    144b:	48 63 d5             	movslq %ebp,%rdx
    144e:	48 29 d6             	sub    %rdx,%rsi
    1451:	e8 ea fb ff ff       	call   1040 <memcpy@plt>
    1456:	41 01 ef             	add    %ebp,%r15d
    1459:	49 63 c7             	movslq %r15d,%rax
    145c:	41 c6 04 06 00       	movb   $0x0,(%r14,%rax,1)
    1461:	48 83 c4 08          	add    $0x8,%rsp
    1465:	5b                   	pop    %rbx
    1466:	41 5c                	pop    %r12
    1468:	41 5d                	pop    %r13
    146a:	41 5e                	pop    %r14
    146c:	41 5f                	pop    %r15
    146e:	5d                   	pop    %rbp
    146f:	c3                   	ret    

