0000000000001370 <func0>:
    1370:	55                   	push   %rbp
    1371:	41 57                	push   %r15
    1373:	41 56                	push   %r14
    1375:	41 54                	push   %r12
    1377:	53                   	push   %rbx
    1378:	49 89 fe             	mov    %rdi,%r14
    137b:	e8 b0 fc ff ff       	call   1030 <strlen@plt>
    1380:	48 89 c3             	mov    %rax,%rbx
    1383:	45 31 ff             	xor    %r15d,%r15d
    1386:	85 db                	test   %ebx,%ebx
    1388:	74 59                	je     13e3 <func0+0x73>
    138a:	89 dd                	mov    %ebx,%ebp
    138c:	48 c1 e3 20          	shl    $0x20,%rbx
    1390:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
    1397:	ff ff ff 
    139a:	48 01 d8             	add    %rbx,%rax
    139d:	48 c1 f8 20          	sar    $0x20,%rax
    13a1:	45 0f b6 24 06       	movzbl (%r14,%rax,1),%r12d
    13a6:	e8 a5 fc ff ff       	call   1050 <__ctype_b_loc@plt>
    13ab:	48 8b 00             	mov    (%rax),%rax
    13ae:	42 f6 44 60 01 04    	testb  $0x4,0x1(%rax,%r12,2)
    13b4:	74 2d                	je     13e3 <func0+0x73>
    13b6:	41 bf 01 00 00 00    	mov    $0x1,%r15d
    13bc:	83 fd 01             	cmp    $0x1,%ebp
    13bf:	74 22                	je     13e3 <func0+0x73>
    13c1:	48 b9 00 00 00 00 fe 	movabs $0xfffffffe00000000,%rcx
    13c8:	ff ff ff 
    13cb:	48 01 cb             	add    %rcx,%rbx
    13ce:	48 c1 fb 20          	sar    $0x20,%rbx
    13d2:	41 0f b6 0c 1e       	movzbl (%r14,%rbx,1),%ecx
    13d7:	45 31 ff             	xor    %r15d,%r15d
    13da:	f6 44 48 01 04       	testb  $0x4,0x1(%rax,%rcx,2)
    13df:	41 0f 94 c7          	sete   %r15b
    13e3:	44 89 f8             	mov    %r15d,%eax
    13e6:	5b                   	pop    %rbx
    13e7:	41 5c                	pop    %r12
    13e9:	41 5e                	pop    %r14
    13eb:	41 5f                	pop    %r15
    13ed:	5d                   	pop    %rbp
    13ee:	c3                   	ret    

