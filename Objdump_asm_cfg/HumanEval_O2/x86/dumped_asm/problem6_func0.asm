0000000000001310 <func0>:
    1310:	55                   	push   %rbp
    1311:	41 56                	push   %r14
    1313:	53                   	push   %rbx
    1314:	41 89 d6             	mov    %edx,%r14d
    1317:	89 f5                	mov    %esi,%ebp
    1319:	31 c0                	xor    %eax,%eax
    131b:	85 f6                	test   %esi,%esi
    131d:	8d 54 2d ff          	lea    -0x1(%rbp,%rbp,1),%edx
    1321:	0f 4e d0             	cmovle %eax,%edx
    1324:	48 89 fb             	mov    %rdi,%rbx
    1327:	89 11                	mov    %edx,(%rcx)
    1329:	48 63 fa             	movslq %edx,%rdi
    132c:	48 c1 e7 02          	shl    $0x2,%rdi
    1330:	e8 1b fd ff ff       	call   1050 <malloc@plt>
    1335:	85 ed                	test   %ebp,%ebp
    1337:	0f 8e 36 01 00 00    	jle    1473 <func0+0x163>
    133d:	8b 0b                	mov    (%rbx),%ecx
    133f:	89 08                	mov    %ecx,(%rax)
    1341:	83 fd 01             	cmp    $0x1,%ebp
    1344:	0f 84 29 01 00 00    	je     1473 <func0+0x163>
    134a:	89 e9                	mov    %ebp,%ecx
    134c:	4c 8d 41 ff          	lea    -0x1(%rcx),%r8
    1350:	bf 01 00 00 00       	mov    $0x1,%edi
    1355:	be 01 00 00 00       	mov    $0x1,%esi
    135a:	49 83 f8 04          	cmp    $0x4,%r8
    135e:	0f 82 e8 00 00 00    	jb     144c <func0+0x13c>
    1364:	4c 89 c6             	mov    %r8,%rsi
    1367:	48 83 e6 fc          	and    $0xfffffffffffffffc,%rsi
    136b:	66 41 0f 6e c6       	movd   %r14d,%xmm0
    1370:	66 0f 70 c0 50       	pshufd $0x50,%xmm0,%xmm0
    1375:	48 8d 7e fc          	lea    -0x4(%rsi),%rdi
    1379:	48 89 fa             	mov    %rdi,%rdx
    137c:	48 c1 ea 02          	shr    $0x2,%rdx
    1380:	48 ff c2             	inc    %rdx
    1383:	48 85 ff             	test   %rdi,%rdi
    1386:	0f 84 ec 00 00 00    	je     1478 <func0+0x168>
    138c:	48 89 d5             	mov    %rdx,%rbp
    138f:	48 83 e5 fe          	and    $0xfffffffffffffffe,%rbp
    1393:	31 ff                	xor    %edi,%edi
    1395:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    139c:	00 00 00 00 
    13a0:	f3 0f 7e 4c bb 04    	movq   0x4(%rbx,%rdi,4),%xmm1
    13a6:	f3 0f 7e 54 bb 0c    	movq   0xc(%rbx,%rdi,4),%xmm2
    13ac:	66 0f 6f d8          	movdqa %xmm0,%xmm3
    13b0:	66 0f 62 d9          	punpckldq %xmm1,%xmm3
    13b4:	f3 0f 7f 5c f8 04    	movdqu %xmm3,0x4(%rax,%rdi,8)
    13ba:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    13be:	66 0f 62 ca          	punpckldq %xmm2,%xmm1
    13c2:	f3 0f 7f 4c f8 14    	movdqu %xmm1,0x14(%rax,%rdi,8)
    13c8:	f3 0f 7e 4c bb 14    	movq   0x14(%rbx,%rdi,4),%xmm1
    13ce:	f3 0f 7e 54 bb 1c    	movq   0x1c(%rbx,%rdi,4),%xmm2
    13d4:	66 0f 6f d8          	movdqa %xmm0,%xmm3
    13d8:	66 0f 62 d9          	punpckldq %xmm1,%xmm3
    13dc:	f3 0f 7f 5c f8 24    	movdqu %xmm3,0x24(%rax,%rdi,8)
    13e2:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    13e6:	66 0f 62 ca          	punpckldq %xmm2,%xmm1
    13ea:	f3 0f 7f 4c f8 34    	movdqu %xmm1,0x34(%rax,%rdi,8)
    13f0:	48 83 c7 08          	add    $0x8,%rdi
    13f4:	48 83 c5 fe          	add    $0xfffffffffffffffe,%rbp
    13f8:	75 a6                	jne    13a0 <func0+0x90>
    13fa:	f6 c2 01             	test   $0x1,%dl
    13fd:	74 3e                	je     143d <func0+0x12d>
    13ff:	48 8d 14 bd 00 00 00 	lea    0x0(,%rdi,4),%rdx
    1406:	00 
    1407:	48 c1 e7 03          	shl    $0x3,%rdi
    140b:	48 83 ca 04          	or     $0x4,%rdx
    140f:	f3 0f 7e 0c 13       	movq   (%rbx,%rdx,1),%xmm1
    1414:	f3 0f 7e 54 13 08    	movq   0x8(%rbx,%rdx,1),%xmm2
    141a:	48 89 fa             	mov    %rdi,%rdx
    141d:	48 83 ca 08          	or     $0x8,%rdx
    1421:	48 83 cf 18          	or     $0x18,%rdi
    1425:	66 0f 6f d8          	movdqa %xmm0,%xmm3
    1429:	66 0f 62 d9          	punpckldq %xmm1,%xmm3
    142d:	f3 0f 7f 5c 10 fc    	movdqu %xmm3,-0x4(%rax,%rdx,1)
    1433:	66 0f 62 c2          	punpckldq %xmm2,%xmm0
    1437:	f3 0f 7f 44 38 fc    	movdqu %xmm0,-0x4(%rax,%rdi,1)
    143d:	49 39 f0             	cmp    %rsi,%r8
    1440:	74 31                	je     1473 <func0+0x163>
    1442:	48 8d 7e 01          	lea    0x1(%rsi),%rdi
    1446:	48 01 f6             	add    %rsi,%rsi
    1449:	48 ff c6             	inc    %rsi
    144c:	48 8d 14 bb          	lea    (%rbx,%rdi,4),%rdx
    1450:	48 29 f9             	sub    %rdi,%rcx
    1453:	48 8d 34 b0          	lea    (%rax,%rsi,4),%rsi
    1457:	48 83 c6 04          	add    $0x4,%rsi
    145b:	31 ff                	xor    %edi,%edi
    145d:	0f 1f 00             	nopl   (%rax)
    1460:	44 89 74 fe fc       	mov    %r14d,-0x4(%rsi,%rdi,8)
    1465:	8b 2c ba             	mov    (%rdx,%rdi,4),%ebp
    1468:	89 2c fe             	mov    %ebp,(%rsi,%rdi,8)
    146b:	48 ff c7             	inc    %rdi
    146e:	48 39 f9             	cmp    %rdi,%rcx
    1471:	75 ed                	jne    1460 <func0+0x150>
    1473:	5b                   	pop    %rbx
    1474:	41 5e                	pop    %r14
    1476:	5d                   	pop    %rbp
    1477:	c3                   	ret    
    1478:	31 ff                	xor    %edi,%edi
    147a:	f6 c2 01             	test   $0x1,%dl
    147d:	75 80                	jne    13ff <func0+0xef>
    147f:	eb bc                	jmp    143d <func0+0x12d>

