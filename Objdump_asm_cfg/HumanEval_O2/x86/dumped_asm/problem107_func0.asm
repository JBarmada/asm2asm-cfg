00000000000012f0 <func0>:
    12f0:	55                   	push   %rbp
    12f1:	53                   	push   %rbx
    12f2:	50                   	push   %rax
    12f3:	89 fd                	mov    %edi,%ebp
    12f5:	48 63 df             	movslq %edi,%rbx
    12f8:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
    12ff:	00 
    1300:	e8 4b fd ff ff       	call   1050 <malloc@plt>
    1305:	85 db                	test   %ebx,%ebx
    1307:	7e 78                	jle    1381 <func0+0x91>
    1309:	41 89 e8             	mov    %ebp,%r8d
    130c:	83 fd 01             	cmp    $0x1,%ebp
    130f:	75 0e                	jne    131f <func0+0x2f>
    1311:	31 d2                	xor    %edx,%edx
    1313:	be 01 00 00 00       	mov    $0x1,%esi
    1318:	bf 01 00 00 00       	mov    $0x1,%edi
    131d:	eb 4c                	jmp    136b <func0+0x7b>
    131f:	44 89 c1             	mov    %r8d,%ecx
    1322:	83 e1 fe             	and    $0xfffffffe,%ecx
    1325:	48 f7 d9             	neg    %rcx
    1328:	31 d2                	xor    %edx,%edx
    132a:	be 01 00 00 00       	mov    $0x1,%esi
    132f:	bf 01 00 00 00       	mov    $0x1,%edi
    1334:	bb 02 00 00 00       	mov    $0x2,%ebx
    1339:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1340:	8d 6b ff             	lea    -0x1(%rbx),%ebp
    1343:	01 da                	add    %ebx,%edx
    1345:	ff ca                	dec    %edx
    1347:	89 54 b8 fc          	mov    %edx,-0x4(%rax,%rdi,4)
    134b:	01 da                	add    %ebx,%edx
    134d:	0f af f3             	imul   %ebx,%esi
    1350:	0f af f5             	imul   %ebp,%esi
    1353:	89 34 b8             	mov    %esi,(%rax,%rdi,4)
    1356:	83 c3 02             	add    $0x2,%ebx
    1359:	48 8d 2c 39          	lea    (%rcx,%rdi,1),%rbp
    135d:	48 83 c5 02          	add    $0x2,%rbp
    1361:	48 83 c7 02          	add    $0x2,%rdi
    1365:	48 83 fd 01          	cmp    $0x1,%rbp
    1369:	75 d5                	jne    1340 <func0+0x50>
    136b:	41 f6 c0 01          	test   $0x1,%r8b
    136f:	74 10                	je     1381 <func0+0x91>
    1371:	01 fa                	add    %edi,%edx
    1373:	0f af f7             	imul   %edi,%esi
    1376:	40 f6 c7 01          	test   $0x1,%dil
    137a:	0f 45 f2             	cmovne %edx,%esi
    137d:	89 74 b8 fc          	mov    %esi,-0x4(%rax,%rdi,4)
    1381:	48 83 c4 08          	add    $0x8,%rsp
    1385:	5b                   	pop    %rbx
    1386:	5d                   	pop    %rbp
    1387:	c3                   	ret    

