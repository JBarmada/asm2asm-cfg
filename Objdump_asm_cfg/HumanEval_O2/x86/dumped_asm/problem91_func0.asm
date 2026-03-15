00000000000012f0 <func0>:
    12f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12f5:	83 fe 02             	cmp    $0x2,%esi
    12f8:	0f 8c 87 00 00 00    	jl     1385 <func0+0x95>
    12fe:	41 89 f0             	mov    %esi,%r8d
    1301:	4e 8d 0c 85 00 00 00 	lea    0x0(,%r8,4),%r9
    1308:	00 
    1309:	49 83 e1 f8          	and    $0xfffffffffffffff8,%r9
    130d:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
    1312:	45 31 d2             	xor    %r10d,%r10d
    1315:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
    131a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1320:	42 8b 14 17          	mov    (%rdi,%r10,1),%edx
    1324:	39 c2                	cmp    %eax,%edx
    1326:	89 d6                	mov    %edx,%esi
    1328:	0f 44 f1             	cmove  %ecx,%esi
    132b:	39 ca                	cmp    %ecx,%edx
    132d:	0f 4d f1             	cmovge %ecx,%esi
    1330:	39 c2                	cmp    %eax,%edx
    1332:	0f 4d d0             	cmovge %eax,%edx
    1335:	0f 4c f0             	cmovl  %eax,%esi
    1338:	42 8b 44 17 04       	mov    0x4(%rdi,%r10,1),%eax
    133d:	39 d0                	cmp    %edx,%eax
    133f:	89 c1                	mov    %eax,%ecx
    1341:	0f 44 ce             	cmove  %esi,%ecx
    1344:	39 f0                	cmp    %esi,%eax
    1346:	0f 4d ce             	cmovge %esi,%ecx
    1349:	39 d0                	cmp    %edx,%eax
    134b:	0f 4d c2             	cmovge %edx,%eax
    134e:	0f 4c ca             	cmovl  %edx,%ecx
    1351:	49 83 c2 08          	add    $0x8,%r10
    1355:	4d 39 d1             	cmp    %r10,%r9
    1358:	75 c6                	jne    1320 <func0+0x30>
    135a:	41 f6 c0 01          	test   $0x1,%r8b
    135e:	74 17                	je     1377 <func0+0x87>
    1360:	42 8b 14 17          	mov    (%rdi,%r10,1),%edx
    1364:	39 c2                	cmp    %eax,%edx
    1366:	89 d6                	mov    %edx,%esi
    1368:	0f 44 f1             	cmove  %ecx,%esi
    136b:	39 ca                	cmp    %ecx,%edx
    136d:	0f 4d f1             	cmovge %ecx,%esi
    1370:	39 c2                	cmp    %eax,%edx
    1372:	0f 4c f0             	cmovl  %eax,%esi
    1375:	89 f1                	mov    %esi,%ecx
    1377:	81 f9 ff ff ff 7f    	cmp    $0x7fffffff,%ecx
    137d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1382:	0f 45 c1             	cmovne %ecx,%eax
    1385:	c3                   	ret    

