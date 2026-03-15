0000000000001290 <func0>:
    1290:	55                   	push   %rbp
    1291:	53                   	push   %rbx
    1292:	0f 57 c0             	xorps  %xmm0,%xmm0
    1295:	0f 29 44 24 e8       	movaps %xmm0,-0x18(%rsp)
    129a:	0f 29 44 24 d8       	movaps %xmm0,-0x28(%rsp)
    129f:	48 c7 44 24 f8 00 00 	movq   $0x0,-0x8(%rsp)
    12a6:	00 00 
    12a8:	80 3f 00             	cmpb   $0x0,(%rdi)
    12ab:	0f 84 84 01 00 00    	je     1435 <func0+0x1a5>
    12b1:	b8 7a 65 72 6f       	mov    $0x6f72657a,%eax
    12b6:	b9 74 68 72 65       	mov    $0x65726874,%ecx
    12bb:	ba 66 6f 75 72       	mov    $0x72756f66,%edx
    12c0:	41 bb 66 69 76 65    	mov    $0x65766966,%r11d
    12c6:	41 b8 73 65 76 65    	mov    $0x65766573,%r8d
    12cc:	41 b9 65 69 67 68    	mov    $0x68676965,%r9d
    12d2:	41 ba 6e 69 6e 65    	mov    $0x656e696e,%r10d
    12d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    12df:	00 
    12e0:	31 f6                	xor    %esi,%esi
    12e2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    12e9:	1f 84 00 00 00 00 00 
    12f0:	0f b6 1c 37          	movzbl (%rdi,%rsi,1),%ebx
    12f4:	f6 c3 df             	test   $0xdf,%bl
    12f7:	74 17                	je     1310 <func0+0x80>
    12f9:	88 5c 34 d2          	mov    %bl,-0x2e(%rsp,%rsi,1)
    12fd:	48 ff c6             	inc    %rsi
    1300:	eb ee                	jmp    12f0 <func0+0x60>
    1302:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1309:	1f 84 00 00 00 00 00 
    1310:	89 f3                	mov    %esi,%ebx
    1312:	c6 44 1c d2 00       	movb   $0x0,-0x2e(%rsp,%rbx,1)
    1317:	8b 5c 24 d2          	mov    -0x2e(%rsp),%ebx
    131b:	31 c3                	xor    %eax,%ebx
    131d:	0f b6 6c 24 d6       	movzbl -0x2a(%rsp),%ebp
    1322:	09 dd                	or     %ebx,%ebp
    1324:	0f 84 a6 00 00 00    	je     13d0 <func0+0x140>
    132a:	81 7c 24 d2 6f 6e 65 	cmpl   $0x656e6f,-0x2e(%rsp)
    1331:	00 
    1332:	0f 84 a8 00 00 00    	je     13e0 <func0+0x150>
    1338:	81 7c 24 d2 74 77 6f 	cmpl   $0x6f7774,-0x2e(%rsp)
    133f:	00 
    1340:	0f 84 a1 00 00 00    	je     13e7 <func0+0x157>
    1346:	8b 5c 24 d2          	mov    -0x2e(%rsp),%ebx
    134a:	31 cb                	xor    %ecx,%ebx
    134c:	0f b7 6c 24 d6       	movzwl -0x2a(%rsp),%ebp
    1351:	83 f5 65             	xor    $0x65,%ebp
    1354:	09 dd                	or     %ebx,%ebp
    1356:	0f 84 92 00 00 00    	je     13ee <func0+0x15e>
    135c:	8b 5c 24 d2          	mov    -0x2e(%rsp),%ebx
    1360:	31 d3                	xor    %edx,%ebx
    1362:	0f b6 6c 24 d6       	movzbl -0x2a(%rsp),%ebp
    1367:	09 dd                	or     %ebx,%ebp
    1369:	0f 84 86 00 00 00    	je     13f5 <func0+0x165>
    136f:	8b 5c 24 d2          	mov    -0x2e(%rsp),%ebx
    1373:	44 31 db             	xor    %r11d,%ebx
    1376:	0f b6 6c 24 d6       	movzbl -0x2a(%rsp),%ebp
    137b:	09 dd                	or     %ebx,%ebp
    137d:	0f 84 79 00 00 00    	je     13fc <func0+0x16c>
    1383:	81 7c 24 d2 73 69 78 	cmpl   $0x786973,-0x2e(%rsp)
    138a:	00 
    138b:	74 76                	je     1403 <func0+0x173>
    138d:	8b 5c 24 d2          	mov    -0x2e(%rsp),%ebx
    1391:	44 31 c3             	xor    %r8d,%ebx
    1394:	0f b7 6c 24 d6       	movzwl -0x2a(%rsp),%ebp
    1399:	83 f5 6e             	xor    $0x6e,%ebp
    139c:	09 dd                	or     %ebx,%ebp
    139e:	74 6a                	je     140a <func0+0x17a>
    13a0:	8b 5c 24 d2          	mov    -0x2e(%rsp),%ebx
    13a4:	44 31 cb             	xor    %r9d,%ebx
    13a7:	0f b7 6c 24 d6       	movzwl -0x2a(%rsp),%ebp
    13ac:	83 f5 74             	xor    $0x74,%ebp
    13af:	09 dd                	or     %ebx,%ebp
    13b1:	74 5e                	je     1411 <func0+0x181>
    13b3:	8b 5c 24 d2          	mov    -0x2e(%rsp),%ebx
    13b7:	44 31 d3             	xor    %r10d,%ebx
    13ba:	0f b6 6c 24 d6       	movzbl -0x2a(%rsp),%ebp
    13bf:	09 dd                	or     %ebx,%ebp
    13c1:	75 61                	jne    1424 <func0+0x194>
    13c3:	bb 09 00 00 00       	mov    $0x9,%ebx
    13c8:	eb 56                	jmp    1420 <func0+0x190>
    13ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    13d0:	31 db                	xor    %ebx,%ebx
    13d2:	eb 4c                	jmp    1420 <func0+0x190>
    13d4:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    13db:	00 00 00 00 00 
    13e0:	bb 01 00 00 00       	mov    $0x1,%ebx
    13e5:	eb 39                	jmp    1420 <func0+0x190>
    13e7:	bb 02 00 00 00       	mov    $0x2,%ebx
    13ec:	eb 32                	jmp    1420 <func0+0x190>
    13ee:	bb 03 00 00 00       	mov    $0x3,%ebx
    13f3:	eb 2b                	jmp    1420 <func0+0x190>
    13f5:	bb 04 00 00 00       	mov    $0x4,%ebx
    13fa:	eb 24                	jmp    1420 <func0+0x190>
    13fc:	bb 05 00 00 00       	mov    $0x5,%ebx
    1401:	eb 1d                	jmp    1420 <func0+0x190>
    1403:	bb 06 00 00 00       	mov    $0x6,%ebx
    1408:	eb 16                	jmp    1420 <func0+0x190>
    140a:	bb 07 00 00 00       	mov    $0x7,%ebx
    140f:	eb 0f                	jmp    1420 <func0+0x190>
    1411:	bb 08 00 00 00       	mov    $0x8,%ebx
    1416:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    141d:	00 00 00 
    1420:	ff 44 9c d8          	incl   -0x28(%rsp,%rbx,4)
    1424:	ff c6                	inc    %esi
    1426:	80 7c 37 ff 00       	cmpb   $0x0,-0x1(%rdi,%rsi,1)
    142b:	48 8d 3c 37          	lea    (%rdi,%rsi,1),%rdi
    142f:	0f 85 ab fe ff ff    	jne    12e0 <func0+0x50>
    1435:	45 31 c9             	xor    %r9d,%r9d
    1438:	4c 8d 05 61 29 00 00 	lea    0x2961(%rip),%r8        # 3da0 <__do_global_dtors_aux_fini_array_entry+0x8>
    143f:	48 8d 05 0a 2c 00 00 	lea    0x2c0a(%rip),%rax        # 4050 <func0.out>
    1446:	45 31 db             	xor    %r11d,%r11d
    1449:	eb 0e                	jmp    1459 <func0+0x1c9>
    144b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1450:	49 ff c1             	inc    %r9
    1453:	49 83 f9 0a          	cmp    $0xa,%r9
    1457:	74 4f                	je     14a8 <func0+0x218>
    1459:	46 8b 54 8c d8       	mov    -0x28(%rsp,%r9,4),%r10d
    145e:	45 85 d2             	test   %r10d,%r10d
    1461:	7e ed                	jle    1450 <func0+0x1c0>
    1463:	4b 8b 34 c8          	mov    (%r8,%r9,8),%rsi
    1467:	31 d2                	xor    %edx,%edx
    1469:	eb 16                	jmp    1481 <func0+0x1f1>
    146b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1470:	49 63 cb             	movslq %r11d,%rcx
    1473:	41 ff c3             	inc    %r11d
    1476:	c6 04 01 20          	movb   $0x20,(%rcx,%rax,1)
    147a:	ff c2                	inc    %edx
    147c:	44 39 d2             	cmp    %r10d,%edx
    147f:	74 cf                	je     1450 <func0+0x1c0>
    1481:	0f b6 1e             	movzbl (%rsi),%ebx
    1484:	84 db                	test   %bl,%bl
    1486:	74 e8                	je     1470 <func0+0x1e0>
    1488:	49 63 cb             	movslq %r11d,%rcx
    148b:	31 ff                	xor    %edi,%edi
    148d:	0f 1f 00             	nopl   (%rax)
    1490:	48 8d 2c 39          	lea    (%rcx,%rdi,1),%rbp
    1494:	88 1c 28             	mov    %bl,(%rax,%rbp,1)
    1497:	0f b6 5c 3e 01       	movzbl 0x1(%rsi,%rdi,1),%ebx
    149c:	48 ff c7             	inc    %rdi
    149f:	84 db                	test   %bl,%bl
    14a1:	75 ed                	jne    1490 <func0+0x200>
    14a3:	41 01 fb             	add    %edi,%r11d
    14a6:	eb c8                	jmp    1470 <func0+0x1e0>
    14a8:	45 85 db             	test   %r11d,%r11d
    14ab:	7e 0a                	jle    14b7 <func0+0x227>
    14ad:	41 ff cb             	dec    %r11d
    14b0:	41 c6 04 03 00       	movb   $0x0,(%r11,%rax,1)
    14b5:	eb 07                	jmp    14be <func0+0x22e>
    14b7:	c6 05 92 2b 00 00 00 	movb   $0x0,0x2b92(%rip)        # 4050 <func0.out>
    14be:	48 8d 05 8b 2b 00 00 	lea    0x2b8b(%rip),%rax        # 4050 <func0.out>
    14c5:	5b                   	pop    %rbx
    14c6:	5d                   	pop    %rbp
    14c7:	c3                   	ret    

