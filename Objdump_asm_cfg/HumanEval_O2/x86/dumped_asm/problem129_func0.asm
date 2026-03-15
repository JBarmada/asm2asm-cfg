0000000000001380 <func0>:
    1380:	85 f6                	test   %esi,%esi
    1382:	74 16                	je     139a <func0+0x1a>
    1384:	7e 1a                	jle    13a0 <func0+0x20>
    1386:	41 89 f0             	mov    %esi,%r8d
    1389:	83 fe 01             	cmp    $0x1,%esi
    138c:	75 15                	jne    13a3 <func0+0x23>
    138e:	45 31 d2             	xor    %r10d,%r10d
    1391:	be 01 00 00 00       	mov    $0x1,%esi
    1396:	31 c0                	xor    %eax,%eax
    1398:	eb 6b                	jmp    1405 <func0+0x85>
    139a:	b8 00 80 ff ff       	mov    $0xffff8000,%eax
    139f:	c3                   	ret    
    13a0:	31 c0                	xor    %eax,%eax
    13a2:	c3                   	ret    
    13a3:	45 89 c1             	mov    %r8d,%r9d
    13a6:	41 83 e1 fe          	and    $0xfffffffe,%r9d
    13aa:	45 31 d2             	xor    %r10d,%r10d
    13ad:	be 01 00 00 00       	mov    $0x1,%esi
    13b2:	31 c0                	xor    %eax,%eax
    13b4:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    13bb:	00 00 00 00 00 
    13c0:	42 8b 14 97          	mov    (%rdi,%r10,4),%edx
    13c4:	46 8b 5c 97 04       	mov    0x4(%rdi,%r10,4),%r11d
    13c9:	85 d2                	test   %edx,%edx
    13cb:	0f 44 f2             	cmove  %edx,%esi
    13ce:	89 f1                	mov    %esi,%ecx
    13d0:	f7 d9                	neg    %ecx
    13d2:	85 d2                	test   %edx,%edx
    13d4:	0f 49 ce             	cmovns %esi,%ecx
    13d7:	45 85 db             	test   %r11d,%r11d
    13da:	41 0f 44 cb          	cmove  %r11d,%ecx
    13de:	89 ce                	mov    %ecx,%esi
    13e0:	f7 de                	neg    %esi
    13e2:	45 85 db             	test   %r11d,%r11d
    13e5:	0f 49 f1             	cmovns %ecx,%esi
    13e8:	89 d1                	mov    %edx,%ecx
    13ea:	f7 d9                	neg    %ecx
    13ec:	0f 48 ca             	cmovs  %edx,%ecx
    13ef:	01 c1                	add    %eax,%ecx
    13f1:	44 89 d8             	mov    %r11d,%eax
    13f4:	f7 d8                	neg    %eax
    13f6:	41 0f 48 c3          	cmovs  %r11d,%eax
    13fa:	01 c8                	add    %ecx,%eax
    13fc:	49 83 c2 02          	add    $0x2,%r10
    1400:	4d 39 d1             	cmp    %r10,%r9
    1403:	75 bb                	jne    13c0 <func0+0x40>
    1405:	41 f6 c0 01          	test   $0x1,%r8b
    1409:	74 1b                	je     1426 <func0+0xa6>
    140b:	42 8b 0c 97          	mov    (%rdi,%r10,4),%ecx
    140f:	85 c9                	test   %ecx,%ecx
    1411:	0f 44 f1             	cmove  %ecx,%esi
    1414:	89 f2                	mov    %esi,%edx
    1416:	f7 da                	neg    %edx
    1418:	85 c9                	test   %ecx,%ecx
    141a:	0f 48 f2             	cmovs  %edx,%esi
    141d:	89 ca                	mov    %ecx,%edx
    141f:	f7 da                	neg    %edx
    1421:	0f 48 d1             	cmovs  %ecx,%edx
    1424:	01 d0                	add    %edx,%eax
    1426:	0f af c6             	imul   %esi,%eax
    1429:	c3                   	ret    

