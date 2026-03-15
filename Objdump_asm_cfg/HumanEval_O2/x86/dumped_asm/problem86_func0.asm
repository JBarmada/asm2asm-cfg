0000000000001260 <func0>:
    1260:	31 c0                	xor    %eax,%eax
    1262:	83 fe 02             	cmp    $0x2,%esi
    1265:	0f 8c e9 00 00 00    	jl     1354 <func0+0xf4>
    126b:	83 c6 fe             	add    $0xfffffffe,%esi
    126e:	45 31 c9             	xor    %r9d,%r9d
    1271:	83 fe 10             	cmp    $0x10,%esi
    1274:	73 0f                	jae    1285 <func0+0x25>
    1276:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    127c:	31 d2                	xor    %edx,%edx
    127e:	31 c0                	xor    %eax,%eax
    1280:	e9 9e 00 00 00       	jmp    1323 <func0+0xc3>
    1285:	89 f2                	mov    %esi,%edx
    1287:	d1 ea                	shr    %edx
    1289:	ff c2                	inc    %edx
    128b:	41 89 d0             	mov    %edx,%r8d
    128e:	41 83 e0 07          	and    $0x7,%r8d
    1292:	b8 08 00 00 00       	mov    $0x8,%eax
    1297:	49 0f 45 c0          	cmovne %r8,%rax
    129b:	48 29 c2             	sub    %rax,%rdx
    129e:	4c 8d 04 12          	lea    (%rdx,%rdx,1),%r8
    12a2:	49 ff c0             	inc    %r8
    12a5:	66 0f ef c0          	pxor   %xmm0,%xmm0
    12a9:	31 c0                	xor    %eax,%eax
    12ab:	0f 28 1d 9e 0e 00 00 	movaps 0xe9e(%rip),%xmm3        # 2150 <_IO_stdin_used+0x150>
    12b2:	66 0f ef d2          	pxor   %xmm2,%xmm2
    12b6:	66 0f ef c9          	pxor   %xmm1,%xmm1
    12ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12c0:	0f 10 64 c7 04       	movups 0x4(%rdi,%rax,8),%xmm4
    12c5:	0f 10 6c c7 14       	movups 0x14(%rdi,%rax,8),%xmm5
    12ca:	0f c6 e5 88          	shufps $0x88,%xmm5,%xmm4
    12ce:	0f 10 6c c7 24       	movups 0x24(%rdi,%rax,8),%xmm5
    12d3:	0f 10 74 c7 34       	movups 0x34(%rdi,%rax,8),%xmm6
    12d8:	0f c6 ee 88          	shufps $0x88,%xmm6,%xmm5
    12dc:	0f 28 f4             	movaps %xmm4,%xmm6
    12df:	0f 54 f3             	andps  %xmm3,%xmm6
    12e2:	0f 28 fd             	movaps %xmm5,%xmm7
    12e5:	0f 54 fb             	andps  %xmm3,%xmm7
    12e8:	66 0f 76 f0          	pcmpeqd %xmm0,%xmm6
    12ec:	66 0f db f4          	pand   %xmm4,%xmm6
    12f0:	66 0f fe d6          	paddd  %xmm6,%xmm2
    12f4:	66 0f 76 f8          	pcmpeqd %xmm0,%xmm7
    12f8:	66 0f db fd          	pand   %xmm5,%xmm7
    12fc:	66 0f fe cf          	paddd  %xmm7,%xmm1
    1300:	48 83 c0 08          	add    $0x8,%rax
    1304:	48 39 c2             	cmp    %rax,%rdx
    1307:	75 b7                	jne    12c0 <func0+0x60>
    1309:	66 0f fe ca          	paddd  %xmm2,%xmm1
    130d:	66 0f 70 c1 ee       	pshufd $0xee,%xmm1,%xmm0
    1312:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1316:	66 0f 70 c8 55       	pshufd $0x55,%xmm0,%xmm1
    131b:	66 0f fe c8          	paddd  %xmm0,%xmm1
    131f:	66 0f 7e c8          	movd   %xmm1,%eax
    1323:	89 f6                	mov    %esi,%esi
    1325:	48 d1 ee             	shr    %rsi
    1328:	48 29 d6             	sub    %rdx,%rsi
    132b:	48 ff c6             	inc    %rsi
    132e:	4a 8d 14 87          	lea    (%rdi,%r8,4),%rdx
    1332:	31 ff                	xor    %edi,%edi
    1334:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    133b:	00 00 00 00 00 
    1340:	8b 0c fa             	mov    (%rdx,%rdi,8),%ecx
    1343:	f6 c1 01             	test   $0x1,%cl
    1346:	41 0f 45 c9          	cmovne %r9d,%ecx
    134a:	01 c8                	add    %ecx,%eax
    134c:	48 ff c7             	inc    %rdi
    134f:	48 39 fe             	cmp    %rdi,%rsi
    1352:	75 ec                	jne    1340 <func0+0xe0>
    1354:	c3                   	ret    

