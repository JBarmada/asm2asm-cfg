00000000000013c0 <func0>:
    13c0:	55                   	push   %rbp
    13c1:	41 57                	push   %r15
    13c3:	41 56                	push   %r14
    13c5:	41 54                	push   %r12
    13c7:	53                   	push   %rbx
    13c8:	85 f6                	test   %esi,%esi
    13ca:	7e 79                	jle    1445 <func0+0x85>
    13cc:	41 89 f0             	mov    %esi,%r8d
    13cf:	b0 01                	mov    $0x1,%al
    13d1:	41 be 02 00 00 00    	mov    $0x2,%r14d
    13d7:	41 bf 01 00 00 00    	mov    $0x1,%r15d
    13dd:	45 31 c9             	xor    %r9d,%r9d
    13e0:	41 89 c2             	mov    %eax,%r10d
    13e3:	4d 89 cb             	mov    %r9,%r11
    13e6:	49 ff c1             	inc    %r9
    13e9:	4d 89 fc             	mov    %r15,%r12
    13ec:	4c 89 f1             	mov    %r14,%rcx
    13ef:	4d 39 c1             	cmp    %r8,%r9
    13f2:	0f 92 c0             	setb   %al
    13f5:	72 21                	jb     1418 <func0+0x58>
    13f7:	49 ff c6             	inc    %r14
    13fa:	49 ff c7             	inc    %r15
    13fd:	4d 39 c1             	cmp    %r8,%r9
    1400:	75 de                	jne    13e0 <func0+0x20>
    1402:	eb 43                	jmp    1447 <func0+0x87>
    1404:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    140b:	00 00 00 00 00 
    1410:	48 ff c1             	inc    %rcx
    1413:	4d 39 c4             	cmp    %r8,%r12
    1416:	74 df                	je     13f7 <func0+0x37>
    1418:	4c 89 e2             	mov    %r12,%rdx
    141b:	49 ff c4             	inc    %r12
    141e:	41 39 f4             	cmp    %esi,%r12d
    1421:	7d ed                	jge    1410 <func0+0x50>
    1423:	8b 2c 97             	mov    (%rdi,%rdx,4),%ebp
    1426:	42 03 2c 9f          	add    (%rdi,%r11,4),%ebp
    142a:	48 89 ca             	mov    %rcx,%rdx
    142d:	0f 1f 00             	nopl   (%rax)
    1430:	8b 1c 97             	mov    (%rdi,%rdx,4),%ebx
    1433:	01 eb                	add    %ebp,%ebx
    1435:	74 09                	je     1440 <func0+0x80>
    1437:	48 ff c2             	inc    %rdx
    143a:	39 f2                	cmp    %esi,%edx
    143c:	7c f2                	jl     1430 <func0+0x70>
    143e:	eb d0                	jmp    1410 <func0+0x50>
    1440:	44 89 d0             	mov    %r10d,%eax
    1443:	eb 02                	jmp    1447 <func0+0x87>
    1445:	31 c0                	xor    %eax,%eax
    1447:	24 01                	and    $0x1,%al
    1449:	5b                   	pop    %rbx
    144a:	41 5c                	pop    %r12
    144c:	41 5e                	pop    %r14
    144e:	41 5f                	pop    %r15
    1450:	5d                   	pop    %rbp
    1451:	c3                   	ret    

