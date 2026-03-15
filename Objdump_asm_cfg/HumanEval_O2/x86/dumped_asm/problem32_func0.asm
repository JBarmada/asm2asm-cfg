00000000000013d0 <func0>:
    13d0:	48 83 ff 02          	cmp    $0x2,%rdi
    13d4:	7d 03                	jge    13d9 <func0+0x9>
    13d6:	31 c0                	xor    %eax,%eax
    13d8:	c3                   	ret    
    13d9:	b0 01                	mov    $0x1,%al
    13db:	48 83 ff 04          	cmp    $0x4,%rdi
    13df:	72 4f                	jb     1430 <func0+0x60>
    13e1:	b9 02 00 00 00       	mov    $0x2,%ecx
    13e6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    13ed:	00 00 00 
    13f0:	48 89 f8             	mov    %rdi,%rax
    13f3:	48 09 c8             	or     %rcx,%rax
    13f6:	48 c1 e8 20          	shr    $0x20,%rax
    13fa:	74 14                	je     1410 <func0+0x40>
    13fc:	48 89 f8             	mov    %rdi,%rax
    13ff:	48 99                	cqto   
    1401:	48 f7 f9             	idiv   %rcx
    1404:	48 85 d2             	test   %rdx,%rdx
    1407:	75 12                	jne    141b <func0+0x4b>
    1409:	eb 1f                	jmp    142a <func0+0x5a>
    140b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1410:	89 f8                	mov    %edi,%eax
    1412:	31 d2                	xor    %edx,%edx
    1414:	f7 f1                	div    %ecx
    1416:	48 85 d2             	test   %rdx,%rdx
    1419:	74 0f                	je     142a <func0+0x5a>
    141b:	48 ff c1             	inc    %rcx
    141e:	48 89 c8             	mov    %rcx,%rax
    1421:	48 0f af c1          	imul   %rcx,%rax
    1425:	48 39 f8             	cmp    %rdi,%rax
    1428:	7e c6                	jle    13f0 <func0+0x20>
    142a:	48 85 d2             	test   %rdx,%rdx
    142d:	0f 95 c0             	setne  %al
    1430:	c3                   	ret    

