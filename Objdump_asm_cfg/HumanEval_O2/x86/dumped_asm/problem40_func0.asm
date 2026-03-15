0000000000001350 <func0>:
    1350:	45 31 c9             	xor    %r9d,%r9d
    1353:	b8 02 00 00 00       	mov    $0x2,%eax
    1358:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    135e:	eb 18                	jmp    1378 <func0+0x28>
    1360:	85 d2                	test   %edx,%edx
    1362:	0f 95 c2             	setne  %dl
    1365:	44 89 c0             	mov    %r8d,%eax
    1368:	01 c8                	add    %ecx,%eax
    136a:	0f b6 d2             	movzbl %dl,%edx
    136d:	41 01 d1             	add    %edx,%r9d
    1370:	41 89 c8             	mov    %ecx,%r8d
    1373:	41 39 f9             	cmp    %edi,%r9d
    1376:	74 2e                	je     13a6 <func0+0x56>
    1378:	41 39 f9             	cmp    %edi,%r9d
    137b:	7d 2c                	jge    13a9 <func0+0x59>
    137d:	89 c1                	mov    %eax,%ecx
    137f:	b2 01                	mov    $0x1,%dl
    1381:	83 f8 04             	cmp    $0x4,%eax
    1384:	7c df                	jl     1365 <func0+0x15>
    1386:	be 02 00 00 00       	mov    $0x2,%esi
    138b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1390:	89 c8                	mov    %ecx,%eax
    1392:	99                   	cltd   
    1393:	f7 fe                	idiv   %esi
    1395:	85 d2                	test   %edx,%edx
    1397:	74 c7                	je     1360 <func0+0x10>
    1399:	ff c6                	inc    %esi
    139b:	89 f0                	mov    %esi,%eax
    139d:	0f af c6             	imul   %esi,%eax
    13a0:	39 c8                	cmp    %ecx,%eax
    13a2:	7e ec                	jle    1390 <func0+0x40>
    13a4:	eb ba                	jmp    1360 <func0+0x10>
    13a6:	89 c8                	mov    %ecx,%eax
    13a8:	c3                   	ret    
    13a9:	31 c0                	xor    %eax,%eax
    13ab:	c3                   	ret    

