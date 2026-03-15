0000000000001240 <func0>:
    1240:	85 ff                	test   %edi,%edi
    1242:	7e 35                	jle    1279 <func0+0x39>
    1244:	b8 01 00 00 00       	mov    $0x1,%eax
    1249:	83 ff 01             	cmp    $0x1,%edi
    124c:	0f 84 47 01 00 00    	je     1399 <func0+0x159>
    1252:	b8 12 00 00 00       	mov    $0x12,%eax
    1257:	83 ff 03             	cmp    $0x3,%edi
    125a:	0f 82 39 01 00 00    	jb     1399 <func0+0x159>
    1260:	44 8d 47 fe          	lea    -0x2(%rdi),%r8d
    1264:	41 83 f8 08          	cmp    $0x8,%r8d
    1268:	73 12                	jae    127c <func0+0x3c>
    126a:	b8 12 00 00 00       	mov    $0x12,%eax
    126f:	b9 02 00 00 00       	mov    $0x2,%ecx
    1274:	e9 15 01 00 00       	jmp    138e <func0+0x14e>
    1279:	31 c0                	xor    %eax,%eax
    127b:	c3                   	ret    
    127c:	44 89 c1             	mov    %r8d,%ecx
    127f:	83 e1 f8             	and    $0xfffffff8,%ecx
    1282:	8d 51 f8             	lea    -0x8(%rcx),%edx
    1285:	89 d6                	mov    %edx,%esi
    1287:	c1 ee 03             	shr    $0x3,%esi
    128a:	ff c6                	inc    %esi
    128c:	89 f0                	mov    %esi,%eax
    128e:	83 e0 07             	and    $0x7,%eax
    1291:	83 fa 38             	cmp    $0x38,%edx
    1294:	73 12                	jae    12a8 <func0+0x68>
    1296:	66 0f 6f 05 e2 0d 00 	movdqa 0xde2(%rip),%xmm0        # 2080 <_IO_stdin_used+0x80>
    129d:	00 
    129e:	66 0f 6f 0d ea 0d 00 	movdqa 0xdea(%rip),%xmm1        # 2090 <_IO_stdin_used+0x90>
    12a5:	00 
    12a6:	eb 63                	jmp    130b <func0+0xcb>
    12a8:	83 e6 f8             	and    $0xfffffff8,%esi
    12ab:	66 0f 6f 05 cd 0d 00 	movdqa 0xdcd(%rip),%xmm0        # 2080 <_IO_stdin_used+0x80>
    12b2:	00 
    12b3:	66 0f 6f 0d d5 0d 00 	movdqa 0xdd5(%rip),%xmm1        # 2090 <_IO_stdin_used+0x90>
    12ba:	00 
    12bb:	66 0f 6f 15 dd 0d 00 	movdqa 0xddd(%rip),%xmm2        # 20a0 <_IO_stdin_used+0xa0>
    12c2:	00 
    12c3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    12ca:	84 00 00 00 00 00 
    12d0:	66 0f 70 d9 f5       	pshufd $0xf5,%xmm1,%xmm3
    12d5:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    12d9:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    12de:	66 0f f4 da          	pmuludq %xmm2,%xmm3
    12e2:	66 0f 70 db e8       	pshufd $0xe8,%xmm3,%xmm3
    12e7:	66 0f 62 cb          	punpckldq %xmm3,%xmm1
    12eb:	66 0f 70 d8 f5       	pshufd $0xf5,%xmm0,%xmm3
    12f0:	66 0f f4 c2          	pmuludq %xmm2,%xmm0
    12f4:	66 0f 70 c0 e8       	pshufd $0xe8,%xmm0,%xmm0
    12f9:	66 0f f4 da          	pmuludq %xmm2,%xmm3
    12fd:	66 0f 70 db e8       	pshufd $0xe8,%xmm3,%xmm3
    1302:	66 0f 62 c3          	punpckldq %xmm3,%xmm0
    1306:	83 c6 f8             	add    $0xfffffff8,%esi
    1309:	75 c5                	jne    12d0 <func0+0x90>
    130b:	85 c0                	test   %eax,%eax
    130d:	74 4b                	je     135a <func0+0x11a>
    130f:	66 0f 6f 15 99 0d 00 	movdqa 0xd99(%rip),%xmm2        # 20b0 <_IO_stdin_used+0xb0>
    1316:	00 
    1317:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    131e:	00 00 
    1320:	66 0f 70 d9 f5       	pshufd $0xf5,%xmm1,%xmm3
    1325:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    1329:	66 0f 70 c9 e8       	pshufd $0xe8,%xmm1,%xmm1
    132e:	66 0f f4 da          	pmuludq %xmm2,%xmm3
    1332:	66 0f 70 db e8       	pshufd $0xe8,%xmm3,%xmm3
    1337:	66 0f 62 cb          	punpckldq %xmm3,%xmm1
    133b:	66 0f 70 d8 f5       	pshufd $0xf5,%xmm0,%xmm3
    1340:	66 0f f4 c2          	pmuludq %xmm2,%xmm0
    1344:	66 0f 70 c0 e8       	pshufd $0xe8,%xmm0,%xmm0
    1349:	66 0f f4 da          	pmuludq %xmm2,%xmm3
    134d:	66 0f 70 db e8       	pshufd $0xe8,%xmm3,%xmm3
    1352:	66 0f 62 c3          	punpckldq %xmm3,%xmm0
    1356:	ff c8                	dec    %eax
    1358:	75 c6                	jne    1320 <func0+0xe0>
    135a:	66 0f 70 d1 f5       	pshufd $0xf5,%xmm1,%xmm2
    135f:	66 0f 70 d8 f5       	pshufd $0xf5,%xmm0,%xmm3
    1364:	66 0f f4 da          	pmuludq %xmm2,%xmm3
    1368:	66 0f f4 c1          	pmuludq %xmm1,%xmm0
    136c:	66 0f 70 c8 ee       	pshufd $0xee,%xmm0,%xmm1
    1371:	66 0f f4 c8          	pmuludq %xmm0,%xmm1
    1375:	66 0f 70 c3 aa       	pshufd $0xaa,%xmm3,%xmm0
    137a:	66 0f f4 c3          	pmuludq %xmm3,%xmm0
    137e:	66 0f f4 c1          	pmuludq %xmm1,%xmm0
    1382:	66 0f 7e c0          	movd   %xmm0,%eax
    1386:	41 39 c8             	cmp    %ecx,%r8d
    1389:	74 0e                	je     1399 <func0+0x159>
    138b:	83 c9 02             	or     $0x2,%ecx
    138e:	29 cf                	sub    %ecx,%edi
    1390:	01 c0                	add    %eax,%eax
    1392:	8d 04 80             	lea    (%rax,%rax,4),%eax
    1395:	ff cf                	dec    %edi
    1397:	75 f7                	jne    1390 <func0+0x150>
    1399:	c3                   	ret    

