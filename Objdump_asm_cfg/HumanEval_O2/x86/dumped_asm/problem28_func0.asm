0000000000001230 <func0>:
    1230:	41 56                	push   %r14
    1232:	53                   	push   %rbx
    1233:	50                   	push   %rax
    1234:	49 89 f6             	mov    %rsi,%r14
    1237:	48 89 fb             	mov    %rdi,%rbx
    123a:	e8 f1 fd ff ff       	call   1030 <strlen@plt>
    123f:	85 c0                	test   %eax,%eax
    1241:	0f 8e 05 02 00 00    	jle    144c <func0+0x21c>
    1247:	41 89 c0             	mov    %eax,%r8d
    124a:	31 d2                	xor    %edx,%edx
    124c:	49 83 f8 08          	cmp    $0x8,%r8
    1250:	0f 82 2a 02 00 00    	jb     1480 <func0+0x250>
    1256:	4c 89 f6             	mov    %r14,%rsi
    1259:	48 29 de             	sub    %rbx,%rsi
    125c:	48 83 fe 20          	cmp    $0x20,%rsi
    1260:	0f 82 1a 02 00 00    	jb     1480 <func0+0x250>
    1266:	41 83 f8 20          	cmp    $0x20,%r8d
    126a:	73 07                	jae    1273 <func0+0x43>
    126c:	31 d2                	xor    %edx,%edx
    126e:	e9 28 01 00 00       	jmp    139b <func0+0x16b>
    1273:	89 c6                	mov    %eax,%esi
    1275:	83 e6 1f             	and    $0x1f,%esi
    1278:	4c 89 c2             	mov    %r8,%rdx
    127b:	48 29 f2             	sub    %rsi,%rdx
    127e:	31 ff                	xor    %edi,%edi
    1280:	66 44 0f 6f 05 77 0e 	movdqa 0xe77(%rip),%xmm8        # 2100 <_IO_stdin_used+0x100>
    1287:	00 00 
    1289:	66 44 0f 6f 0d 7e 0e 	movdqa 0xe7e(%rip),%xmm9        # 2110 <_IO_stdin_used+0x110>
    1290:	00 00 
    1292:	66 44 0f 6f 15 85 0e 	movdqa 0xe85(%rip),%xmm10        # 2120 <_IO_stdin_used+0x120>
    1299:	00 00 
    129b:	66 44 0f 6f 1d 8c 0e 	movdqa 0xe8c(%rip),%xmm11        # 2130 <_IO_stdin_used+0x130>
    12a2:	00 00 
    12a4:	66 44 0f 6f 25 93 0e 	movdqa 0xe93(%rip),%xmm12        # 2140 <_IO_stdin_used+0x140>
    12ab:	00 00 
    12ad:	66 44 0f 6f 2d 9a 0e 	movdqa 0xe9a(%rip),%xmm13        # 2150 <_IO_stdin_used+0x150>
    12b4:	00 00 
    12b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    12bd:	00 00 00 
    12c0:	f3 0f 6f 0c 3b       	movdqu (%rbx,%rdi,1),%xmm1
    12c5:	f3 0f 6f 6c 3b 10    	movdqu 0x10(%rbx,%rdi,1),%xmm5
    12cb:	66 0f 6f c1          	movdqa %xmm1,%xmm0
    12cf:	66 41 0f fc c0       	paddb  %xmm8,%xmm0
    12d4:	66 0f 6f f0          	movdqa %xmm0,%xmm6
    12d8:	66 41 0f da f1       	pminub %xmm9,%xmm6
    12dd:	66 0f 74 f0          	pcmpeqb %xmm0,%xmm6
    12e1:	66 0f 6f d5          	movdqa %xmm5,%xmm2
    12e5:	66 41 0f fc d0       	paddb  %xmm8,%xmm2
    12ea:	66 0f 6f c2          	movdqa %xmm2,%xmm0
    12ee:	66 41 0f da c1       	pminub %xmm9,%xmm0
    12f3:	66 0f 74 c2          	pcmpeqb %xmm2,%xmm0
    12f7:	66 0f 6f d1          	movdqa %xmm1,%xmm2
    12fb:	66 41 0f fc d2       	paddb  %xmm10,%xmm2
    1300:	66 0f 6f fd          	movdqa %xmm5,%xmm7
    1304:	66 41 0f fc fa       	paddb  %xmm10,%xmm7
    1309:	66 0f 6f da          	movdqa %xmm2,%xmm3
    130d:	66 41 0f da db       	pminub %xmm11,%xmm3
    1312:	66 0f 74 da          	pcmpeqb %xmm2,%xmm3
    1316:	66 0f 6f d7          	movdqa %xmm7,%xmm2
    131a:	66 41 0f da d3       	pminub %xmm11,%xmm2
    131f:	66 0f 74 d7          	pcmpeqb %xmm7,%xmm2
    1323:	66 0f 6f f9          	movdqa %xmm1,%xmm7
    1327:	66 41 0f fc fc       	paddb  %xmm12,%xmm7
    132c:	66 0f 6f e5          	movdqa %xmm5,%xmm4
    1330:	66 41 0f fc e4       	paddb  %xmm12,%xmm4
    1335:	66 0f db fb          	pand   %xmm3,%xmm7
    1339:	66 0f df d9          	pandn  %xmm1,%xmm3
    133d:	66 0f eb df          	por    %xmm7,%xmm3
    1341:	66 0f db e2          	pand   %xmm2,%xmm4
    1345:	66 0f df d5          	pandn  %xmm5,%xmm2
    1349:	66 0f eb d4          	por    %xmm4,%xmm2
    134d:	66 41 0f fc cd       	paddb  %xmm13,%xmm1
    1352:	66 41 0f fc ed       	paddb  %xmm13,%xmm5
    1357:	66 0f db de          	pand   %xmm6,%xmm3
    135b:	66 0f df f1          	pandn  %xmm1,%xmm6
    135f:	66 0f eb f3          	por    %xmm3,%xmm6
    1363:	66 0f db d0          	pand   %xmm0,%xmm2
    1367:	66 0f df c5          	pandn  %xmm5,%xmm0
    136b:	66 0f eb c2          	por    %xmm2,%xmm0
    136f:	f3 41 0f 7f 34 3e    	movdqu %xmm6,(%r14,%rdi,1)
    1375:	f3 41 0f 7f 44 3e 10 	movdqu %xmm0,0x10(%r14,%rdi,1)
    137c:	48 83 c7 20          	add    $0x20,%rdi
    1380:	48 39 fa             	cmp    %rdi,%rdx
    1383:	0f 85 37 ff ff ff    	jne    12c0 <func0+0x90>
    1389:	48 85 f6             	test   %rsi,%rsi
    138c:	0f 84 ba 00 00 00    	je     144c <func0+0x21c>
    1392:	83 fe 08             	cmp    $0x8,%esi
    1395:	0f 82 e5 00 00 00    	jb     1480 <func0+0x250>
    139b:	48 89 d6             	mov    %rdx,%rsi
    139e:	89 c7                	mov    %eax,%edi
    13a0:	83 e7 07             	and    $0x7,%edi
    13a3:	4c 89 c2             	mov    %r8,%rdx
    13a6:	48 29 fa             	sub    %rdi,%rdx
    13a9:	66 44 0f 6f 05 ae 0d 	movdqa 0xdae(%rip),%xmm8        # 2160 <_IO_stdin_used+0x160>
    13b0:	00 00 
    13b2:	66 44 0f 6f 0d b5 0d 	movdqa 0xdb5(%rip),%xmm9        # 2170 <_IO_stdin_used+0x170>
    13b9:	00 00 
    13bb:	66 44 0f 6f 15 bc 0d 	movdqa 0xdbc(%rip),%xmm10        # 2180 <_IO_stdin_used+0x180>
    13c2:	00 00 
    13c4:	66 0f 6f 1d c4 0d 00 	movdqa 0xdc4(%rip),%xmm3        # 2190 <_IO_stdin_used+0x190>
    13cb:	00 
    13cc:	66 0f 6f 25 cc 0d 00 	movdqa 0xdcc(%rip),%xmm4        # 21a0 <_IO_stdin_used+0x1a0>
    13d3:	00 
    13d4:	66 0f 6f 2d d4 0d 00 	movdqa 0xdd4(%rip),%xmm5        # 21b0 <_IO_stdin_used+0x1b0>
    13db:	00 
    13dc:	0f 1f 40 00          	nopl   0x0(%rax)
    13e0:	f3 0f 7e 34 33       	movq   (%rbx,%rsi,1),%xmm6
    13e5:	66 0f 6f fe          	movdqa %xmm6,%xmm7
    13e9:	66 41 0f fc f8       	paddb  %xmm8,%xmm7
    13ee:	66 0f 6f c7          	movdqa %xmm7,%xmm0
    13f2:	66 41 0f de c1       	pmaxub %xmm9,%xmm0
    13f7:	66 0f 74 c7          	pcmpeqb %xmm7,%xmm0
    13fb:	66 0f 6f ce          	movdqa %xmm6,%xmm1
    13ff:	66 41 0f fc ca       	paddb  %xmm10,%xmm1
    1404:	66 0f 6f f9          	movdqa %xmm1,%xmm7
    1408:	66 0f de fb          	pmaxub %xmm3,%xmm7
    140c:	66 0f 74 f9          	pcmpeqb %xmm1,%xmm7
    1410:	66 0f 6f ce          	movdqa %xmm6,%xmm1
    1414:	66 0f fc cc          	paddb  %xmm4,%xmm1
    1418:	66 0f 6f d7          	movdqa %xmm7,%xmm2
    141c:	66 0f db d6          	pand   %xmm6,%xmm2
    1420:	66 0f df f9          	pandn  %xmm1,%xmm7
    1424:	66 0f eb fa          	por    %xmm2,%xmm7
    1428:	66 0f fc f5          	paddb  %xmm5,%xmm6
    142c:	66 0f db f0          	pand   %xmm0,%xmm6
    1430:	66 0f df c7          	pandn  %xmm7,%xmm0
    1434:	66 0f eb f0          	por    %xmm0,%xmm6
    1438:	66 41 0f d6 34 36    	movq   %xmm6,(%r14,%rsi,1)
    143e:	48 83 c6 08          	add    $0x8,%rsi
    1442:	48 39 f2             	cmp    %rsi,%rdx
    1445:	75 99                	jne    13e0 <func0+0x1b0>
    1447:	48 85 ff             	test   %rdi,%rdi
    144a:	75 34                	jne    1480 <func0+0x250>
    144c:	48 98                	cltq   
    144e:	41 c6 04 06 00       	movb   $0x0,(%r14,%rax,1)
    1453:	48 83 c4 08          	add    $0x8,%rsp
    1457:	5b                   	pop    %rbx
    1458:	41 5e                	pop    %r14
    145a:	c3                   	ret    
    145b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1460:	8d 7e bf             	lea    -0x41(%rsi),%edi
    1463:	8d 4e 20             	lea    0x20(%rsi),%ecx
    1466:	40 80 ff 1a          	cmp    $0x1a,%dil
    146a:	40 0f b6 fe          	movzbl %sil,%edi
    146e:	0f b6 f1             	movzbl %cl,%esi
    1471:	0f 43 f7             	cmovae %edi,%esi
    1474:	41 88 34 16          	mov    %sil,(%r14,%rdx,1)
    1478:	48 ff c2             	inc    %rdx
    147b:	49 39 d0             	cmp    %rdx,%r8
    147e:	74 cc                	je     144c <func0+0x21c>
    1480:	0f b6 34 13          	movzbl (%rbx,%rdx,1),%esi
    1484:	8d 7e 9f             	lea    -0x61(%rsi),%edi
    1487:	40 80 ff 19          	cmp    $0x19,%dil
    148b:	77 d3                	ja     1460 <func0+0x230>
    148d:	40 80 c6 e0          	add    $0xe0,%sil
    1491:	eb e1                	jmp    1474 <func0+0x244>

