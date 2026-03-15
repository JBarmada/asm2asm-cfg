0000000000001280 <func0>:
    1280:	85 f6                	test   %esi,%esi
    1282:	7e 1a                	jle    129e <func0+0x1e>
    1284:	41 89 f1             	mov    %esi,%r9d
    1287:	4d 8d 41 ff          	lea    -0x1(%r9),%r8
    128b:	44 89 c9             	mov    %r9d,%ecx
    128e:	83 e1 07             	and    $0x7,%ecx
    1291:	49 83 f8 07          	cmp    $0x7,%r8
    1295:	73 10                	jae    12a7 <func0+0x27>
    1297:	0f 57 c9             	xorps  %xmm1,%xmm1
    129a:	31 d2                	xor    %edx,%edx
    129c:	eb 5a                	jmp    12f8 <func0+0x78>
    129e:	f3 0f 2a d6          	cvtsi2ss %esi,%xmm2
    12a2:	e9 95 00 00 00       	jmp    133c <func0+0xbc>
    12a7:	44 89 c8             	mov    %r9d,%eax
    12aa:	83 e0 f8             	and    $0xfffffff8,%eax
    12ad:	0f 57 c9             	xorps  %xmm1,%xmm1
    12b0:	31 d2                	xor    %edx,%edx
    12b2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    12b9:	1f 84 00 00 00 00 00 
    12c0:	f3 0f 58 0c 97       	addss  (%rdi,%rdx,4),%xmm1
    12c5:	f3 0f 58 4c 97 04    	addss  0x4(%rdi,%rdx,4),%xmm1
    12cb:	f3 0f 58 4c 97 08    	addss  0x8(%rdi,%rdx,4),%xmm1
    12d1:	f3 0f 58 4c 97 0c    	addss  0xc(%rdi,%rdx,4),%xmm1
    12d7:	f3 0f 58 4c 97 10    	addss  0x10(%rdi,%rdx,4),%xmm1
    12dd:	f3 0f 58 4c 97 14    	addss  0x14(%rdi,%rdx,4),%xmm1
    12e3:	f3 0f 58 4c 97 18    	addss  0x18(%rdi,%rdx,4),%xmm1
    12e9:	f3 0f 58 4c 97 1c    	addss  0x1c(%rdi,%rdx,4),%xmm1
    12ef:	48 83 c2 08          	add    $0x8,%rdx
    12f3:	48 39 d0             	cmp    %rdx,%rax
    12f6:	75 c8                	jne    12c0 <func0+0x40>
    12f8:	48 85 c9             	test   %rcx,%rcx
    12fb:	74 20                	je     131d <func0+0x9d>
    12fd:	48 8d 04 97          	lea    (%rdi,%rdx,4),%rax
    1301:	31 d2                	xor    %edx,%edx
    1303:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    130a:	84 00 00 00 00 00 
    1310:	f3 0f 58 0c 90       	addss  (%rax,%rdx,4),%xmm1
    1315:	48 ff c2             	inc    %rdx
    1318:	48 39 d1             	cmp    %rdx,%rcx
    131b:	75 f3                	jne    1310 <func0+0x90>
    131d:	f3 0f 2a d6          	cvtsi2ss %esi,%xmm2
    1321:	85 f6                	test   %esi,%esi
    1323:	7e 17                	jle    133c <func0+0xbc>
    1325:	f3 0f 5e ca          	divss  %xmm2,%xmm1
    1329:	44 89 c9             	mov    %r9d,%ecx
    132c:	83 e1 03             	and    $0x3,%ecx
    132f:	49 83 f8 03          	cmp    $0x3,%r8
    1333:	73 0f                	jae    1344 <func0+0xc4>
    1335:	0f 57 c0             	xorps  %xmm0,%xmm0
    1338:	31 d2                	xor    %edx,%edx
    133a:	eb 70                	jmp    13ac <func0+0x12c>
    133c:	0f 57 c0             	xorps  %xmm0,%xmm0
    133f:	f3 0f 5e c2          	divss  %xmm2,%xmm0
    1343:	c3                   	ret    
    1344:	41 83 e1 fc          	and    $0xfffffffc,%r9d
    1348:	0f 57 c0             	xorps  %xmm0,%xmm0
    134b:	31 d2                	xor    %edx,%edx
    134d:	0f 28 1d bc 0d 00 00 	movaps 0xdbc(%rip),%xmm3        # 2110 <_IO_stdin_used+0x110>
    1354:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    135b:	00 00 00 00 00 
    1360:	f3 0f 10 24 97       	movss  (%rdi,%rdx,4),%xmm4
    1365:	f3 0f 10 6c 97 04    	movss  0x4(%rdi,%rdx,4),%xmm5
    136b:	f3 0f 5c e1          	subss  %xmm1,%xmm4
    136f:	0f 54 e3             	andps  %xmm3,%xmm4
    1372:	f3 0f 58 e0          	addss  %xmm0,%xmm4
    1376:	f3 0f 5c e9          	subss  %xmm1,%xmm5
    137a:	0f 54 eb             	andps  %xmm3,%xmm5
    137d:	f3 0f 58 ec          	addss  %xmm4,%xmm5
    1381:	f3 0f 10 64 97 08    	movss  0x8(%rdi,%rdx,4),%xmm4
    1387:	f3 0f 5c e1          	subss  %xmm1,%xmm4
    138b:	0f 54 e3             	andps  %xmm3,%xmm4
    138e:	f3 0f 58 e5          	addss  %xmm5,%xmm4
    1392:	f3 0f 10 44 97 0c    	movss  0xc(%rdi,%rdx,4),%xmm0
    1398:	f3 0f 5c c1          	subss  %xmm1,%xmm0
    139c:	0f 54 c3             	andps  %xmm3,%xmm0
    139f:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    13a3:	48 83 c2 04          	add    $0x4,%rdx
    13a7:	49 39 d1             	cmp    %rdx,%r9
    13aa:	75 b4                	jne    1360 <func0+0xe0>
    13ac:	48 85 c9             	test   %rcx,%rcx
    13af:	74 27                	je     13d8 <func0+0x158>
    13b1:	48 8d 04 97          	lea    (%rdi,%rdx,4),%rax
    13b5:	31 d2                	xor    %edx,%edx
    13b7:	0f 28 1d 52 0d 00 00 	movaps 0xd52(%rip),%xmm3        # 2110 <_IO_stdin_used+0x110>
    13be:	66 90                	xchg   %ax,%ax
    13c0:	f3 0f 10 24 90       	movss  (%rax,%rdx,4),%xmm4
    13c5:	f3 0f 5c e1          	subss  %xmm1,%xmm4
    13c9:	0f 54 e3             	andps  %xmm3,%xmm4
    13cc:	f3 0f 58 c4          	addss  %xmm4,%xmm0
    13d0:	48 ff c2             	inc    %rdx
    13d3:	48 39 d1             	cmp    %rdx,%rcx
    13d6:	75 e8                	jne    13c0 <func0+0x140>
    13d8:	f3 0f 5e c2          	divss  %xmm2,%xmm0
    13dc:	c3                   	ret    

