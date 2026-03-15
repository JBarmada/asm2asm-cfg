0000000000001560 <func0>:
    1560:	55                   	push   %rbp
    1561:	41 57                	push   %r15
    1563:	41 56                	push   %r14
    1565:	41 55                	push   %r13
    1567:	41 54                	push   %r12
    1569:	53                   	push   %rbx
    156a:	48 81 ec 28 01 00 00 	sub    $0x128,%rsp
    1571:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
    1576:	85 f6                	test   %esi,%esi
    1578:	0f 8e 4d 01 00 00    	jle    16cb <func0+0x16b>
    157e:	89 f0                	mov    %esi,%eax
    1580:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    1585:	31 ed                	xor    %ebp,%ebp
    1587:	48 8d 05 ca 0a 00 00 	lea    0xaca(%rip),%rax        # 2058 <_IO_stdin_used+0x58>
    158e:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1593:	48 8d 5c 24 20       	lea    0x20(%rsp),%rbx
    1598:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%rsp)
    159f:	00 
    15a0:	eb 26                	jmp    15c8 <func0+0x68>
    15a2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    15a9:	1f 84 00 00 00 00 00 
    15b0:	44 89 74 24 04       	mov    %r14d,0x4(%rsp)
    15b5:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
    15ba:	48 ff c5             	inc    %rbp
    15bd:	48 3b 6c 24 10       	cmp    0x10(%rsp),%rbp
    15c2:	0f 84 0f 01 00 00    	je     16d7 <func0+0x177>
    15c8:	0f 57 c0             	xorps  %xmm0,%xmm0
    15cb:	0f 29 84 24 10 01 00 	movaps %xmm0,0x110(%rsp)
    15d2:	00 
    15d3:	0f 29 84 24 00 01 00 	movaps %xmm0,0x100(%rsp)
    15da:	00 
    15db:	0f 29 84 24 f0 00 00 	movaps %xmm0,0xf0(%rsp)
    15e2:	00 
    15e3:	0f 29 84 24 e0 00 00 	movaps %xmm0,0xe0(%rsp)
    15ea:	00 
    15eb:	0f 29 84 24 d0 00 00 	movaps %xmm0,0xd0(%rsp)
    15f2:	00 
    15f3:	0f 29 84 24 c0 00 00 	movaps %xmm0,0xc0(%rsp)
    15fa:	00 
    15fb:	0f 29 84 24 b0 00 00 	movaps %xmm0,0xb0(%rsp)
    1602:	00 
    1603:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
    160a:	00 
    160b:	0f 29 84 24 90 00 00 	movaps %xmm0,0x90(%rsp)
    1612:	00 
    1613:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
    161a:	00 
    161b:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
    1620:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
    1625:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
    162a:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
    162f:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
    1634:	0f 29 44 24 20       	movaps %xmm0,0x20(%rsp)
    1639:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    163e:	4c 8b 24 e8          	mov    (%rax,%rbp,8),%r12
    1642:	45 0f b6 2c 24       	movzbl (%r12),%r13d
    1647:	41 be 00 00 00 00    	mov    $0x0,%r14d
    164d:	45 84 ed             	test   %r13b,%r13b
    1650:	74 4e                	je     16a0 <func0+0x140>
    1652:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
    1657:	45 31 f6             	xor    %r14d,%r14d
    165a:	eb 10                	jmp    166c <func0+0x10c>
    165c:	0f 1f 40 00          	nopl   0x0(%rax)
    1660:	45 0f b6 2f          	movzbl (%r15),%r13d
    1664:	49 ff c7             	inc    %r15
    1667:	45 84 ed             	test   %r13b,%r13b
    166a:	74 34                	je     16a0 <func0+0x140>
    166c:	41 0f be f5          	movsbl %r13b,%esi
    1670:	48 89 df             	mov    %rbx,%rdi
    1673:	e8 c8 f9 ff ff       	call   1040 <strchr@plt>
    1678:	48 85 c0             	test   %rax,%rax
    167b:	75 e3                	jne    1660 <func0+0x100>
    167d:	48 89 df             	mov    %rbx,%rdi
    1680:	e8 ab f9 ff ff       	call   1030 <strlen@plt>
    1685:	48 98                	cltq   
    1687:	44 88 6c 04 20       	mov    %r13b,0x20(%rsp,%rax,1)
    168c:	ff c0                	inc    %eax
    168e:	48 98                	cltq   
    1690:	c6 44 04 20 00       	movb   $0x0,0x20(%rsp,%rax,1)
    1695:	41 ff c6             	inc    %r14d
    1698:	eb c6                	jmp    1660 <func0+0x100>
    169a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    16a0:	44 3b 74 24 04       	cmp    0x4(%rsp),%r14d
    16a5:	0f 8f 05 ff ff ff    	jg     15b0 <func0+0x50>
    16ab:	0f 85 09 ff ff ff    	jne    15ba <func0+0x5a>
    16b1:	4c 89 e7             	mov    %r12,%rdi
    16b4:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    16b9:	e8 a2 f9 ff ff       	call   1060 <strcmp@plt>
    16be:	85 c0                	test   %eax,%eax
    16c0:	0f 88 ea fe ff ff    	js     15b0 <func0+0x50>
    16c6:	e9 ef fe ff ff       	jmp    15ba <func0+0x5a>
    16cb:	48 8d 05 86 09 00 00 	lea    0x986(%rip),%rax        # 2058 <_IO_stdin_used+0x58>
    16d2:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    16d7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    16dc:	48 81 c4 28 01 00 00 	add    $0x128,%rsp
    16e3:	5b                   	pop    %rbx
    16e4:	41 5c                	pop    %r12
    16e6:	41 5d                	pop    %r13
    16e8:	41 5e                	pop    %r14
    16ea:	41 5f                	pop    %r15
    16ec:	5d                   	pop    %rbp
    16ed:	c3                   	ret    

