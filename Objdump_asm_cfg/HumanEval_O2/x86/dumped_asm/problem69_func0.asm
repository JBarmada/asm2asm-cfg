0000000000001450 <func0>:
    1450:	53                   	push   %rbx
    1451:	85 f6                	test   %esi,%esi
    1453:	7e 53                	jle    14a8 <func0+0x58>
    1455:	48 89 d0             	mov    %rdx,%rax
    1458:	41 89 f0             	mov    %esi,%r8d
    145b:	83 fe 01             	cmp    $0x1,%esi
    145e:	75 4c                	jne    14ac <func0+0x5c>
    1460:	41 ba ff ff ff 7f    	mov    $0x7fffffff,%r10d
    1466:	41 bb ff ff ff ff    	mov    $0xffffffff,%r11d
    146c:	31 f6                	xor    %esi,%esi
    146e:	41 f6 c0 01          	test   $0x1,%r8b
    1472:	74 25                	je     1499 <func0+0x49>
    1474:	8b 3c b7             	mov    (%rdi,%rsi,4),%edi
    1477:	40 f6 c7 01          	test   $0x1,%dil
    147b:	75 1c                	jne    1499 <func0+0x49>
    147d:	44 39 d7             	cmp    %r10d,%edi
    1480:	41 0f 9c c0          	setl   %r8b
    1484:	41 83 fb ff          	cmp    $0xffffffff,%r11d
    1488:	0f 94 c1             	sete   %cl
    148b:	44 08 c1             	or     %r8b,%cl
    148e:	44 0f 45 d7          	cmovne %edi,%r10d
    1492:	41 0f 44 f3          	cmove  %r11d,%esi
    1496:	41 89 f3             	mov    %esi,%r11d
    1499:	41 83 fb ff          	cmp    $0xffffffff,%r11d
    149d:	74 09                	je     14a8 <func0+0x58>
    149f:	44 89 10             	mov    %r10d,(%rax)
    14a2:	44 89 58 04          	mov    %r11d,0x4(%rax)
    14a6:	5b                   	pop    %rbx
    14a7:	c3                   	ret    
    14a8:	31 c0                	xor    %eax,%eax
    14aa:	5b                   	pop    %rbx
    14ab:	c3                   	ret    
    14ac:	45 89 c1             	mov    %r8d,%r9d
    14af:	41 83 e1 fe          	and    $0xfffffffe,%r9d
    14b3:	41 ba ff ff ff 7f    	mov    $0x7fffffff,%r10d
    14b9:	41 bb ff ff ff ff    	mov    $0xffffffff,%r11d
    14bf:	31 f6                	xor    %esi,%esi
    14c1:	eb 16                	jmp    14d9 <func0+0x89>
    14c3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    14ca:	84 00 00 00 00 00 
    14d0:	48 83 c6 02          	add    $0x2,%rsi
    14d4:	49 39 f1             	cmp    %rsi,%r9
    14d7:	74 95                	je     146e <func0+0x1e>
    14d9:	8b 0c b7             	mov    (%rdi,%rsi,4),%ecx
    14dc:	f6 c1 01             	test   $0x1,%cl
    14df:	75 17                	jne    14f8 <func0+0xa8>
    14e1:	44 39 d1             	cmp    %r10d,%ecx
    14e4:	0f 9c c2             	setl   %dl
    14e7:	41 83 fb ff          	cmp    $0xffffffff,%r11d
    14eb:	0f 94 c3             	sete   %bl
    14ee:	08 d3                	or     %dl,%bl
    14f0:	44 0f 45 d1          	cmovne %ecx,%r10d
    14f4:	44 0f 45 de          	cmovne %esi,%r11d
    14f8:	8b 4c b7 04          	mov    0x4(%rdi,%rsi,4),%ecx
    14fc:	f6 c1 01             	test   $0x1,%cl
    14ff:	75 cf                	jne    14d0 <func0+0x80>
    1501:	44 39 d1             	cmp    %r10d,%ecx
    1504:	0f 9c c2             	setl   %dl
    1507:	41 83 fb ff          	cmp    $0xffffffff,%r11d
    150b:	0f 94 c3             	sete   %bl
    150e:	08 d3                	or     %dl,%bl
    1510:	8d 56 01             	lea    0x1(%rsi),%edx
    1513:	84 db                	test   %bl,%bl
    1515:	44 0f 45 d1          	cmovne %ecx,%r10d
    1519:	44 0f 45 da          	cmovne %edx,%r11d
    151d:	eb b1                	jmp    14d0 <func0+0x80>

