0000000000001300 <func0>:
    1300:	53                   	push   %rbx
    1301:	48 83 ec 10          	sub    $0x10,%rsp
    1305:	89 fa                	mov    %edi,%edx
    1307:	48 8d 35 b0 0d 00 00 	lea    0xdb0(%rip),%rsi        # 20be <_IO_stdin_used+0xbe>
    130e:	31 db                	xor    %ebx,%ebx
    1310:	48 8d 7c 24 0a       	lea    0xa(%rsp),%rdi
    1315:	31 c0                	xor    %eax,%eax
    1317:	e8 54 fd ff ff       	call   1070 <sprintf@plt>
    131c:	0f b6 44 24 0a       	movzbl 0xa(%rsp),%eax
    1321:	84 c0                	test   %al,%al
    1323:	74 6e                	je     1393 <func0+0x93>
    1325:	48 8d 4c 24 0b       	lea    0xb(%rsp),%rcx
    132a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1330:	0f be c0             	movsbl %al,%eax
    1333:	01 c3                	add    %eax,%ebx
    1335:	83 c3 d0             	add    $0xffffffd0,%ebx
    1338:	0f b6 01             	movzbl (%rcx),%eax
    133b:	48 ff c1             	inc    %rcx
    133e:	84 c0                	test   %al,%al
    1340:	75 ee                	jne    1330 <func0+0x30>
    1342:	bf 21 00 00 00       	mov    $0x21,%edi
    1347:	e8 14 fd ff ff       	call   1060 <malloc@plt>
    134c:	85 db                	test   %ebx,%ebx
    134e:	74 4d                	je     139d <func0+0x9d>
    1350:	7e 5d                	jle    13af <func0+0xaf>
    1352:	31 f6                	xor    %esi,%esi
    1354:	89 da                	mov    %ebx,%edx
    1356:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    135d:	00 00 00 
    1360:	89 d9                	mov    %ebx,%ecx
    1362:	80 e1 01             	and    $0x1,%cl
    1365:	80 c9 30             	or     $0x30,%cl
    1368:	88 0c 30             	mov    %cl,(%rax,%rsi,1)
    136b:	48 ff c6             	inc    %rsi
    136e:	d1 ea                	shr    %edx
    1370:	83 fb 02             	cmp    $0x2,%ebx
    1373:	89 d3                	mov    %edx,%ebx
    1375:	73 e9                	jae    1360 <func0+0x60>
    1377:	c6 04 30 00          	movb   $0x0,(%rax,%rsi,1)
    137b:	f7 c6 fe ff ff ff    	test   $0xfffffffe,%esi
    1381:	74 26                	je     13a9 <func0+0xa9>
    1383:	49 89 f0             	mov    %rsi,%r8
    1386:	49 d1 e8             	shr    %r8
    1389:	49 83 f8 01          	cmp    $0x1,%r8
    138d:	75 24                	jne    13b3 <func0+0xb3>
    138f:	31 d2                	xor    %edx,%edx
    1391:	eb 5a                	jmp    13ed <func0+0xed>
    1393:	bf 21 00 00 00       	mov    $0x21,%edi
    1398:	e8 c3 fc ff ff       	call   1060 <malloc@plt>
    139d:	c6 00 30             	movb   $0x30,(%rax)
    13a0:	b9 01 00 00 00       	mov    $0x1,%ecx
    13a5:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    13a9:	48 83 c4 10          	add    $0x10,%rsp
    13ad:	5b                   	pop    %rbx
    13ae:	c3                   	ret    
    13af:	31 c9                	xor    %ecx,%ecx
    13b1:	eb f2                	jmp    13a5 <func0+0xa5>
    13b3:	48 8d 7e ff          	lea    -0x1(%rsi),%rdi
    13b7:	49 83 e0 fe          	and    $0xfffffffffffffffe,%r8
    13bb:	31 d2                	xor    %edx,%edx
    13bd:	0f 1f 00             	nopl   (%rax)
    13c0:	0f b6 1c 10          	movzbl (%rax,%rdx,1),%ebx
    13c4:	0f b6 0c 38          	movzbl (%rax,%rdi,1),%ecx
    13c8:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    13cb:	88 1c 38             	mov    %bl,(%rax,%rdi,1)
    13ce:	0f b6 4c 10 01       	movzbl 0x1(%rax,%rdx,1),%ecx
    13d3:	0f b6 5c 38 ff       	movzbl -0x1(%rax,%rdi,1),%ebx
    13d8:	88 5c 10 01          	mov    %bl,0x1(%rax,%rdx,1)
    13dc:	88 4c 38 ff          	mov    %cl,-0x1(%rax,%rdi,1)
    13e0:	48 83 c2 02          	add    $0x2,%rdx
    13e4:	48 83 c7 fe          	add    $0xfffffffffffffffe,%rdi
    13e8:	49 39 d0             	cmp    %rdx,%r8
    13eb:	75 d3                	jne    13c0 <func0+0xc0>
    13ed:	40 f6 c6 02          	test   $0x2,%sil
    13f1:	74 b6                	je     13a9 <func0+0xa9>
    13f3:	0f b6 0c 10          	movzbl (%rax,%rdx,1),%ecx
    13f7:	48 89 c7             	mov    %rax,%rdi
    13fa:	48 29 d7             	sub    %rdx,%rdi
    13fd:	0f b6 5c 37 ff       	movzbl -0x1(%rdi,%rsi,1),%ebx
    1402:	88 1c 10             	mov    %bl,(%rax,%rdx,1)
    1405:	88 4c 37 ff          	mov    %cl,-0x1(%rdi,%rsi,1)
    1409:	eb 9e                	jmp    13a9 <func0+0xa9>

