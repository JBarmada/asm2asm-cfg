0000000000001310 <func0>:
    1310:	55                   	push   %rbp
    1311:	41 57                	push   %r15
    1313:	41 56                	push   %r14
    1315:	41 55                	push   %r13
    1317:	41 54                	push   %r12
    1319:	53                   	push   %rbx
    131a:	48 83 ec 18          	sub    $0x18,%rsp
    131e:	48 89 cd             	mov    %rcx,%rbp
    1321:	49 89 d4             	mov    %rdx,%r12
    1324:	41 89 f7             	mov    %esi,%r15d
    1327:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
    132c:	48 89 d7             	mov    %rdx,%rdi
    132f:	e8 1c fd ff ff       	call   1050 <strlen@plt>
    1334:	49 89 c6             	mov    %rax,%r14
    1337:	49 63 df             	movslq %r15d,%rbx
    133a:	48 8d 3c dd 00 00 00 	lea    0x0(,%rbx,8),%rdi
    1341:	00 
    1342:	e8 39 fd ff ff       	call   1080 <malloc@plt>
    1347:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    134c:	48 89 45 00          	mov    %rax,0x0(%rbp)
    1350:	85 db                	test   %ebx,%ebx
    1352:	7e 52                	jle    13a6 <func0+0x96>
    1354:	4d 63 ee             	movslq %r14d,%r13
    1357:	45 89 fe             	mov    %r15d,%r14d
    135a:	45 31 ff             	xor    %r15d,%r15d
    135d:	31 ed                	xor    %ebp,%ebp
    135f:	eb 17                	jmp    1378 <func0+0x68>
    1361:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1368:	0f 1f 84 00 00 00 00 
    136f:	00 
    1370:	49 ff c7             	inc    %r15
    1373:	4d 39 fe             	cmp    %r15,%r14
    1376:	74 30                	je     13a8 <func0+0x98>
    1378:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    137d:	4a 8b 1c f8          	mov    (%rax,%r15,8),%rbx
    1381:	48 89 df             	mov    %rbx,%rdi
    1384:	4c 89 e6             	mov    %r12,%rsi
    1387:	4c 89 ea             	mov    %r13,%rdx
    138a:	e8 b1 fc ff ff       	call   1040 <strncmp@plt>
    138f:	85 c0                	test   %eax,%eax
    1391:	75 dd                	jne    1370 <func0+0x60>
    1393:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1398:	48 8b 00             	mov    (%rax),%rax
    139b:	48 63 cd             	movslq %ebp,%rcx
    139e:	ff c5                	inc    %ebp
    13a0:	48 89 1c c8          	mov    %rbx,(%rax,%rcx,8)
    13a4:	eb ca                	jmp    1370 <func0+0x60>
    13a6:	31 ed                	xor    %ebp,%ebp
    13a8:	89 e8                	mov    %ebp,%eax
    13aa:	48 83 c4 18          	add    $0x18,%rsp
    13ae:	5b                   	pop    %rbx
    13af:	41 5c                	pop    %r12
    13b1:	41 5d                	pop    %r13
    13b3:	41 5e                	pop    %r14
    13b5:	41 5f                	pop    %r15
    13b7:	5d                   	pop    %rbp
    13b8:	c3                   	ret    

