00000000000015d0 <func0>:
    15d0:	55                   	push   %rbp
    15d1:	41 56                	push   %r14
    15d3:	53                   	push   %rbx
    15d4:	49 89 f8             	mov    %rdi,%r8
    15d7:	85 d2                	test   %edx,%edx
    15d9:	7e 64                	jle    163f <func0+0x6f>
    15db:	41 89 d1             	mov    %edx,%r9d
    15de:	41 be 18 fc ff ff    	mov    $0xfffffc18,%r14d
    15e4:	31 d2                	xor    %edx,%edx
    15e6:	45 31 db             	xor    %r11d,%r11d
    15e9:	eb 18                	jmp    1603 <func0+0x33>
    15eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    15f0:	44 39 f0             	cmp    %r14d,%eax
    15f3:	4d 0f 4f da          	cmovg  %r10,%r11
    15f7:	44 0f 4f f0          	cmovg  %eax,%r14d
    15fb:	48 ff c2             	inc    %rdx
    15fe:	4c 39 ca             	cmp    %r9,%rdx
    1601:	74 3f                	je     1642 <func0+0x72>
    1603:	4c 8b 14 d6          	mov    (%rsi,%rdx,8),%r10
    1607:	41 0f b6 1a          	movzbl (%r10),%ebx
    160b:	b8 00 00 00 00       	mov    $0x0,%eax
    1610:	84 db                	test   %bl,%bl
    1612:	74 dc                	je     15f0 <func0+0x20>
    1614:	49 8d 7a 01          	lea    0x1(%r10),%rdi
    1618:	31 c0                	xor    %eax,%eax
    161a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1620:	8d 6b bf             	lea    -0x41(%rbx),%ebp
    1623:	40 80 fd 1a          	cmp    $0x1a,%bpl
    1627:	83 d0 00             	adc    $0x0,%eax
    162a:	80 c3 9f             	add    $0x9f,%bl
    162d:	80 fb 1a             	cmp    $0x1a,%bl
    1630:	83 d8 00             	sbb    $0x0,%eax
    1633:	0f b6 1f             	movzbl (%rdi),%ebx
    1636:	48 ff c7             	inc    %rdi
    1639:	84 db                	test   %bl,%bl
    163b:	75 e3                	jne    1620 <func0+0x50>
    163d:	eb b1                	jmp    15f0 <func0+0x20>
    163f:	45 31 db             	xor    %r11d,%r11d
    1642:	48 8d 35 01 0d 00 00 	lea    0xd01(%rip),%rsi        # 234a <_IO_stdin_used+0x34a>
    1649:	48 89 cf             	mov    %rcx,%rdi
    164c:	4c 89 c2             	mov    %r8,%rdx
    164f:	4c 89 d9             	mov    %r11,%rcx
    1652:	31 c0                	xor    %eax,%eax
    1654:	5b                   	pop    %rbx
    1655:	41 5e                	pop    %r14
    1657:	5d                   	pop    %rbp
    1658:	e9 e3 f9 ff ff       	jmp    1040 <sprintf@plt>

