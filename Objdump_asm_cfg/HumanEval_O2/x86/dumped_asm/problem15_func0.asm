0000000000001460 <func0>:
    1460:	55                   	push   %rbp
    1461:	41 57                	push   %r15
    1463:	41 56                	push   %r14
    1465:	41 55                	push   %r13
    1467:	41 54                	push   %r12
    1469:	53                   	push   %rbx
    146a:	48 83 ec 18          	sub    $0x18,%rsp
    146e:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    1473:	49 89 fc             	mov    %rdi,%r12
    1476:	e8 d5 fb ff ff       	call   1050 <strlen@plt>
    147b:	48 89 c5             	mov    %rax,%rbp
    147e:	48 89 c3             	mov    %rax,%rbx
    1481:	48 c1 e3 20          	shl    $0x20,%rbx
    1485:	48 89 df             	mov    %rbx,%rdi
    1488:	48 c1 ff 1d          	sar    $0x1d,%rdi
    148c:	e8 ef fb ff ff       	call   1080 <malloc@plt>
    1491:	49 89 c5             	mov    %rax,%r13
    1494:	48 bf 00 00 00 00 01 	movabs $0x100000000,%rdi
    149b:	00 00 00 
    149e:	48 01 df             	add    %rbx,%rdi
    14a1:	48 c1 ff 20          	sar    $0x20,%rdi
    14a5:	e8 d6 fb ff ff       	call   1080 <malloc@plt>
    14aa:	48 89 c3             	mov    %rax,%rbx
    14ad:	c6 00 00             	movb   $0x0,(%rax)
    14b0:	85 ed                	test   %ebp,%ebp
    14b2:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    14b7:	7e 57                	jle    1510 <func0+0xb0>
    14b9:	41 89 ee             	mov    %ebp,%r14d
    14bc:	45 31 ff             	xor    %r15d,%r15d
    14bf:	90                   	nop
    14c0:	48 89 df             	mov    %rbx,%rdi
    14c3:	e8 88 fb ff ff       	call   1050 <strlen@plt>
    14c8:	48 89 c5             	mov    %rax,%rbp
    14cb:	48 8d 70 02          	lea    0x2(%rax),%rsi
    14cf:	48 89 df             	mov    %rbx,%rdi
    14d2:	e8 b9 fb ff ff       	call   1090 <realloc@plt>
    14d7:	48 89 c3             	mov    %rax,%rbx
    14da:	43 0f b6 04 3c       	movzbl (%r12,%r15,1),%eax
    14df:	88 04 2b             	mov    %al,(%rbx,%rbp,1)
    14e2:	c6 44 2b 01 00       	movb   $0x0,0x1(%rbx,%rbp,1)
    14e7:	48 89 df             	mov    %rbx,%rdi
    14ea:	e8 61 fb ff ff       	call   1050 <strlen@plt>
    14ef:	48 8d 78 01          	lea    0x1(%rax),%rdi
    14f3:	e8 88 fb ff ff       	call   1080 <malloc@plt>
    14f8:	4b 89 44 fd 00       	mov    %rax,0x0(%r13,%r15,8)
    14fd:	48 89 c7             	mov    %rax,%rdi
    1500:	48 89 de             	mov    %rbx,%rsi
    1503:	e8 38 fb ff ff       	call   1040 <strcpy@plt>
    1508:	49 ff c7             	inc    %r15
    150b:	4d 39 fe             	cmp    %r15,%r14
    150e:	75 b0                	jne    14c0 <func0+0x60>
    1510:	48 89 df             	mov    %rbx,%rdi
    1513:	e8 18 fb ff ff       	call   1030 <free@plt>
    1518:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    151d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    1522:	89 08                	mov    %ecx,(%rax)
    1524:	4c 89 e8             	mov    %r13,%rax
    1527:	48 83 c4 18          	add    $0x18,%rsp
    152b:	5b                   	pop    %rbx
    152c:	41 5c                	pop    %r12
    152e:	41 5d                	pop    %r13
    1530:	41 5e                	pop    %r14
    1532:	41 5f                	pop    %r15
    1534:	5d                   	pop    %rbp
    1535:	c3                   	ret    

