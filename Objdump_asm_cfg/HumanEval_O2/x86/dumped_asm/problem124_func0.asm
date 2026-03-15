0000000000001380 <func0>:
    1380:	55                   	push   %rbp
    1381:	41 56                	push   %r14
    1383:	53                   	push   %rbx
    1384:	49 89 d6             	mov    %rdx,%r14
    1387:	48 89 f0             	mov    %rsi,%rax
    138a:	c7 02 01 00 00 00    	movl   $0x1,(%rdx)
    1390:	c7 06 01 00 00 00    	movl   $0x1,(%rsi)
    1396:	83 ff 01             	cmp    $0x1,%edi
    1399:	75 5b                	jne    13f6 <func0+0x76>
    139b:	41 83 3e 02          	cmpl   $0x2,(%r14)
    139f:	7c 50                	jl     13f1 <func0+0x71>
    13a1:	b9 01 00 00 00       	mov    $0x1,%ecx
    13a6:	eb 19                	jmp    13c1 <func0+0x41>
    13a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    13af:	00 
    13b0:	48 63 f6             	movslq %esi,%rsi
    13b3:	89 14 b0             	mov    %edx,(%rax,%rsi,4)
    13b6:	48 ff c1             	inc    %rcx
    13b9:	49 63 16             	movslq (%r14),%rdx
    13bc:	48 39 d1             	cmp    %rdx,%rcx
    13bf:	7d 30                	jge    13f1 <func0+0x71>
    13c1:	8b 14 88             	mov    (%rax,%rcx,4),%edx
    13c4:	48 89 ce             	mov    %rcx,%rsi
    13c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    13ce:	00 00 
    13d0:	48 8d 7e ff          	lea    -0x1(%rsi),%rdi
    13d4:	89 fd                	mov    %edi,%ebp
    13d6:	8b 2c a8             	mov    (%rax,%rbp,4),%ebp
    13d9:	39 d5                	cmp    %edx,%ebp
    13db:	7e d3                	jle    13b0 <func0+0x30>
    13dd:	89 2c b0             	mov    %ebp,(%rax,%rsi,4)
    13e0:	48 8d 6f 01          	lea    0x1(%rdi),%rbp
    13e4:	48 89 fe             	mov    %rdi,%rsi
    13e7:	48 83 fd 01          	cmp    $0x1,%rbp
    13eb:	7f e3                	jg     13d0 <func0+0x50>
    13ed:	31 f6                	xor    %esi,%esi
    13ef:	eb bf                	jmp    13b0 <func0+0x30>
    13f1:	5b                   	pop    %rbx
    13f2:	41 5e                	pop    %r14
    13f4:	5d                   	pop    %rbp
    13f5:	c3                   	ret    
    13f6:	89 fb                	mov    %edi,%ebx
    13f8:	bd 0a 00 00 00       	mov    $0xa,%ebp
    13fd:	eb 11                	jmp    1410 <func0+0x90>
    13ff:	90                   	nop
    1400:	89 d9                	mov    %ebx,%ecx
    1402:	c1 e9 1f             	shr    $0x1f,%ecx
    1405:	01 d9                	add    %ebx,%ecx
    1407:	d1 f9                	sar    %ecx
    1409:	89 cb                	mov    %ecx,%ebx
    140b:	83 fb 01             	cmp    $0x1,%ebx
    140e:	74 8b                	je     139b <func0+0x1b>
    1410:	89 d9                	mov    %ebx,%ecx
    1412:	81 e1 01 00 00 80    	and    $0x80000001,%ecx
    1418:	83 f9 01             	cmp    $0x1,%ecx
    141b:	75 e3                	jne    1400 <func0+0x80>
    141d:	41 8b 0e             	mov    (%r14),%ecx
    1420:	39 e9                	cmp    %ebp,%ecx
    1422:	7c 14                	jl     1438 <func0+0xb8>
    1424:	01 ed                	add    %ebp,%ebp
    1426:	48 63 f5             	movslq %ebp,%rsi
    1429:	48 c1 e6 02          	shl    $0x2,%rsi
    142d:	48 89 c7             	mov    %rax,%rdi
    1430:	e8 2b fc ff ff       	call   1060 <realloc@plt>
    1435:	41 8b 0e             	mov    (%r14),%ecx
    1438:	8d 51 01             	lea    0x1(%rcx),%edx
    143b:	41 89 16             	mov    %edx,(%r14)
    143e:	48 63 c9             	movslq %ecx,%rcx
    1441:	89 1c 88             	mov    %ebx,(%rax,%rcx,4)
    1444:	8d 1c 5b             	lea    (%rbx,%rbx,2),%ebx
    1447:	ff c3                	inc    %ebx
    1449:	eb c0                	jmp    140b <func0+0x8b>

