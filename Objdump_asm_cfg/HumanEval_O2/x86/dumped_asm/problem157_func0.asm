00000000000014e0 <func0>:
    14e0:	55                   	push   %rbp
    14e1:	41 57                	push   %r15
    14e3:	41 56                	push   %r14
    14e5:	41 55                	push   %r13
    14e7:	41 54                	push   %r12
    14e9:	53                   	push   %rbx
    14ea:	50                   	push   %rax
    14eb:	c6 06 00             	movb   $0x0,(%rsi)
    14ee:	85 ff                	test   %edi,%edi
    14f0:	7e 63                	jle    1555 <func0+0x75>
    14f2:	49 89 f6             	mov    %rsi,%r14
    14f5:	89 fd                	mov    %edi,%ebp
    14f7:	31 c0                	xor    %eax,%eax
    14f9:	4c 8d 25 e0 0c 00 00 	lea    0xce0(%rip),%r12        # 21e0 <_IO_stdin_used+0x1e0>
    1500:	eb 1c                	jmp    151e <func0+0x3e>
    1502:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1509:	1f 84 00 00 00 00 00 
    1510:	31 c0                	xor    %eax,%eax
    1512:	85 ed                	test   %ebp,%ebp
    1514:	0f 9f c0             	setg   %al
    1517:	44 01 e8             	add    %r13d,%eax
    151a:	85 ed                	test   %ebp,%ebp
    151c:	7e 37                	jle    1555 <func0+0x75>
    151e:	41 89 c5             	mov    %eax,%r13d
    1521:	48 8d 05 f8 0c 00 00 	lea    0xcf8(%rip),%rax        # 2220 <_IO_stdin_used+0x220>
    1528:	46 8b 3c a8          	mov    (%rax,%r13,4),%r15d
    152c:	44 39 fd             	cmp    %r15d,%ebp
    152f:	7c df                	jl     1510 <func0+0x30>
    1531:	4b 63 1c ac          	movslq (%r12,%r13,4),%rbx
    1535:	4c 01 e3             	add    %r12,%rbx
    1538:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    153f:	00 
    1540:	4c 89 f7             	mov    %r14,%rdi
    1543:	48 89 de             	mov    %rbx,%rsi
    1546:	e8 f5 fa ff ff       	call   1040 <strcat@plt>
    154b:	44 29 fd             	sub    %r15d,%ebp
    154e:	44 39 fd             	cmp    %r15d,%ebp
    1551:	7d ed                	jge    1540 <func0+0x60>
    1553:	eb bb                	jmp    1510 <func0+0x30>
    1555:	48 83 c4 08          	add    $0x8,%rsp
    1559:	5b                   	pop    %rbx
    155a:	41 5c                	pop    %r12
    155c:	41 5d                	pop    %r13
    155e:	41 5e                	pop    %r14
    1560:	41 5f                	pop    %r15
    1562:	5d                   	pop    %rbp
    1563:	c3                   	ret    

