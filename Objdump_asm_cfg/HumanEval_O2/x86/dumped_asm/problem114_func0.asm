00000000000013a0 <func0>:
    13a0:	55                   	push   %rbp
    13a1:	41 57                	push   %r15
    13a3:	41 56                	push   %r14
    13a5:	41 55                	push   %r13
    13a7:	41 54                	push   %r12
    13a9:	53                   	push   %rbx
    13aa:	50                   	push   %rax
    13ab:	89 f5                	mov    %esi,%ebp
    13ad:	49 89 fe             	mov    %rdi,%r14
    13b0:	48 63 de             	movslq %esi,%rbx
    13b3:	48 8d 3c dd 00 00 00 	lea    0x0(,%rbx,8),%rdi
    13ba:	00 
    13bb:	e8 a0 fc ff ff       	call   1060 <malloc@plt>
    13c0:	49 89 c4             	mov    %rax,%r12
    13c3:	85 db                	test   %ebx,%ebx
    13c5:	0f 8e 8f 00 00 00    	jle    145a <func0+0xba>
    13cb:	41 89 ed             	mov    %ebp,%r13d
    13ce:	4c 8d 3d f7 0d 00 00 	lea    0xdf7(%rip),%r15        # 21cc <_IO_stdin_used+0x1cc>
    13d5:	31 db                	xor    %ebx,%ebx
    13d7:	eb 31                	jmp    140a <func0+0x6a>
    13d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13e0:	bf 64 00 00 00       	mov    $0x64,%edi
    13e5:	e8 76 fc ff ff       	call   1060 <malloc@plt>
    13ea:	49 89 04 dc          	mov    %rax,(%r12,%rbx,8)
    13ee:	48 89 c7             	mov    %rax,%rdi
    13f1:	4c 89 fe             	mov    %r15,%rsi
    13f4:	89 ea                	mov    %ebp,%edx
    13f6:	89 e9                	mov    %ebp,%ecx
    13f8:	41 89 e8             	mov    %ebp,%r8d
    13fb:	31 c0                	xor    %eax,%eax
    13fd:	e8 6e fc ff ff       	call   1070 <sprintf@plt>
    1402:	48 ff c3             	inc    %rbx
    1405:	4c 39 eb             	cmp    %r13,%rbx
    1408:	74 50                	je     145a <func0+0xba>
    140a:	49 8b 04 de          	mov    (%r14,%rbx,8),%rax
    140e:	0f b6 08             	movzbl (%rax),%ecx
    1411:	bd 00 00 00 00       	mov    $0x0,%ebp
    1416:	84 c9                	test   %cl,%cl
    1418:	74 c6                	je     13e0 <func0+0x40>
    141a:	48 ff c0             	inc    %rax
    141d:	31 ed                	xor    %ebp,%ebp
    141f:	eb 19                	jmp    143a <func0+0x9a>
    1421:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1428:	0f 1f 84 00 00 00 00 
    142f:	00 
    1430:	0f b6 08             	movzbl (%rax),%ecx
    1433:	48 ff c0             	inc    %rax
    1436:	84 c9                	test   %cl,%cl
    1438:	74 a6                	je     13e0 <func0+0x40>
    143a:	8d 51 d0             	lea    -0x30(%rcx),%edx
    143d:	80 fa 09             	cmp    $0x9,%dl
    1440:	77 ee                	ja     1430 <func0+0x90>
    1442:	0f b6 c9             	movzbl %cl,%ecx
    1445:	83 c1 d0             	add    $0xffffffd0,%ecx
    1448:	81 e1 01 00 00 80    	and    $0x80000001,%ecx
    144e:	31 d2                	xor    %edx,%edx
    1450:	83 f9 01             	cmp    $0x1,%ecx
    1453:	0f 94 c2             	sete   %dl
    1456:	01 d5                	add    %edx,%ebp
    1458:	eb d6                	jmp    1430 <func0+0x90>
    145a:	4c 89 e0             	mov    %r12,%rax
    145d:	48 83 c4 08          	add    $0x8,%rsp
    1461:	5b                   	pop    %rbx
    1462:	41 5c                	pop    %r12
    1464:	41 5d                	pop    %r13
    1466:	41 5e                	pop    %r14
    1468:	41 5f                	pop    %r15
    146a:	5d                   	pop    %rbp
    146b:	c3                   	ret    

