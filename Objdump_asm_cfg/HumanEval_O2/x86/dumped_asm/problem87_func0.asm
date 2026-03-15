00000000000013b0 <func0>:
    13b0:	55                   	push   %rbp
    13b1:	41 57                	push   %r15
    13b3:	41 56                	push   %r14
    13b5:	41 55                	push   %r13
    13b7:	41 54                	push   %r12
    13b9:	53                   	push   %rbx
    13ba:	48 83 ec 48          	sub    $0x48,%rsp
    13be:	48 89 fb             	mov    %rdi,%rbx
    13c1:	e8 7a fc ff ff       	call   1040 <strlen@plt>
    13c6:	48 89 c5             	mov    %rax,%rbp
    13c9:	83 c0 02             	add    $0x2,%eax
    13cc:	48 63 f8             	movslq %eax,%rdi
    13cf:	e8 ac fc ff ff       	call   1080 <malloc@plt>
    13d4:	49 89 eb             	mov    %rbp,%r11
    13d7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    13dc:	45 31 f6             	xor    %r14d,%r14d
    13df:	41 f7 c3 00 00 00 80 	test   $0x80000000,%r11d
    13e6:	0f 85 e1 00 00 00    	jne    14cd <func0+0x11d>
    13ec:	49 89 da             	mov    %rbx,%r10
    13ef:	41 ff c3             	inc    %r11d
    13f2:	45 31 ed             	xor    %r13d,%r13d
    13f5:	45 31 f6             	xor    %r14d,%r14d
    13f8:	45 31 e4             	xor    %r12d,%r12d
    13fb:	eb 1f                	jmp    141c <func0+0x6c>
    13fd:	0f 1f 00             	nopl   (%rax)
    1400:	49 63 cc             	movslq %r12d,%rcx
    1403:	41 ff c4             	inc    %r12d
    1406:	88 44 0c 10          	mov    %al,0x10(%rsp,%rcx,1)
    140a:	45 89 e7             	mov    %r12d,%r15d
    140d:	49 ff c5             	inc    %r13
    1410:	45 89 fc             	mov    %r15d,%r12d
    1413:	4d 39 dd             	cmp    %r11,%r13
    1416:	0f 84 b1 00 00 00    	je     14cd <func0+0x11d>
    141c:	43 0f b6 04 2a       	movzbl (%r10,%r13,1),%eax
    1421:	a8 df                	test   $0xdf,%al
    1423:	75 db                	jne    1400 <func0+0x50>
    1425:	41 83 fc 02          	cmp    $0x2,%r12d
    1429:	7c 55                	jl     1480 <func0+0xd0>
    142b:	45 8d 44 24 ff       	lea    -0x1(%r12),%r8d
    1430:	45 89 e1             	mov    %r12d,%r9d
    1433:	49 8d 51 ff          	lea    -0x1(%r9),%rdx
    1437:	48 8d 74 24 11       	lea    0x11(%rsp),%rsi
    143c:	31 db                	xor    %ebx,%ebx
    143e:	eb 0b                	jmp    144b <func0+0x9b>
    1440:	48 ff c6             	inc    %rsi
    1443:	48 ff ca             	dec    %rdx
    1446:	4c 39 c3             	cmp    %r8,%rbx
    1449:	74 35                	je     1480 <func0+0xd0>
    144b:	48 89 df             	mov    %rbx,%rdi
    144e:	48 ff c3             	inc    %rbx
    1451:	4c 39 cb             	cmp    %r9,%rbx
    1454:	73 ea                	jae    1440 <func0+0x90>
    1456:	31 ed                	xor    %ebp,%ebp
    1458:	eb 0e                	jmp    1468 <func0+0xb8>
    145a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1460:	48 ff c5             	inc    %rbp
    1463:	48 39 ea             	cmp    %rbp,%rdx
    1466:	74 d8                	je     1440 <func0+0x90>
    1468:	0f b6 44 3c 10       	movzbl 0x10(%rsp,%rdi,1),%eax
    146d:	0f b6 0c 2e          	movzbl (%rsi,%rbp,1),%ecx
    1471:	38 c8                	cmp    %cl,%al
    1473:	7e eb                	jle    1460 <func0+0xb0>
    1475:	88 4c 3c 10          	mov    %cl,0x10(%rsp,%rdi,1)
    1479:	88 04 2e             	mov    %al,(%rsi,%rbp,1)
    147c:	eb e2                	jmp    1460 <func0+0xb0>
    147e:	66 90                	xchg   %ax,%ax
    1480:	45 85 f6             	test   %r14d,%r14d
    1483:	7e 0f                	jle    1494 <func0+0xe4>
    1485:	44 89 f0             	mov    %r14d,%eax
    1488:	41 ff c6             	inc    %r14d
    148b:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    1490:	c6 04 01 20          	movb   $0x20,(%rcx,%rax,1)
    1494:	45 31 ff             	xor    %r15d,%r15d
    1497:	45 85 e4             	test   %r12d,%r12d
    149a:	0f 8e 6d ff ff ff    	jle    140d <func0+0x5d>
    14a0:	4d 63 f6             	movslq %r14d,%r14
    14a3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    14a8:	4a 8d 3c 30          	lea    (%rax,%r14,1),%rdi
    14ac:	44 89 e2             	mov    %r12d,%edx
    14af:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    14b4:	4c 89 d3             	mov    %r10,%rbx
    14b7:	4c 89 dd             	mov    %r11,%rbp
    14ba:	e8 b1 fb ff ff       	call   1070 <memcpy@plt>
    14bf:	49 89 eb             	mov    %rbp,%r11
    14c2:	49 89 da             	mov    %rbx,%r10
    14c5:	45 01 e6             	add    %r12d,%r14d
    14c8:	e9 40 ff ff ff       	jmp    140d <func0+0x5d>
    14cd:	49 63 ce             	movslq %r14d,%rcx
    14d0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    14d5:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    14d9:	48 83 c4 48          	add    $0x48,%rsp
    14dd:	5b                   	pop    %rbx
    14de:	41 5c                	pop    %r12
    14e0:	41 5d                	pop    %r13
    14e2:	41 5e                	pop    %r14
    14e4:	41 5f                	pop    %r15
    14e6:	5d                   	pop    %rbp
    14e7:	c3                   	ret    

