0000000000001280 <func0>:
    1280:	41 56                	push   %r14
    1282:	53                   	push   %rbx
    1283:	50                   	push   %rax
    1284:	0f b6 1f             	movzbl (%rdi),%ebx
    1287:	84 db                	test   %bl,%bl
    1289:	0f 84 8f 00 00 00    	je     131e <func0+0x9e>
    128f:	49 89 fe             	mov    %rdi,%r14
    1292:	e8 a9 fd ff ff       	call   1040 <__ctype_b_loc@plt>
    1297:	4c 8b 08             	mov    (%rax),%r9
    129a:	49 ff c6             	inc    %r14
    129d:	ba 01 00 00 00       	mov    $0x1,%edx
    12a2:	31 c0                	xor    %eax,%eax
    12a4:	49 b8 00 00 00 00 02 	movabs $0x8000400200000000,%r8
    12ab:	40 00 80 
    12ae:	45 31 d2             	xor    %r10d,%r10d
    12b1:	eb 26                	jmp    12d9 <func0+0x59>
    12b3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    12ba:	84 00 00 00 00 00 
    12c0:	41 ba 01 00 00 00    	mov    $0x1,%r10d
    12c6:	41 0f b6 d3          	movzbl %r11b,%edx
    12ca:	01 d0                	add    %edx,%eax
    12cc:	41 0f b6 1e          	movzbl (%r14),%ebx
    12d0:	49 ff c6             	inc    %r14
    12d3:	89 ca                	mov    %ecx,%edx
    12d5:	84 db                	test   %bl,%bl
    12d7:	74 47                	je     1320 <func0+0xa0>
    12d9:	48 0f be fb          	movsbq %bl,%rdi
    12dd:	41 0f b7 34 79       	movzwl (%r9,%rdi,2),%esi
    12e2:	89 f1                	mov    %esi,%ecx
    12e4:	81 e1 00 20 00 00    	and    $0x2000,%ecx
    12ea:	c1 ee 0d             	shr    $0xd,%esi
    12ed:	45 85 d2             	test   %r10d,%r10d
    12f0:	41 0f 95 c3          	setne  %r11b
    12f4:	41 20 f3             	and    %sil,%r11b
    12f7:	85 c9                	test   %ecx,%ecx
    12f9:	0f 45 ca             	cmovne %edx,%ecx
    12fc:	40 80 ff 49          	cmp    $0x49,%dil
    1300:	75 04                	jne    1306 <func0+0x86>
    1302:	85 d2                	test   %edx,%edx
    1304:	75 ba                	jne    12c0 <func0+0x40>
    1306:	45 31 d2             	xor    %r10d,%r10d
    1309:	80 fb 3f             	cmp    $0x3f,%bl
    130c:	77 b8                	ja     12c6 <func0+0x46>
    130e:	0f b6 d3             	movzbl %bl,%edx
    1311:	49 0f a3 d0          	bt     %rdx,%r8
    1315:	73 af                	jae    12c6 <func0+0x46>
    1317:	b9 01 00 00 00       	mov    $0x1,%ecx
    131c:	eb a8                	jmp    12c6 <func0+0x46>
    131e:	31 c0                	xor    %eax,%eax
    1320:	48 83 c4 08          	add    $0x8,%rsp
    1324:	5b                   	pop    %rbx
    1325:	41 5e                	pop    %r14
    1327:	c3                   	ret    

