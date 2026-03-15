0000000000001390 <func0>:
    1390:	55                   	push   %rbp
    1391:	41 57                	push   %r15
    1393:	41 56                	push   %r14
    1395:	41 55                	push   %r13
    1397:	41 54                	push   %r12
    1399:	53                   	push   %rbx
    139a:	50                   	push   %rax
    139b:	4d 89 c6             	mov    %r8,%r14
    139e:	41 89 cf             	mov    %ecx,%r15d
    13a1:	48 89 d3             	mov    %rdx,%rbx
    13a4:	41 89 f4             	mov    %esi,%r12d
    13a7:	49 89 fd             	mov    %rdi,%r13
    13aa:	48 63 ee             	movslq %esi,%rbp
    13ad:	48 8d 3c ad 00 00 00 	lea    0x0(,%rbp,4),%rdi
    13b4:	00 
    13b5:	e8 96 fc ff ff       	call   1050 <malloc@plt>
    13ba:	85 ed                	test   %ebp,%ebp
    13bc:	0f 8e 10 01 00 00    	jle    14d2 <func0+0x142>
    13c2:	45 89 e0             	mov    %r12d,%r8d
    13c5:	44 89 fe             	mov    %r15d,%esi
    13c8:	31 ff                	xor    %edi,%edi
    13ca:	45 31 c9             	xor    %r9d,%r9d
    13cd:	eb 12                	jmp    13e1 <func0+0x51>
    13cf:	90                   	nop
    13d0:	49 63 d1             	movslq %r9d,%rdx
    13d3:	41 ff c1             	inc    %r9d
    13d6:	89 0c 90             	mov    %ecx,(%rax,%rdx,4)
    13d9:	48 ff c7             	inc    %rdi
    13dc:	4c 39 c7             	cmp    %r8,%rdi
    13df:	74 3e                	je     141f <func0+0x8f>
    13e1:	45 85 c9             	test   %r9d,%r9d
    13e4:	7e 17                	jle    13fd <func0+0x6d>
    13e6:	41 8b 4c bd 00       	mov    0x0(%r13,%rdi,4),%ecx
    13eb:	44 89 cd             	mov    %r9d,%ebp
    13ee:	31 d2                	xor    %edx,%edx
    13f0:	39 0c 90             	cmp    %ecx,(%rax,%rdx,4)
    13f3:	74 e4                	je     13d9 <func0+0x49>
    13f5:	48 ff c2             	inc    %rdx
    13f8:	48 39 d5             	cmp    %rdx,%rbp
    13fb:	75 f3                	jne    13f0 <func0+0x60>
    13fd:	45 85 ff             	test   %r15d,%r15d
    1400:	7e d7                	jle    13d9 <func0+0x49>
    1402:	41 8b 4c bd 00       	mov    0x0(%r13,%rdi,4),%ecx
    1407:	31 d2                	xor    %edx,%edx
    1409:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1410:	3b 0c 93             	cmp    (%rbx,%rdx,4),%ecx
    1413:	74 bb                	je     13d0 <func0+0x40>
    1415:	48 ff c2             	inc    %rdx
    1418:	48 39 d6             	cmp    %rdx,%rsi
    141b:	75 f3                	jne    1410 <func0+0x80>
    141d:	eb ba                	jmp    13d9 <func0+0x49>
    141f:	41 83 f9 02          	cmp    $0x2,%r9d
    1423:	0f 8c ac 00 00 00    	jl     14d5 <func0+0x145>
    1429:	45 8d 41 ff          	lea    -0x1(%r9),%r8d
    142d:	31 f6                	xor    %esi,%esi
    142f:	45 89 c3             	mov    %r8d,%r11d
    1432:	eb 1a                	jmp    144e <func0+0xbe>
    1434:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    143b:	00 00 00 00 00 
    1440:	ff c6                	inc    %esi
    1442:	41 ff cb             	dec    %r11d
    1445:	44 39 c6             	cmp    %r8d,%esi
    1448:	0f 84 87 00 00 00    	je     14d5 <func0+0x145>
    144e:	89 f1                	mov    %esi,%ecx
    1450:	f7 d1                	not    %ecx
    1452:	44 01 c9             	add    %r9d,%ecx
    1455:	85 c9                	test   %ecx,%ecx
    1457:	7e e7                	jle    1440 <func0+0xb0>
    1459:	45 89 c2             	mov    %r8d,%r10d
    145c:	41 29 f2             	sub    %esi,%r10d
    145f:	8b 10                	mov    (%rax),%edx
    1461:	41 83 fa 01          	cmp    $0x1,%r10d
    1465:	75 19                	jne    1480 <func0+0xf0>
    1467:	31 db                	xor    %ebx,%ebx
    1469:	41 f6 c2 01          	test   $0x1,%r10b
    146d:	74 d1                	je     1440 <func0+0xb0>
    146f:	8b 4c 98 04          	mov    0x4(%rax,%rbx,4),%ecx
    1473:	39 ca                	cmp    %ecx,%edx
    1475:	7e c9                	jle    1440 <func0+0xb0>
    1477:	89 0c 98             	mov    %ecx,(%rax,%rbx,4)
    147a:	89 54 98 04          	mov    %edx,0x4(%rax,%rbx,4)
    147e:	eb c0                	jmp    1440 <func0+0xb0>
    1480:	44 89 df             	mov    %r11d,%edi
    1483:	83 e7 fe             	and    $0xfffffffe,%edi
    1486:	31 c9                	xor    %ecx,%ecx
    1488:	eb 16                	jmp    14a0 <func0+0x110>
    148a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1490:	89 6c 88 04          	mov    %ebp,0x4(%rax,%rcx,4)
    1494:	89 54 88 08          	mov    %edx,0x8(%rax,%rcx,4)
    1498:	48 89 d9             	mov    %rbx,%rcx
    149b:	48 39 df             	cmp    %rbx,%rdi
    149e:	74 c9                	je     1469 <func0+0xd9>
    14a0:	8b 6c 88 04          	mov    0x4(%rax,%rcx,4),%ebp
    14a4:	39 ea                	cmp    %ebp,%edx
    14a6:	7e 18                	jle    14c0 <func0+0x130>
    14a8:	89 2c 88             	mov    %ebp,(%rax,%rcx,4)
    14ab:	89 54 88 04          	mov    %edx,0x4(%rax,%rcx,4)
    14af:	eb 11                	jmp    14c2 <func0+0x132>
    14b1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    14b8:	0f 1f 84 00 00 00 00 
    14bf:	00 
    14c0:	89 ea                	mov    %ebp,%edx
    14c2:	48 8d 59 02          	lea    0x2(%rcx),%rbx
    14c6:	8b 6c 88 08          	mov    0x8(%rax,%rcx,4),%ebp
    14ca:	39 ea                	cmp    %ebp,%edx
    14cc:	7f c2                	jg     1490 <func0+0x100>
    14ce:	89 ea                	mov    %ebp,%edx
    14d0:	eb c6                	jmp    1498 <func0+0x108>
    14d2:	45 31 c9             	xor    %r9d,%r9d
    14d5:	45 89 0e             	mov    %r9d,(%r14)
    14d8:	48 83 c4 08          	add    $0x8,%rsp
    14dc:	5b                   	pop    %rbx
    14dd:	41 5c                	pop    %r12
    14df:	41 5d                	pop    %r13
    14e1:	41 5e                	pop    %r14
    14e3:	41 5f                	pop    %r15
    14e5:	5d                   	pop    %rbp
    14e6:	c3                   	ret    

