0000000000001650 <func0>:
    1650:	55                   	push   %rbp
    1651:	53                   	push   %rbx
    1652:	50                   	push   %rax
    1653:	89 fb                	mov    %edi,%ebx
    1655:	8d 6b 01             	lea    0x1(%rbx),%ebp
    1658:	48 63 fd             	movslq %ebp,%rdi
    165b:	48 c1 e7 02          	shl    $0x2,%rdi
    165f:	e8 ec f9 ff ff       	call   1050 <malloc@plt>
    1664:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
    166a:	85 db                	test   %ebx,%ebx
    166c:	74 0c                	je     167a <func0+0x2a>
    166e:	c7 40 04 03 00 00 00 	movl   $0x3,0x4(%rax)
    1675:	83 fb 02             	cmp    $0x2,%ebx
    1678:	7d 07                	jge    1681 <func0+0x31>
    167a:	48 83 c4 08          	add    $0x8,%rsp
    167e:	5b                   	pop    %rbx
    167f:	5d                   	pop    %rbp
    1680:	c3                   	ret    
    1681:	89 e9                	mov    %ebp,%ecx
    1683:	ba 02 00 00 00       	mov    $0x2,%edx
    1688:	be 03 00 00 00       	mov    $0x3,%esi
    168d:	eb 1f                	jmp    16ae <func0+0x5e>
    168f:	90                   	nop
    1690:	8b 6c 90 f8          	mov    -0x8(%rax,%rdx,4),%ebp
    1694:	48 8d 5a 01          	lea    0x1(%rdx),%rbx
    1698:	89 df                	mov    %ebx,%edi
    169a:	d1 ef                	shr    %edi
    169c:	01 f7                	add    %esi,%edi
    169e:	8d 34 2f             	lea    (%rdi,%rbp,1),%esi
    16a1:	ff c6                	inc    %esi
    16a3:	89 34 90             	mov    %esi,(%rax,%rdx,4)
    16a6:	48 89 da             	mov    %rbx,%rdx
    16a9:	48 39 cb             	cmp    %rcx,%rbx
    16ac:	74 cc                	je     167a <func0+0x2a>
    16ae:	f6 c2 01             	test   $0x1,%dl
    16b1:	75 dd                	jne    1690 <func0+0x40>
    16b3:	89 d6                	mov    %edx,%esi
    16b5:	d1 ee                	shr    %esi
    16b7:	ff c6                	inc    %esi
    16b9:	48 8d 5a 01          	lea    0x1(%rdx),%rbx
    16bd:	eb e4                	jmp    16a3 <func0+0x53>

