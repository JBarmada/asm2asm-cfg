0000000000001420 <func0>:
    1420:	55                   	push   %rbp
    1421:	41 57                	push   %r15
    1423:	41 56                	push   %r14
    1425:	41 55                	push   %r13
    1427:	41 54                	push   %r12
    1429:	53                   	push   %rbx
    142a:	48 83 ec 28          	sub    $0x28,%rsp
    142e:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
    1433:	48 89 fb             	mov    %rdi,%rbx
    1436:	c6 44 24 0e 00       	movb   $0x0,0xe(%rsp)
    143b:	66 c7 44 24 0c 00 00 	movw   $0x0,0xc(%rsp)
    1442:	e8 09 fc ff ff       	call   1050 <strlen@plt>
    1447:	48 89 c5             	mov    %rax,%rbp
    144a:	83 c0 02             	add    $0x2,%eax
    144d:	48 63 f8             	movslq %eax,%rdi
    1450:	e8 1b fc ff ff       	call   1070 <malloc@plt>
    1455:	48 89 c7             	mov    %rax,%rdi
    1458:	48 89 de             	mov    %rbx,%rsi
    145b:	48 89 c3             	mov    %rax,%rbx
    145e:	e8 dd fb ff ff       	call   1040 <strcpy@plt>
    1463:	48 89 df             	mov    %rbx,%rdi
    1466:	e8 e5 fb ff ff       	call   1050 <strlen@plt>
    146b:	48 89 ea             	mov    %rbp,%rdx
    146e:	66 c7 04 03 20 00    	movw   $0x20,(%rbx,%rax,1)
    1474:	81 fa fe ff ff 7f    	cmp    $0x7ffffffe,%edx
    147a:	0f 87 64 01 00 00    	ja     15e4 <func0+0x1c4>
    1480:	ff c2                	inc    %edx
    1482:	45 31 f6             	xor    %r14d,%r14d
    1485:	45 31 ed             	xor    %r13d,%r13d
    1488:	31 ed                	xor    %ebp,%ebp
    148a:	45 31 e4             	xor    %r12d,%r12d
    148d:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
    1492:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
    1497:	eb 1f                	jmp    14b8 <func0+0x98>
    1499:	48 63 c5             	movslq %ebp,%rax
    149c:	ff c5                	inc    %ebp
    149e:	41 c7 44 85 00 01 00 	movl   $0x1,0x0(%r13,%rax,4)
    14a5:	00 00 
    14a7:	c6 44 24 0c 00       	movb   $0x0,0xc(%rsp)
    14ac:	49 ff c6             	inc    %r14
    14af:	4c 39 f2             	cmp    %r14,%rdx
    14b2:	0f 84 31 01 00 00    	je     15e9 <func0+0x1c9>
    14b8:	46 0f b6 3c 33       	movzbl (%rbx,%r14,1),%r15d
    14bd:	41 80 ff 20          	cmp    $0x20,%r15b
    14c1:	0f 85 f9 00 00 00    	jne    15c0 <func0+0x1a0>
    14c7:	66 83 7c 24 0c 6f    	cmpw   $0x6f,0xc(%rsp)
    14cd:	75 3a                	jne    1509 <func0+0xe9>
    14cf:	44 39 e5             	cmp    %r12d,%ebp
    14d2:	75 27                	jne    14fb <func0+0xdb>
    14d4:	44 8d 64 2d 00       	lea    0x0(%rbp,%rbp,1),%r12d
    14d9:	85 ed                	test   %ebp,%ebp
    14db:	b8 04 00 00 00       	mov    $0x4,%eax
    14e0:	44 0f 4e e0          	cmovle %eax,%r12d
    14e4:	49 63 f4             	movslq %r12d,%rsi
    14e7:	48 c1 e6 02          	shl    $0x2,%rsi
    14eb:	4c 89 ef             	mov    %r13,%rdi
    14ee:	e8 8d fb ff ff       	call   1080 <realloc@plt>
    14f3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    14f8:	49 89 c5             	mov    %rax,%r13
    14fb:	48 63 c5             	movslq %ebp,%rax
    14fe:	ff c5                	inc    %ebp
    1500:	41 c7 44 85 00 04 00 	movl   $0x4,0x0(%r13,%rax,4)
    1507:	00 00 
    1509:	0f b7 44 24 0c       	movzwl 0xc(%rsp),%eax
    150e:	35 6f 7c 00 00       	xor    $0x7c6f,%eax
    1513:	0f b6 4c 24 0e       	movzbl 0xe(%rsp),%ecx
    1518:	66 09 c1             	or     %ax,%cx
    151b:	75 41                	jne    155e <func0+0x13e>
    151d:	44 39 e5             	cmp    %r12d,%ebp
    1520:	75 2e                	jne    1550 <func0+0x130>
    1522:	43 8d 1c 24          	lea    (%r12,%r12,1),%ebx
    1526:	45 85 e4             	test   %r12d,%r12d
    1529:	b8 04 00 00 00       	mov    $0x4,%eax
    152e:	0f 4e d8             	cmovle %eax,%ebx
    1531:	48 63 f3             	movslq %ebx,%rsi
    1534:	48 c1 e6 02          	shl    $0x2,%rsi
    1538:	4c 89 ef             	mov    %r13,%rdi
    153b:	e8 40 fb ff ff       	call   1080 <realloc@plt>
    1540:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    1545:	49 89 c5             	mov    %rax,%r13
    1548:	41 89 dc             	mov    %ebx,%r12d
    154b:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
    1550:	48 63 c5             	movslq %ebp,%rax
    1553:	ff c5                	inc    %ebp
    1555:	41 c7 44 85 00 02 00 	movl   $0x2,0x0(%r13,%rax,4)
    155c:	00 00 
    155e:	0f b7 44 24 0c       	movzwl 0xc(%rsp),%eax
    1563:	35 2e 7c 00 00       	xor    $0x7c2e,%eax
    1568:	0f b6 4c 24 0e       	movzbl 0xe(%rsp),%ecx
    156d:	66 09 c1             	or     %ax,%cx
    1570:	0f 85 31 ff ff ff    	jne    14a7 <func0+0x87>
    1576:	44 39 e5             	cmp    %r12d,%ebp
    1579:	0f 85 1a ff ff ff    	jne    1499 <func0+0x79>
    157f:	43 8d 1c 24          	lea    (%r12,%r12,1),%ebx
    1583:	45 85 e4             	test   %r12d,%r12d
    1586:	b8 04 00 00 00       	mov    $0x4,%eax
    158b:	0f 4e d8             	cmovle %eax,%ebx
    158e:	48 63 f3             	movslq %ebx,%rsi
    1591:	48 c1 e6 02          	shl    $0x2,%rsi
    1595:	4c 89 ef             	mov    %r13,%rdi
    1598:	e8 e3 fa ff ff       	call   1080 <realloc@plt>
    159d:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    15a2:	49 89 c5             	mov    %rax,%r13
    15a5:	41 89 dc             	mov    %ebx,%r12d
    15a8:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
    15ad:	e9 e7 fe ff ff       	jmp    1499 <func0+0x79>
    15b2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    15b9:	1f 84 00 00 00 00 00 
    15c0:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
    15c5:	e8 86 fa ff ff       	call   1050 <strlen@plt>
    15ca:	48 83 f8 01          	cmp    $0x1,%rax
    15ce:	77 0a                	ja     15da <func0+0x1ba>
    15d0:	44 88 7c 04 0c       	mov    %r15b,0xc(%rsp,%rax,1)
    15d5:	c6 44 04 0d 00       	movb   $0x0,0xd(%rsp,%rax,1)
    15da:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    15df:	e9 c8 fe ff ff       	jmp    14ac <func0+0x8c>
    15e4:	31 ed                	xor    %ebp,%ebp
    15e6:	45 31 ed             	xor    %r13d,%r13d
    15e9:	48 89 df             	mov    %rbx,%rdi
    15ec:	e8 3f fa ff ff       	call   1030 <free@plt>
    15f1:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    15f6:	89 28                	mov    %ebp,(%rax)
    15f8:	4c 89 e8             	mov    %r13,%rax
    15fb:	48 83 c4 28          	add    $0x28,%rsp
    15ff:	5b                   	pop    %rbx
    1600:	41 5c                	pop    %r12
    1602:	41 5d                	pop    %r13
    1604:	41 5e                	pop    %r14
    1606:	41 5f                	pop    %r15
    1608:	5d                   	pop    %rbp
    1609:	c3                   	ret    

