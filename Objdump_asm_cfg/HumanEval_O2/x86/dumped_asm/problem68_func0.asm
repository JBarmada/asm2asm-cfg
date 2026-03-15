0000000000001300 <func0>:
    1300:	55                   	push   %rbp
    1301:	41 56                	push   %r14
    1303:	53                   	push   %rbx
    1304:	48 83 ec 20          	sub    $0x20,%rsp
    1308:	41 89 f6             	mov    %esi,%r14d
    130b:	66 c7 44 24 18 00 00 	movw   $0x0,0x18(%rsp)
    1312:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
    1319:	00 00 
    131b:	66 c7 44 24 08 00 00 	movw   $0x0,0x8(%rsp)
    1322:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    1329:	00 
    132a:	0f b6 1f             	movzbl (%rdi),%ebx
    132d:	84 db                	test   %bl,%bl
    132f:	74 68                	je     1399 <func0+0x99>
    1331:	48 89 fd             	mov    %rdi,%rbp
    1334:	e8 17 fd ff ff       	call   1050 <__ctype_b_loc@plt>
    1339:	48 8b 00             	mov    (%rax),%rax
    133c:	48 ff c5             	inc    %rbp
    133f:	45 31 c0             	xor    %r8d,%r8d
    1342:	ba 01 00 00 00       	mov    $0x1,%edx
    1347:	31 ff                	xor    %edi,%edi
    1349:	31 f6                	xor    %esi,%esi
    134b:	eb 25                	jmp    1372 <func0+0x72>
    134d:	0f 1f 00             	nopl   (%rax)
    1350:	85 f6                	test   %esi,%esi
    1352:	0f 94 c1             	sete   %cl
    1355:	85 ff                	test   %edi,%edi
    1357:	0f 9f c3             	setg   %bl
    135a:	84 d9                	test   %bl,%cl
    135c:	0f 45 f2             	cmovne %edx,%esi
    135f:	41 0f 45 f8          	cmovne %r8d,%edi
    1363:	89 f9                	mov    %edi,%ecx
    1365:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    1369:	48 ff c5             	inc    %rbp
    136c:	89 cf                	mov    %ecx,%edi
    136e:	84 db                	test   %bl,%bl
    1370:	74 27                	je     1399 <func0+0x99>
    1372:	48 0f be cb          	movsbq %bl,%rcx
    1376:	f6 44 48 01 08       	testb  $0x8,0x1(%rax,%rcx,2)
    137b:	74 d3                	je     1350 <func0+0x50>
    137d:	8d 4f 01             	lea    0x1(%rdi),%ecx
    1380:	48 63 ff             	movslq %edi,%rdi
    1383:	85 f6                	test   %esi,%esi
    1385:	74 0a                	je     1391 <func0+0x91>
    1387:	88 1c 3c             	mov    %bl,(%rsp,%rdi,1)
    138a:	be 01 00 00 00       	mov    $0x1,%esi
    138f:	eb d4                	jmp    1365 <func0+0x65>
    1391:	88 5c 3c 10          	mov    %bl,0x10(%rsp,%rdi,1)
    1395:	31 f6                	xor    %esi,%esi
    1397:	eb cc                	jmp    1365 <func0+0x65>
    1399:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    139e:	31 f6                	xor    %esi,%esi
    13a0:	ba 0a 00 00 00       	mov    $0xa,%edx
    13a5:	e8 96 fc ff ff       	call   1040 <strtol@plt>
    13aa:	48 89 c3             	mov    %rax,%rbx
    13ad:	48 89 e7             	mov    %rsp,%rdi
    13b0:	31 f6                	xor    %esi,%esi
    13b2:	ba 0a 00 00 00       	mov    $0xa,%edx
    13b7:	e8 84 fc ff ff       	call   1040 <strtol@plt>
    13bc:	01 d8                	add    %ebx,%eax
    13be:	41 29 c6             	sub    %eax,%r14d
    13c1:	44 89 f0             	mov    %r14d,%eax
    13c4:	48 83 c4 20          	add    $0x20,%rsp
    13c8:	5b                   	pop    %rbx
    13c9:	41 5e                	pop    %r14
    13cb:	5d                   	pop    %rbp
    13cc:	c3                   	ret    

