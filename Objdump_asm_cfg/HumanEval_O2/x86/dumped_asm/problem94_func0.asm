0000000000001300 <func0>:
    1300:	55                   	push   %rbp
    1301:	41 57                	push   %r15
    1303:	41 56                	push   %r14
    1305:	41 55                	push   %r13
    1307:	41 54                	push   %r12
    1309:	53                   	push   %rbx
    130a:	50                   	push   %rax
    130b:	49 89 f6             	mov    %rsi,%r14
    130e:	0f b6 1f             	movzbl (%rdi),%ebx
    1311:	84 db                	test   %bl,%bl
    1313:	0f 84 87 00 00 00    	je     13a0 <func0+0xa0>
    1319:	49 89 ff             	mov    %rdi,%r15
    131c:	31 ed                	xor    %ebp,%ebp
    131e:	e8 3d fd ff ff       	call   1060 <__ctype_b_loc@plt>
    1323:	49 89 c4             	mov    %rax,%r12
    1326:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    132d:	00 00 00 
    1330:	49 8b 04 24          	mov    (%r12),%rax
    1334:	4c 0f be eb          	movsbq %bl,%r13
    1338:	42 0f b7 04 68       	movzwl (%rax,%r13,2),%eax
    133d:	a9 00 02 00 00       	test   $0x200,%eax
    1342:	75 1c                	jne    1360 <func0+0x60>
    1344:	a9 00 01 00 00       	test   $0x100,%eax
    1349:	74 22                	je     136d <func0+0x6d>
    134b:	e8 00 fd ff ff       	call   1050 <__ctype_tolower_loc@plt>
    1350:	eb 13                	jmp    1365 <func0+0x65>
    1352:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1359:	1f 84 00 00 00 00 00 
    1360:	e8 cb fc ff ff       	call   1030 <__ctype_toupper_loc@plt>
    1365:	48 8b 00             	mov    (%rax),%rax
    1368:	42 0f b6 1c a8       	movzbl (%rax,%r13,4),%ebx
    136d:	0f b6 c3             	movzbl %bl,%eax
    1370:	83 c0 bf             	add    $0xffffffbf,%eax
    1373:	83 f8 34             	cmp    $0x34,%eax
    1376:	77 13                	ja     138b <func0+0x8b>
    1378:	48 b9 11 41 10 00 11 	movabs $0x10411100104111,%rcx
    137f:	41 10 00 
    1382:	48 0f a3 c1          	bt     %rax,%rcx
    1386:	73 03                	jae    138b <func0+0x8b>
    1388:	80 c3 02             	add    $0x2,%bl
    138b:	41 88 1c 2e          	mov    %bl,(%r14,%rbp,1)
    138f:	41 0f b6 5c 2f 01    	movzbl 0x1(%r15,%rbp,1),%ebx
    1395:	48 ff c5             	inc    %rbp
    1398:	84 db                	test   %bl,%bl
    139a:	75 94                	jne    1330 <func0+0x30>
    139c:	89 e8                	mov    %ebp,%eax
    139e:	eb 02                	jmp    13a2 <func0+0xa2>
    13a0:	31 c0                	xor    %eax,%eax
    13a2:	41 c6 04 06 00       	movb   $0x0,(%r14,%rax,1)
    13a7:	48 83 c4 08          	add    $0x8,%rsp
    13ab:	5b                   	pop    %rbx
    13ac:	41 5c                	pop    %r12
    13ae:	41 5d                	pop    %r13
    13b0:	41 5e                	pop    %r14
    13b2:	41 5f                	pop    %r15
    13b4:	5d                   	pop    %rbp
    13b5:	c3                   	ret    

