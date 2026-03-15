0000000000001340 <func0>:
    1340:	39 fe                	cmp    %edi,%esi
    1342:	41 89 f8             	mov    %edi,%r8d
    1345:	44 0f 4f c6          	cmovg  %esi,%r8d
    1349:	c7 01 00 00 00 00    	movl   $0x0,(%rcx)
    134f:	0f 4c fe             	cmovl  %esi,%edi
    1352:	45 8d 48 01          	lea    0x1(%r8),%r9d
    1356:	44 89 c8             	mov    %r9d,%eax
    1359:	29 f8                	sub    %edi,%eax
    135b:	89 fe                	mov    %edi,%esi
    135d:	a8 01                	test   $0x1,%al
    135f:	74 1a                	je     137b <func0+0x3b>
    1361:	83 ff 09             	cmp    $0x9,%edi
    1364:	7f 12                	jg     1378 <func0+0x38>
    1366:	89 f8                	mov    %edi,%eax
    1368:	83 e0 01             	and    $0x1,%eax
    136b:	75 0b                	jne    1378 <func0+0x38>
    136d:	48 63 01             	movslq (%rcx),%rax
    1370:	8d 70 01             	lea    0x1(%rax),%esi
    1373:	89 31                	mov    %esi,(%rcx)
    1375:	89 3c 82             	mov    %edi,(%rdx,%rax,4)
    1378:	8d 77 01             	lea    0x1(%rdi),%esi
    137b:	41 39 f8             	cmp    %edi,%r8d
    137e:	75 01                	jne    1381 <func0+0x41>
    1380:	c3                   	ret    
    1381:	41 89 f0             	mov    %esi,%r8d
    1384:	41 83 e0 01          	and    $0x1,%r8d
    1388:	eb 0e                	jmp    1398 <func0+0x58>
    138a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1390:	83 c6 02             	add    $0x2,%esi
    1393:	41 39 f1             	cmp    %esi,%r9d
    1396:	74 e8                	je     1380 <func0+0x40>
    1398:	83 fe 09             	cmp    $0x9,%esi
    139b:	7f 10                	jg     13ad <func0+0x6d>
    139d:	45 85 c0             	test   %r8d,%r8d
    13a0:	75 0b                	jne    13ad <func0+0x6d>
    13a2:	48 63 01             	movslq (%rcx),%rax
    13a5:	8d 78 01             	lea    0x1(%rax),%edi
    13a8:	89 39                	mov    %edi,(%rcx)
    13aa:	89 34 82             	mov    %esi,(%rdx,%rax,4)
    13ad:	8d 46 01             	lea    0x1(%rsi),%eax
    13b0:	83 f8 09             	cmp    $0x9,%eax
    13b3:	7f db                	jg     1390 <func0+0x50>
    13b5:	45 85 c0             	test   %r8d,%r8d
    13b8:	74 d6                	je     1390 <func0+0x50>
    13ba:	4c 63 11             	movslq (%rcx),%r10
    13bd:	41 8d 7a 01          	lea    0x1(%r10),%edi
    13c1:	89 39                	mov    %edi,(%rcx)
    13c3:	42 89 04 92          	mov    %eax,(%rdx,%r10,4)
    13c7:	eb c7                	jmp    1390 <func0+0x50>

