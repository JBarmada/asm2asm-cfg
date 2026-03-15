0000000000001280 <func0>:
    1280:	41 57                	push   %r15
    1282:	41 56                	push   %r14
    1284:	41 54                	push   %r12
    1286:	53                   	push   %rbx
    1287:	50                   	push   %rax
    1288:	49 89 f6             	mov    %rsi,%r14
    128b:	48 89 fb             	mov    %rdi,%rbx
    128e:	e8 ad fd ff ff       	call   1040 <strlen@plt>
    1293:	49 89 c4             	mov    %rax,%r12
    1296:	4c 89 f7             	mov    %r14,%rdi
    1299:	e8 a2 fd ff ff       	call   1040 <strlen@plt>
    129e:	49 89 c7             	mov    %rax,%r15
    12a1:	45 39 fc             	cmp    %r15d,%r12d
    12a4:	45 0f 4c fc          	cmovl  %r12d,%r15d
    12a8:	41 8d 47 01          	lea    0x1(%r15),%eax
    12ac:	48 63 f8             	movslq %eax,%rdi
    12af:	e8 bc fd ff ff       	call   1070 <malloc@plt>
    12b4:	48 85 c0             	test   %rax,%rax
    12b7:	0f 84 83 01 00 00    	je     1440 <func0+0x1c0>
    12bd:	45 85 ff             	test   %r15d,%r15d
    12c0:	0f 8e 73 01 00 00    	jle    1439 <func0+0x1b9>
    12c6:	45 89 f9             	mov    %r15d,%r9d
    12c9:	41 83 ff 08          	cmp    $0x8,%r15d
    12cd:	73 07                	jae    12d6 <func0+0x56>
    12cf:	31 d2                	xor    %edx,%edx
    12d1:	e9 4a 01 00 00       	jmp    1420 <func0+0x1a0>
    12d6:	41 83 ff 20          	cmp    $0x20,%r15d
    12da:	73 07                	jae    12e3 <func0+0x63>
    12dc:	31 d2                	xor    %edx,%edx
    12de:	e9 fc 00 00 00       	jmp    13df <func0+0x15f>
    12e3:	44 89 ca             	mov    %r9d,%edx
    12e6:	83 e2 e0             	and    $0xffffffe0,%edx
    12e9:	48 8d 72 e0          	lea    -0x20(%rdx),%rsi
    12ed:	49 89 f0             	mov    %rsi,%r8
    12f0:	49 c1 e8 05          	shr    $0x5,%r8
    12f4:	49 ff c0             	inc    %r8
    12f7:	48 85 f6             	test   %rsi,%rsi
    12fa:	0f 84 4c 01 00 00    	je     144c <func0+0x1cc>
    1300:	4c 89 c7             	mov    %r8,%rdi
    1303:	48 83 e7 fe          	and    $0xfffffffffffffffe,%rdi
    1307:	31 f6                	xor    %esi,%esi
    1309:	66 0f 6f 05 8f 0d 00 	movdqa 0xd8f(%rip),%xmm0        # 20a0 <_IO_stdin_used+0xa0>
    1310:	00 
    1311:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1318:	0f 1f 84 00 00 00 00 
    131f:	00 
    1320:	f3 0f 6f 0c 33       	movdqu (%rbx,%rsi,1),%xmm1
    1325:	f3 0f 6f 54 33 10    	movdqu 0x10(%rbx,%rsi,1),%xmm2
    132b:	f3 41 0f 6f 1c 36    	movdqu (%r14,%rsi,1),%xmm3
    1331:	66 0f 74 d9          	pcmpeqb %xmm1,%xmm3
    1335:	f3 41 0f 6f 4c 36 10 	movdqu 0x10(%r14,%rsi,1),%xmm1
    133c:	66 0f 74 ca          	pcmpeqb %xmm2,%xmm1
    1340:	66 0f fc d8          	paddb  %xmm0,%xmm3
    1344:	66 0f fc c8          	paddb  %xmm0,%xmm1
    1348:	f3 0f 7f 1c 30       	movdqu %xmm3,(%rax,%rsi,1)
    134d:	f3 0f 7f 4c 30 10    	movdqu %xmm1,0x10(%rax,%rsi,1)
    1353:	f3 0f 6f 4c 33 20    	movdqu 0x20(%rbx,%rsi,1),%xmm1
    1359:	f3 0f 6f 54 33 30    	movdqu 0x30(%rbx,%rsi,1),%xmm2
    135f:	f3 41 0f 6f 5c 36 20 	movdqu 0x20(%r14,%rsi,1),%xmm3
    1366:	66 0f 74 d9          	pcmpeqb %xmm1,%xmm3
    136a:	f3 41 0f 6f 4c 36 30 	movdqu 0x30(%r14,%rsi,1),%xmm1
    1371:	66 0f 74 ca          	pcmpeqb %xmm2,%xmm1
    1375:	66 0f fc d8          	paddb  %xmm0,%xmm3
    1379:	66 0f fc c8          	paddb  %xmm0,%xmm1
    137d:	f3 0f 7f 5c 30 20    	movdqu %xmm3,0x20(%rax,%rsi,1)
    1383:	f3 0f 7f 4c 30 30    	movdqu %xmm1,0x30(%rax,%rsi,1)
    1389:	48 83 c6 40          	add    $0x40,%rsi
    138d:	48 83 c7 fe          	add    $0xfffffffffffffffe,%rdi
    1391:	75 8d                	jne    1320 <func0+0xa0>
    1393:	41 f6 c0 01          	test   $0x1,%r8b
    1397:	74 3b                	je     13d4 <func0+0x154>
    1399:	f3 0f 6f 04 33       	movdqu (%rbx,%rsi,1),%xmm0
    139e:	f3 0f 6f 4c 33 10    	movdqu 0x10(%rbx,%rsi,1),%xmm1
    13a4:	f3 41 0f 6f 14 36    	movdqu (%r14,%rsi,1),%xmm2
    13aa:	66 0f 74 d0          	pcmpeqb %xmm0,%xmm2
    13ae:	f3 41 0f 6f 44 36 10 	movdqu 0x10(%r14,%rsi,1),%xmm0
    13b5:	66 0f 74 c1          	pcmpeqb %xmm1,%xmm0
    13b9:	66 0f 6f 0d df 0c 00 	movdqa 0xcdf(%rip),%xmm1        # 20a0 <_IO_stdin_used+0xa0>
    13c0:	00 
    13c1:	66 0f fc d1          	paddb  %xmm1,%xmm2
    13c5:	66 0f fc c1          	paddb  %xmm1,%xmm0
    13c9:	f3 0f 7f 14 30       	movdqu %xmm2,(%rax,%rsi,1)
    13ce:	f3 0f 7f 44 30 10    	movdqu %xmm0,0x10(%rax,%rsi,1)
    13d4:	4c 39 ca             	cmp    %r9,%rdx
    13d7:	74 60                	je     1439 <func0+0x1b9>
    13d9:	41 f6 c1 18          	test   $0x18,%r9b
    13dd:	74 41                	je     1420 <func0+0x1a0>
    13df:	48 89 d6             	mov    %rdx,%rsi
    13e2:	44 89 ca             	mov    %r9d,%edx
    13e5:	83 e2 f8             	and    $0xfffffff8,%edx
    13e8:	66 0f 6f 05 c0 0c 00 	movdqa 0xcc0(%rip),%xmm0        # 20b0 <_IO_stdin_used+0xb0>
    13ef:	00 
    13f0:	f3 0f 7e 0c 33       	movq   (%rbx,%rsi,1),%xmm1
    13f5:	f3 41 0f 7e 14 36    	movq   (%r14,%rsi,1),%xmm2
    13fb:	66 0f 74 d1          	pcmpeqb %xmm1,%xmm2
    13ff:	66 0f fc d0          	paddb  %xmm0,%xmm2
    1403:	66 0f d6 14 30       	movq   %xmm2,(%rax,%rsi,1)
    1408:	48 83 c6 08          	add    $0x8,%rsi
    140c:	48 39 f2             	cmp    %rsi,%rdx
    140f:	75 df                	jne    13f0 <func0+0x170>
    1411:	4c 39 ca             	cmp    %r9,%rdx
    1414:	74 23                	je     1439 <func0+0x1b9>
    1416:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    141d:	00 00 00 
    1420:	0f b6 0c 13          	movzbl (%rbx,%rdx,1),%ecx
    1424:	41 3a 0c 16          	cmp    (%r14,%rdx,1),%cl
    1428:	0f 94 c1             	sete   %cl
    142b:	80 f1 31             	xor    $0x31,%cl
    142e:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    1431:	48 ff c2             	inc    %rdx
    1434:	49 39 d1             	cmp    %rdx,%r9
    1437:	75 e7                	jne    1420 <func0+0x1a0>
    1439:	49 63 cf             	movslq %r15d,%rcx
    143c:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    1440:	48 83 c4 08          	add    $0x8,%rsp
    1444:	5b                   	pop    %rbx
    1445:	41 5c                	pop    %r12
    1447:	41 5e                	pop    %r14
    1449:	41 5f                	pop    %r15
    144b:	c3                   	ret    
    144c:	31 f6                	xor    %esi,%esi
    144e:	41 f6 c0 01          	test   $0x1,%r8b
    1452:	0f 85 41 ff ff ff    	jne    1399 <func0+0x119>
    1458:	e9 77 ff ff ff       	jmp    13d4 <func0+0x154>

