00000000000012e0 <func0>:
    12e0:	55                   	push   %rbp
    12e1:	41 57                	push   %r15
    12e3:	41 56                	push   %r14
    12e5:	41 55                	push   %r13
    12e7:	41 54                	push   %r12
    12e9:	53                   	push   %rbx
    12ea:	50                   	push   %rax
    12eb:	49 89 fe             	mov    %rdi,%r14
    12ee:	e8 3d fd ff ff       	call   1030 <strlen@plt>
    12f3:	49 89 c7             	mov    %rax,%r15
    12f6:	45 85 ff             	test   %r15d,%r15d
    12f9:	7e 4f                	jle    134a <func0+0x6a>
    12fb:	45 89 fd             	mov    %r15d,%r13d
    12fe:	31 ed                	xor    %ebp,%ebp
    1300:	4c 8d 25 c0 0d 00 00 	lea    0xdc0(%rip),%r12        # 20c7 <_IO_stdin_used+0xc7>
    1307:	31 db                	xor    %ebx,%ebx
    1309:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1310:	41 0f be 34 2e       	movsbl (%r14,%rbp,1),%esi
    1315:	ba 0b 00 00 00       	mov    $0xb,%edx
    131a:	4c 89 e7             	mov    %r12,%rdi
    131d:	e8 2e fd ff ff       	call   1050 <memchr@plt>
    1322:	48 83 f8 01          	cmp    $0x1,%rax
    1326:	83 db ff             	sbb    $0xffffffff,%ebx
    1329:	48 ff c5             	inc    %rbp
    132c:	49 39 ed             	cmp    %rbp,%r13
    132f:	75 df                	jne    1310 <func0+0x30>
    1331:	45 85 ff             	test   %r15d,%r15d
    1334:	7e 16                	jle    134c <func0+0x6c>
    1336:	41 ff cf             	dec    %r15d
    1339:	43 0f b6 04 3e       	movzbl (%r14,%r15,1),%eax
    133e:	83 c8 20             	or     $0x20,%eax
    1341:	83 f8 79             	cmp    $0x79,%eax
    1344:	75 06                	jne    134c <func0+0x6c>
    1346:	ff c3                	inc    %ebx
    1348:	eb 02                	jmp    134c <func0+0x6c>
    134a:	31 db                	xor    %ebx,%ebx
    134c:	89 d8                	mov    %ebx,%eax
    134e:	48 83 c4 08          	add    $0x8,%rsp
    1352:	5b                   	pop    %rbx
    1353:	41 5c                	pop    %r12
    1355:	41 5d                	pop    %r13
    1357:	41 5e                	pop    %r14
    1359:	41 5f                	pop    %r15
    135b:	5d                   	pop    %rbp
    135c:	c3                   	ret    

