00000000000012b0 <func0>:
    12b0:	53                   	push   %rbx
    12b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12b6:	83 fe 02             	cmp    $0x2,%esi
    12b9:	0f 8c a3 00 00 00    	jl     1362 <func0+0xb2>
    12bf:	89 f0                	mov    %esi,%eax
    12c1:	8b 37                	mov    (%rdi),%esi
    12c3:	4c 8d 40 ff          	lea    -0x1(%rax),%r8
    12c7:	48 83 c0 fe          	add    $0xfffffffffffffffe,%rax
    12cb:	45 89 c1             	mov    %r8d,%r9d
    12ce:	41 83 e1 03          	and    $0x3,%r9d
    12d2:	48 83 f8 03          	cmp    $0x3,%rax
    12d6:	73 0c                	jae    12e4 <func0+0x34>
    12d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12dd:	ba 01 00 00 00       	mov    $0x1,%edx
    12e2:	eb 5c                	jmp    1340 <func0+0x90>
    12e4:	49 83 e0 fc          	and    $0xfffffffffffffffc,%r8
    12e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12ed:	ba 01 00 00 00       	mov    $0x1,%edx
    12f2:	31 db                	xor    %ebx,%ebx
    12f4:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    12fb:	00 00 00 00 00 
    1300:	44 8b 14 97          	mov    (%rdi,%rdx,4),%r10d
    1304:	44 8b 5c 97 04       	mov    0x4(%rdi,%rdx,4),%r11d
    1309:	41 39 f2             	cmp    %esi,%r10d
    130c:	0f 4c c2             	cmovl  %edx,%eax
    130f:	8d 72 01             	lea    0x1(%rdx),%esi
    1312:	45 39 d3             	cmp    %r10d,%r11d
    1315:	0f 4d f0             	cmovge %eax,%esi
    1318:	8d 4a 02             	lea    0x2(%rdx),%ecx
    131b:	44 8b 54 97 08       	mov    0x8(%rdi,%rdx,4),%r10d
    1320:	45 39 da             	cmp    %r11d,%r10d
    1323:	0f 4d ce             	cmovge %esi,%ecx
    1326:	8d 42 03             	lea    0x3(%rdx),%eax
    1329:	8b 74 97 0c          	mov    0xc(%rdi,%rdx,4),%esi
    132d:	44 39 d6             	cmp    %r10d,%esi
    1330:	0f 4d c1             	cmovge %ecx,%eax
    1333:	48 83 c2 04          	add    $0x4,%rdx
    1337:	48 83 c3 04          	add    $0x4,%rbx
    133b:	4c 39 c3             	cmp    %r8,%rbx
    133e:	75 c0                	jne    1300 <func0+0x50>
    1340:	4d 85 c9             	test   %r9,%r9
    1343:	74 1d                	je     1362 <func0+0xb2>
    1345:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    134c:	00 00 00 00 
    1350:	8b 0c 97             	mov    (%rdi,%rdx,4),%ecx
    1353:	39 f1                	cmp    %esi,%ecx
    1355:	0f 4c c2             	cmovl  %edx,%eax
    1358:	48 ff c2             	inc    %rdx
    135b:	89 ce                	mov    %ecx,%esi
    135d:	49 ff c9             	dec    %r9
    1360:	75 ee                	jne    1350 <func0+0xa0>
    1362:	5b                   	pop    %rbx
    1363:	c3                   	ret    

