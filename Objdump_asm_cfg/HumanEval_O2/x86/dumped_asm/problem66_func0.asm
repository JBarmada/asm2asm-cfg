00000000000012f0 <func0>:
    12f0:	55                   	push   %rbp
    12f1:	41 57                	push   %r15
    12f3:	41 56                	push   %r14
    12f5:	53                   	push   %rbx
    12f6:	48 83 ec 38          	sub    $0x38,%rsp
    12fa:	41 89 f6             	mov    %esi,%r14d
    12fd:	89 fa                	mov    %edi,%edx
    12ff:	4c 8d 3d 6a 2d 00 00 	lea    0x2d6a(%rip),%r15        # 4070 <func0.xs>
    1306:	48 8d 35 c8 0d 00 00 	lea    0xdc8(%rip),%rsi        # 20d5 <_IO_stdin_used+0xd5>
    130d:	4c 89 ff             	mov    %r15,%rdi
    1310:	31 c0                	xor    %eax,%eax
    1312:	e8 69 fd ff ff       	call   1080 <sprintf@plt>
    1317:	4c 89 ff             	mov    %r15,%rdi
    131a:	e8 21 fd ff ff       	call   1040 <strlen@plt>
    131f:	89 c5                	mov    %eax,%ebp
    1321:	44 29 f5             	sub    %r14d,%ebp
    1324:	7d 2a                	jge    1350 <func0+0x60>
    1326:	83 f8 02             	cmp    $0x2,%eax
    1329:	0f 8c e6 00 00 00    	jl     1415 <func0+0x125>
    132f:	49 89 c0             	mov    %rax,%r8
    1332:	49 d1 e8             	shr    %r8
    1335:	45 89 c3             	mov    %r8d,%r11d
    1338:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
    133f:	41 83 e0 01          	and    $0x1,%r8d
    1343:	49 83 fb 01          	cmp    $0x1,%r11
    1347:	75 40                	jne    1389 <func0+0x99>
    1349:	31 d2                	xor    %edx,%edx
    134b:	e9 a5 00 00 00       	jmp    13f5 <func0+0x105>
    1350:	48 63 f0             	movslq %eax,%rsi
    1353:	4c 01 fe             	add    %r15,%rsi
    1356:	49 63 de             	movslq %r14d,%rbx
    1359:	48 29 de             	sub    %rbx,%rsi
    135c:	49 89 e6             	mov    %rsp,%r14
    135f:	4c 89 f7             	mov    %r14,%rdi
    1362:	e8 c9 fc ff ff       	call   1030 <strcpy@plt>
    1367:	c6 04 1c 00          	movb   $0x0,(%rsp,%rbx,1)
    136b:	48 63 d5             	movslq %ebp,%rdx
    136e:	4c 89 f7             	mov    %r14,%rdi
    1371:	4c 89 fe             	mov    %r15,%rsi
    1374:	e8 e7 fc ff ff       	call   1060 <strncat@plt>
    1379:	4c 89 ff             	mov    %r15,%rdi
    137c:	4c 89 f6             	mov    %r14,%rsi
    137f:	e8 ac fc ff ff       	call   1030 <strcpy@plt>
    1384:	e9 8c 00 00 00       	jmp    1415 <func0+0x125>
    1389:	49 b9 00 00 00 00 fe 	movabs $0xfffffffe00000000,%r9
    1390:	ff ff ff 
    1393:	4d 29 c3             	sub    %r8,%r11
    1396:	48 89 c2             	mov    %rax,%rdx
    1399:	48 c1 e2 20          	shl    $0x20,%rdx
    139d:	4a 8d 34 0a          	lea    (%rdx,%r9,1),%rsi
    13a1:	48 bf 00 00 00 00 ff 	movabs $0xffffffff00000000,%rdi
    13a8:	ff ff ff 
    13ab:	48 01 d7             	add    %rdx,%rdi
    13ae:	31 d2                	xor    %edx,%edx
    13b0:	46 0f b6 14 3a       	movzbl (%rdx,%r15,1),%r10d
    13b5:	48 89 f9             	mov    %rdi,%rcx
    13b8:	48 c1 f9 20          	sar    $0x20,%rcx
    13bc:	42 0f b6 1c 39       	movzbl (%rcx,%r15,1),%ebx
    13c1:	42 88 1c 3a          	mov    %bl,(%rdx,%r15,1)
    13c5:	46 88 14 39          	mov    %r10b,(%rcx,%r15,1)
    13c9:	42 0f b6 4c 3a 01    	movzbl 0x1(%rdx,%r15,1),%ecx
    13cf:	48 89 f5             	mov    %rsi,%rbp
    13d2:	48 c1 fd 20          	sar    $0x20,%rbp
    13d6:	42 0f b6 5c 3d 00    	movzbl 0x0(%rbp,%r15,1),%ebx
    13dc:	42 88 5c 3a 01       	mov    %bl,0x1(%rdx,%r15,1)
    13e1:	42 88 4c 3d 00       	mov    %cl,0x0(%rbp,%r15,1)
    13e6:	48 83 c2 02          	add    $0x2,%rdx
    13ea:	4c 01 ce             	add    %r9,%rsi
    13ed:	4c 01 cf             	add    %r9,%rdi
    13f0:	49 39 d3             	cmp    %rdx,%r11
    13f3:	75 bb                	jne    13b0 <func0+0xc0>
    13f5:	4d 85 c0             	test   %r8,%r8
    13f8:	74 1b                	je     1415 <func0+0x125>
    13fa:	42 0f b6 0c 3a       	movzbl (%rdx,%r15,1),%ecx
    13ff:	89 d6                	mov    %edx,%esi
    1401:	f7 d6                	not    %esi
    1403:	01 c6                	add    %eax,%esi
    1405:	48 63 c6             	movslq %esi,%rax
    1408:	42 0f b6 1c 38       	movzbl (%rax,%r15,1),%ebx
    140d:	42 88 1c 3a          	mov    %bl,(%rdx,%r15,1)
    1411:	42 88 0c 38          	mov    %cl,(%rax,%r15,1)
    1415:	48 8d 05 54 2c 00 00 	lea    0x2c54(%rip),%rax        # 4070 <func0.xs>
    141c:	48 83 c4 38          	add    $0x38,%rsp
    1420:	5b                   	pop    %rbx
    1421:	41 5e                	pop    %r14
    1423:	41 5f                	pop    %r15
    1425:	5d                   	pop    %rbp
    1426:	c3                   	ret    

