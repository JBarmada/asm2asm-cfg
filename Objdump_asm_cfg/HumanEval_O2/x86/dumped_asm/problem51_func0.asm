0000000000001300 <func0>:
    1300:	55                   	push   %rbp
    1301:	53                   	push   %rbx
    1302:	50                   	push   %rax
    1303:	89 f5                	mov    %esi,%ebp
    1305:	48 89 fb             	mov    %rdi,%rbx
    1308:	e8 43 fd ff ff       	call   1050 <strlen@plt>
    130d:	48 85 c0             	test   %rax,%rax
    1310:	0f 84 29 08 00 00    	je     1b3f <func0+0x83f>
    1316:	31 c9                	xor    %ecx,%ecx
    1318:	85 ed                	test   %ebp,%ebp
    131a:	0f 94 c1             	sete   %cl
    131d:	c1 e1 04             	shl    $0x4,%ecx
    1320:	83 c9 a4             	or     $0xffffffa4,%ecx
    1323:	48 83 f8 08          	cmp    $0x8,%rax
    1327:	73 07                	jae    1330 <func0+0x30>
    1329:	31 d2                	xor    %edx,%edx
    132b:	e9 d7 07 00 00       	jmp    1b07 <func0+0x807>
    1330:	66 44 0f 6e c1       	movd   %ecx,%xmm8
    1335:	48 83 f8 10          	cmp    $0x10,%rax
    1339:	0f 83 50 01 00 00    	jae    148f <func0+0x18f>
    133f:	31 d2                	xor    %edx,%edx
    1341:	48 89 d6             	mov    %rdx,%rsi
    1344:	48 89 c2             	mov    %rax,%rdx
    1347:	48 83 e2 f8          	and    $0xfffffffffffffff8,%rdx
    134b:	66 41 0f 70 c0 00    	pshufd $0x0,%xmm8,%xmm0
    1351:	66 0f 6f 0d e7 0c 00 	movdqa 0xce7(%rip),%xmm1        # 2040 <_IO_stdin_used+0x40>
    1358:	00 
    1359:	66 0f 6f 15 ef 0c 00 	movdqa 0xcef(%rip),%xmm2        # 2050 <_IO_stdin_used+0x50>
    1360:	00 
    1361:	66 0f 6f 1d f7 0c 00 	movdqa 0xcf7(%rip),%xmm3        # 2060 <_IO_stdin_used+0x60>
    1368:	00 
    1369:	66 44 0f 6f 05 0e 0d 	movdqa 0xd0e(%rip),%xmm8        # 2080 <_IO_stdin_used+0x80>
    1370:	00 00 
    1372:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1379:	1f 84 00 00 00 00 00 
    1380:	f3 0f 7e 2c 33       	movq   (%rbx,%rsi,1),%xmm5
    1385:	66 0f 60 f5          	punpcklbw %xmm5,%xmm6
    1389:	66 0f 61 ee          	punpcklwd %xmm6,%xmm5
    138d:	66 0f 72 e5 18       	psrad  $0x18,%xmm5
    1392:	66 0f 69 f6          	punpckhwd %xmm6,%xmm6
    1396:	66 0f 72 e6 18       	psrad  $0x18,%xmm6
    139b:	66 0f fe f0          	paddd  %xmm0,%xmm6
    139f:	66 0f fe e8          	paddd  %xmm0,%xmm5
    13a3:	66 0f 6f fd          	movdqa %xmm5,%xmm7
    13a7:	66 0f f4 f9          	pmuludq %xmm1,%xmm7
    13ab:	66 0f 70 ff ed       	pshufd $0xed,%xmm7,%xmm7
    13b0:	66 0f 70 e5 f5       	pshufd $0xf5,%xmm5,%xmm4
    13b5:	66 0f f4 e1          	pmuludq %xmm1,%xmm4
    13b9:	66 0f 70 e4 ed       	pshufd $0xed,%xmm4,%xmm4
    13be:	66 0f 62 fc          	punpckldq %xmm4,%xmm7
    13c2:	66 0f ef e4          	pxor   %xmm4,%xmm4
    13c6:	66 0f 66 e5          	pcmpgtd %xmm5,%xmm4
    13ca:	66 0f db e1          	pand   %xmm1,%xmm4
    13ce:	66 0f fa fc          	psubd  %xmm4,%xmm7
    13d2:	66 0f 6f e7          	movdqa %xmm7,%xmm4
    13d6:	66 0f 72 d4 1f       	psrld  $0x1f,%xmm4
    13db:	66 0f 72 d7 03       	psrld  $0x3,%xmm7
    13e0:	66 0f fe fc          	paddd  %xmm4,%xmm7
    13e4:	66 0f 70 e7 f5       	pshufd $0xf5,%xmm7,%xmm4
    13e9:	66 0f f4 fa          	pmuludq %xmm2,%xmm7
    13ed:	66 0f 70 ff e8       	pshufd $0xe8,%xmm7,%xmm7
    13f2:	66 0f f4 e2          	pmuludq %xmm2,%xmm4
    13f6:	66 0f 70 e4 e8       	pshufd $0xe8,%xmm4,%xmm4
    13fb:	66 0f 62 fc          	punpckldq %xmm4,%xmm7
    13ff:	66 0f fa ef          	psubd  %xmm7,%xmm5
    1403:	66 0f 6f e6          	movdqa %xmm6,%xmm4
    1407:	66 0f f4 e1          	pmuludq %xmm1,%xmm4
    140b:	66 0f 70 e4 ed       	pshufd $0xed,%xmm4,%xmm4
    1410:	66 0f 70 fe f5       	pshufd $0xf5,%xmm6,%xmm7
    1415:	66 0f f4 f9          	pmuludq %xmm1,%xmm7
    1419:	66 0f 70 ff ed       	pshufd $0xed,%xmm7,%xmm7
    141e:	66 0f 62 e7          	punpckldq %xmm7,%xmm4
    1422:	66 0f ef ff          	pxor   %xmm7,%xmm7
    1426:	66 0f 66 fe          	pcmpgtd %xmm6,%xmm7
    142a:	66 0f db f9          	pand   %xmm1,%xmm7
    142e:	66 0f fa e7          	psubd  %xmm7,%xmm4
    1432:	66 0f 6f fc          	movdqa %xmm4,%xmm7
    1436:	66 0f 72 d7 1f       	psrld  $0x1f,%xmm7
    143b:	66 0f 72 d4 03       	psrld  $0x3,%xmm4
    1440:	66 0f fe e7          	paddd  %xmm7,%xmm4
    1444:	66 0f 70 fc f5       	pshufd $0xf5,%xmm4,%xmm7
    1449:	66 0f f4 e2          	pmuludq %xmm2,%xmm4
    144d:	66 0f 70 e4 e8       	pshufd $0xe8,%xmm4,%xmm4
    1452:	66 0f f4 fa          	pmuludq %xmm2,%xmm7
    1456:	66 0f 70 ff e8       	pshufd $0xe8,%xmm7,%xmm7
    145b:	66 0f 62 e7          	punpckldq %xmm7,%xmm4
    145f:	66 0f fa f4          	psubd  %xmm4,%xmm6
    1463:	66 0f db f3          	pand   %xmm3,%xmm6
    1467:	66 0f db eb          	pand   %xmm3,%xmm5
    146b:	66 0f 67 ee          	packuswb %xmm6,%xmm5
    146f:	66 0f 67 ed          	packuswb %xmm5,%xmm5
    1473:	66 41 0f fc e8       	paddb  %xmm8,%xmm5
    1478:	66 0f d6 2c 33       	movq   %xmm5,(%rbx,%rsi,1)
    147d:	48 83 c6 08          	add    $0x8,%rsi
    1481:	48 39 f2             	cmp    %rsi,%rdx
    1484:	0f 85 f6 fe ff ff    	jne    1380 <func0+0x80>
    148a:	e9 ab 06 00 00       	jmp    1b3a <func0+0x83a>
    148f:	48 89 c2             	mov    %rax,%rdx
    1492:	48 83 e2 f0          	and    $0xfffffffffffffff0,%rdx
    1496:	66 45 0f 70 e0 00    	pshufd $0x0,%xmm8,%xmm12
    149c:	48 8d 72 f0          	lea    -0x10(%rdx),%rsi
    14a0:	48 89 f5             	mov    %rsi,%rbp
    14a3:	48 c1 ed 04          	shr    $0x4,%rbp
    14a7:	48 ff c5             	inc    %rbp
    14aa:	48 85 f6             	test   %rsi,%rsi
    14ad:	0f 84 46 06 00 00    	je     1af9 <func0+0x7f9>
    14b3:	48 89 ef             	mov    %rbp,%rdi
    14b6:	48 83 e7 fe          	and    $0xfffffffffffffffe,%rdi
    14ba:	31 f6                	xor    %esi,%esi
    14bc:	66 0f 6f 15 7c 0b 00 	movdqa 0xb7c(%rip),%xmm2        # 2040 <_IO_stdin_used+0x40>
    14c3:	00 
    14c4:	66 0f 6f 1d 84 0b 00 	movdqa 0xb84(%rip),%xmm3        # 2050 <_IO_stdin_used+0x50>
    14cb:	00 
    14cc:	66 44 0f 6f 15 8b 0b 	movdqa 0xb8b(%rip),%xmm10        # 2060 <_IO_stdin_used+0x60>
    14d3:	00 00 
    14d5:	66 44 0f 6f 0d 92 0b 	movdqa 0xb92(%rip),%xmm9        # 2070 <_IO_stdin_used+0x70>
    14dc:	00 00 
    14de:	66 90                	xchg   %ax,%ax
    14e0:	f3 0f 6f 24 33       	movdqu (%rbx,%rsi,1),%xmm4
    14e5:	f3 44 0f 6f 5c 33 10 	movdqu 0x10(%rbx,%rsi,1),%xmm11
    14ec:	66 0f 60 c4          	punpcklbw %xmm4,%xmm0
    14f0:	66 0f 61 f0          	punpcklwd %xmm0,%xmm6
    14f4:	66 0f 72 e6 18       	psrad  $0x18,%xmm6
    14f9:	66 0f 69 c0          	punpckhwd %xmm0,%xmm0
    14fd:	66 0f 72 e0 18       	psrad  $0x18,%xmm0
    1502:	66 0f 68 e4          	punpckhbw %xmm4,%xmm4
    1506:	66 0f 61 ec          	punpcklwd %xmm4,%xmm5
    150a:	66 0f 72 e5 18       	psrad  $0x18,%xmm5
    150f:	66 0f 69 e4          	punpckhwd %xmm4,%xmm4
    1513:	66 0f 72 e4 18       	psrad  $0x18,%xmm4
    1518:	66 41 0f fe e4       	paddd  %xmm12,%xmm4
    151d:	66 41 0f fe ec       	paddd  %xmm12,%xmm5
    1522:	66 41 0f fe c4       	paddd  %xmm12,%xmm0
    1527:	66 41 0f fe f4       	paddd  %xmm12,%xmm6
    152c:	66 0f 6f fe          	movdqa %xmm6,%xmm7
    1530:	66 0f f4 fa          	pmuludq %xmm2,%xmm7
    1534:	66 0f 70 ff ed       	pshufd $0xed,%xmm7,%xmm7
    1539:	66 0f 70 ce f5       	pshufd $0xf5,%xmm6,%xmm1
    153e:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    1542:	66 0f 70 c9 ed       	pshufd $0xed,%xmm1,%xmm1
    1547:	66 0f 62 f9          	punpckldq %xmm1,%xmm7
    154b:	66 0f ef c9          	pxor   %xmm1,%xmm1
    154f:	66 0f 66 ce          	pcmpgtd %xmm6,%xmm1
    1553:	66 0f db ca          	pand   %xmm2,%xmm1
    1557:	66 0f fa f9          	psubd  %xmm1,%xmm7
    155b:	66 0f 6f cf          	movdqa %xmm7,%xmm1
    155f:	66 0f 72 d1 1f       	psrld  $0x1f,%xmm1
    1564:	66 0f 72 d7 03       	psrld  $0x3,%xmm7
    1569:	66 0f fe f9          	paddd  %xmm1,%xmm7
    156d:	66 0f 70 cf f5       	pshufd $0xf5,%xmm7,%xmm1
    1572:	66 0f f4 fb          	pmuludq %xmm3,%xmm7
    1576:	66 0f 70 ff e8       	pshufd $0xe8,%xmm7,%xmm7
    157b:	66 0f f4 cb          	pmuludq %xmm3,%xmm1
    157f:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    1584:	66 0f 62 f9          	punpckldq %xmm1,%xmm7
    1588:	66 0f fa f7          	psubd  %xmm7,%xmm6
    158c:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    1590:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    1594:	66 0f 70 c9 ed       	pshufd $0xed,%xmm1,%xmm1
    1599:	66 0f 70 f8 f5       	pshufd $0xf5,%xmm0,%xmm7
    159e:	66 0f f4 fa          	pmuludq %xmm2,%xmm7
    15a2:	66 0f 70 ff ed       	pshufd $0xed,%xmm7,%xmm7
    15a7:	66 0f 62 cf          	punpckldq %xmm7,%xmm1
    15ab:	66 0f ef ff          	pxor   %xmm7,%xmm7
    15af:	66 0f 66 f8          	pcmpgtd %xmm0,%xmm7
    15b3:	66 0f db fa          	pand   %xmm2,%xmm7
    15b7:	66 0f fa cf          	psubd  %xmm7,%xmm1
    15bb:	66 0f 6f f9          	movdqa %xmm1,%xmm7
    15bf:	66 0f 72 d7 1f       	psrld  $0x1f,%xmm7
    15c4:	66 0f 72 d1 03       	psrld  $0x3,%xmm1
    15c9:	66 0f fe cf          	paddd  %xmm7,%xmm1
    15cd:	66 0f 70 f9 f5       	pshufd $0xf5,%xmm1,%xmm7
    15d2:	66 0f f4 cb          	pmuludq %xmm3,%xmm1
    15d6:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    15db:	66 0f f4 fb          	pmuludq %xmm3,%xmm7
    15df:	66 0f 70 ff e8       	pshufd $0xe8,%xmm7,%xmm7
    15e4:	66 0f 62 cf          	punpckldq %xmm7,%xmm1
    15e8:	66 0f fa c1          	psubd  %xmm1,%xmm0
    15ec:	66 0f 6f cd          	movdqa %xmm5,%xmm1
    15f0:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    15f4:	66 0f 70 c9 ed       	pshufd $0xed,%xmm1,%xmm1
    15f9:	66 0f 70 fd f5       	pshufd $0xf5,%xmm5,%xmm7
    15fe:	66 0f f4 fa          	pmuludq %xmm2,%xmm7
    1602:	66 0f 70 ff ed       	pshufd $0xed,%xmm7,%xmm7
    1607:	66 0f 62 cf          	punpckldq %xmm7,%xmm1
    160b:	66 0f ef ff          	pxor   %xmm7,%xmm7
    160f:	66 0f 66 fd          	pcmpgtd %xmm5,%xmm7
    1613:	66 0f db fa          	pand   %xmm2,%xmm7
    1617:	66 0f fa cf          	psubd  %xmm7,%xmm1
    161b:	66 0f 6f f9          	movdqa %xmm1,%xmm7
    161f:	66 0f 72 d7 1f       	psrld  $0x1f,%xmm7
    1624:	66 0f 72 d1 03       	psrld  $0x3,%xmm1
    1629:	66 0f fe cf          	paddd  %xmm7,%xmm1
    162d:	66 0f 70 f9 f5       	pshufd $0xf5,%xmm1,%xmm7
    1632:	66 0f f4 cb          	pmuludq %xmm3,%xmm1
    1636:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    163b:	66 0f f4 fb          	pmuludq %xmm3,%xmm7
    163f:	66 0f 70 ff e8       	pshufd $0xe8,%xmm7,%xmm7
    1644:	66 0f 62 cf          	punpckldq %xmm7,%xmm1
    1648:	66 0f fa e9          	psubd  %xmm1,%xmm5
    164c:	66 0f 6f cc          	movdqa %xmm4,%xmm1
    1650:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    1654:	66 0f 70 c9 ed       	pshufd $0xed,%xmm1,%xmm1
    1659:	66 0f 70 fc f5       	pshufd $0xf5,%xmm4,%xmm7
    165e:	66 0f f4 fa          	pmuludq %xmm2,%xmm7
    1662:	66 0f 70 ff ed       	pshufd $0xed,%xmm7,%xmm7
    1667:	66 0f 62 cf          	punpckldq %xmm7,%xmm1
    166b:	66 0f ef ff          	pxor   %xmm7,%xmm7
    166f:	66 0f 66 fc          	pcmpgtd %xmm4,%xmm7
    1673:	66 0f db fa          	pand   %xmm2,%xmm7
    1677:	66 0f fa cf          	psubd  %xmm7,%xmm1
    167b:	66 0f 6f f9          	movdqa %xmm1,%xmm7
    167f:	66 0f 72 d7 1f       	psrld  $0x1f,%xmm7
    1684:	66 0f 72 d1 03       	psrld  $0x3,%xmm1
    1689:	66 0f fe cf          	paddd  %xmm7,%xmm1
    168d:	66 0f 70 f9 f5       	pshufd $0xf5,%xmm1,%xmm7
    1692:	66 0f f4 cb          	pmuludq %xmm3,%xmm1
    1696:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    169b:	66 0f f4 fb          	pmuludq %xmm3,%xmm7
    169f:	66 0f 70 ff e8       	pshufd $0xe8,%xmm7,%xmm7
    16a4:	66 0f 62 cf          	punpckldq %xmm7,%xmm1
    16a8:	66 0f fa e1          	psubd  %xmm1,%xmm4
    16ac:	66 41 0f db e2       	pand   %xmm10,%xmm4
    16b1:	66 41 0f db ea       	pand   %xmm10,%xmm5
    16b6:	66 0f 67 ec          	packuswb %xmm4,%xmm5
    16ba:	66 41 0f db c2       	pand   %xmm10,%xmm0
    16bf:	66 41 0f db f2       	pand   %xmm10,%xmm6
    16c4:	66 0f 67 f0          	packuswb %xmm0,%xmm6
    16c8:	66 0f 67 f5          	packuswb %xmm5,%xmm6
    16cc:	66 41 0f fc f1       	paddb  %xmm9,%xmm6
    16d1:	f3 0f 7f 34 33       	movdqu %xmm6,(%rbx,%rsi,1)
    16d6:	66 41 0f 60 c3       	punpcklbw %xmm11,%xmm0
    16db:	66 0f 61 f8          	punpcklwd %xmm0,%xmm7
    16df:	66 0f 72 e7 18       	psrad  $0x18,%xmm7
    16e4:	66 0f 69 c0          	punpckhwd %xmm0,%xmm0
    16e8:	66 0f 72 e0 18       	psrad  $0x18,%xmm0
    16ed:	66 41 0f 68 cb       	punpckhbw %xmm11,%xmm1
    16f2:	66 0f 61 e9          	punpcklwd %xmm1,%xmm5
    16f6:	66 0f 72 e5 18       	psrad  $0x18,%xmm5
    16fb:	66 0f 69 e1          	punpckhwd %xmm1,%xmm4
    16ff:	66 0f 72 e4 18       	psrad  $0x18,%xmm4
    1704:	66 41 0f fe e4       	paddd  %xmm12,%xmm4
    1709:	66 41 0f fe ec       	paddd  %xmm12,%xmm5
    170e:	66 41 0f fe c4       	paddd  %xmm12,%xmm0
    1713:	66 41 0f fe fc       	paddd  %xmm12,%xmm7
    1718:	66 0f 6f cf          	movdqa %xmm7,%xmm1
    171c:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    1720:	66 0f 70 c9 ed       	pshufd $0xed,%xmm1,%xmm1
    1725:	66 0f 70 f7 f5       	pshufd $0xf5,%xmm7,%xmm6
    172a:	66 0f f4 f2          	pmuludq %xmm2,%xmm6
    172e:	66 0f 70 f6 ed       	pshufd $0xed,%xmm6,%xmm6
    1733:	66 0f 62 ce          	punpckldq %xmm6,%xmm1
    1737:	66 0f ef f6          	pxor   %xmm6,%xmm6
    173b:	66 0f 66 f7          	pcmpgtd %xmm7,%xmm6
    173f:	66 0f db f2          	pand   %xmm2,%xmm6
    1743:	66 0f fa ce          	psubd  %xmm6,%xmm1
    1747:	66 0f 6f f1          	movdqa %xmm1,%xmm6
    174b:	66 0f 72 d6 1f       	psrld  $0x1f,%xmm6
    1750:	66 0f 72 d1 03       	psrld  $0x3,%xmm1
    1755:	66 0f fe ce          	paddd  %xmm6,%xmm1
    1759:	66 0f 70 f1 f5       	pshufd $0xf5,%xmm1,%xmm6
    175e:	66 0f f4 cb          	pmuludq %xmm3,%xmm1
    1762:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    1767:	66 0f f4 f3          	pmuludq %xmm3,%xmm6
    176b:	66 0f 70 f6 e8       	pshufd $0xe8,%xmm6,%xmm6
    1770:	66 0f 62 ce          	punpckldq %xmm6,%xmm1
    1774:	66 0f fa f9          	psubd  %xmm1,%xmm7
    1778:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    177c:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    1780:	66 0f 70 c9 ed       	pshufd $0xed,%xmm1,%xmm1
    1785:	66 0f 70 f0 f5       	pshufd $0xf5,%xmm0,%xmm6
    178a:	66 0f f4 f2          	pmuludq %xmm2,%xmm6
    178e:	66 0f 70 f6 ed       	pshufd $0xed,%xmm6,%xmm6
    1793:	66 0f 62 ce          	punpckldq %xmm6,%xmm1
    1797:	66 0f ef f6          	pxor   %xmm6,%xmm6
    179b:	66 0f 66 f0          	pcmpgtd %xmm0,%xmm6
    179f:	66 0f db f2          	pand   %xmm2,%xmm6
    17a3:	66 0f fa ce          	psubd  %xmm6,%xmm1
    17a7:	66 0f 6f f1          	movdqa %xmm1,%xmm6
    17ab:	66 0f 72 d6 1f       	psrld  $0x1f,%xmm6
    17b0:	66 0f 72 d1 03       	psrld  $0x3,%xmm1
    17b5:	66 0f fe ce          	paddd  %xmm6,%xmm1
    17b9:	66 0f 70 f1 f5       	pshufd $0xf5,%xmm1,%xmm6
    17be:	66 0f f4 cb          	pmuludq %xmm3,%xmm1
    17c2:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    17c7:	66 0f f4 f3          	pmuludq %xmm3,%xmm6
    17cb:	66 0f 70 f6 e8       	pshufd $0xe8,%xmm6,%xmm6
    17d0:	66 0f 62 ce          	punpckldq %xmm6,%xmm1
    17d4:	66 0f fa c1          	psubd  %xmm1,%xmm0
    17d8:	66 0f 6f cd          	movdqa %xmm5,%xmm1
    17dc:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    17e0:	66 0f 70 c9 ed       	pshufd $0xed,%xmm1,%xmm1
    17e5:	66 0f 70 f5 f5       	pshufd $0xf5,%xmm5,%xmm6
    17ea:	66 0f f4 f2          	pmuludq %xmm2,%xmm6
    17ee:	66 0f 70 f6 ed       	pshufd $0xed,%xmm6,%xmm6
    17f3:	66 0f 62 ce          	punpckldq %xmm6,%xmm1
    17f7:	66 0f ef f6          	pxor   %xmm6,%xmm6
    17fb:	66 0f 66 f5          	pcmpgtd %xmm5,%xmm6
    17ff:	66 0f db f2          	pand   %xmm2,%xmm6
    1803:	66 0f fa ce          	psubd  %xmm6,%xmm1
    1807:	66 0f 6f f1          	movdqa %xmm1,%xmm6
    180b:	66 0f 72 d6 1f       	psrld  $0x1f,%xmm6
    1810:	66 0f 72 d1 03       	psrld  $0x3,%xmm1
    1815:	66 0f fe ce          	paddd  %xmm6,%xmm1
    1819:	66 0f 70 f1 f5       	pshufd $0xf5,%xmm1,%xmm6
    181e:	66 0f f4 cb          	pmuludq %xmm3,%xmm1
    1822:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    1827:	66 0f f4 f3          	pmuludq %xmm3,%xmm6
    182b:	66 0f 70 f6 e8       	pshufd $0xe8,%xmm6,%xmm6
    1830:	66 0f 62 ce          	punpckldq %xmm6,%xmm1
    1834:	66 0f fa e9          	psubd  %xmm1,%xmm5
    1838:	66 0f 6f cc          	movdqa %xmm4,%xmm1
    183c:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    1840:	66 0f 70 c9 ed       	pshufd $0xed,%xmm1,%xmm1
    1845:	66 0f 70 f4 f5       	pshufd $0xf5,%xmm4,%xmm6
    184a:	66 0f f4 f2          	pmuludq %xmm2,%xmm6
    184e:	66 0f 70 f6 ed       	pshufd $0xed,%xmm6,%xmm6
    1853:	66 0f 62 ce          	punpckldq %xmm6,%xmm1
    1857:	66 0f ef f6          	pxor   %xmm6,%xmm6
    185b:	66 0f 66 f4          	pcmpgtd %xmm4,%xmm6
    185f:	66 0f db f2          	pand   %xmm2,%xmm6
    1863:	66 0f fa ce          	psubd  %xmm6,%xmm1
    1867:	66 0f 6f f1          	movdqa %xmm1,%xmm6
    186b:	66 0f 72 d6 1f       	psrld  $0x1f,%xmm6
    1870:	66 0f 72 d1 03       	psrld  $0x3,%xmm1
    1875:	66 0f fe ce          	paddd  %xmm6,%xmm1
    1879:	66 0f 70 f1 f5       	pshufd $0xf5,%xmm1,%xmm6
    187e:	66 0f f4 cb          	pmuludq %xmm3,%xmm1
    1882:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    1887:	66 0f f4 f3          	pmuludq %xmm3,%xmm6
    188b:	66 0f 70 f6 e8       	pshufd $0xe8,%xmm6,%xmm6
    1890:	66 0f 62 ce          	punpckldq %xmm6,%xmm1
    1894:	66 0f fa e1          	psubd  %xmm1,%xmm4
    1898:	66 41 0f db e2       	pand   %xmm10,%xmm4
    189d:	66 41 0f db ea       	pand   %xmm10,%xmm5
    18a2:	66 0f 67 ec          	packuswb %xmm4,%xmm5
    18a6:	66 41 0f db c2       	pand   %xmm10,%xmm0
    18ab:	66 41 0f db fa       	pand   %xmm10,%xmm7
    18b0:	66 0f 67 f8          	packuswb %xmm0,%xmm7
    18b4:	66 0f 67 fd          	packuswb %xmm5,%xmm7
    18b8:	66 41 0f fc f9       	paddb  %xmm9,%xmm7
    18bd:	f3 0f 7f 7c 33 10    	movdqu %xmm7,0x10(%rbx,%rsi,1)
    18c3:	48 83 c6 20          	add    $0x20,%rsi
    18c7:	48 83 c7 fe          	add    $0xfffffffffffffffe,%rdi
    18cb:	0f 85 0f fc ff ff    	jne    14e0 <func0+0x1e0>
    18d1:	40 f6 c5 01          	test   $0x1,%bpl
    18d5:	0f 84 0f 02 00 00    	je     1aea <func0+0x7ea>
    18db:	f3 0f 6f 04 33       	movdqu (%rbx,%rsi,1),%xmm0
    18e0:	66 0f 60 c8          	punpcklbw %xmm0,%xmm1
    18e4:	66 0f 61 d1          	punpcklwd %xmm1,%xmm2
    18e8:	66 0f 72 e2 18       	psrad  $0x18,%xmm2
    18ed:	66 0f 69 d9          	punpckhwd %xmm1,%xmm3
    18f1:	66 0f 72 e3 18       	psrad  $0x18,%xmm3
    18f6:	66 0f 68 c0          	punpckhbw %xmm0,%xmm0
    18fa:	66 0f 61 e0          	punpcklwd %xmm0,%xmm4
    18fe:	66 0f 72 e4 18       	psrad  $0x18,%xmm4
    1903:	66 0f 69 c0          	punpckhwd %xmm0,%xmm0
    1907:	66 0f 72 e0 18       	psrad  $0x18,%xmm0
    190c:	66 41 0f fe c4       	paddd  %xmm12,%xmm0
    1911:	66 41 0f fe e4       	paddd  %xmm12,%xmm4
    1916:	66 41 0f fe dc       	paddd  %xmm12,%xmm3
    191b:	66 41 0f fe d4       	paddd  %xmm12,%xmm2
    1920:	66 0f 6f 0d 18 07 00 	movdqa 0x718(%rip),%xmm1        # 2040 <_IO_stdin_used+0x40>
    1927:	00 
    1928:	66 0f 6f ea          	movdqa %xmm2,%xmm5
    192c:	66 0f f4 e9          	pmuludq %xmm1,%xmm5
    1930:	66 0f 70 fd ed       	pshufd $0xed,%xmm5,%xmm7
    1935:	66 0f 70 ea f5       	pshufd $0xf5,%xmm2,%xmm5
    193a:	66 0f f4 e9          	pmuludq %xmm1,%xmm5
    193e:	66 0f 70 ed ed       	pshufd $0xed,%xmm5,%xmm5
    1943:	66 0f 62 fd          	punpckldq %xmm5,%xmm7
    1947:	66 0f ef ed          	pxor   %xmm5,%xmm5
    194b:	66 0f ef f6          	pxor   %xmm6,%xmm6
    194f:	66 0f 66 f2          	pcmpgtd %xmm2,%xmm6
    1953:	66 0f db f1          	pand   %xmm1,%xmm6
    1957:	66 0f fa fe          	psubd  %xmm6,%xmm7
    195b:	66 0f 6f f7          	movdqa %xmm7,%xmm6
    195f:	66 0f 72 d6 1f       	psrld  $0x1f,%xmm6
    1964:	66 0f 72 d7 03       	psrld  $0x3,%xmm7
    1969:	66 0f fe fe          	paddd  %xmm6,%xmm7
    196d:	66 44 0f 6f 0d da 06 	movdqa 0x6da(%rip),%xmm9        # 2050 <_IO_stdin_used+0x50>
    1974:	00 00 
    1976:	66 0f 70 f7 f5       	pshufd $0xf5,%xmm7,%xmm6
    197b:	66 41 0f f4 f9       	pmuludq %xmm9,%xmm7
    1980:	66 0f 70 ff e8       	pshufd $0xe8,%xmm7,%xmm7
    1985:	66 41 0f f4 f1       	pmuludq %xmm9,%xmm6
    198a:	66 0f 70 f6 e8       	pshufd $0xe8,%xmm6,%xmm6
    198f:	66 0f 62 fe          	punpckldq %xmm6,%xmm7
    1993:	66 0f fa d7          	psubd  %xmm7,%xmm2
    1997:	66 0f 6f f3          	movdqa %xmm3,%xmm6
    199b:	66 0f f4 f1          	pmuludq %xmm1,%xmm6
    199f:	66 0f 70 f6 ed       	pshufd $0xed,%xmm6,%xmm6
    19a4:	66 0f 70 fb f5       	pshufd $0xf5,%xmm3,%xmm7
    19a9:	66 0f f4 f9          	pmuludq %xmm1,%xmm7
    19ad:	66 0f 70 ff ed       	pshufd $0xed,%xmm7,%xmm7
    19b2:	66 0f 62 f7          	punpckldq %xmm7,%xmm6
    19b6:	66 0f ef ff          	pxor   %xmm7,%xmm7
    19ba:	66 0f 66 fb          	pcmpgtd %xmm3,%xmm7
    19be:	66 0f db f9          	pand   %xmm1,%xmm7
    19c2:	66 0f fa f7          	psubd  %xmm7,%xmm6
    19c6:	66 0f 6f fe          	movdqa %xmm6,%xmm7
    19ca:	66 0f 72 d7 1f       	psrld  $0x1f,%xmm7
    19cf:	66 0f 72 d6 03       	psrld  $0x3,%xmm6
    19d4:	66 0f fe f7          	paddd  %xmm7,%xmm6
    19d8:	66 0f 70 fe f5       	pshufd $0xf5,%xmm6,%xmm7
    19dd:	66 41 0f f4 f1       	pmuludq %xmm9,%xmm6
    19e2:	66 0f 70 f6 e8       	pshufd $0xe8,%xmm6,%xmm6
    19e7:	66 41 0f f4 f9       	pmuludq %xmm9,%xmm7
    19ec:	66 0f 70 ff e8       	pshufd $0xe8,%xmm7,%xmm7
    19f1:	66 0f 62 f7          	punpckldq %xmm7,%xmm6
    19f5:	66 0f fa de          	psubd  %xmm6,%xmm3
    19f9:	66 0f 6f f4          	movdqa %xmm4,%xmm6
    19fd:	66 0f f4 f1          	pmuludq %xmm1,%xmm6
    1a01:	66 0f 70 f6 ed       	pshufd $0xed,%xmm6,%xmm6
    1a06:	66 0f 70 fc f5       	pshufd $0xf5,%xmm4,%xmm7
    1a0b:	66 0f f4 f9          	pmuludq %xmm1,%xmm7
    1a0f:	66 0f 70 ff ed       	pshufd $0xed,%xmm7,%xmm7
    1a14:	66 0f 62 f7          	punpckldq %xmm7,%xmm6
    1a18:	66 0f ef ff          	pxor   %xmm7,%xmm7
    1a1c:	66 0f 66 fc          	pcmpgtd %xmm4,%xmm7
    1a20:	66 0f db f9          	pand   %xmm1,%xmm7
    1a24:	66 0f fa f7          	psubd  %xmm7,%xmm6
    1a28:	66 0f 6f fe          	movdqa %xmm6,%xmm7
    1a2c:	66 0f 72 d7 1f       	psrld  $0x1f,%xmm7
    1a31:	66 0f 72 d6 03       	psrld  $0x3,%xmm6
    1a36:	66 0f fe f7          	paddd  %xmm7,%xmm6
    1a3a:	66 0f 70 fe f5       	pshufd $0xf5,%xmm6,%xmm7
    1a3f:	66 41 0f f4 f1       	pmuludq %xmm9,%xmm6
    1a44:	66 0f 70 f6 e8       	pshufd $0xe8,%xmm6,%xmm6
    1a49:	66 41 0f f4 f9       	pmuludq %xmm9,%xmm7
    1a4e:	66 0f 70 ff e8       	pshufd $0xe8,%xmm7,%xmm7
    1a53:	66 0f 62 f7          	punpckldq %xmm7,%xmm6
    1a57:	66 0f fa e6          	psubd  %xmm6,%xmm4
    1a5b:	66 0f 6f f0          	movdqa %xmm0,%xmm6
    1a5f:	66 0f f4 f1          	pmuludq %xmm1,%xmm6
    1a63:	66 0f 70 f6 ed       	pshufd $0xed,%xmm6,%xmm6
    1a68:	66 0f 70 f8 f5       	pshufd $0xf5,%xmm0,%xmm7
    1a6d:	66 0f f4 f9          	pmuludq %xmm1,%xmm7
    1a71:	66 0f 70 ff ed       	pshufd $0xed,%xmm7,%xmm7
    1a76:	66 0f 62 f7          	punpckldq %xmm7,%xmm6
    1a7a:	66 0f 66 e8          	pcmpgtd %xmm0,%xmm5
    1a7e:	66 0f db e9          	pand   %xmm1,%xmm5
    1a82:	66 0f fa f5          	psubd  %xmm5,%xmm6
    1a86:	66 0f 6f ce          	movdqa %xmm6,%xmm1
    1a8a:	66 0f 72 d1 1f       	psrld  $0x1f,%xmm1
    1a8f:	66 0f 72 d6 03       	psrld  $0x3,%xmm6
    1a94:	66 0f fe f1          	paddd  %xmm1,%xmm6
    1a98:	66 0f 70 ce f5       	pshufd $0xf5,%xmm6,%xmm1
    1a9d:	66 41 0f f4 f1       	pmuludq %xmm9,%xmm6
    1aa2:	66 0f 70 ee e8       	pshufd $0xe8,%xmm6,%xmm5
    1aa7:	66 41 0f f4 c9       	pmuludq %xmm9,%xmm1
    1aac:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    1ab1:	66 0f 62 e9          	punpckldq %xmm1,%xmm5
    1ab5:	66 0f fa c5          	psubd  %xmm5,%xmm0
    1ab9:	66 0f 6f 0d 9f 05 00 	movdqa 0x59f(%rip),%xmm1        # 2060 <_IO_stdin_used+0x60>
    1ac0:	00 
    1ac1:	66 0f db c1          	pand   %xmm1,%xmm0
    1ac5:	66 0f db e1          	pand   %xmm1,%xmm4
    1ac9:	66 0f 67 e0          	packuswb %xmm0,%xmm4
    1acd:	66 0f db d9          	pand   %xmm1,%xmm3
    1ad1:	66 0f db d1          	pand   %xmm1,%xmm2
    1ad5:	66 0f 67 d3          	packuswb %xmm3,%xmm2
    1ad9:	66 0f 67 d4          	packuswb %xmm4,%xmm2
    1add:	66 0f fc 15 8b 05 00 	paddb  0x58b(%rip),%xmm2        # 2070 <_IO_stdin_used+0x70>
    1ae4:	00 
    1ae5:	f3 0f 7f 14 33       	movdqu %xmm2,(%rbx,%rsi,1)
    1aea:	48 39 d0             	cmp    %rdx,%rax
    1aed:	74 50                	je     1b3f <func0+0x83f>
    1aef:	a8 08                	test   $0x8,%al
    1af1:	0f 85 4a f8 ff ff    	jne    1341 <func0+0x41>
    1af7:	eb 0e                	jmp    1b07 <func0+0x807>
    1af9:	31 f6                	xor    %esi,%esi
    1afb:	40 f6 c5 01          	test   $0x1,%bpl
    1aff:	0f 85 d6 fd ff ff    	jne    18db <func0+0x5db>
    1b05:	eb e3                	jmp    1aea <func0+0x7ea>
    1b07:	0f be 34 13          	movsbl (%rbx,%rdx,1),%esi
    1b0b:	01 ce                	add    %ecx,%esi
    1b0d:	48 63 f6             	movslq %esi,%rsi
    1b10:	48 69 fe 4f ec c4 4e 	imul   $0x4ec4ec4f,%rsi,%rdi
    1b17:	48 89 fd             	mov    %rdi,%rbp
    1b1a:	48 c1 ed 3f          	shr    $0x3f,%rbp
    1b1e:	48 c1 ff 23          	sar    $0x23,%rdi
    1b22:	01 ef                	add    %ebp,%edi
    1b24:	8d 2c bf             	lea    (%rdi,%rdi,4),%ebp
    1b27:	8d 6c ad 00          	lea    0x0(%rbp,%rbp,4),%ebp
    1b2b:	01 fd                	add    %edi,%ebp
    1b2d:	29 ee                	sub    %ebp,%esi
    1b2f:	40 80 c6 61          	add    $0x61,%sil
    1b33:	40 88 34 13          	mov    %sil,(%rbx,%rdx,1)
    1b37:	48 ff c2             	inc    %rdx
    1b3a:	48 39 d0             	cmp    %rdx,%rax
    1b3d:	75 c8                	jne    1b07 <func0+0x807>
    1b3f:	48 83 c4 08          	add    $0x8,%rsp
    1b43:	5b                   	pop    %rbx
    1b44:	5d                   	pop    %rbp
    1b45:	c3                   	ret    

