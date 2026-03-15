00000000000013b0 <func0>:
    13b0:	55                   	push   %rbp
    13b1:	41 57                	push   %r15
    13b3:	41 56                	push   %r14
    13b5:	41 55                	push   %r13
    13b7:	41 54                	push   %r12
    13b9:	53                   	push   %rbx
    13ba:	50                   	push   %rax
    13bb:	85 f6                	test   %esi,%esi
    13bd:	0f 84 92 00 00 00    	je     1455 <func0+0xa5>
    13c3:	0f 8e 90 00 00 00    	jle    1459 <func0+0xa9>
    13c9:	49 89 ff             	mov    %rdi,%r15
    13cc:	89 f0                	mov    %esi,%eax
    13ce:	48 89 04 24          	mov    %rax,(%rsp)
    13d2:	45 31 e4             	xor    %r12d,%r12d
    13d5:	45 31 ed             	xor    %r13d,%r13d
    13d8:	31 db                	xor    %ebx,%ebx
    13da:	eb 0d                	jmp    13e9 <func0+0x39>
    13dc:	0f 1f 40 00          	nopl   0x0(%rax)
    13e0:	49 ff c4             	inc    %r12
    13e3:	4c 3b 24 24          	cmp    (%rsp),%r12
    13e7:	74 70                	je     1459 <func0+0xa9>
    13e9:	4c 89 e0             	mov    %r12,%rax
    13ec:	48 c1 e0 04          	shl    $0x4,%rax
    13f0:	49 8b 2c 07          	mov    (%r15,%rax,1),%rbp
    13f4:	44 0f b6 75 00       	movzbl 0x0(%rbp),%r14d
    13f9:	45 84 f6             	test   %r14b,%r14b
    13fc:	74 e2                	je     13e0 <func0+0x30>
    13fe:	e8 3d fc ff ff       	call   1040 <__ctype_b_loc@plt>
    1403:	48 8b 08             	mov    (%rax),%rcx
    1406:	48 ff c5             	inc    %rbp
    1409:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1410:	41 0f b6 c6          	movzbl %r14b,%eax
    1414:	0f b7 14 41          	movzwl (%rcx,%rax,2),%edx
    1418:	31 c0                	xor    %eax,%eax
    141a:	f7 c2 00 04 00 00    	test   $0x400,%edx
    1420:	74 3c                	je     145e <func0+0xae>
    1422:	f7 c2 00 01 00 00    	test   $0x100,%edx
    1428:	74 06                	je     1430 <func0+0x80>
    142a:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    1430:	f7 c2 00 02 00 00    	test   $0x200,%edx
    1436:	74 05                	je     143d <func0+0x8d>
    1438:	bb 01 00 00 00       	mov    $0x1,%ebx
    143d:	42 8d 14 2b          	lea    (%rbx,%r13,1),%edx
    1441:	83 fa 02             	cmp    $0x2,%edx
    1444:	74 18                	je     145e <func0+0xae>
    1446:	44 0f b6 75 00       	movzbl 0x0(%rbp),%r14d
    144b:	48 ff c5             	inc    %rbp
    144e:	45 84 f6             	test   %r14b,%r14b
    1451:	75 bd                	jne    1410 <func0+0x60>
    1453:	eb 8b                	jmp    13e0 <func0+0x30>
    1455:	31 c0                	xor    %eax,%eax
    1457:	eb 05                	jmp    145e <func0+0xae>
    1459:	b8 01 00 00 00       	mov    $0x1,%eax
    145e:	48 83 c4 08          	add    $0x8,%rsp
    1462:	5b                   	pop    %rbx
    1463:	41 5c                	pop    %r12
    1465:	41 5d                	pop    %r13
    1467:	41 5e                	pop    %r14
    1469:	41 5f                	pop    %r15
    146b:	5d                   	pop    %rbp
    146c:	c3                   	ret    

