00000000000012d0 <func0>:
    12d0:	55                   	push   %rbp
    12d1:	41 57                	push   %r15
    12d3:	41 56                	push   %r14
    12d5:	41 54                	push   %r12
    12d7:	53                   	push   %rbx
    12d8:	49 89 fe             	mov    %rdi,%r14
    12db:	e8 50 fd ff ff       	call   1030 <strlen@plt>
    12e0:	48 85 c0             	test   %rax,%rax
    12e3:	74 3e                	je     1323 <func0+0x53>
    12e5:	49 89 c4             	mov    %rax,%r12
    12e8:	31 db                	xor    %ebx,%ebx
    12ea:	4c 8d 3d 26 0e 00 00 	lea    0xe26(%rip),%r15        # 2117 <_IO_stdin_used+0x117>
    12f1:	31 ed                	xor    %ebp,%ebp
    12f3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    12fa:	84 00 00 00 00 00 
    1300:	41 0f be 34 1e       	movsbl (%r14,%rbx,1),%esi
    1305:	ba 07 00 00 00       	mov    $0x7,%edx
    130a:	4c 89 ff             	mov    %r15,%rdi
    130d:	e8 3e fd ff ff       	call   1050 <memchr@plt>
    1312:	48 83 f8 01          	cmp    $0x1,%rax
    1316:	83 dd ff             	sbb    $0xffffffff,%ebp
    1319:	48 ff c3             	inc    %rbx
    131c:	49 39 dc             	cmp    %rbx,%r12
    131f:	75 df                	jne    1300 <func0+0x30>
    1321:	eb 02                	jmp    1325 <func0+0x55>
    1323:	31 ed                	xor    %ebp,%ebp
    1325:	89 e8                	mov    %ebp,%eax
    1327:	5b                   	pop    %rbx
    1328:	41 5c                	pop    %r12
    132a:	41 5e                	pop    %r14
    132c:	41 5f                	pop    %r15
    132e:	5d                   	pop    %rbp
    132f:	c3                   	ret    

