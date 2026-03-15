00000000000012c0 <func0>:
    12c0:	55                   	push   %rbp
    12c1:	41 57                	push   %r15
    12c3:	41 56                	push   %r14
    12c5:	41 55                	push   %r13
    12c7:	41 54                	push   %r12
    12c9:	53                   	push   %rbx
    12ca:	50                   	push   %rax
    12cb:	85 f6                	test   %esi,%esi
    12cd:	7e 57                	jle    1326 <func0+0x66>
    12cf:	41 89 f7             	mov    %esi,%r15d
    12d2:	49 89 fc             	mov    %rdi,%r12
    12d5:	41 89 f5             	mov    %esi,%r13d
    12d8:	31 ed                	xor    %ebp,%ebp
    12da:	31 db                	xor    %ebx,%ebx
    12dc:	0f 1f 40 00          	nopl   0x0(%rax)
    12e0:	49 8b 3c ec          	mov    (%r12,%rbp,8),%rdi
    12e4:	e8 57 fd ff ff       	call   1040 <strlen@plt>
    12e9:	01 c3                	add    %eax,%ebx
    12eb:	48 ff c5             	inc    %rbp
    12ee:	49 39 ed             	cmp    %rbp,%r13
    12f1:	75 ed                	jne    12e0 <func0+0x20>
    12f3:	ff c3                	inc    %ebx
    12f5:	48 63 fb             	movslq %ebx,%rdi
    12f8:	e8 73 fd ff ff       	call   1070 <malloc@plt>
    12fd:	48 85 c0             	test   %rax,%rax
    1300:	74 3b                	je     133d <func0+0x7d>
    1302:	49 89 c6             	mov    %rax,%r14
    1305:	c6 00 00             	movb   $0x0,(%rax)
    1308:	45 85 ff             	test   %r15d,%r15d
    130b:	7e 33                	jle    1340 <func0+0x80>
    130d:	31 db                	xor    %ebx,%ebx
    130f:	90                   	nop
    1310:	49 8b 34 dc          	mov    (%r12,%rbx,8),%rsi
    1314:	4c 89 f7             	mov    %r14,%rdi
    1317:	e8 64 fd ff ff       	call   1080 <strcat@plt>
    131c:	48 ff c3             	inc    %rbx
    131f:	49 39 dd             	cmp    %rbx,%r13
    1322:	75 ec                	jne    1310 <func0+0x50>
    1324:	eb 1a                	jmp    1340 <func0+0x80>
    1326:	bf 01 00 00 00       	mov    $0x1,%edi
    132b:	e8 40 fd ff ff       	call   1070 <malloc@plt>
    1330:	48 85 c0             	test   %rax,%rax
    1333:	74 08                	je     133d <func0+0x7d>
    1335:	49 89 c6             	mov    %rax,%r14
    1338:	c6 00 00             	movb   $0x0,(%rax)
    133b:	eb 03                	jmp    1340 <func0+0x80>
    133d:	45 31 f6             	xor    %r14d,%r14d
    1340:	4c 89 f0             	mov    %r14,%rax
    1343:	48 83 c4 08          	add    $0x8,%rsp
    1347:	5b                   	pop    %rbx
    1348:	41 5c                	pop    %r12
    134a:	41 5d                	pop    %r13
    134c:	41 5e                	pop    %r14
    134e:	41 5f                	pop    %r15
    1350:	5d                   	pop    %rbp
    1351:	c3                   	ret    

