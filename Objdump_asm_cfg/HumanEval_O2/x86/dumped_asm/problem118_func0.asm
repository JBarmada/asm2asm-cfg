00000000000015b0 <func0>:
    15b0:	55                   	push   %rbp
    15b1:	41 57                	push   %r15
    15b3:	41 56                	push   %r14
    15b5:	41 55                	push   %r13
    15b7:	41 54                	push   %r12
    15b9:	53                   	push   %rbx
    15ba:	48 83 ec 38          	sub    $0x38,%rsp
    15be:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
    15c3:	89 74 24 14          	mov    %esi,0x14(%rsp)
    15c7:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
    15cc:	e8 7f fa ff ff       	call   1050 <strlen@plt>
    15d1:	48 ff c0             	inc    %rax
    15d4:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    15d9:	48 89 c7             	mov    %rax,%rdi
    15dc:	e8 af fa ff ff       	call   1090 <malloc@plt>
    15e1:	48 89 c3             	mov    %rax,%rbx
    15e4:	45 31 f6             	xor    %r14d,%r14d
    15e7:	e8 c4 fa ff ff       	call   10b0 <__ctype_b_loc@plt>
    15ec:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    15f1:	31 c0                	xor    %eax,%eax
    15f3:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    15f8:	45 31 ed             	xor    %r13d,%r13d
    15fb:	45 31 e4             	xor    %r12d,%r12d
    15fe:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%rsp)
    1605:	00 
    1606:	eb 1d                	jmp    1625 <func0+0x75>
    1608:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    160f:	00 
    1610:	45 8d 66 01          	lea    0x1(%r14),%r12d
    1614:	45 31 ed             	xor    %r13d,%r13d
    1617:	49 ff c6             	inc    %r14
    161a:	4c 39 74 24 28       	cmp    %r14,0x28(%rsp)
    161f:	0f 84 c0 00 00 00    	je     16e5 <func0+0x135>
    1625:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    162a:	48 8b 28             	mov    (%rax),%rbp
    162d:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    1632:	4e 0f be 3c 30       	movsbq (%rax,%r14,1),%r15
    1637:	42 f6 44 7d 01 20    	testb  $0x20,0x1(%rbp,%r15,2)
    163d:	75 41                	jne    1680 <func0+0xd0>
    163f:	45 84 ff             	test   %r15b,%r15b
    1642:	74 3c                	je     1680 <func0+0xd0>
    1644:	44 89 f0             	mov    %r14d,%eax
    1647:	44 29 e0             	sub    %r12d,%eax
    164a:	48 98                	cltq   
    164c:	44 88 3c 03          	mov    %r15b,(%rbx,%rax,1)
    1650:	ba 0b 00 00 00       	mov    $0xb,%edx
    1655:	48 8d 3d d8 0a 00 00 	lea    0xad8(%rip),%rdi        # 2134 <_IO_stdin_used+0x134>
    165c:	44 89 fe             	mov    %r15d,%esi
    165f:	e8 0c fa ff ff       	call   1070 <memchr@plt>
    1664:	48 85 c0             	test   %rax,%rax
    1667:	75 ae                	jne    1617 <func0+0x67>
    1669:	41 0f b6 c7          	movzbl %r15b,%eax
    166d:	0f b7 44 45 00       	movzwl 0x0(%rbp,%rax,2),%eax
    1672:	0f ba e0 0a          	bt     $0xa,%eax
    1676:	41 83 d5 00          	adc    $0x0,%r13d
    167a:	eb 9b                	jmp    1617 <func0+0x67>
    167c:	0f 1f 40 00          	nopl   0x0(%rax)
    1680:	44 3b 6c 24 14       	cmp    0x14(%rsp),%r13d
    1685:	75 89                	jne    1610 <func0+0x60>
    1687:	44 89 f0             	mov    %r14d,%eax
    168a:	44 29 e0             	sub    %r12d,%eax
    168d:	48 98                	cltq   
    168f:	c6 04 03 00          	movb   $0x0,(%rbx,%rax,1)
    1693:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1697:	4c 63 f8             	movslq %eax,%r15
    169a:	ff c0                	inc    %eax
    169c:	89 44 24 04          	mov    %eax,0x4(%rsp)
    16a0:	4a 8d 34 fd 08 00 00 	lea    0x8(,%r15,8),%rsi
    16a7:	00 
    16a8:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    16ad:	e8 ee f9 ff ff       	call   10a0 <realloc@plt>
    16b2:	48 89 dd             	mov    %rbx,%rbp
    16b5:	48 89 c3             	mov    %rax,%rbx
    16b8:	48 89 ef             	mov    %rbp,%rdi
    16bb:	e8 90 f9 ff ff       	call   1050 <strlen@plt>
    16c0:	48 8d 78 01          	lea    0x1(%rax),%rdi
    16c4:	e8 c7 f9 ff ff       	call   1090 <malloc@plt>
    16c9:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
    16ce:	4a 89 04 fb          	mov    %rax,(%rbx,%r15,8)
    16d2:	48 89 eb             	mov    %rbp,%rbx
    16d5:	48 89 c7             	mov    %rax,%rdi
    16d8:	48 89 ee             	mov    %rbp,%rsi
    16db:	e8 60 f9 ff ff       	call   1040 <strcpy@plt>
    16e0:	e9 2b ff ff ff       	jmp    1610 <func0+0x60>
    16e5:	48 89 df             	mov    %rbx,%rdi
    16e8:	e8 43 f9 ff ff       	call   1030 <free@plt>
    16ed:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    16f2:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
    16f6:	89 08                	mov    %ecx,(%rax)
    16f8:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    16fd:	48 83 c4 38          	add    $0x38,%rsp
    1701:	5b                   	pop    %rbx
    1702:	41 5c                	pop    %r12
    1704:	41 5d                	pop    %r13
    1706:	41 5e                	pop    %r14
    1708:	41 5f                	pop    %r15
    170a:	5d                   	pop    %rbp
    170b:	c3                   	ret    

