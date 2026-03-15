0000000000001270 <func0>:
    1270:	55                   	push   %rbp
    1271:	41 57                	push   %r15
    1273:	41 56                	push   %r14
    1275:	41 55                	push   %r13
    1277:	41 54                	push   %r12
    1279:	53                   	push   %rbx
    127a:	50                   	push   %rax
    127b:	85 f6                	test   %esi,%esi
    127d:	7e 32                	jle    12b1 <func0+0x41>
    127f:	49 89 fe             	mov    %rdi,%r14
    1282:	41 89 f4             	mov    %esi,%r12d
    1285:	31 db                	xor    %ebx,%ebx
    1287:	4c 8d 2d d1 0d 00 00 	lea    0xdd1(%rip),%r13        # 205f <_IO_stdin_used+0x5f>
    128e:	31 ed                	xor    %ebp,%ebp
    1290:	4d 8b 3c de          	mov    (%r14,%rbx,8),%r15
    1294:	4c 89 ff             	mov    %r15,%rdi
    1297:	e8 94 fd ff ff       	call   1030 <strlen@plt>
    129c:	39 c5                	cmp    %eax,%ebp
    129e:	0f 4f c5             	cmovg  %ebp,%eax
    12a1:	4d 0f 4c ef          	cmovl  %r15,%r13
    12a5:	48 ff c3             	inc    %rbx
    12a8:	89 c5                	mov    %eax,%ebp
    12aa:	49 39 dc             	cmp    %rbx,%r12
    12ad:	75 e1                	jne    1290 <func0+0x20>
    12af:	eb 07                	jmp    12b8 <func0+0x48>
    12b1:	4c 8d 2d a7 0d 00 00 	lea    0xda7(%rip),%r13        # 205f <_IO_stdin_used+0x5f>
    12b8:	4c 89 e8             	mov    %r13,%rax
    12bb:	48 83 c4 08          	add    $0x8,%rsp
    12bf:	5b                   	pop    %rbx
    12c0:	41 5c                	pop    %r12
    12c2:	41 5d                	pop    %r13
    12c4:	41 5e                	pop    %r14
    12c6:	41 5f                	pop    %r15
    12c8:	5d                   	pop    %rbp
    12c9:	c3                   	ret    

