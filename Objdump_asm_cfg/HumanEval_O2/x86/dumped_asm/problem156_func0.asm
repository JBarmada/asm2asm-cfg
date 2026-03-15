00000000000013b0 <func0>:
    13b0:	89 f8                	mov    %edi,%eax
    13b2:	f7 d8                	neg    %eax
    13b4:	0f 48 c7             	cmovs  %edi,%eax
    13b7:	31 c9                	xor    %ecx,%ecx
    13b9:	31 d2                	xor    %edx,%edx
    13bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    13c0:	4c 63 c0             	movslq %eax,%r8
    13c3:	83 e0 01             	and    $0x1,%eax
    13c6:	01 c2                	add    %eax,%edx
    13c8:	83 f0 01             	xor    $0x1,%eax
    13cb:	01 c1                	add    %eax,%ecx
    13cd:	49 69 c0 67 66 66 66 	imul   $0x66666667,%r8,%rax
    13d4:	48 89 c7             	mov    %rax,%rdi
    13d7:	48 c1 ef 3f          	shr    $0x3f,%rdi
    13db:	48 c1 f8 22          	sar    $0x22,%rax
    13df:	01 f8                	add    %edi,%eax
    13e1:	41 83 f8 09          	cmp    $0x9,%r8d
    13e5:	7f d9                	jg     13c0 <func0+0x10>
    13e7:	89 0e                	mov    %ecx,(%rsi)
    13e9:	89 56 04             	mov    %edx,0x4(%rsi)
    13ec:	c3                   	ret    

