0000000000001480 <func0>:
    1480:	55                   	push   %rbp
    1481:	41 57                	push   %r15
    1483:	41 56                	push   %r14
    1485:	41 55                	push   %r13
    1487:	41 54                	push   %r12
    1489:	53                   	push   %rbx
    148a:	48 83 ec 18          	sub    $0x18,%rsp
    148e:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    1493:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
    1498:	85 f6                	test   %esi,%esi
    149a:	7e 51                	jle    14ed <func0+0x6d>
    149c:	49 89 fc             	mov    %rdi,%r12
    149f:	41 89 f5             	mov    %esi,%r13d
    14a2:	45 31 f6             	xor    %r14d,%r14d
    14a5:	31 ed                	xor    %ebp,%ebp
    14a7:	31 db                	xor    %ebx,%ebx
    14a9:	eb 0d                	jmp    14b8 <func0+0x38>
    14ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    14b0:	49 ff c6             	inc    %r14
    14b3:	4d 39 f5             	cmp    %r14,%r13
    14b6:	74 39                	je     14f1 <func0+0x71>
    14b8:	4b 8b 3c f4          	mov    (%r12,%r14,8),%rdi
    14bc:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    14c1:	e8 aa fb ff ff       	call   1070 <strstr@plt>
    14c6:	48 85 c0             	test   %rax,%rax
    14c9:	74 e5                	je     14b0 <func0+0x30>
    14cb:	4c 63 fd             	movslq %ebp,%r15
    14ce:	ff c5                	inc    %ebp
    14d0:	4a 8d 34 fd 08 00 00 	lea    0x8(,%r15,8),%rsi
    14d7:	00 
    14d8:	48 89 df             	mov    %rbx,%rdi
    14db:	e8 80 fb ff ff       	call   1060 <realloc@plt>
    14e0:	48 89 c3             	mov    %rax,%rbx
    14e3:	4b 8b 04 f4          	mov    (%r12,%r14,8),%rax
    14e7:	4a 89 04 fb          	mov    %rax,(%rbx,%r15,8)
    14eb:	eb c3                	jmp    14b0 <func0+0x30>
    14ed:	31 db                	xor    %ebx,%ebx
    14ef:	31 ed                	xor    %ebp,%ebp
    14f1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    14f6:	89 28                	mov    %ebp,(%rax)
    14f8:	48 89 d8             	mov    %rbx,%rax
    14fb:	48 83 c4 18          	add    $0x18,%rsp
    14ff:	5b                   	pop    %rbx
    1500:	41 5c                	pop    %r12
    1502:	41 5d                	pop    %r13
    1504:	41 5e                	pop    %r14
    1506:	41 5f                	pop    %r15
    1508:	5d                   	pop    %rbp
    1509:	c3                   	ret    

