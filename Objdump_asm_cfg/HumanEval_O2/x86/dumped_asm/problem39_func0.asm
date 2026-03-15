00000000000012d0 <func0>:
    12d0:	55                   	push   %rbp
    12d1:	41 57                	push   %r15
    12d3:	41 56                	push   %r14
    12d5:	41 55                	push   %r13
    12d7:	41 54                	push   %r12
    12d9:	53                   	push   %rbx
    12da:	48 83 ec 18          	sub    $0x18,%rsp
    12de:	89 74 24 04          	mov    %esi,0x4(%rsp)
    12e2:	48 89 fb             	mov    %rdi,%rbx
    12e5:	e8 66 fd ff ff       	call   1050 <strlen@plt>
    12ea:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    12ef:	85 c0                	test   %eax,%eax
    12f1:	0f 8e ae 00 00 00    	jle    13a5 <func0+0xd5>
    12f7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    12fc:	83 c0 02             	add    $0x2,%eax
    12ff:	b9 ab aa aa aa       	mov    $0xaaaaaaab,%ecx
    1304:	48 0f af c8          	imul   %rax,%rcx
    1308:	48 c1 e9 21          	shr    $0x21,%rcx
    130c:	41 be 03 00 00 00    	mov    $0x3,%r14d
    1312:	45 31 ff             	xor    %r15d,%r15d
    1315:	49 89 e5             	mov    %rsp,%r13
    1318:	eb 3a                	jmp    1354 <func0+0x84>
    131a:	0f b6 04 24          	movzbl (%rsp),%eax
    131e:	0f b7 4c 24 01       	movzwl 0x1(%rsp),%ecx
    1323:	66 89 0c 24          	mov    %cx,(%rsp)
    1327:	88 44 24 02          	mov    %al,0x2(%rsp)
    132b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1330:	48 89 df             	mov    %rbx,%rdi
    1333:	4c 89 ee             	mov    %r13,%rsi
    1336:	48 89 ea             	mov    %rbp,%rdx
    1339:	e8 f2 fc ff ff       	call   1030 <strncpy@plt>
    133e:	41 83 c6 03          	add    $0x3,%r14d
    1342:	48 83 c3 03          	add    $0x3,%rbx
    1346:	41 83 c7 fd          	add    $0xfffffffd,%r15d
    134a:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    134f:	48 ff c9             	dec    %rcx
    1352:	74 51                	je     13a5 <func0+0xd5>
    1354:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    1359:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
    135e:	45 39 e6             	cmp    %r12d,%r14d
    1361:	45 0f 4c e6          	cmovl  %r14d,%r12d
    1365:	43 8d 04 3c          	lea    (%r12,%r15,1),%eax
    1369:	48 63 e8             	movslq %eax,%rbp
    136c:	4c 89 ef             	mov    %r13,%rdi
    136f:	48 89 de             	mov    %rbx,%rsi
    1372:	48 89 ea             	mov    %rbp,%rdx
    1375:	e8 b6 fc ff ff       	call   1030 <strncpy@plt>
    137a:	c6 04 2c 00          	movb   $0x0,(%rsp,%rbp,1)
    137e:	45 39 f4             	cmp    %r14d,%r12d
    1381:	75 ad                	jne    1330 <func0+0x60>
    1383:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
    1388:	74 90                	je     131a <func0+0x4a>
    138a:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
    138f:	0f b6 0c 24          	movzbl (%rsp),%ecx
    1393:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
    1398:	88 54 24 02          	mov    %dl,0x2(%rsp)
    139c:	88 4c 24 01          	mov    %cl,0x1(%rsp)
    13a0:	88 04 24             	mov    %al,(%rsp)
    13a3:	eb 8b                	jmp    1330 <func0+0x60>
    13a5:	48 83 c4 18          	add    $0x18,%rsp
    13a9:	5b                   	pop    %rbx
    13aa:	41 5c                	pop    %r12
    13ac:	41 5d                	pop    %r13
    13ae:	41 5e                	pop    %r14
    13b0:	41 5f                	pop    %r15
    13b2:	5d                   	pop    %rbp
    13b3:	c3                   	ret    

