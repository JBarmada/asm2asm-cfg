0000000000001350 <func0>:
    1350:	85 f6                	test   %esi,%esi
    1352:	7e 5f                	jle    13b3 <func0+0x63>
    1354:	41 89 f0             	mov    %esi,%r8d
    1357:	45 31 c9             	xor    %r9d,%r9d
    135a:	4d 89 c2             	mov    %r8,%r10
    135d:	48 89 fa             	mov    %rdi,%rdx
    1360:	eb 1a                	jmp    137c <func0+0x2c>
    1362:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1369:	1f 84 00 00 00 00 00 
    1370:	48 83 c2 04          	add    $0x4,%rdx
    1374:	49 ff ca             	dec    %r10
    1377:	4d 39 c1             	cmp    %r8,%r9
    137a:	74 37                	je     13b3 <func0+0x63>
    137c:	4c 89 c8             	mov    %r9,%rax
    137f:	49 ff c1             	inc    %r9
    1382:	4d 39 c1             	cmp    %r8,%r9
    1385:	73 e9                	jae    1370 <func0+0x20>
    1387:	b9 01 00 00 00       	mov    $0x1,%ecx
    138c:	eb 0a                	jmp    1398 <func0+0x48>
    138e:	66 90                	xchg   %ax,%ax
    1390:	48 ff c1             	inc    %rcx
    1393:	49 39 ca             	cmp    %rcx,%r10
    1396:	74 d8                	je     1370 <func0+0x20>
    1398:	f3 0f 10 04 87       	movss  (%rdi,%rax,4),%xmm0
    139d:	f3 0f 10 0c 8a       	movss  (%rdx,%rcx,4),%xmm1
    13a2:	0f 2e c1             	ucomiss %xmm1,%xmm0
    13a5:	76 e9                	jbe    1390 <func0+0x40>
    13a7:	f3 0f 11 0c 87       	movss  %xmm1,(%rdi,%rax,4)
    13ac:	f3 0f 11 04 8a       	movss  %xmm0,(%rdx,%rcx,4)
    13b1:	eb dd                	jmp    1390 <func0+0x40>
    13b3:	89 f0                	mov    %esi,%eax
    13b5:	25 01 00 00 80       	and    $0x80000001,%eax
    13ba:	83 f8 01             	cmp    $0x1,%eax
    13bd:	75 08                	jne    13c7 <func0+0x77>
    13bf:	d1 ee                	shr    %esi
    13c1:	f3 0f 10 04 b7       	movss  (%rdi,%rsi,4),%xmm0
    13c6:	c3                   	ret    
    13c7:	89 f0                	mov    %esi,%eax
    13c9:	c1 e8 1f             	shr    $0x1f,%eax
    13cc:	01 f0                	add    %esi,%eax
    13ce:	d1 f8                	sar    %eax
    13d0:	48 98                	cltq   
    13d2:	f3 0f 10 04 87       	movss  (%rdi,%rax,4),%xmm0
    13d7:	f3 0f 58 44 87 fc    	addss  -0x4(%rdi,%rax,4),%xmm0
    13dd:	f3 0f 59 05 8f 0d 00 	mulss  0xd8f(%rip),%xmm0        # 2174 <_IO_stdin_used+0x174>
    13e4:	00 
    13e5:	c3                   	ret    

