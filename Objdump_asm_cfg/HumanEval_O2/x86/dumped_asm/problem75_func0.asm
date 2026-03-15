0000000000001240 <func0>:
    1240:	55                   	push   %rbp
    1241:	41 57                	push   %r15
    1243:	41 56                	push   %r14
    1245:	41 55                	push   %r13
    1247:	41 54                	push   %r12
    1249:	53                   	push   %rbx
    124a:	50                   	push   %rax
    124b:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
    124f:	49 89 d4             	mov    %rdx,%r12
    1252:	48 89 fd             	mov    %rdi,%rbp
    1255:	45 31 f6             	xor    %r14d,%r14d
    1258:	bb 00 00 00 00       	mov    $0x0,%ebx
    125d:	85 f6                	test   %esi,%esi
    125f:	7e 23                	jle    1284 <func0+0x44>
    1261:	41 89 f5             	mov    %esi,%r13d
    1264:	45 31 ff             	xor    %r15d,%r15d
    1267:	31 db                	xor    %ebx,%ebx
    1269:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1270:	4a 8b 7c fd 00       	mov    0x0(%rbp,%r15,8),%rdi
    1275:	e8 b6 fd ff ff       	call   1030 <strlen@plt>
    127a:	01 c3                	add    %eax,%ebx
    127c:	49 ff c7             	inc    %r15
    127f:	4d 39 fd             	cmp    %r15,%r13
    1282:	75 ec                	jne    1270 <func0+0x30>
    1284:	49 89 ed             	mov    %rbp,%r13
    1287:	8b 44 24 04          	mov    0x4(%rsp),%eax
    128b:	85 c0                	test   %eax,%eax
    128d:	7e 25                	jle    12b4 <func0+0x74>
    128f:	41 89 c7             	mov    %eax,%r15d
    1292:	31 ed                	xor    %ebp,%ebp
    1294:	45 31 f6             	xor    %r14d,%r14d
    1297:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    129e:	00 00 
    12a0:	49 8b 3c ec          	mov    (%r12,%rbp,8),%rdi
    12a4:	e8 87 fd ff ff       	call   1030 <strlen@plt>
    12a9:	41 01 c6             	add    %eax,%r14d
    12ac:	48 ff c5             	inc    %rbp
    12af:	49 39 ef             	cmp    %rbp,%r15
    12b2:	75 ec                	jne    12a0 <func0+0x60>
    12b4:	44 39 f3             	cmp    %r14d,%ebx
    12b7:	4d 0f 4e e5          	cmovle %r13,%r12
    12bb:	4d 0f 4c e5          	cmovl  %r13,%r12
    12bf:	4c 89 e0             	mov    %r12,%rax
    12c2:	48 83 c4 08          	add    $0x8,%rsp
    12c6:	5b                   	pop    %rbx
    12c7:	41 5c                	pop    %r12
    12c9:	41 5d                	pop    %r13
    12cb:	41 5e                	pop    %r14
    12cd:	41 5f                	pop    %r15
    12cf:	5d                   	pop    %rbp
    12d0:	c3                   	ret    

