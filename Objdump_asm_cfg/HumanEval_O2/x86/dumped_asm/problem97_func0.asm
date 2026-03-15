00000000000016a0 <func0>:
    16a0:	55                   	push   %rbp
    16a1:	41 57                	push   %r15
    16a3:	41 56                	push   %r14
    16a5:	53                   	push   %rbx
    16a6:	50                   	push   %rax
    16a7:	49 89 f6             	mov    %rsi,%r14
    16aa:	41 89 ff             	mov    %edi,%r15d
    16ad:	48 63 df             	movslq %edi,%rbx
    16b0:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
    16b7:	00 
    16b8:	e8 93 f9 ff ff       	call   1050 <malloc@plt>
    16bd:	48 89 c1             	mov    %rax,%rcx
    16c0:	41 c7 06 00 00 00 00 	movl   $0x0,(%r14)
    16c7:	83 fb 03             	cmp    $0x3,%ebx
    16ca:	7c 53                	jl     171f <func0+0x7f>
    16cc:	be 02 00 00 00       	mov    $0x2,%esi
    16d1:	45 31 c0             	xor    %r8d,%r8d
    16d4:	eb 1d                	jmp    16f3 <func0+0x53>
    16d6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    16dd:	00 00 00 
    16e0:	49 63 c0             	movslq %r8d,%rax
    16e3:	89 34 81             	mov    %esi,(%rcx,%rax,4)
    16e6:	41 ff c0             	inc    %r8d
    16e9:	45 89 06             	mov    %r8d,(%r14)
    16ec:	ff c6                	inc    %esi
    16ee:	44 39 fe             	cmp    %r15d,%esi
    16f1:	74 2c                	je     171f <func0+0x7f>
    16f3:	45 85 c0             	test   %r8d,%r8d
    16f6:	7e e8                	jle    16e0 <func0+0x40>
    16f8:	44 89 c3             	mov    %r8d,%ebx
    16fb:	31 ed                	xor    %ebp,%ebp
    16fd:	0f 1f 00             	nopl   (%rax)
    1700:	8b 3c a9             	mov    (%rcx,%rbp,4),%edi
    1703:	89 f8                	mov    %edi,%eax
    1705:	0f af c7             	imul   %edi,%eax
    1708:	39 f0                	cmp    %esi,%eax
    170a:	77 d4                	ja     16e0 <func0+0x40>
    170c:	89 f0                	mov    %esi,%eax
    170e:	99                   	cltd   
    170f:	f7 ff                	idiv   %edi
    1711:	85 d2                	test   %edx,%edx
    1713:	74 d7                	je     16ec <func0+0x4c>
    1715:	48 ff c5             	inc    %rbp
    1718:	48 39 eb             	cmp    %rbp,%rbx
    171b:	75 e3                	jne    1700 <func0+0x60>
    171d:	eb c1                	jmp    16e0 <func0+0x40>
    171f:	48 89 c8             	mov    %rcx,%rax
    1722:	48 83 c4 08          	add    $0x8,%rsp
    1726:	5b                   	pop    %rbx
    1727:	41 5e                	pop    %r14
    1729:	41 5f                	pop    %r15
    172b:	5d                   	pop    %rbp
    172c:	c3                   	ret    

