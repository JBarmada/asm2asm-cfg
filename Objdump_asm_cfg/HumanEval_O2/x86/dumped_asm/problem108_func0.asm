00000000000013e0 <func0>:
    13e0:	55                   	push   %rbp
    13e1:	41 56                	push   %r14
    13e3:	53                   	push   %rbx
    13e4:	41 89 fe             	mov    %edi,%r14d
    13e7:	bf 08 00 00 00       	mov    $0x8,%edi
    13ec:	e8 5f fc ff ff       	call   1050 <malloc@plt>
    13f1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    13f8:	45 85 f6             	test   %r14d,%r14d
    13fb:	7e 74                	jle    1471 <func0+0x91>
    13fd:	be 01 00 00 00       	mov    $0x1,%esi
    1402:	45 31 c0             	xor    %r8d,%r8d
    1405:	45 31 c9             	xor    %r9d,%r9d
    1408:	eb 17                	jmp    1421 <func0+0x41>
    140a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1410:	41 ff c1             	inc    %r9d
    1413:	44 89 48 04          	mov    %r9d,0x4(%rax)
    1417:	8d 4e 01             	lea    0x1(%rsi),%ecx
    141a:	44 39 f6             	cmp    %r14d,%esi
    141d:	89 ce                	mov    %ecx,%esi
    141f:	74 50                	je     1471 <func0+0x91>
    1421:	89 f7                	mov    %esi,%edi
    1423:	31 c9                	xor    %ecx,%ecx
    1425:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    142c:	00 00 00 00 
    1430:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
    1433:	48 63 ef             	movslq %edi,%rbp
    1436:	48 69 fd 67 66 66 66 	imul   $0x66666667,%rbp,%rdi
    143d:	48 89 fb             	mov    %rdi,%rbx
    1440:	48 c1 eb 3f          	shr    $0x3f,%rbx
    1444:	48 c1 ff 22          	sar    $0x22,%rdi
    1448:	01 df                	add    %ebx,%edi
    144a:	8d 1c 3f             	lea    (%rdi,%rdi,1),%ebx
    144d:	8d 1c 9b             	lea    (%rbx,%rbx,4),%ebx
    1450:	89 ea                	mov    %ebp,%edx
    1452:	29 da                	sub    %ebx,%edx
    1454:	8d 0c 4a             	lea    (%rdx,%rcx,2),%ecx
    1457:	83 c5 09             	add    $0x9,%ebp
    145a:	83 fd 12             	cmp    $0x12,%ebp
    145d:	77 d1                	ja     1430 <func0+0x50>
    145f:	39 ce                	cmp    %ecx,%esi
    1461:	75 b4                	jne    1417 <func0+0x37>
    1463:	40 f6 c6 01          	test   $0x1,%sil
    1467:	75 a7                	jne    1410 <func0+0x30>
    1469:	41 ff c0             	inc    %r8d
    146c:	44 89 00             	mov    %r8d,(%rax)
    146f:	eb a6                	jmp    1417 <func0+0x37>
    1471:	5b                   	pop    %rbx
    1472:	41 5e                	pop    %r14
    1474:	5d                   	pop    %rbp
    1475:	c3                   	ret    

