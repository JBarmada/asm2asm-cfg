0000000000001380 <func0>:
    1380:	b0 01                	mov    $0x1,%al
    1382:	83 fe 02             	cmp    $0x2,%esi
    1385:	0f 8c 29 01 00 00    	jl     14b4 <func0+0x134>
    138b:	41 89 f1             	mov    %esi,%r9d
    138e:	f3 0f 10 0f          	movss  (%rdi),%xmm1
    1392:	4d 8d 41 ff          	lea    -0x1(%r9),%r8
    1396:	49 83 f8 08          	cmp    $0x8,%r8
    139a:	73 0e                	jae    13aa <func0+0x2a>
    139c:	31 c0                	xor    %eax,%eax
    139e:	b9 01 00 00 00       	mov    $0x1,%ecx
    13a3:	31 d2                	xor    %edx,%edx
    13a5:	e9 d4 00 00 00       	jmp    147e <func0+0xfe>
    13aa:	4c 89 c6             	mov    %r8,%rsi
    13ad:	48 83 e6 f8          	and    $0xfffffffffffffff8,%rsi
    13b1:	48 8d 4e 01          	lea    0x1(%rsi),%rcx
    13b5:	0f c6 c9 00          	shufps $0x0,%xmm1,%xmm1
    13b9:	45 0f 57 c0          	xorps  %xmm8,%xmm8
    13bd:	31 c0                	xor    %eax,%eax
    13bf:	45 0f 57 c9          	xorps  %xmm9,%xmm9
    13c3:	0f 57 db             	xorps  %xmm3,%xmm3
    13c6:	0f 57 e4             	xorps  %xmm4,%xmm4
    13c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13d0:	0f 28 c1             	movaps %xmm1,%xmm0
    13d3:	0f 10 6c 87 04       	movups 0x4(%rdi,%rax,4),%xmm5
    13d8:	0f c6 c5 03          	shufps $0x3,%xmm5,%xmm0
    13dc:	0f c6 c5 98          	shufps $0x98,%xmm5,%xmm0
    13e0:	0f 28 f5             	movaps %xmm5,%xmm6
    13e3:	0f 28 d0             	movaps %xmm0,%xmm2
    13e6:	0f c2 d5 01          	cmpltps %xmm5,%xmm2
    13ea:	0f c2 e8 01          	cmpltps %xmm0,%xmm5
    13ee:	0f 10 4c 87 14       	movups 0x14(%rdi,%rax,4),%xmm1
    13f3:	0f c6 f1 03          	shufps $0x3,%xmm1,%xmm6
    13f7:	0f c6 f1 98          	shufps $0x98,%xmm1,%xmm6
    13fb:	0f 28 c1             	movaps %xmm1,%xmm0
    13fe:	0f c2 c6 01          	cmpltps %xmm6,%xmm0
    1402:	0f c2 f1 01          	cmpltps %xmm1,%xmm6
    1406:	0f 28 fa             	movaps %xmm2,%xmm7
    1409:	0f 55 fb             	andnps %xmm3,%xmm7
    140c:	0f 28 df             	movaps %xmm7,%xmm3
    140f:	66 0f fa da          	psubd  %xmm2,%xmm3
    1413:	0f 28 d6             	movaps %xmm6,%xmm2
    1416:	0f 55 d4             	andnps %xmm4,%xmm2
    1419:	0f 28 e2             	movaps %xmm2,%xmm4
    141c:	66 0f fa e6          	psubd  %xmm6,%xmm4
    1420:	0f 28 d5             	movaps %xmm5,%xmm2
    1423:	41 0f 55 d0          	andnps %xmm8,%xmm2
    1427:	44 0f 28 c2          	movaps %xmm2,%xmm8
    142b:	66 44 0f fa c5       	psubd  %xmm5,%xmm8
    1430:	0f 28 d0             	movaps %xmm0,%xmm2
    1433:	41 0f 55 d1          	andnps %xmm9,%xmm2
    1437:	44 0f 28 ca          	movaps %xmm2,%xmm9
    143b:	66 44 0f fa c8       	psubd  %xmm0,%xmm9
    1440:	48 83 c0 08          	add    $0x8,%rax
    1444:	48 39 c6             	cmp    %rax,%rsi
    1447:	75 87                	jne    13d0 <func0+0x50>
    1449:	0f 56 dc             	orps   %xmm4,%xmm3
    144c:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1450:	66 0f 76 d8          	pcmpeqd %xmm0,%xmm3
    1454:	0f 50 c3             	movmskps %xmm3,%eax
    1457:	31 d2                	xor    %edx,%edx
    1459:	83 f8 0f             	cmp    $0xf,%eax
    145c:	0f 95 c2             	setne  %dl
    145f:	45 0f 56 c1          	orps   %xmm9,%xmm8
    1463:	66 44 0f 76 c0       	pcmpeqd %xmm0,%xmm8
    1468:	45 0f 50 d0          	movmskps %xmm8,%r10d
    146c:	31 c0                	xor    %eax,%eax
    146e:	41 83 fa 0f          	cmp    $0xf,%r10d
    1472:	0f 95 c0             	setne  %al
    1475:	49 39 f0             	cmp    %rsi,%r8
    1478:	74 32                	je     14ac <func0+0x12c>
    147a:	0f c6 c9 ff          	shufps $0xff,%xmm1,%xmm1
    147e:	be 01 00 00 00       	mov    $0x1,%esi
    1483:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    148a:	84 00 00 00 00 00 
    1490:	f3 0f 10 04 8f       	movss  (%rdi,%rcx,4),%xmm0
    1495:	0f 2e c1             	ucomiss %xmm1,%xmm0
    1498:	0f 47 d6             	cmova  %esi,%edx
    149b:	0f 2e c8             	ucomiss %xmm0,%xmm1
    149e:	0f 47 c6             	cmova  %esi,%eax
    14a1:	48 ff c1             	inc    %rcx
    14a4:	0f 28 c8             	movaps %xmm0,%xmm1
    14a7:	49 39 c9             	cmp    %rcx,%r9
    14aa:	75 e4                	jne    1490 <func0+0x110>
    14ac:	01 c2                	add    %eax,%edx
    14ae:	83 fa 02             	cmp    $0x2,%edx
    14b1:	0f 95 c0             	setne  %al
    14b4:	c3                   	ret    

