0000000000001330 <func0>:
    1330:	85 f6                	test   %esi,%esi
    1332:	7e 57                	jle    138b <func0+0x5b>
    1334:	41 89 f0             	mov    %esi,%r8d
    1337:	45 31 d2             	xor    %r10d,%r10d
    133a:	be cd cc cc cc       	mov    $0xcccccccd,%esi
    133f:	31 c0                	xor    %eax,%eax
    1341:	eb 15                	jmp    1358 <func0+0x28>
    1343:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    134a:	84 00 00 00 00 00 
    1350:	49 ff c2             	inc    %r10
    1353:	4d 39 c2             	cmp    %r8,%r10
    1356:	74 35                	je     138d <func0+0x5d>
    1358:	46 8b 0c 97          	mov    (%rdi,%r10,4),%r9d
    135c:	41 83 f9 0b          	cmp    $0xb,%r9d
    1360:	7c ee                	jl     1350 <func0+0x20>
    1362:	44 89 c9             	mov    %r9d,%ecx
    1365:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    136c:	00 00 00 00 
    1370:	89 ca                	mov    %ecx,%edx
    1372:	89 c9                	mov    %ecx,%ecx
    1374:	48 0f af ce          	imul   %rsi,%rcx
    1378:	48 c1 e9 23          	shr    $0x23,%rcx
    137c:	83 fa 63             	cmp    $0x63,%edx
    137f:	77 ef                	ja     1370 <func0+0x40>
    1381:	44 21 c9             	and    %r9d,%ecx
    1384:	83 e1 01             	and    $0x1,%ecx
    1387:	01 c8                	add    %ecx,%eax
    1389:	eb c5                	jmp    1350 <func0+0x20>
    138b:	31 c0                	xor    %eax,%eax
    138d:	c3                   	ret    

