0000000000001510 <func0>:
    1510:	85 c9                	test   %ecx,%ecx
    1512:	0f 8e 0a 01 00 00    	jle    1622 <func0+0x112>
    1518:	41 89 c8             	mov    %ecx,%r8d
    151b:	83 f9 08             	cmp    $0x8,%ecx
    151e:	73 08                	jae    1528 <func0+0x18>
    1520:	45 31 db             	xor    %r11d,%r11d
    1523:	e9 91 00 00 00       	jmp    15b9 <func0+0xa9>
    1528:	48 89 d0             	mov    %rdx,%rax
    152b:	48 29 f8             	sub    %rdi,%rax
    152e:	45 31 db             	xor    %r11d,%r11d
    1531:	48 83 f8 20          	cmp    $0x20,%rax
    1535:	0f 82 7e 00 00 00    	jb     15b9 <func0+0xa9>
    153b:	48 89 d0             	mov    %rdx,%rax
    153e:	48 29 f0             	sub    %rsi,%rax
    1541:	48 83 f8 20          	cmp    $0x20,%rax
    1545:	72 72                	jb     15b9 <func0+0xa9>
    1547:	45 89 c3             	mov    %r8d,%r11d
    154a:	41 83 e3 f8          	and    $0xfffffff8,%r11d
    154e:	4e 8d 0c 85 00 00 00 	lea    0x0(,%r8,4),%r9
    1555:	00 
    1556:	49 83 e1 e0          	and    $0xffffffffffffffe0,%r9
    155a:	31 c0                	xor    %eax,%eax
    155c:	0f 1f 40 00          	nopl   0x0(%rax)
    1560:	f3 0f 6f 04 07       	movdqu (%rdi,%rax,1),%xmm0
    1565:	f3 0f 6f 4c 07 10    	movdqu 0x10(%rdi,%rax,1),%xmm1
    156b:	f3 0f 6f 14 06       	movdqu (%rsi,%rax,1),%xmm2
    1570:	66 0f fa c2          	psubd  %xmm2,%xmm0
    1574:	f3 0f 6f 54 06 10    	movdqu 0x10(%rsi,%rax,1),%xmm2
    157a:	66 0f fa ca          	psubd  %xmm2,%xmm1
    157e:	66 0f 6f d0          	movdqa %xmm0,%xmm2
    1582:	66 0f 72 e2 1f       	psrad  $0x1f,%xmm2
    1587:	66 0f ef c2          	pxor   %xmm2,%xmm0
    158b:	66 0f fa c2          	psubd  %xmm2,%xmm0
    158f:	66 0f 6f d1          	movdqa %xmm1,%xmm2
    1593:	66 0f 72 e2 1f       	psrad  $0x1f,%xmm2
    1598:	66 0f ef ca          	pxor   %xmm2,%xmm1
    159c:	66 0f fa ca          	psubd  %xmm2,%xmm1
    15a0:	f3 0f 7f 04 02       	movdqu %xmm0,(%rdx,%rax,1)
    15a5:	f3 0f 7f 4c 02 10    	movdqu %xmm1,0x10(%rdx,%rax,1)
    15ab:	48 83 c0 20          	add    $0x20,%rax
    15af:	49 39 c1             	cmp    %rax,%r9
    15b2:	75 ac                	jne    1560 <func0+0x50>
    15b4:	4d 39 c3             	cmp    %r8,%r11
    15b7:	74 69                	je     1622 <func0+0x112>
    15b9:	4d 89 da             	mov    %r11,%r10
    15bc:	49 f7 d2             	not    %r10
    15bf:	41 f6 c0 01          	test   $0x1,%r8b
    15c3:	74 19                	je     15de <func0+0xce>
    15c5:	46 8b 0c 9f          	mov    (%rdi,%r11,4),%r9d
    15c9:	46 2b 0c 9e          	sub    (%rsi,%r11,4),%r9d
    15cd:	44 89 c8             	mov    %r9d,%eax
    15d0:	f7 d8                	neg    %eax
    15d2:	41 0f 48 c1          	cmovs  %r9d,%eax
    15d6:	42 89 04 9a          	mov    %eax,(%rdx,%r11,4)
    15da:	49 83 cb 01          	or     $0x1,%r11
    15de:	4d 01 c2             	add    %r8,%r10
    15e1:	74 3f                	je     1622 <func0+0x112>
    15e3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    15ea:	84 00 00 00 00 00 
    15f0:	42 8b 0c 9f          	mov    (%rdi,%r11,4),%ecx
    15f4:	42 2b 0c 9e          	sub    (%rsi,%r11,4),%ecx
    15f8:	89 c8                	mov    %ecx,%eax
    15fa:	f7 d8                	neg    %eax
    15fc:	0f 48 c1             	cmovs  %ecx,%eax
    15ff:	42 89 04 9a          	mov    %eax,(%rdx,%r11,4)
    1603:	42 8b 44 9f 04       	mov    0x4(%rdi,%r11,4),%eax
    1608:	42 2b 44 9e 04       	sub    0x4(%rsi,%r11,4),%eax
    160d:	89 c1                	mov    %eax,%ecx
    160f:	f7 d9                	neg    %ecx
    1611:	0f 48 c8             	cmovs  %eax,%ecx
    1614:	42 89 4c 9a 04       	mov    %ecx,0x4(%rdx,%r11,4)
    1619:	49 83 c3 02          	add    $0x2,%r11
    161d:	4d 39 d8             	cmp    %r11,%r8
    1620:	75 ce                	jne    15f0 <func0+0xe0>
    1622:	c3                   	ret    

