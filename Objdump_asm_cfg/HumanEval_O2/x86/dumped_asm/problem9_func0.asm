0000000000001340 <func0>:
    1340:	85 f6                	test   %esi,%esi
    1342:	7e 17                	jle    135b <func0+0x1b>
    1344:	41 89 f1             	mov    %esi,%r9d
    1347:	83 fe 08             	cmp    $0x8,%esi
    134a:	73 1b                	jae    1367 <func0+0x27>
    134c:	45 31 d2             	xor    %r10d,%r10d
    134f:	be 01 00 00 00       	mov    $0x1,%esi
    1354:	31 c0                	xor    %eax,%eax
    1356:	e9 a5 01 00 00       	jmp    1500 <func0+0x1c0>
    135b:	be 01 00 00 00       	mov    $0x1,%esi
    1360:	31 c0                	xor    %eax,%eax
    1362:	e9 aa 01 00 00       	jmp    1511 <func0+0x1d1>
    1367:	45 89 ca             	mov    %r9d,%r10d
    136a:	41 83 e2 f8          	and    $0xfffffff8,%r10d
    136e:	49 8d 42 f8          	lea    -0x8(%r10),%rax
    1372:	49 89 c0             	mov    %rax,%r8
    1375:	49 c1 e8 03          	shr    $0x3,%r8
    1379:	49 ff c0             	inc    %r8
    137c:	48 85 c0             	test   %rax,%rax
    137f:	0f 84 92 01 00 00    	je     1517 <func0+0x1d7>
    1385:	4c 89 c0             	mov    %r8,%rax
    1388:	48 83 e0 fe          	and    $0xfffffffffffffffe,%rax
    138c:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
    1391:	66 0f 6f 0d 67 0d 00 	movdqa 0xd67(%rip),%xmm1        # 2100 <_IO_stdin_used+0x100>
    1398:	00 
    1399:	31 f6                	xor    %esi,%esi
    139b:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    139f:	66 0f ef d2          	pxor   %xmm2,%xmm2
    13a3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    13aa:	84 00 00 00 00 00 
    13b0:	f3 0f 6f 34 b7       	movdqu (%rdi,%rsi,4),%xmm6
    13b5:	f3 0f 6f 64 b7 10    	movdqu 0x10(%rdi,%rsi,4),%xmm4
    13bb:	f3 0f 6f 7c b7 20    	movdqu 0x20(%rdi,%rsi,4),%xmm7
    13c1:	f3 44 0f 6f 44 b7 30 	movdqu 0x30(%rdi,%rsi,4),%xmm8
    13c8:	66 44 0f fe ce       	paddd  %xmm6,%xmm9
    13cd:	66 0f fe d4          	paddd  %xmm4,%xmm2
    13d1:	66 0f 70 ee f5       	pshufd $0xf5,%xmm6,%xmm5
    13d6:	66 0f 70 c1 f5       	pshufd $0xf5,%xmm1,%xmm0
    13db:	66 0f f4 c5          	pmuludq %xmm5,%xmm0
    13df:	66 0f f4 f1          	pmuludq %xmm1,%xmm6
    13e3:	66 0f 70 cc f5       	pshufd $0xf5,%xmm4,%xmm1
    13e8:	66 0f 70 eb f5       	pshufd $0xf5,%xmm3,%xmm5
    13ed:	66 0f f4 e9          	pmuludq %xmm1,%xmm5
    13f1:	66 0f f4 e3          	pmuludq %xmm3,%xmm4
    13f5:	66 44 0f fe cf       	paddd  %xmm7,%xmm9
    13fa:	66 41 0f fe d0       	paddd  %xmm8,%xmm2
    13ff:	66 0f f4 f7          	pmuludq %xmm7,%xmm6
    1403:	66 0f 70 ce e8       	pshufd $0xe8,%xmm6,%xmm1
    1408:	66 0f 70 df f5       	pshufd $0xf5,%xmm7,%xmm3
    140d:	66 0f f4 d8          	pmuludq %xmm0,%xmm3
    1411:	66 0f 70 c3 e8       	pshufd $0xe8,%xmm3,%xmm0
    1416:	66 0f 62 c8          	punpckldq %xmm0,%xmm1
    141a:	66 41 0f f4 e0       	pmuludq %xmm8,%xmm4
    141f:	66 0f 70 dc e8       	pshufd $0xe8,%xmm4,%xmm3
    1424:	66 41 0f 70 c0 f5    	pshufd $0xf5,%xmm8,%xmm0
    142a:	66 0f f4 c5          	pmuludq %xmm5,%xmm0
    142e:	66 0f 70 c0 e8       	pshufd $0xe8,%xmm0,%xmm0
    1433:	66 0f 62 d8          	punpckldq %xmm0,%xmm3
    1437:	48 83 c6 10          	add    $0x10,%rsi
    143b:	48 83 c0 fe          	add    $0xfffffffffffffffe,%rax
    143f:	0f 85 6b ff ff ff    	jne    13b0 <func0+0x70>
    1445:	41 f6 c0 01          	test   $0x1,%r8b
    1449:	74 5c                	je     14a7 <func0+0x167>
    144b:	f3 0f 6f 04 b7       	movdqu (%rdi,%rsi,4),%xmm0
    1450:	f3 0f 6f 64 b7 10    	movdqu 0x10(%rdi,%rsi,4),%xmm4
    1456:	66 44 0f fe c8       	paddd  %xmm0,%xmm9
    145b:	66 0f fe d4          	paddd  %xmm4,%xmm2
    145f:	66 0f 70 e8 f5       	pshufd $0xf5,%xmm0,%xmm5
    1464:	66 0f f4 c1          	pmuludq %xmm1,%xmm0
    1468:	66 0f 70 c9 f5       	pshufd $0xf5,%xmm1,%xmm1
    146d:	66 0f 70 c0 e8       	pshufd $0xe8,%xmm0,%xmm0
    1472:	66 0f f4 cd          	pmuludq %xmm5,%xmm1
    1476:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    147b:	66 0f 62 c1          	punpckldq %xmm1,%xmm0
    147f:	66 0f 70 cc f5       	pshufd $0xf5,%xmm4,%xmm1
    1484:	66 0f f4 e3          	pmuludq %xmm3,%xmm4
    1488:	66 0f 70 db f5       	pshufd $0xf5,%xmm3,%xmm3
    148d:	66 0f 70 e4 e8       	pshufd $0xe8,%xmm4,%xmm4
    1492:	66 0f f4 d9          	pmuludq %xmm1,%xmm3
    1496:	66 0f 70 cb e8       	pshufd $0xe8,%xmm3,%xmm1
    149b:	66 0f 62 e1          	punpckldq %xmm1,%xmm4
    149f:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    14a3:	66 0f 6f dc          	movdqa %xmm4,%xmm3
    14a7:	66 44 0f fe ca       	paddd  %xmm2,%xmm9
    14ac:	66 41 0f 70 c1 ee    	pshufd $0xee,%xmm9,%xmm0
    14b2:	66 41 0f fe c1       	paddd  %xmm9,%xmm0
    14b7:	66 0f 70 d0 55       	pshufd $0x55,%xmm0,%xmm2
    14bc:	66 0f fe d0          	paddd  %xmm0,%xmm2
    14c0:	66 0f 7e d0          	movd   %xmm2,%eax
    14c4:	66 0f 70 c1 f5       	pshufd $0xf5,%xmm1,%xmm0
    14c9:	66 0f 70 d3 f5       	pshufd $0xf5,%xmm3,%xmm2
    14ce:	66 0f f4 d0          	pmuludq %xmm0,%xmm2
    14d2:	66 0f f4 d9          	pmuludq %xmm1,%xmm3
    14d6:	66 0f 70 c3 ee       	pshufd $0xee,%xmm3,%xmm0
    14db:	66 0f f4 c3          	pmuludq %xmm3,%xmm0
    14df:	66 0f 70 ca aa       	pshufd $0xaa,%xmm2,%xmm1
    14e4:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    14e8:	66 0f f4 c8          	pmuludq %xmm0,%xmm1
    14ec:	66 0f 7e ce          	movd   %xmm1,%esi
    14f0:	4d 39 ca             	cmp    %r9,%r10
    14f3:	74 1c                	je     1511 <func0+0x1d1>
    14f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    14fc:	00 00 00 00 
    1500:	42 8b 0c 97          	mov    (%rdi,%r10,4),%ecx
    1504:	01 c8                	add    %ecx,%eax
    1506:	0f af f1             	imul   %ecx,%esi
    1509:	49 ff c2             	inc    %r10
    150c:	4d 39 d1             	cmp    %r10,%r9
    150f:	75 ef                	jne    1500 <func0+0x1c0>
    1511:	89 02                	mov    %eax,(%rdx)
    1513:	89 72 04             	mov    %esi,0x4(%rdx)
    1516:	c3                   	ret    
    1517:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
    151c:	66 0f 6f 0d dc 0b 00 	movdqa 0xbdc(%rip),%xmm1        # 2100 <_IO_stdin_used+0x100>
    1523:	00 
    1524:	31 f6                	xor    %esi,%esi
    1526:	66 0f 6f d9          	movdqa %xmm1,%xmm3
    152a:	66 0f ef d2          	pxor   %xmm2,%xmm2
    152e:	41 f6 c0 01          	test   $0x1,%r8b
    1532:	0f 85 13 ff ff ff    	jne    144b <func0+0x10b>
    1538:	e9 6a ff ff ff       	jmp    14a7 <func0+0x167>

