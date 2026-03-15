0000000000001390 <func0>:
    1390:	55                   	push   %rbp
    1391:	41 57                	push   %r15
    1393:	41 56                	push   %r14
    1395:	41 54                	push   %r12
    1397:	53                   	push   %rbx
    1398:	49 89 ce             	mov    %rcx,%r14
    139b:	49 89 d7             	mov    %rdx,%r15
    139e:	89 f5                	mov    %esi,%ebp
    13a0:	49 89 fc             	mov    %rdi,%r12
    13a3:	48 63 de             	movslq %esi,%rbx
    13a6:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
    13ad:	00 
    13ae:	e8 9d fc ff ff       	call   1050 <malloc@plt>
    13b3:	49 89 07             	mov    %rax,(%r15)
    13b6:	41 c7 06 00 00 00 00 	movl   $0x0,(%r14)
    13bd:	85 db                	test   %ebx,%ebx
    13bf:	0f 8e 1d 01 00 00    	jle    14e2 <func0+0x152>
    13c5:	41 89 e8             	mov    %ebp,%r8d
    13c8:	45 31 c9             	xor    %r9d,%r9d
    13cb:	be 01 00 00 00       	mov    $0x1,%esi
    13d0:	bf cd cc cc cc       	mov    $0xcccccccd,%edi
    13d5:	31 ed                	xor    %ebp,%ebp
    13d7:	eb 0f                	jmp    13e8 <func0+0x58>
    13d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13e0:	48 ff c5             	inc    %rbp
    13e3:	4c 39 c5             	cmp    %r8,%rbp
    13e6:	74 51                	je     1439 <func0+0xa9>
    13e8:	45 8b 14 ac          	mov    (%r12,%rbp,4),%r10d
    13ec:	45 85 d2             	test   %r10d,%r10d
    13ef:	41 0f 95 c3          	setne  %r11b
    13f3:	7e 30                	jle    1425 <func0+0x95>
    13f5:	0f 94 c1             	sete   %cl
    13f8:	44 89 d2             	mov    %r10d,%edx
    13fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1400:	f6 c2 01             	test   $0x1,%dl
    1403:	0f b6 c9             	movzbl %cl,%ecx
    1406:	0f 44 ce             	cmove  %esi,%ecx
    1409:	89 cb                	mov    %ecx,%ebx
    140b:	80 e3 01             	and    $0x1,%bl
    140e:	41 0f 94 c3          	sete   %r11b
    1412:	83 fa 0a             	cmp    $0xa,%edx
    1415:	72 0e                	jb     1425 <func0+0x95>
    1417:	89 d2                	mov    %edx,%edx
    1419:	48 0f af d7          	imul   %rdi,%rdx
    141d:	48 c1 ea 23          	shr    $0x23,%rdx
    1421:	84 db                	test   %bl,%bl
    1423:	74 db                	je     1400 <func0+0x70>
    1425:	45 84 db             	test   %r11b,%r11b
    1428:	74 b6                	je     13e0 <func0+0x50>
    142a:	4d 63 c9             	movslq %r9d,%r9
    142d:	46 89 14 88          	mov    %r10d,(%rax,%r9,4)
    1431:	41 ff c1             	inc    %r9d
    1434:	45 89 0e             	mov    %r9d,(%r14)
    1437:	eb a7                	jmp    13e0 <func0+0x50>
    1439:	41 83 f9 02          	cmp    $0x2,%r9d
    143d:	0f 8c 9f 00 00 00    	jl     14e2 <func0+0x152>
    1443:	45 8d 41 ff          	lea    -0x1(%r9),%r8d
    1447:	31 f6                	xor    %esi,%esi
    1449:	45 89 c3             	mov    %r8d,%r11d
    144c:	eb 10                	jmp    145e <func0+0xce>
    144e:	66 90                	xchg   %ax,%ax
    1450:	ff c6                	inc    %esi
    1452:	41 ff cb             	dec    %r11d
    1455:	44 39 c6             	cmp    %r8d,%esi
    1458:	0f 84 84 00 00 00    	je     14e2 <func0+0x152>
    145e:	89 f1                	mov    %esi,%ecx
    1460:	f7 d1                	not    %ecx
    1462:	44 01 c9             	add    %r9d,%ecx
    1465:	85 c9                	test   %ecx,%ecx
    1467:	7e e7                	jle    1450 <func0+0xc0>
    1469:	45 89 c2             	mov    %r8d,%r10d
    146c:	41 29 f2             	sub    %esi,%r10d
    146f:	8b 10                	mov    (%rax),%edx
    1471:	41 83 fa 01          	cmp    $0x1,%r10d
    1475:	75 19                	jne    1490 <func0+0x100>
    1477:	31 db                	xor    %ebx,%ebx
    1479:	41 f6 c2 01          	test   $0x1,%r10b
    147d:	74 d1                	je     1450 <func0+0xc0>
    147f:	8b 4c 98 04          	mov    0x4(%rax,%rbx,4),%ecx
    1483:	39 ca                	cmp    %ecx,%edx
    1485:	7e c9                	jle    1450 <func0+0xc0>
    1487:	89 0c 98             	mov    %ecx,(%rax,%rbx,4)
    148a:	89 54 98 04          	mov    %edx,0x4(%rax,%rbx,4)
    148e:	eb c0                	jmp    1450 <func0+0xc0>
    1490:	44 89 df             	mov    %r11d,%edi
    1493:	83 e7 fe             	and    $0xfffffffe,%edi
    1496:	31 c9                	xor    %ecx,%ecx
    1498:	eb 16                	jmp    14b0 <func0+0x120>
    149a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    14a0:	89 6c 88 04          	mov    %ebp,0x4(%rax,%rcx,4)
    14a4:	89 54 88 08          	mov    %edx,0x8(%rax,%rcx,4)
    14a8:	48 89 d9             	mov    %rbx,%rcx
    14ab:	48 39 df             	cmp    %rbx,%rdi
    14ae:	74 c9                	je     1479 <func0+0xe9>
    14b0:	8b 6c 88 04          	mov    0x4(%rax,%rcx,4),%ebp
    14b4:	39 ea                	cmp    %ebp,%edx
    14b6:	7e 18                	jle    14d0 <func0+0x140>
    14b8:	89 2c 88             	mov    %ebp,(%rax,%rcx,4)
    14bb:	89 54 88 04          	mov    %edx,0x4(%rax,%rcx,4)
    14bf:	eb 11                	jmp    14d2 <func0+0x142>
    14c1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    14c8:	0f 1f 84 00 00 00 00 
    14cf:	00 
    14d0:	89 ea                	mov    %ebp,%edx
    14d2:	48 8d 59 02          	lea    0x2(%rcx),%rbx
    14d6:	8b 6c 88 08          	mov    0x8(%rax,%rcx,4),%ebp
    14da:	39 ea                	cmp    %ebp,%edx
    14dc:	7f c2                	jg     14a0 <func0+0x110>
    14de:	89 ea                	mov    %ebp,%edx
    14e0:	eb c6                	jmp    14a8 <func0+0x118>
    14e2:	5b                   	pop    %rbx
    14e3:	41 5c                	pop    %r12
    14e5:	41 5e                	pop    %r14
    14e7:	41 5f                	pop    %r15
    14e9:	5d                   	pop    %rbp
    14ea:	c3                   	ret    

