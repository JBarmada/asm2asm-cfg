0000000000001430 <func0>:
    1430:	55                   	push   %rbp
    1431:	41 57                	push   %r15
    1433:	41 56                	push   %r14
    1435:	53                   	push   %rbx
    1436:	85 f6                	test   %esi,%esi
    1438:	0f 8e af 00 00 00    	jle    14ed <func0+0xbd>
    143e:	41 89 f2             	mov    %esi,%r10d
    1441:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    1447:	45 31 c0             	xor    %r8d,%r8d
    144a:	eb 10                	jmp    145c <func0+0x2c>
    144c:	0f 1f 40 00          	nopl   0x0(%rax)
    1450:	49 ff c1             	inc    %r9
    1453:	4d 39 d0             	cmp    %r10,%r8
    1456:	0f 84 91 00 00 00    	je     14ed <func0+0xbd>
    145c:	4d 89 c3             	mov    %r8,%r11
    145f:	49 ff c0             	inc    %r8
    1462:	4d 39 d0             	cmp    %r10,%r8
    1465:	73 e9                	jae    1450 <func0+0x20>
    1467:	4c 89 c9             	mov    %r9,%rcx
    146a:	eb 14                	jmp    1480 <func0+0x50>
    146c:	0f 1f 40 00          	nopl   0x0(%rax)
    1470:	46 89 3c 9f          	mov    %r15d,(%rdi,%r11,4)
    1474:	44 89 34 8f          	mov    %r14d,(%rdi,%rcx,4)
    1478:	48 ff c1             	inc    %rcx
    147b:	4c 39 d1             	cmp    %r10,%rcx
    147e:	74 d0                	je     1450 <func0+0x20>
    1480:	46 8b 34 9f          	mov    (%rdi,%r11,4),%r14d
    1484:	31 c0                	xor    %eax,%eax
    1486:	be 00 00 00 00       	mov    $0x0,%esi
    148b:	45 85 f6             	test   %r14d,%r14d
    148e:	7e 20                	jle    14b0 <func0+0x80>
    1490:	31 f6                	xor    %esi,%esi
    1492:	44 89 f2             	mov    %r14d,%edx
    1495:	44 89 f3             	mov    %r14d,%ebx
    1498:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    149f:	00 
    14a0:	89 d5                	mov    %edx,%ebp
    14a2:	83 e5 01             	and    $0x1,%ebp
    14a5:	01 ee                	add    %ebp,%esi
    14a7:	d1 eb                	shr    %ebx
    14a9:	83 fa 02             	cmp    $0x2,%edx
    14ac:	89 da                	mov    %ebx,%edx
    14ae:	73 f0                	jae    14a0 <func0+0x70>
    14b0:	44 8b 3c 8f          	mov    (%rdi,%rcx,4),%r15d
    14b4:	45 85 ff             	test   %r15d,%r15d
    14b7:	7e 27                	jle    14e0 <func0+0xb0>
    14b9:	31 c0                	xor    %eax,%eax
    14bb:	44 89 fa             	mov    %r15d,%edx
    14be:	44 89 fd             	mov    %r15d,%ebp
    14c1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    14c8:	0f 1f 84 00 00 00 00 
    14cf:	00 
    14d0:	89 d3                	mov    %edx,%ebx
    14d2:	83 e3 01             	and    $0x1,%ebx
    14d5:	01 d8                	add    %ebx,%eax
    14d7:	d1 ed                	shr    %ebp
    14d9:	83 fa 01             	cmp    $0x1,%edx
    14dc:	89 ea                	mov    %ebp,%edx
    14de:	77 f0                	ja     14d0 <func0+0xa0>
    14e0:	39 f0                	cmp    %esi,%eax
    14e2:	72 8c                	jb     1470 <func0+0x40>
    14e4:	75 92                	jne    1478 <func0+0x48>
    14e6:	45 39 f7             	cmp    %r14d,%r15d
    14e9:	7c 85                	jl     1470 <func0+0x40>
    14eb:	eb 8b                	jmp    1478 <func0+0x48>
    14ed:	5b                   	pop    %rbx
    14ee:	41 5e                	pop    %r14
    14f0:	41 5f                	pop    %r15
    14f2:	5d                   	pop    %rbp
    14f3:	c3                   	ret    

