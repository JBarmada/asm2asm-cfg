00000000000012d0 <func0>:
    12d0:	55                   	push   %rbp
    12d1:	41 57                	push   %r15
    12d3:	41 56                	push   %r14
    12d5:	41 55                	push   %r13
    12d7:	41 54                	push   %r12
    12d9:	53                   	push   %rbx
    12da:	50                   	push   %rax
    12db:	80 3f 00             	cmpb   $0x0,(%rdi)
    12de:	74 4f                	je     132f <func0+0x5f>
    12e0:	49 89 fc             	mov    %rdi,%r12
    12e3:	e8 48 fd ff ff       	call   1030 <strlen@plt>
    12e8:	49 89 c6             	mov    %rax,%r14
    12eb:	31 db                	xor    %ebx,%ebx
    12ed:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    12f3:	4c 8d 3d c2 0d 00 00 	lea    0xdc2(%rip),%r15        # 20bc <_IO_stdin_used+0xbc>
    12fa:	31 ed                	xor    %ebp,%ebp
    12fc:	0f 1f 40 00          	nopl   0x0(%rax)
    1300:	49 39 de             	cmp    %rbx,%r14
    1303:	76 2c                	jbe    1331 <func0+0x61>
    1305:	41 0f be 34 1c       	movsbl (%r12,%rbx,1),%esi
    130a:	ba 06 00 00 00       	mov    $0x6,%edx
    130f:	4c 89 ff             	mov    %r15,%rdi
    1312:	e8 39 fd ff ff       	call   1050 <memchr@plt>
    1317:	48 83 f8 01          	cmp    $0x1,%rax
    131b:	83 dd ff             	sbb    $0xffffffff,%ebp
    131e:	48 83 c3 02          	add    $0x2,%rbx
    1322:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
    1327:	4d 8d 6d 01          	lea    0x1(%r13),%r13
    132b:	75 d3                	jne    1300 <func0+0x30>
    132d:	eb 02                	jmp    1331 <func0+0x61>
    132f:	31 ed                	xor    %ebp,%ebp
    1331:	89 e8                	mov    %ebp,%eax
    1333:	48 83 c4 08          	add    $0x8,%rsp
    1337:	5b                   	pop    %rbx
    1338:	41 5c                	pop    %r12
    133a:	41 5d                	pop    %r13
    133c:	41 5e                	pop    %r14
    133e:	41 5f                	pop    %r15
    1340:	5d                   	pop    %rbp
    1341:	c3                   	ret    

