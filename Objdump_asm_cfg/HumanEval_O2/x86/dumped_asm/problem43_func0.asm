0000000000001290 <func0>:
    1290:	85 f6                	test   %esi,%esi
    1292:	0f 8e c3 00 00 00    	jle    135b <func0+0xcb>
    1298:	89 f0                	mov    %esi,%eax
    129a:	83 fe 08             	cmp    $0x8,%esi
    129d:	73 07                	jae    12a6 <func0+0x16>
    129f:	31 c9                	xor    %ecx,%ecx
    12a1:	e9 aa 00 00 00       	jmp    1350 <func0+0xc0>
    12a6:	89 c1                	mov    %eax,%ecx
    12a8:	83 e1 f8             	and    $0xfffffff8,%ecx
    12ab:	48 8d 51 f8          	lea    -0x8(%rcx),%rdx
    12af:	49 89 d0             	mov    %rdx,%r8
    12b2:	49 c1 e8 03          	shr    $0x3,%r8
    12b6:	49 ff c0             	inc    %r8
    12b9:	48 85 d2             	test   %rdx,%rdx
    12bc:	0f 84 9a 00 00 00    	je     135c <func0+0xcc>
    12c2:	4c 89 c6             	mov    %r8,%rsi
    12c5:	48 83 e6 fe          	and    $0xfffffffffffffffe,%rsi
    12c9:	31 d2                	xor    %edx,%edx
    12cb:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
    12cf:	90                   	nop
    12d0:	f3 0f 6f 0c 97       	movdqu (%rdi,%rdx,4),%xmm1
    12d5:	f3 0f 6f 54 97 10    	movdqu 0x10(%rdi,%rdx,4),%xmm2
    12db:	f3 0f 6f 5c 97 20    	movdqu 0x20(%rdi,%rdx,4),%xmm3
    12e1:	f3 0f 6f 64 97 30    	movdqu 0x30(%rdi,%rdx,4),%xmm4
    12e7:	66 0f fa c8          	psubd  %xmm0,%xmm1
    12eb:	66 0f fa d0          	psubd  %xmm0,%xmm2
    12ef:	f3 0f 7f 0c 97       	movdqu %xmm1,(%rdi,%rdx,4)
    12f4:	f3 0f 7f 54 97 10    	movdqu %xmm2,0x10(%rdi,%rdx,4)
    12fa:	66 0f fa d8          	psubd  %xmm0,%xmm3
    12fe:	66 0f fa e0          	psubd  %xmm0,%xmm4
    1302:	f3 0f 7f 5c 97 20    	movdqu %xmm3,0x20(%rdi,%rdx,4)
    1308:	f3 0f 7f 64 97 30    	movdqu %xmm4,0x30(%rdi,%rdx,4)
    130e:	48 83 c2 10          	add    $0x10,%rdx
    1312:	48 83 c6 fe          	add    $0xfffffffffffffffe,%rsi
    1316:	75 b8                	jne    12d0 <func0+0x40>
    1318:	41 f6 c0 01          	test   $0x1,%r8b
    131c:	74 22                	je     1340 <func0+0xb0>
    131e:	f3 0f 6f 04 97       	movdqu (%rdi,%rdx,4),%xmm0
    1323:	f3 0f 6f 4c 97 10    	movdqu 0x10(%rdi,%rdx,4),%xmm1
    1329:	66 0f 76 d2          	pcmpeqd %xmm2,%xmm2
    132d:	66 0f fa c2          	psubd  %xmm2,%xmm0
    1331:	66 0f fa ca          	psubd  %xmm2,%xmm1
    1335:	f3 0f 7f 04 97       	movdqu %xmm0,(%rdi,%rdx,4)
    133a:	f3 0f 7f 4c 97 10    	movdqu %xmm1,0x10(%rdi,%rdx,4)
    1340:	48 39 c1             	cmp    %rax,%rcx
    1343:	74 16                	je     135b <func0+0xcb>
    1345:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    134c:	00 00 00 00 
    1350:	ff 04 8f             	incl   (%rdi,%rcx,4)
    1353:	48 ff c1             	inc    %rcx
    1356:	48 39 c8             	cmp    %rcx,%rax
    1359:	75 f5                	jne    1350 <func0+0xc0>
    135b:	c3                   	ret    
    135c:	31 d2                	xor    %edx,%edx
    135e:	41 f6 c0 01          	test   $0x1,%r8b
    1362:	75 ba                	jne    131e <func0+0x8e>
    1364:	eb da                	jmp    1340 <func0+0xb0>

