0000000000001350 <func0>:
    1350:	31 c0                	xor    %eax,%eax
    1352:	83 ff 02             	cmp    $0x2,%edi
    1355:	7c 19                	jl     1370 <func0+0x20>
    1357:	31 c9                	xor    %ecx,%ecx
    1359:	83 ff 04             	cmp    $0x4,%edi
    135c:	73 13                	jae    1371 <func0+0x21>
    135e:	31 d2                	xor    %edx,%edx
    1360:	83 ff 02             	cmp    $0x2,%edi
    1363:	0f 9d c2             	setge  %dl
    1366:	01 ca                	add    %ecx,%edx
    1368:	31 c0                	xor    %eax,%eax
    136a:	83 fa 03             	cmp    $0x3,%edx
    136d:	0f 94 c0             	sete   %al
    1370:	c3                   	ret    
    1371:	31 c9                	xor    %ecx,%ecx
    1373:	be 02 00 00 00       	mov    $0x2,%esi
    1378:	eb 11                	jmp    138b <func0+0x3b>
    137a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1380:	ff c6                	inc    %esi
    1382:	89 f0                	mov    %esi,%eax
    1384:	0f af c6             	imul   %esi,%eax
    1387:	39 f8                	cmp    %edi,%eax
    1389:	7f d3                	jg     135e <func0+0xe>
    138b:	89 f8                	mov    %edi,%eax
    138d:	0f 1f 00             	nopl   (%rax)
    1390:	99                   	cltd   
    1391:	f7 fe                	idiv   %esi
    1393:	85 d2                	test   %edx,%edx
    1395:	75 e9                	jne    1380 <func0+0x30>
    1397:	89 f8                	mov    %edi,%eax
    1399:	99                   	cltd   
    139a:	f7 fe                	idiv   %esi
    139c:	ff c1                	inc    %ecx
    139e:	89 c7                	mov    %eax,%edi
    13a0:	eb ee                	jmp    1390 <func0+0x40>

