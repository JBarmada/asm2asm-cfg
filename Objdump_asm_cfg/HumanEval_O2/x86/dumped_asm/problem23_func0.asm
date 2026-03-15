00000000000012e0 <func0>:
    12e0:	55                   	push   %rbp
    12e1:	41 57                	push   %r15
    12e3:	41 56                	push   %r14
    12e5:	41 55                	push   %r13
    12e7:	41 54                	push   %r12
    12e9:	53                   	push   %rbx
    12ea:	50                   	push   %rax
    12eb:	49 89 f6             	mov    %rsi,%r14
    12ee:	44 0f b6 3f          	movzbl (%rdi),%r15d
    12f2:	45 84 ff             	test   %r15b,%r15b
    12f5:	0f 84 a7 00 00 00    	je     13a2 <func0+0xc2>
    12fb:	49 89 fd             	mov    %rdi,%r13
    12fe:	31 ed                	xor    %ebp,%ebp
    1300:	e8 5b fd ff ff       	call   1060 <__ctype_b_loc@plt>
    1305:	49 89 c4             	mov    %rax,%r12
    1308:	49 8b 04 24          	mov    (%r12),%rax
    130c:	4c 89 eb             	mov    %r13,%rbx
    130f:	90                   	nop
    1310:	49 0f be cf          	movsbq %r15b,%rcx
    1314:	f6 44 48 01 08       	testb  $0x8,0x1(%rax,%rcx,2)
    1319:	75 15                	jne    1330 <func0+0x50>
    131b:	41 80 ff 2d          	cmp    $0x2d,%r15b
    131f:	74 0f                	je     1330 <func0+0x50>
    1321:	44 0f b6 7b 01       	movzbl 0x1(%rbx),%r15d
    1326:	48 ff c3             	inc    %rbx
    1329:	45 84 ff             	test   %r15b,%r15b
    132c:	75 e2                	jne    1310 <func0+0x30>
    132e:	eb 74                	jmp    13a4 <func0+0xc4>
    1330:	48 89 df             	mov    %rbx,%rdi
    1333:	48 89 e6             	mov    %rsp,%rsi
    1336:	ba 0a 00 00 00       	mov    $0xa,%edx
    133b:	e8 10 fd ff ff       	call   1050 <strtol@plt>
    1340:	4c 8b 2c 24          	mov    (%rsp),%r13
    1344:	4c 39 eb             	cmp    %r13,%rbx
    1347:	74 3a                	je     1383 <func0+0xa3>
    1349:	41 0f b6 4d 00       	movzbl 0x0(%r13),%ecx
    134e:	83 f9 2c             	cmp    $0x2c,%ecx
    1351:	74 04                	je     1357 <func0+0x77>
    1353:	85 c9                	test   %ecx,%ecx
    1355:	75 2c                	jne    1383 <func0+0xa3>
    1357:	48 63 cd             	movslq %ebp,%rcx
    135a:	ff c5                	inc    %ebp
    135c:	48 8d 15 fd 2c 00 00 	lea    0x2cfd(%rip),%rdx        # 4060 <func0.out>
    1363:	89 04 8a             	mov    %eax,(%rdx,%rcx,4)
    1366:	45 0f b6 7d 00       	movzbl 0x0(%r13),%r15d
    136b:	45 84 ff             	test   %r15b,%r15b
    136e:	75 98                	jne    1308 <func0+0x28>
    1370:	eb 32                	jmp    13a4 <func0+0xc4>
    1372:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1379:	1f 84 00 00 00 00 00 
    1380:	49 ff c5             	inc    %r13
    1383:	45 0f b6 7d 00       	movzbl 0x0(%r13),%r15d
    1388:	45 85 ff             	test   %r15d,%r15d
    138b:	74 06                	je     1393 <func0+0xb3>
    138d:	41 83 ff 2c          	cmp    $0x2c,%r15d
    1391:	75 ed                	jne    1380 <func0+0xa0>
    1393:	4c 89 2c 24          	mov    %r13,(%rsp)
    1397:	45 84 ff             	test   %r15b,%r15b
    139a:	0f 85 68 ff ff ff    	jne    1308 <func0+0x28>
    13a0:	eb 02                	jmp    13a4 <func0+0xc4>
    13a2:	31 ed                	xor    %ebp,%ebp
    13a4:	41 89 2e             	mov    %ebp,(%r14)
    13a7:	48 8d 05 b2 2c 00 00 	lea    0x2cb2(%rip),%rax        # 4060 <func0.out>
    13ae:	48 83 c4 08          	add    $0x8,%rsp
    13b2:	5b                   	pop    %rbx
    13b3:	41 5c                	pop    %r12
    13b5:	41 5d                	pop    %r13
    13b7:	41 5e                	pop    %r14
    13b9:	41 5f                	pop    %r15
    13bb:	5d                   	pop    %rbp
    13bc:	c3                   	ret    

