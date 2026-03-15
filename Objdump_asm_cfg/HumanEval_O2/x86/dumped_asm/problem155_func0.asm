0000000000001300 <func0>:
    1300:	55                   	push   %rbp
    1301:	41 57                	push   %r15
    1303:	41 56                	push   %r14
    1305:	41 55                	push   %r13
    1307:	41 54                	push   %r12
    1309:	53                   	push   %rbx
    130a:	48 83 ec 18          	sub    $0x18,%rsp
    130e:	49 89 f7             	mov    %rsi,%r15
    1311:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
    1316:	48 89 f7             	mov    %rsi,%rdi
    1319:	e8 32 fd ff ff       	call   1050 <strlen@plt>
    131e:	48 89 c3             	mov    %rax,%rbx
    1321:	01 c0                	add    %eax,%eax
    1323:	ff c0                	inc    %eax
    1325:	48 63 f8             	movslq %eax,%rdi
    1328:	e8 43 fd ff ff       	call   1070 <malloc@plt>
    132d:	49 89 c5             	mov    %rax,%r13
    1330:	85 db                	test   %ebx,%ebx
    1332:	7e 68                	jle    139c <func0+0x9c>
    1334:	4c 63 f3             	movslq %ebx,%r14
    1337:	44 89 f0             	mov    %r14d,%eax
    133a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    133f:	41 b4 01             	mov    $0x1,%r12b
    1342:	31 ed                	xor    %ebp,%ebp
    1344:	4c 89 f3             	mov    %r14,%rbx
    1347:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    134e:	00 00 
    1350:	49 8d 34 2f          	lea    (%r15,%rbp,1),%rsi
    1354:	4c 89 ef             	mov    %r13,%rdi
    1357:	48 89 da             	mov    %rbx,%rdx
    135a:	e8 e1 fc ff ff       	call   1040 <strncpy@plt>
    135f:	4a 8d 3c 2b          	lea    (%rbx,%r13,1),%rdi
    1363:	4c 89 fe             	mov    %r15,%rsi
    1366:	48 89 ea             	mov    %rbp,%rdx
    1369:	e8 d2 fc ff ff       	call   1040 <strncpy@plt>
    136e:	43 c6 44 35 00 00    	movb   $0x0,0x0(%r13,%r14,1)
    1374:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    1379:	4c 89 ee             	mov    %r13,%rsi
    137c:	e8 ff fc ff ff       	call   1080 <strstr@plt>
    1381:	48 85 c0             	test   %rax,%rax
    1384:	75 19                	jne    139f <func0+0x9f>
    1386:	48 ff c5             	inc    %rbp
    1389:	4c 39 f5             	cmp    %r14,%rbp
    138c:	41 0f 9c c4          	setl   %r12b
    1390:	48 ff cb             	dec    %rbx
    1393:	48 39 6c 24 08       	cmp    %rbp,0x8(%rsp)
    1398:	75 b6                	jne    1350 <func0+0x50>
    139a:	eb 03                	jmp    139f <func0+0x9f>
    139c:	45 31 e4             	xor    %r12d,%r12d
    139f:	4c 89 ef             	mov    %r13,%rdi
    13a2:	e8 89 fc ff ff       	call   1030 <free@plt>
    13a7:	41 80 e4 01          	and    $0x1,%r12b
    13ab:	44 89 e0             	mov    %r12d,%eax
    13ae:	48 83 c4 18          	add    $0x18,%rsp
    13b2:	5b                   	pop    %rbx
    13b3:	41 5c                	pop    %r12
    13b5:	41 5d                	pop    %r13
    13b7:	41 5e                	pop    %r14
    13b9:	41 5f                	pop    %r15
    13bb:	5d                   	pop    %rbp
    13bc:	c3                   	ret    

