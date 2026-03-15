0000000000001380 <func0>:
    1380:	55                   	push   %rbp
    1381:	41 57                	push   %r15
    1383:	41 56                	push   %r14
    1385:	53                   	push   %rbx
    1386:	50                   	push   %rax
    1387:	49 89 ff             	mov    %rdi,%r15
    138a:	0f b6 2f             	movzbl (%rdi),%ebp
    138d:	40 84 ed             	test   %bpl,%bpl
    1390:	74 37                	je     13c9 <func0+0x49>
    1392:	49 8d 5f 01          	lea    0x1(%r15),%rbx
    1396:	4c 8d 35 7e 0d 00 00 	lea    0xd7e(%rip),%r14        # 211b <_IO_stdin_used+0x11b>
    139d:	eb 0c                	jmp    13ab <func0+0x2b>
    139f:	90                   	nop
    13a0:	0f b6 2b             	movzbl (%rbx),%ebp
    13a3:	48 ff c3             	inc    %rbx
    13a6:	40 84 ed             	test   %bpl,%bpl
    13a9:	74 1e                	je     13c9 <func0+0x49>
    13ab:	40 0f be f5          	movsbl %bpl,%esi
    13af:	ba 0b 00 00 00       	mov    $0xb,%edx
    13b4:	4c 89 f7             	mov    %r14,%rdi
    13b7:	e8 84 fc ff ff       	call   1040 <memchr@plt>
    13bc:	48 85 c0             	test   %rax,%rax
    13bf:	75 df                	jne    13a0 <func0+0x20>
    13c1:	41 88 2f             	mov    %bpl,(%r15)
    13c4:	49 ff c7             	inc    %r15
    13c7:	eb d7                	jmp    13a0 <func0+0x20>
    13c9:	41 c6 07 00          	movb   $0x0,(%r15)
    13cd:	48 83 c4 08          	add    $0x8,%rsp
    13d1:	5b                   	pop    %rbx
    13d2:	41 5e                	pop    %r14
    13d4:	41 5f                	pop    %r15
    13d6:	5d                   	pop    %rbp
    13d7:	c3                   	ret    

