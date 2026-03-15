0000000000001430 <func0>:
    1430:	41 56                	push   %r14
    1432:	53                   	push   %rbx
    1433:	50                   	push   %rax
    1434:	49 89 fe             	mov    %rdi,%r14
    1437:	e8 f4 fb ff ff       	call   1030 <strlen@plt>
    143c:	48 85 c0             	test   %rax,%rax
    143f:	74 72                	je     14b3 <func0+0x83>
    1441:	41 0f b6 16          	movzbl (%r14),%edx
    1445:	31 c9                	xor    %ecx,%ecx
    1447:	80 fa 5b             	cmp    $0x5b,%dl
    144a:	0f 94 c1             	sete   %cl
    144d:	31 f6                	xor    %esi,%esi
    144f:	80 fa 5d             	cmp    $0x5d,%dl
    1452:	40 0f 94 c6          	sete   %sil
    1456:	29 f1                	sub    %esi,%ecx
    1458:	45 31 c0             	xor    %r8d,%r8d
    145b:	85 c9                	test   %ecx,%ecx
    145d:	41 0f 4e c8          	cmovle %r8d,%ecx
    1461:	bf 01 00 00 00       	mov    $0x1,%edi
    1466:	89 ce                	mov    %ecx,%esi
    1468:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    146f:	00 
    1470:	48 89 fa             	mov    %rdi,%rdx
    1473:	48 39 f8             	cmp    %rdi,%rax
    1476:	74 31                	je     14a9 <func0+0x79>
    1478:	41 0f b6 1c 16       	movzbl (%r14,%rdx,1),%ebx
    147d:	31 ff                	xor    %edi,%edi
    147f:	80 fb 5b             	cmp    $0x5b,%bl
    1482:	40 0f 94 c7          	sete   %dil
    1486:	01 fe                	add    %edi,%esi
    1488:	31 ff                	xor    %edi,%edi
    148a:	80 fb 5d             	cmp    $0x5d,%bl
    148d:	40 0f 94 c7          	sete   %dil
    1491:	29 fe                	sub    %edi,%esi
    1493:	85 f6                	test   %esi,%esi
    1495:	41 0f 4e f0          	cmovle %r8d,%esi
    1499:	39 ce                	cmp    %ecx,%esi
    149b:	0f 4f ce             	cmovg  %esi,%ecx
    149e:	8d 59 fe             	lea    -0x2(%rcx),%ebx
    14a1:	48 8d 7a 01          	lea    0x1(%rdx),%rdi
    14a5:	39 de                	cmp    %ebx,%esi
    14a7:	7f c7                	jg     1470 <func0+0x40>
    14a9:	31 c9                	xor    %ecx,%ecx
    14ab:	48 39 d0             	cmp    %rdx,%rax
    14ae:	0f 97 c1             	seta   %cl
    14b1:	eb 02                	jmp    14b5 <func0+0x85>
    14b3:	31 c9                	xor    %ecx,%ecx
    14b5:	89 c8                	mov    %ecx,%eax
    14b7:	48 83 c4 08          	add    $0x8,%rsp
    14bb:	5b                   	pop    %rbx
    14bc:	41 5e                	pop    %r14
    14be:	c3                   	ret    

