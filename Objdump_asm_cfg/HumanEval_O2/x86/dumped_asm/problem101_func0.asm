0000000000001330 <func0>:
    1330:	55                   	push   %rbp
    1331:	53                   	push   %rbx
    1332:	50                   	push   %rax
    1333:	89 fd                	mov    %edi,%ebp
    1335:	48 63 df             	movslq %edi,%rbx
    1338:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
    133f:	00 
    1340:	e8 0b fd ff ff       	call   1050 <malloc@plt>
    1345:	89 18                	mov    %ebx,(%rax)
    1347:	83 fb 02             	cmp    $0x2,%ebx
    134a:	0f 8c 9f 00 00 00    	jl     13ef <func0+0xbf>
    1350:	89 e9                	mov    %ebp,%ecx
    1352:	8b 18                	mov    (%rax),%ebx
    1354:	48 8d 79 ff          	lea    -0x1(%rcx),%rdi
    1358:	48 83 c1 fe          	add    $0xfffffffffffffffe,%rcx
    135c:	89 fa                	mov    %edi,%edx
    135e:	83 e2 03             	and    $0x3,%edx
    1361:	be 01 00 00 00       	mov    $0x1,%esi
    1366:	48 83 f9 03          	cmp    $0x3,%rcx
    136a:	72 55                	jb     13c1 <func0+0x91>
    136c:	48 83 e7 fc          	and    $0xfffffffffffffffc,%rdi
    1370:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    1377:	31 c9                	xor    %ecx,%ecx
    1379:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1380:	8d 2c 0b             	lea    (%rbx,%rcx,1),%ebp
    1383:	83 c5 02             	add    $0x2,%ebp
    1386:	89 6c 48 04          	mov    %ebp,0x4(%rax,%rcx,2)
    138a:	8d 6c 0b 04          	lea    0x4(%rbx,%rcx,1),%ebp
    138e:	89 6c 48 08          	mov    %ebp,0x8(%rax,%rcx,2)
    1392:	8d 6c 0b 06          	lea    0x6(%rbx,%rcx,1),%ebp
    1396:	89 6c 48 0c          	mov    %ebp,0xc(%rax,%rcx,2)
    139a:	8d 2c 0b             	lea    (%rbx,%rcx,1),%ebp
    139d:	83 c5 08             	add    $0x8,%ebp
    13a0:	89 6c 48 10          	mov    %ebp,0x10(%rax,%rcx,2)
    13a4:	48 83 c1 08          	add    $0x8,%rcx
    13a8:	48 8d 2c 37          	lea    (%rdi,%rsi,1),%rbp
    13ac:	48 83 c5 fc          	add    $0xfffffffffffffffc,%rbp
    13b0:	48 83 c6 fc          	add    $0xfffffffffffffffc,%rsi
    13b4:	48 83 fd ff          	cmp    $0xffffffffffffffff,%rbp
    13b8:	75 c6                	jne    1380 <func0+0x50>
    13ba:	01 d9                	add    %ebx,%ecx
    13bc:	48 f7 de             	neg    %rsi
    13bf:	89 cb                	mov    %ecx,%ebx
    13c1:	48 85 d2             	test   %rdx,%rdx
    13c4:	74 29                	je     13ef <func0+0xbf>
    13c6:	83 c3 02             	add    $0x2,%ebx
    13c9:	48 8d 0c b0          	lea    (%rax,%rsi,4),%rcx
    13cd:	48 01 d2             	add    %rdx,%rdx
    13d0:	31 f6                	xor    %esi,%esi
    13d2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    13d9:	1f 84 00 00 00 00 00 
    13e0:	8d 3c 33             	lea    (%rbx,%rsi,1),%edi
    13e3:	89 3c 71             	mov    %edi,(%rcx,%rsi,2)
    13e6:	48 83 c6 02          	add    $0x2,%rsi
    13ea:	48 39 f2             	cmp    %rsi,%rdx
    13ed:	75 f1                	jne    13e0 <func0+0xb0>
    13ef:	48 83 c4 08          	add    $0x8,%rsp
    13f3:	5b                   	pop    %rbx
    13f4:	5d                   	pop    %rbp
    13f5:	c3                   	ret    

