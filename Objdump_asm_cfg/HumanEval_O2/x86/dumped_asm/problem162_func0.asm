0000000000001410 <func0>:
    1410:	55                   	push   %rbp
    1411:	41 57                	push   %r15
    1413:	41 56                	push   %r14
    1415:	41 55                	push   %r13
    1417:	41 54                	push   %r12
    1419:	53                   	push   %rbx
    141a:	50                   	push   %rax
    141b:	49 89 ff             	mov    %rdi,%r15
    141e:	e8 1d fc ff ff       	call   1040 <strlen@plt>
    1423:	48 89 c5             	mov    %rax,%rbp
    1426:	85 ed                	test   %ebp,%ebp
    1428:	48 89 04 24          	mov    %rax,(%rsp)
    142c:	7e 65                	jle    1493 <func0+0x83>
    142e:	e8 4d fc ff ff       	call   1080 <__ctype_b_loc@plt>
    1433:	48 89 c3             	mov    %rax,%rbx
    1436:	41 89 ec             	mov    %ebp,%r12d
    1439:	31 ed                	xor    %ebp,%ebp
    143b:	45 31 ed             	xor    %r13d,%r13d
    143e:	eb 0b                	jmp    144b <func0+0x3b>
    1440:	41 ff c5             	inc    %r13d
    1443:	48 ff c5             	inc    %rbp
    1446:	49 39 ec             	cmp    %rbp,%r12
    1449:	74 4b                	je     1496 <func0+0x86>
    144b:	48 8b 03             	mov    (%rbx),%rax
    144e:	45 0f b6 34 2f       	movzbl (%r15,%rbp,1),%r14d
    1453:	42 0f b7 04 70       	movzwl (%rax,%r14,2),%eax
    1458:	a9 00 04 00 00       	test   $0x400,%eax
    145d:	74 e1                	je     1440 <func0+0x30>
    145f:	a9 00 01 00 00       	test   $0x100,%eax
    1464:	75 1a                	jne    1480 <func0+0x70>
    1466:	a9 00 02 00 00       	test   $0x200,%eax
    146b:	74 d6                	je     1443 <func0+0x33>
    146d:	e8 be fb ff ff       	call   1030 <__ctype_toupper_loc@plt>
    1472:	eb 11                	jmp    1485 <func0+0x75>
    1474:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    147b:	00 00 00 00 00 
    1480:	e8 eb fb ff ff       	call   1070 <__ctype_tolower_loc@plt>
    1485:	48 8b 00             	mov    (%rax),%rax
    1488:	42 0f b6 04 b0       	movzbl (%rax,%r14,4),%eax
    148d:	41 88 04 2f          	mov    %al,(%r15,%rbp,1)
    1491:	eb b0                	jmp    1443 <func0+0x33>
    1493:	45 31 ed             	xor    %r13d,%r13d
    1496:	4c 8b 1c 24          	mov    (%rsp),%r11
    149a:	45 39 dd             	cmp    %r11d,%r13d
    149d:	0f 85 c1 00 00 00    	jne    1564 <func0+0x154>
    14a3:	41 83 fb 02          	cmp    $0x2,%r11d
    14a7:	0f 8c b7 00 00 00    	jl     1564 <func0+0x154>
    14ad:	4d 89 d8             	mov    %r11,%r8
    14b0:	49 d1 e8             	shr    %r8
    14b3:	45 89 c2             	mov    %r8d,%r10d
    14b6:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
    14bd:	41 83 e0 01          	and    $0x1,%r8d
    14c1:	49 83 fa 01          	cmp    $0x1,%r10
    14c5:	75 04                	jne    14cb <func0+0xbb>
    14c7:	31 c9                	xor    %ecx,%ecx
    14c9:	eb 78                	jmp    1543 <func0+0x133>
    14cb:	49 b9 00 00 00 00 fe 	movabs $0xfffffffe00000000,%r9
    14d2:	ff ff ff 
    14d5:	4d 29 c2             	sub    %r8,%r10
    14d8:	4c 89 d9             	mov    %r11,%rcx
    14db:	48 c1 e1 20          	shl    $0x20,%rcx
    14df:	4a 8d 3c 09          	lea    (%rcx,%r9,1),%rdi
    14e3:	48 be 00 00 00 00 ff 	movabs $0xffffffff00000000,%rsi
    14ea:	ff ff ff 
    14ed:	48 01 ce             	add    %rcx,%rsi
    14f0:	31 c9                	xor    %ecx,%ecx
    14f2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    14f9:	1f 84 00 00 00 00 00 
    1500:	41 0f b6 04 0f       	movzbl (%r15,%rcx,1),%eax
    1505:	48 89 f5             	mov    %rsi,%rbp
    1508:	48 c1 fd 20          	sar    $0x20,%rbp
    150c:	41 0f b6 14 2f       	movzbl (%r15,%rbp,1),%edx
    1511:	41 88 14 0f          	mov    %dl,(%r15,%rcx,1)
    1515:	41 88 04 2f          	mov    %al,(%r15,%rbp,1)
    1519:	41 0f b6 44 0f 01    	movzbl 0x1(%r15,%rcx,1),%eax
    151f:	48 89 fa             	mov    %rdi,%rdx
    1522:	48 c1 fa 20          	sar    $0x20,%rdx
    1526:	41 0f b6 1c 17       	movzbl (%r15,%rdx,1),%ebx
    152b:	41 88 5c 0f 01       	mov    %bl,0x1(%r15,%rcx,1)
    1530:	41 88 04 17          	mov    %al,(%r15,%rdx,1)
    1534:	48 83 c1 02          	add    $0x2,%rcx
    1538:	4c 01 cf             	add    %r9,%rdi
    153b:	4c 01 ce             	add    %r9,%rsi
    153e:	49 39 ca             	cmp    %rcx,%r10
    1541:	75 bd                	jne    1500 <func0+0xf0>
    1543:	4d 85 c0             	test   %r8,%r8
    1546:	74 1c                	je     1564 <func0+0x154>
    1548:	41 0f b6 04 0f       	movzbl (%r15,%rcx,1),%eax
    154d:	89 ca                	mov    %ecx,%edx
    154f:	f7 d2                	not    %edx
    1551:	44 01 da             	add    %r11d,%edx
    1554:	48 63 d2             	movslq %edx,%rdx
    1557:	41 0f b6 1c 17       	movzbl (%r15,%rdx,1),%ebx
    155c:	41 88 1c 0f          	mov    %bl,(%r15,%rcx,1)
    1560:	41 88 04 17          	mov    %al,(%r15,%rdx,1)
    1564:	4c 89 f8             	mov    %r15,%rax
    1567:	48 83 c4 08          	add    $0x8,%rsp
    156b:	5b                   	pop    %rbx
    156c:	41 5c                	pop    %r12
    156e:	41 5d                	pop    %r13
    1570:	41 5e                	pop    %r14
    1572:	41 5f                	pop    %r15
    1574:	5d                   	pop    %rbp
    1575:	c3                   	ret    

