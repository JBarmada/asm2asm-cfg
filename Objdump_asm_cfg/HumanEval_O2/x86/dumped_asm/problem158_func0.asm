0000000000001420 <func0>:
    1420:	f3 0f 59 c9          	mulss  %xmm1,%xmm1
    1424:	f3 0f 59 c0          	mulss  %xmm0,%xmm0
    1428:	0f 28 d8             	movaps %xmm0,%xmm3
    142b:	f3 0f 58 d9          	addss  %xmm1,%xmm3
    142f:	f3 0f 59 d2          	mulss  %xmm2,%xmm2
    1433:	f3 0f 5c da          	subss  %xmm2,%xmm3
    1437:	0f 54 1d 22 0d 00 00 	andps  0xd22(%rip),%xmm3        # 2160 <_IO_stdin_used+0x160>
    143e:	f3 0f 5a e3          	cvtss2sd %xmm3,%xmm4
    1442:	b8 01 00 00 00       	mov    $0x1,%eax
    1447:	f2 0f 10 1d 21 0d 00 	movsd  0xd21(%rip),%xmm3        # 2170 <_IO_stdin_used+0x170>
    144e:	00 
    144f:	66 0f 2e dc          	ucomisd %xmm4,%xmm3
    1453:	77 3a                	ja     148f <func0+0x6f>
    1455:	0f 28 e0             	movaps %xmm0,%xmm4
    1458:	f3 0f 58 e2          	addss  %xmm2,%xmm4
    145c:	f3 0f 5c e1          	subss  %xmm1,%xmm4
    1460:	0f 54 25 f9 0c 00 00 	andps  0xcf9(%rip),%xmm4        # 2160 <_IO_stdin_used+0x160>
    1467:	f3 0f 5a e4          	cvtss2sd %xmm4,%xmm4
    146b:	66 0f 2e dc          	ucomisd %xmm4,%xmm3
    146f:	77 1e                	ja     148f <func0+0x6f>
    1471:	f3 0f 58 ca          	addss  %xmm2,%xmm1
    1475:	f3 0f 5c c8          	subss  %xmm0,%xmm1
    1479:	0f 54 0d e0 0c 00 00 	andps  0xce0(%rip),%xmm1        # 2160 <_IO_stdin_used+0x160>
    1480:	0f 57 c0             	xorps  %xmm0,%xmm0
    1483:	f3 0f 5a c1          	cvtss2sd %xmm1,%xmm0
    1487:	66 0f 2e d8          	ucomisd %xmm0,%xmm3
    148b:	77 02                	ja     148f <func0+0x6f>
    148d:	31 c0                	xor    %eax,%eax
    148f:	c3                   	ret    

