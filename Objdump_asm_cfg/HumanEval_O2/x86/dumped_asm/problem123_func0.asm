0000000000001300 <func0>:
    1300:	85 f6                	test   %esi,%esi
    1302:	7e 14                	jle    1318 <func0+0x18>
    1304:	41 89 f2             	mov    %esi,%r10d
    1307:	45 31 c9             	xor    %r9d,%r9d
    130a:	83 fe 08             	cmp    $0x8,%esi
    130d:	73 0c                	jae    131b <func0+0x1b>
    130f:	31 f6                	xor    %esi,%esi
    1311:	31 c0                	xor    %eax,%eax
    1313:	e9 78 01 00 00       	jmp    1490 <func0+0x190>
    1318:	31 c0                	xor    %eax,%eax
    131a:	c3                   	ret    
    131b:	44 89 d6             	mov    %r10d,%esi
    131e:	83 e6 f8             	and    $0xfffffff8,%esi
    1321:	48 8d 46 f8          	lea    -0x8(%rsi),%rax
    1325:	49 89 c0             	mov    %rax,%r8
    1328:	49 c1 e8 03          	shr    $0x3,%r8
    132c:	49 ff c0             	inc    %r8
    132f:	48 85 c0             	test   %rax,%rax
    1332:	0f 84 73 01 00 00    	je     14ab <func0+0x1ab>
    1338:	4c 89 c2             	mov    %r8,%rdx
    133b:	48 83 e2 fe          	and    $0xfffffffffffffffe,%rdx
    133f:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1343:	31 c0                	xor    %eax,%eax
    1345:	66 44 0f 6f 05 f2 0d 	movdqa 0xdf2(%rip),%xmm8        # 2140 <_IO_stdin_used+0x140>
    134c:	00 00 
    134e:	66 44 0f 6f 0d f9 0d 	movdqa 0xdf9(%rip),%xmm9        # 2150 <_IO_stdin_used+0x150>
    1355:	00 00 
    1357:	66 44 0f 6f 15 00 0e 	movdqa 0xe00(%rip),%xmm10        # 2160 <_IO_stdin_used+0x160>
    135e:	00 00 
    1360:	66 0f ef c9          	pxor   %xmm1,%xmm1
    1364:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    136b:	00 00 00 00 00 
    1370:	f3 0f 6f 1c 87       	movdqu (%rdi,%rax,4),%xmm3
    1375:	f3 0f 6f 64 87 10    	movdqu 0x10(%rdi,%rax,4),%xmm4
    137b:	f3 0f 6f 74 87 20    	movdqu 0x20(%rdi,%rax,4),%xmm6
    1381:	f3 44 0f 6f 5c 87 30 	movdqu 0x30(%rdi,%rax,4),%xmm11
    1388:	66 0f 6f fb          	movdqa %xmm3,%xmm7
    138c:	66 41 0f fe f8       	paddd  %xmm8,%xmm7
    1391:	66 0f 6f d4          	movdqa %xmm4,%xmm2
    1395:	66 41 0f fe d0       	paddd  %xmm8,%xmm2
    139a:	66 41 0f ef f9       	pxor   %xmm9,%xmm7
    139f:	66 41 0f 6f ea       	movdqa %xmm10,%xmm5
    13a4:	66 0f 66 ef          	pcmpgtd %xmm7,%xmm5
    13a8:	66 41 0f ef d1       	pxor   %xmm9,%xmm2
    13ad:	66 41 0f 6f fa       	movdqa %xmm10,%xmm7
    13b2:	66 0f 66 fa          	pcmpgtd %xmm2,%xmm7
    13b6:	66 0f db eb          	pand   %xmm3,%xmm5
    13ba:	66 0f fe e8          	paddd  %xmm0,%xmm5
    13be:	66 0f db fc          	pand   %xmm4,%xmm7
    13c2:	66 0f fe f9          	paddd  %xmm1,%xmm7
    13c6:	66 0f 6f ce          	movdqa %xmm6,%xmm1
    13ca:	66 41 0f fe c8       	paddd  %xmm8,%xmm1
    13cf:	66 41 0f 6f d3       	movdqa %xmm11,%xmm2
    13d4:	66 41 0f fe d0       	paddd  %xmm8,%xmm2
    13d9:	66 41 0f ef c9       	pxor   %xmm9,%xmm1
    13de:	66 41 0f 6f c2       	movdqa %xmm10,%xmm0
    13e3:	66 0f 66 c1          	pcmpgtd %xmm1,%xmm0
    13e7:	66 41 0f ef d1       	pxor   %xmm9,%xmm2
    13ec:	66 41 0f 6f ca       	movdqa %xmm10,%xmm1
    13f1:	66 0f 66 ca          	pcmpgtd %xmm2,%xmm1
    13f5:	66 0f db c6          	pand   %xmm6,%xmm0
    13f9:	66 0f fe c5          	paddd  %xmm5,%xmm0
    13fd:	66 41 0f db cb       	pand   %xmm11,%xmm1
    1402:	66 0f fe cf          	paddd  %xmm7,%xmm1
    1406:	48 83 c0 10          	add    $0x10,%rax
    140a:	48 83 c2 fe          	add    $0xfffffffffffffffe,%rdx
    140e:	0f 85 5c ff ff ff    	jne    1370 <func0+0x70>
    1414:	41 f6 c0 01          	test   $0x1,%r8b
    1418:	74 56                	je     1470 <func0+0x170>
    141a:	f3 0f 6f 14 87       	movdqu (%rdi,%rax,4),%xmm2
    141f:	f3 0f 6f 5c 87 10    	movdqu 0x10(%rdi,%rax,4),%xmm3
    1425:	66 0f 6f 25 13 0d 00 	movdqa 0xd13(%rip),%xmm4        # 2140 <_IO_stdin_used+0x140>
    142c:	00 
    142d:	66 0f 6f ea          	movdqa %xmm2,%xmm5
    1431:	66 0f fe ec          	paddd  %xmm4,%xmm5
    1435:	66 0f fe e3          	paddd  %xmm3,%xmm4
    1439:	66 44 0f 6f 05 0e 0d 	movdqa 0xd0e(%rip),%xmm8        # 2150 <_IO_stdin_used+0x150>
    1440:	00 00 
    1442:	66 41 0f ef e8       	pxor   %xmm8,%xmm5
    1447:	66 0f 6f 3d 11 0d 00 	movdqa 0xd11(%rip),%xmm7        # 2160 <_IO_stdin_used+0x160>
    144e:	00 
    144f:	66 0f 6f f7          	movdqa %xmm7,%xmm6
    1453:	66 0f 66 f5          	pcmpgtd %xmm5,%xmm6
    1457:	66 41 0f ef e0       	pxor   %xmm8,%xmm4
    145c:	66 0f 66 fc          	pcmpgtd %xmm4,%xmm7
    1460:	66 0f db f2          	pand   %xmm2,%xmm6
    1464:	66 0f fe c6          	paddd  %xmm6,%xmm0
    1468:	66 0f db fb          	pand   %xmm3,%xmm7
    146c:	66 0f fe cf          	paddd  %xmm7,%xmm1
    1470:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1474:	66 0f 70 c8 ee       	pshufd $0xee,%xmm0,%xmm1
    1479:	66 0f fe c8          	paddd  %xmm0,%xmm1
    147d:	66 0f 70 c1 55       	pshufd $0x55,%xmm1,%xmm0
    1482:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1486:	66 0f 7e c0          	movd   %xmm0,%eax
    148a:	4c 39 d6             	cmp    %r10,%rsi
    148d:	74 1b                	je     14aa <func0+0x1aa>
    148f:	90                   	nop
    1490:	8b 14 b7             	mov    (%rdi,%rsi,4),%edx
    1493:	8d 4a 63             	lea    0x63(%rdx),%ecx
    1496:	81 f9 c7 00 00 00    	cmp    $0xc7,%ecx
    149c:	41 0f 43 d1          	cmovae %r9d,%edx
    14a0:	01 d0                	add    %edx,%eax
    14a2:	48 ff c6             	inc    %rsi
    14a5:	49 39 f2             	cmp    %rsi,%r10
    14a8:	75 e6                	jne    1490 <func0+0x190>
    14aa:	c3                   	ret    
    14ab:	66 0f ef c0          	pxor   %xmm0,%xmm0
    14af:	31 c0                	xor    %eax,%eax
    14b1:	66 0f ef c9          	pxor   %xmm1,%xmm1
    14b5:	41 f6 c0 01          	test   $0x1,%r8b
    14b9:	0f 85 5b ff ff ff    	jne    141a <func0+0x11a>
    14bf:	eb af                	jmp    1470 <func0+0x170>

