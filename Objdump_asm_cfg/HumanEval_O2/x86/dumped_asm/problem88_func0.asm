0000000000001430 <func0>:
    1430:	55                   	push   %rbp
    1431:	41 57                	push   %r15
    1433:	41 56                	push   %r14
    1435:	41 55                	push   %r13
    1437:	41 54                	push   %r12
    1439:	53                   	push   %rbx
    143a:	48 83 ec 28          	sub    $0x28,%rsp
    143e:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
    1443:	89 cd                	mov    %ecx,%ebp
    1445:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    144a:	41 89 f5             	mov    %esi,%r13d
    144d:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
    1452:	bf 20 03 00 00       	mov    $0x320,%edi
    1457:	e8 f4 fb ff ff       	call   1050 <malloc@plt>
    145c:	48 89 04 24          	mov    %rax,(%rsp)
    1460:	45 85 ed             	test   %r13d,%r13d
    1463:	0f 8e 84 00 00 00    	jle    14ed <func0+0xbd>
    1469:	44 89 e8             	mov    %r13d,%eax
    146c:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1471:	45 31 e4             	xor    %r12d,%r12d
    1474:	45 31 f6             	xor    %r14d,%r14d
    1477:	eb 11                	jmp    148a <func0+0x5a>
    1479:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1480:	49 ff c4             	inc    %r12
    1483:	4c 3b 64 24 18       	cmp    0x18(%rsp),%r12
    1488:	74 66                	je     14f0 <func0+0xc0>
    148a:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    148f:	46 8b 2c a0          	mov    (%rax,%r12,4),%r13d
    1493:	45 85 ed             	test   %r13d,%r13d
    1496:	7e e8                	jle    1480 <func0+0x50>
    1498:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    149d:	4e 8b 3c e0          	mov    (%rax,%r12,8),%r15
    14a1:	eb 1a                	jmp    14bd <func0+0x8d>
    14a3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    14aa:	84 00 00 00 00 00 
    14b0:	48 8d 43 01          	lea    0x1(%rbx),%rax
    14b4:	49 89 dd             	mov    %rbx,%r13
    14b7:	48 83 f8 01          	cmp    $0x1,%rax
    14bb:	76 c3                	jbe    1480 <func0+0x50>
    14bd:	49 8d 5d ff          	lea    -0x1(%r13),%rbx
    14c1:	89 d8                	mov    %ebx,%eax
    14c3:	41 39 2c 87          	cmp    %ebp,(%r15,%rax,4)
    14c7:	75 e7                	jne    14b0 <func0+0x80>
    14c9:	41 ff cd             	dec    %r13d
    14cc:	bf 08 00 00 00       	mov    $0x8,%edi
    14d1:	e8 7a fb ff ff       	call   1050 <malloc@plt>
    14d6:	4d 63 f6             	movslq %r14d,%r14
    14d9:	48 8b 0c 24          	mov    (%rsp),%rcx
    14dd:	4a 89 04 f1          	mov    %rax,(%rcx,%r14,8)
    14e1:	44 89 20             	mov    %r12d,(%rax)
    14e4:	44 89 68 04          	mov    %r13d,0x4(%rax)
    14e8:	41 ff c6             	inc    %r14d
    14eb:	eb c3                	jmp    14b0 <func0+0x80>
    14ed:	45 31 f6             	xor    %r14d,%r14d
    14f0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    14f5:	44 89 30             	mov    %r14d,(%rax)
    14f8:	48 8b 04 24          	mov    (%rsp),%rax
    14fc:	48 83 c4 28          	add    $0x28,%rsp
    1500:	5b                   	pop    %rbx
    1501:	41 5c                	pop    %r12
    1503:	41 5d                	pop    %r13
    1505:	41 5e                	pop    %r14
    1507:	41 5f                	pop    %r15
    1509:	5d                   	pop    %rbp
    150a:	c3                   	ret    

