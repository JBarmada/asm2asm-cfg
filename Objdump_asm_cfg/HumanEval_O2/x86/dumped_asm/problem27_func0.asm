0000000000001330 <func0>:
    1330:	55                   	push   %rbp
    1331:	41 57                	push   %r15
    1333:	41 56                	push   %r14
    1335:	41 55                	push   %r13
    1337:	41 54                	push   %r12
    1339:	53                   	push   %rbx
    133a:	50                   	push   %rax
    133b:	48 89 14 24          	mov    %rdx,(%rsp)
    133f:	89 f5                	mov    %esi,%ebp
    1341:	49 89 fc             	mov    %rdi,%r12
    1344:	4c 63 f6             	movslq %esi,%r14
    1347:	4a 8d 3c b5 00 00 00 	lea    0x0(,%r14,4),%rdi
    134e:	00 
    134f:	e8 0c fd ff ff       	call   1060 <malloc@plt>
    1354:	49 89 c7             	mov    %rax,%r15
    1357:	be 04 00 00 00       	mov    $0x4,%esi
    135c:	4c 89 f7             	mov    %r14,%rdi
    135f:	e8 ec fc ff ff       	call   1050 <calloc@plt>
    1364:	49 89 c5             	mov    %rax,%r13
    1367:	be 04 00 00 00       	mov    $0x4,%esi
    136c:	4c 89 f7             	mov    %r14,%rdi
    136f:	e8 dc fc ff ff       	call   1050 <calloc@plt>
    1374:	48 89 c3             	mov    %rax,%rbx
    1377:	45 85 f6             	test   %r14d,%r14d
    137a:	0f 8e df 00 00 00    	jle    145f <func0+0x12f>
    1380:	41 89 e8             	mov    %ebp,%r8d
    1383:	31 d2                	xor    %edx,%edx
    1385:	31 f6                	xor    %esi,%esi
    1387:	31 c9                	xor    %ecx,%ecx
    1389:	4c 8b 0c 24          	mov    (%rsp),%r9
    138d:	41 89 ea             	mov    %ebp,%r10d
    1390:	eb 23                	jmp    13b5 <func0+0x85>
    1392:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1399:	1f 84 00 00 00 00 00 
    13a0:	89 f0                	mov    %esi,%eax
    13a2:	ff c6                	inc    %esi
    13a4:	4c 89 ed             	mov    %r13,%rbp
    13a7:	48 98                	cltq   
    13a9:	89 7c 85 00          	mov    %edi,0x0(%rbp,%rax,4)
    13ad:	48 ff c2             	inc    %rdx
    13b0:	4c 39 c2             	cmp    %r8,%rdx
    13b3:	74 64                	je     1419 <func0+0xe9>
    13b5:	41 8b 3c 94          	mov    (%r12,%rdx,4),%edi
    13b9:	85 c9                	test   %ecx,%ecx
    13bb:	7e 20                	jle    13dd <func0+0xad>
    13bd:	89 cd                	mov    %ecx,%ebp
    13bf:	31 c0                	xor    %eax,%eax
    13c1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    13c8:	0f 1f 84 00 00 00 00 
    13cf:	00 
    13d0:	39 3c 83             	cmp    %edi,(%rbx,%rax,4)
    13d3:	74 d8                	je     13ad <func0+0x7d>
    13d5:	48 ff c0             	inc    %rax
    13d8:	48 39 c5             	cmp    %rax,%rbp
    13db:	75 f3                	jne    13d0 <func0+0xa0>
    13dd:	85 f6                	test   %esi,%esi
    13df:	7e bf                	jle    13a0 <func0+0x70>
    13e1:	89 f5                	mov    %esi,%ebp
    13e3:	31 c0                	xor    %eax,%eax
    13e5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    13ec:	00 00 00 00 
    13f0:	41 39 7c 85 00       	cmp    %edi,0x0(%r13,%rax,4)
    13f5:	74 19                	je     1410 <func0+0xe0>
    13f7:	48 ff c0             	inc    %rax
    13fa:	48 39 c5             	cmp    %rax,%rbp
    13fd:	75 f1                	jne    13f0 <func0+0xc0>
    13ff:	eb 9f                	jmp    13a0 <func0+0x70>
    1401:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1408:	0f 1f 84 00 00 00 00 
    140f:	00 
    1410:	89 c8                	mov    %ecx,%eax
    1412:	ff c1                	inc    %ecx
    1414:	48 89 dd             	mov    %rbx,%rbp
    1417:	eb 8e                	jmp    13a7 <func0+0x77>
    1419:	45 85 d2             	test   %r10d,%r10d
    141c:	7e 49                	jle    1467 <func0+0x137>
    141e:	89 ce                	mov    %ecx,%esi
    1420:	31 ff                	xor    %edi,%edi
    1422:	31 d2                	xor    %edx,%edx
    1424:	eb 1b                	jmp    1441 <func0+0x111>
    1426:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    142d:	00 00 00 
    1430:	48 63 c2             	movslq %edx,%rax
    1433:	ff c2                	inc    %edx
    1435:	41 89 2c 87          	mov    %ebp,(%r15,%rax,4)
    1439:	48 ff c7             	inc    %rdi
    143c:	4c 39 c7             	cmp    %r8,%rdi
    143f:	74 28                	je     1469 <func0+0x139>
    1441:	41 8b 2c bc          	mov    (%r12,%rdi,4),%ebp
    1445:	85 c9                	test   %ecx,%ecx
    1447:	7e e7                	jle    1430 <func0+0x100>
    1449:	31 c0                	xor    %eax,%eax
    144b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1450:	39 2c 83             	cmp    %ebp,(%rbx,%rax,4)
    1453:	74 e4                	je     1439 <func0+0x109>
    1455:	48 ff c0             	inc    %rax
    1458:	48 39 c6             	cmp    %rax,%rsi
    145b:	75 f3                	jne    1450 <func0+0x120>
    145d:	eb d1                	jmp    1430 <func0+0x100>
    145f:	31 d2                	xor    %edx,%edx
    1461:	4c 8b 0c 24          	mov    (%rsp),%r9
    1465:	eb 02                	jmp    1469 <func0+0x139>
    1467:	31 d2                	xor    %edx,%edx
    1469:	41 89 11             	mov    %edx,(%r9)
    146c:	4c 89 ef             	mov    %r13,%rdi
    146f:	e8 bc fb ff ff       	call   1030 <free@plt>
    1474:	48 89 df             	mov    %rbx,%rdi
    1477:	e8 b4 fb ff ff       	call   1030 <free@plt>
    147c:	4c 89 f8             	mov    %r15,%rax
    147f:	48 83 c4 08          	add    $0x8,%rsp
    1483:	5b                   	pop    %rbx
    1484:	41 5c                	pop    %r12
    1486:	41 5d                	pop    %r13
    1488:	41 5e                	pop    %r14
    148a:	41 5f                	pop    %r15
    148c:	5d                   	pop    %rbp
    148d:	c3                   	ret    

