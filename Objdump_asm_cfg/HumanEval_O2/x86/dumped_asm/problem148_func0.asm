0000000000001230 <func0>:
    1230:	55                   	push   %rbp
    1231:	41 57                	push   %r15
    1233:	41 56                	push   %r14
    1235:	41 55                	push   %r13
    1237:	41 54                	push   %r12
    1239:	53                   	push   %rbx
    123a:	48 83 ec 18          	sub    $0x18,%rsp
    123e:	89 fb                	mov    %edi,%ebx
    1240:	48 63 ef             	movslq %edi,%rbp
    1243:	48 8d 3c ad 00 00 00 	lea    0x0(,%rbp,4),%rdi
    124a:	00 
    124b:	e8 10 fe ff ff       	call   1060 <malloc@plt>
    1250:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    1255:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    125a:	44 8d 65 01          	lea    0x1(%rbp),%r12d
    125e:	4d 63 fc             	movslq %r12d,%r15
    1261:	49 c1 e7 03          	shl    $0x3,%r15
    1265:	4c 89 ff             	mov    %r15,%rdi
    1268:	e8 f3 fd ff ff       	call   1060 <malloc@plt>
    126d:	49 89 c6             	mov    %rax,%r14
    1270:	4c 89 ff             	mov    %r15,%rdi
    1273:	e8 e8 fd ff ff       	call   1060 <malloc@plt>
    1278:	49 89 c7             	mov    %rax,%r15
    127b:	45 31 ed             	xor    %r13d,%r13d
    127e:	66 90                	xchg   %ax,%ax
    1280:	bf 03 00 00 00       	mov    $0x3,%edi
    1285:	be 04 00 00 00       	mov    $0x4,%esi
    128a:	e8 c1 fd ff ff       	call   1050 <calloc@plt>
    128f:	4b 89 04 ee          	mov    %rax,(%r14,%r13,8)
    1293:	bf 03 00 00 00       	mov    $0x3,%edi
    1298:	be 04 00 00 00       	mov    $0x4,%esi
    129d:	e8 ae fd ff ff       	call   1050 <calloc@plt>
    12a2:	4b 89 04 ef          	mov    %rax,(%r15,%r13,8)
    12a6:	49 ff c5             	inc    %r13
    12a9:	4d 39 ec             	cmp    %r13,%r12
    12ac:	75 d2                	jne    1280 <func0+0x50>
    12ae:	49 8b 06             	mov    (%r14),%rax
    12b1:	4d 8b 0f             	mov    (%r15),%r9
    12b4:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
    12bb:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    12c2:	41 c7 41 08 00 00 00 	movl   $0x0,0x8(%r9)
    12c9:	00 
    12ca:	49 c7 01 00 00 00 00 	movq   $0x0,(%r9)
    12d1:	41 89 db             	mov    %ebx,%r11d
    12d4:	85 db                	test   %ebx,%ebx
    12d6:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
    12db:	0f 8e 26 01 00 00    	jle    1407 <func0+0x1d7>
    12e1:	ba 01 00 00 00       	mov    $0x1,%edx
    12e6:	31 f6                	xor    %esi,%esi
    12e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    12ef:	00 
    12f0:	89 d7                	mov    %edx,%edi
    12f2:	0f af fa             	imul   %edx,%edi
    12f5:	01 f7                	add    %esi,%edi
    12f7:	48 63 ff             	movslq %edi,%rdi
    12fa:	48 69 ef 56 55 55 55 	imul   $0x55555556,%rdi,%rbp
    1301:	48 89 eb             	mov    %rbp,%rbx
    1304:	48 c1 eb 3f          	shr    $0x3f,%rbx
    1308:	48 c1 ed 20          	shr    $0x20,%rbp
    130c:	01 dd                	add    %ebx,%ebp
    130e:	8d 6c 6d 00          	lea    0x0(%rbp,%rbp,2),%ebp
    1312:	29 ef                	sub    %ebp,%edi
    1314:	41 89 7c 92 fc       	mov    %edi,-0x4(%r10,%rdx,4)
    1319:	49 8b 0c d6          	mov    (%r14,%rdx,8),%rcx
    131d:	8b 28                	mov    (%rax),%ebp
    131f:	89 29                	mov    %ebp,(%rcx)
    1321:	8b 68 04             	mov    0x4(%rax),%ebp
    1324:	89 69 04             	mov    %ebp,0x4(%rcx)
    1327:	8b 40 08             	mov    0x8(%rax),%eax
    132a:	89 41 08             	mov    %eax,0x8(%rcx)
    132d:	48 63 c7             	movslq %edi,%rax
    1330:	ff 04 81             	incl   (%rcx,%rax,4)
    1333:	48 ff c2             	inc    %rdx
    1336:	ff ce                	dec    %esi
    1338:	48 89 c8             	mov    %rcx,%rax
    133b:	49 39 d4             	cmp    %rdx,%r12
    133e:	75 b0                	jne    12f0 <func0+0xc0>
    1340:	45 85 db             	test   %r11d,%r11d
    1343:	0f 8e be 00 00 00    	jle    1407 <func0+0x1d7>
    1349:	4d 8d 44 24 ff       	lea    -0x1(%r12),%r8
    134e:	31 d2                	xor    %edx,%edx
    1350:	4c 89 c9             	mov    %r9,%rcx
    1353:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    135a:	84 00 00 00 00 00 
    1360:	49 8b 74 d7 08       	mov    0x8(%r15,%rdx,8),%rsi
    1365:	8b 01                	mov    (%rcx),%eax
    1367:	89 06                	mov    %eax,(%rsi)
    1369:	8b 41 04             	mov    0x4(%rcx),%eax
    136c:	89 46 04             	mov    %eax,0x4(%rsi)
    136f:	8b 41 08             	mov    0x8(%rcx),%eax
    1372:	89 46 08             	mov    %eax,0x8(%rsi)
    1375:	49 8b 3c d6          	mov    (%r14,%rdx,8),%rdi
    1379:	49 63 0c 92          	movslq (%r10,%rdx,4),%rcx
    137d:	48 69 c1 56 55 55 55 	imul   $0x55555556,%rcx,%rax
    1384:	48 89 c5             	mov    %rax,%rbp
    1387:	48 c1 ed 3f          	shr    $0x3f,%rbp
    138b:	48 c1 e8 20          	shr    $0x20,%rax
    138f:	01 e8                	add    %ebp,%eax
    1391:	8d 04 40             	lea    (%rax,%rax,2),%eax
    1394:	8d 69 01             	lea    0x1(%rcx),%ebp
    1397:	48 63 ed             	movslq %ebp,%rbp
    139a:	48 69 ed 56 55 55 55 	imul   $0x55555556,%rbp,%rbp
    13a1:	48 89 eb             	mov    %rbp,%rbx
    13a4:	48 c1 eb 3f          	shr    $0x3f,%rbx
    13a8:	48 c1 ed 20          	shr    $0x20,%rbp
    13ac:	01 dd                	add    %ebx,%ebp
    13ae:	8d 6c 6d 00          	lea    0x0(%rbp,%rbp,2),%ebp
    13b2:	f7 dd                	neg    %ebp
    13b4:	01 cd                	add    %ecx,%ebp
    13b6:	ff c5                	inc    %ebp
    13b8:	89 cb                	mov    %ecx,%ebx
    13ba:	29 c3                	sub    %eax,%ebx
    13bc:	8b 07                	mov    (%rdi),%eax
    13be:	48 63 db             	movslq %ebx,%rbx
    13c1:	01 04 9e             	add    %eax,(%rsi,%rbx,4)
    13c4:	8d 41 02             	lea    0x2(%rcx),%eax
    13c7:	48 98                	cltq   
    13c9:	48 69 c0 56 55 55 55 	imul   $0x55555556,%rax,%rax
    13d0:	48 89 c3             	mov    %rax,%rbx
    13d3:	48 c1 eb 3f          	shr    $0x3f,%rbx
    13d7:	48 c1 e8 20          	shr    $0x20,%rax
    13db:	01 d8                	add    %ebx,%eax
    13dd:	8d 04 40             	lea    (%rax,%rax,2),%eax
    13e0:	f7 d8                	neg    %eax
    13e2:	01 c8                	add    %ecx,%eax
    13e4:	83 c0 02             	add    $0x2,%eax
    13e7:	8b 4f 04             	mov    0x4(%rdi),%ecx
    13ea:	48 63 ed             	movslq %ebp,%rbp
    13ed:	01 0c ae             	add    %ecx,(%rsi,%rbp,4)
    13f0:	8b 4f 08             	mov    0x8(%rdi),%ecx
    13f3:	48 98                	cltq   
    13f5:	01 0c 86             	add    %ecx,(%rsi,%rax,4)
    13f8:	48 ff c2             	inc    %rdx
    13fb:	48 89 f1             	mov    %rsi,%rcx
    13fe:	49 39 d0             	cmp    %rdx,%r8
    1401:	0f 85 59 ff ff ff    	jne    1360 <func0+0x130>
    1407:	45 85 db             	test   %r11d,%r11d
    140a:	0f 88 a5 00 00 00    	js     14b5 <func0+0x285>
    1410:	0f 84 8e 02 00 00    	je     16a4 <func0+0x474>
    1416:	44 89 e2             	mov    %r12d,%edx
    1419:	83 e2 fe             	and    $0xfffffffe,%edx
    141c:	31 c9                	xor    %ecx,%ecx
    141e:	66 90                	xchg   %ax,%ax
    1420:	49 8b 04 cf          	mov    (%r15,%rcx,8),%rax
    1424:	49 8b 34 ce          	mov    (%r14,%rcx,8),%rsi
    1428:	8b 38                	mov    (%rax),%edi
    142a:	89 3e                	mov    %edi,(%rsi)
    142c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    1432:	8b 78 04             	mov    0x4(%rax),%edi
    1435:	89 7e 04             	mov    %edi,0x4(%rsi)
    1438:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
    143f:	8b 78 08             	mov    0x8(%rax),%edi
    1442:	89 7e 08             	mov    %edi,0x8(%rsi)
    1445:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
    144c:	49 8b 44 cf 08       	mov    0x8(%r15,%rcx,8),%rax
    1451:	49 8b 74 ce 08       	mov    0x8(%r14,%rcx,8),%rsi
    1456:	8b 38                	mov    (%rax),%edi
    1458:	89 3e                	mov    %edi,(%rsi)
    145a:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    1460:	8b 78 04             	mov    0x4(%rax),%edi
    1463:	89 7e 04             	mov    %edi,0x4(%rsi)
    1466:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
    146d:	8b 78 08             	mov    0x8(%rax),%edi
    1470:	89 7e 08             	mov    %edi,0x8(%rsi)
    1473:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
    147a:	48 83 c1 02          	add    $0x2,%rcx
    147e:	48 39 ca             	cmp    %rcx,%rdx
    1481:	75 9d                	jne    1420 <func0+0x1f0>
    1483:	41 f6 c4 01          	test   $0x1,%r12b
    1487:	74 2c                	je     14b5 <func0+0x285>
    1489:	49 8b 04 cf          	mov    (%r15,%rcx,8),%rax
    148d:	49 8b 0c ce          	mov    (%r14,%rcx,8),%rcx
    1491:	8b 10                	mov    (%rax),%edx
    1493:	89 11                	mov    %edx,(%rcx)
    1495:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    149b:	8b 50 04             	mov    0x4(%rax),%edx
    149e:	89 51 04             	mov    %edx,0x4(%rcx)
    14a1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
    14a8:	8b 50 08             	mov    0x8(%rax),%edx
    14ab:	89 51 08             	mov    %edx,0x8(%rcx)
    14ae:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
    14b5:	45 85 db             	test   %r11d,%r11d
    14b8:	0f 8e bf 00 00 00    	jle    157d <func0+0x34d>
    14be:	4d 8d 44 24 ff       	lea    -0x1(%r12),%r8
    14c3:	31 d2                	xor    %edx,%edx
    14c5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    14cc:	00 00 00 00 
    14d0:	49 8b 74 d7 08       	mov    0x8(%r15,%rdx,8),%rsi
    14d5:	41 8b 01             	mov    (%r9),%eax
    14d8:	89 06                	mov    %eax,(%rsi)
    14da:	41 8b 41 04          	mov    0x4(%r9),%eax
    14de:	89 46 04             	mov    %eax,0x4(%rsi)
    14e1:	41 8b 41 08          	mov    0x8(%r9),%eax
    14e5:	89 46 08             	mov    %eax,0x8(%rsi)
    14e8:	49 8b 04 d6          	mov    (%r14,%rdx,8),%rax
    14ec:	49 63 3c 92          	movslq (%r10,%rdx,4),%rdi
    14f0:	48 69 ef 56 55 55 55 	imul   $0x55555556,%rdi,%rbp
    14f7:	48 89 eb             	mov    %rbp,%rbx
    14fa:	48 c1 eb 3f          	shr    $0x3f,%rbx
    14fe:	48 c1 ed 20          	shr    $0x20,%rbp
    1502:	01 dd                	add    %ebx,%ebp
    1504:	8d 6c 6d 00          	lea    0x0(%rbp,%rbp,2),%ebp
    1508:	8d 5f 01             	lea    0x1(%rdi),%ebx
    150b:	48 63 db             	movslq %ebx,%rbx
    150e:	48 69 db 56 55 55 55 	imul   $0x55555556,%rbx,%rbx
    1515:	48 89 d9             	mov    %rbx,%rcx
    1518:	48 c1 e9 3f          	shr    $0x3f,%rcx
    151c:	48 c1 eb 20          	shr    $0x20,%rbx
    1520:	01 cb                	add    %ecx,%ebx
    1522:	8d 0c 5b             	lea    (%rbx,%rbx,2),%ecx
    1525:	f7 d9                	neg    %ecx
    1527:	01 f9                	add    %edi,%ecx
    1529:	ff c1                	inc    %ecx
    152b:	89 fb                	mov    %edi,%ebx
    152d:	29 eb                	sub    %ebp,%ebx
    152f:	8b 28                	mov    (%rax),%ebp
    1531:	48 63 db             	movslq %ebx,%rbx
    1534:	01 2c 9e             	add    %ebp,(%rsi,%rbx,4)
    1537:	8d 6f 02             	lea    0x2(%rdi),%ebp
    153a:	48 63 ed             	movslq %ebp,%rbp
    153d:	48 69 ed 56 55 55 55 	imul   $0x55555556,%rbp,%rbp
    1544:	48 89 eb             	mov    %rbp,%rbx
    1547:	48 c1 eb 3f          	shr    $0x3f,%rbx
    154b:	48 c1 ed 20          	shr    $0x20,%rbp
    154f:	01 dd                	add    %ebx,%ebp
    1551:	8d 6c 6d 00          	lea    0x0(%rbp,%rbp,2),%ebp
    1555:	f7 dd                	neg    %ebp
    1557:	01 ef                	add    %ebp,%edi
    1559:	83 c7 02             	add    $0x2,%edi
    155c:	8b 68 04             	mov    0x4(%rax),%ebp
    155f:	48 63 c9             	movslq %ecx,%rcx
    1562:	01 2c 8e             	add    %ebp,(%rsi,%rcx,4)
    1565:	8b 40 08             	mov    0x8(%rax),%eax
    1568:	48 63 cf             	movslq %edi,%rcx
    156b:	01 04 8e             	add    %eax,(%rsi,%rcx,4)
    156e:	48 ff c2             	inc    %rdx
    1571:	49 89 f1             	mov    %rsi,%r9
    1574:	49 39 d0             	cmp    %rdx,%r8
    1577:	0f 85 53 ff ff ff    	jne    14d0 <func0+0x2a0>
    157d:	45 85 db             	test   %r11d,%r11d
    1580:	0f 88 e6 00 00 00    	js     166c <func0+0x43c>
    1586:	0f 84 29 01 00 00    	je     16b5 <func0+0x485>
    158c:	44 89 e1             	mov    %r12d,%ecx
    158f:	83 e1 fe             	and    $0xfffffffe,%ecx
    1592:	31 c0                	xor    %eax,%eax
    1594:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    159b:	00 00 00 00 00 
    15a0:	49 8b 14 c7          	mov    (%r15,%rax,8),%rdx
    15a4:	49 8b 34 c6          	mov    (%r14,%rax,8),%rsi
    15a8:	8b 3a                	mov    (%rdx),%edi
    15aa:	89 3e                	mov    %edi,(%rsi)
    15ac:	c7 02 00 00 00 00    	movl   $0x0,(%rdx)
    15b2:	8b 7a 04             	mov    0x4(%rdx),%edi
    15b5:	89 7e 04             	mov    %edi,0x4(%rsi)
    15b8:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%rdx)
    15bf:	8b 7a 08             	mov    0x8(%rdx),%edi
    15c2:	89 7e 08             	mov    %edi,0x8(%rsi)
    15c5:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%rdx)
    15cc:	49 8b 54 c7 08       	mov    0x8(%r15,%rax,8),%rdx
    15d1:	49 8b 74 c6 08       	mov    0x8(%r14,%rax,8),%rsi
    15d6:	8b 3a                	mov    (%rdx),%edi
    15d8:	89 3e                	mov    %edi,(%rsi)
    15da:	c7 02 00 00 00 00    	movl   $0x0,(%rdx)
    15e0:	8b 7a 04             	mov    0x4(%rdx),%edi
    15e3:	89 7e 04             	mov    %edi,0x4(%rsi)
    15e6:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%rdx)
    15ed:	8b 7a 08             	mov    0x8(%rdx),%edi
    15f0:	89 7e 08             	mov    %edi,0x8(%rsi)
    15f3:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%rdx)
    15fa:	48 83 c0 02          	add    $0x2,%rax
    15fe:	48 39 c1             	cmp    %rax,%rcx
    1601:	75 9d                	jne    15a0 <func0+0x370>
    1603:	41 f6 c4 01          	test   $0x1,%r12b
    1607:	74 2c                	je     1635 <func0+0x405>
    1609:	49 8b 0c c7          	mov    (%r15,%rax,8),%rcx
    160d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
    1611:	8b 11                	mov    (%rcx),%edx
    1613:	89 10                	mov    %edx,(%rax)
    1615:	c7 01 00 00 00 00    	movl   $0x0,(%rcx)
    161b:	8b 51 04             	mov    0x4(%rcx),%edx
    161e:	89 50 04             	mov    %edx,0x4(%rax)
    1621:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%rcx)
    1628:	8b 51 08             	mov    0x8(%rcx),%edx
    162b:	89 50 08             	mov    %edx,0x8(%rax)
    162e:	c7 41 08 00 00 00 00 	movl   $0x0,0x8(%rcx)
    1635:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    163a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
    163e:	44 8b 28             	mov    (%rax),%r13d
    1641:	45 85 db             	test   %r11d,%r11d
    1644:	78 32                	js     1678 <func0+0x448>
    1646:	31 ed                	xor    %ebp,%ebp
    1648:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    164f:	00 
    1650:	49 8b 3c ee          	mov    (%r14,%rbp,8),%rdi
    1654:	e8 d7 f9 ff ff       	call   1030 <free@plt>
    1659:	49 8b 3c ef          	mov    (%r15,%rbp,8),%rdi
    165d:	e8 ce f9 ff ff       	call   1030 <free@plt>
    1662:	48 ff c5             	inc    %rbp
    1665:	49 39 ec             	cmp    %rbp,%r12
    1668:	75 e6                	jne    1650 <func0+0x420>
    166a:	eb 0c                	jmp    1678 <func0+0x448>
    166c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1671:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
    1675:	44 8b 28             	mov    (%rax),%r13d
    1678:	4c 89 f7             	mov    %r14,%rdi
    167b:	e8 b0 f9 ff ff       	call   1030 <free@plt>
    1680:	4c 89 ff             	mov    %r15,%rdi
    1683:	e8 a8 f9 ff ff       	call   1030 <free@plt>
    1688:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    168d:	e8 9e f9 ff ff       	call   1030 <free@plt>
    1692:	44 89 e8             	mov    %r13d,%eax
    1695:	48 83 c4 18          	add    $0x18,%rsp
    1699:	5b                   	pop    %rbx
    169a:	41 5c                	pop    %r12
    169c:	41 5d                	pop    %r13
    169e:	41 5e                	pop    %r14
    16a0:	41 5f                	pop    %r15
    16a2:	5d                   	pop    %rbp
    16a3:	c3                   	ret    
    16a4:	31 c9                	xor    %ecx,%ecx
    16a6:	41 f6 c4 01          	test   $0x1,%r12b
    16aa:	0f 85 d9 fd ff ff    	jne    1489 <func0+0x259>
    16b0:	e9 00 fe ff ff       	jmp    14b5 <func0+0x285>
    16b5:	31 c0                	xor    %eax,%eax
    16b7:	41 f6 c4 01          	test   $0x1,%r12b
    16bb:	0f 85 48 ff ff ff    	jne    1609 <func0+0x3d9>
    16c1:	e9 6f ff ff ff       	jmp    1635 <func0+0x405>

