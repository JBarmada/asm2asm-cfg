0000000000001330 <func0>:
    1330:	41 56                	push   %r14
    1332:	53                   	push   %rbx
    1333:	50                   	push   %rax
    1334:	85 f6                	test   %esi,%esi
    1336:	7e 5d                	jle    1395 <func0+0x65>
    1338:	48 89 fb             	mov    %rdi,%rbx
    133b:	41 89 f6             	mov    %esi,%r14d
    133e:	4a 8d 3c b5 00 00 00 	lea    0x0(,%r14,4),%rdi
    1345:	00 
    1346:	e8 05 fd ff ff       	call   1050 <malloc@plt>
    134b:	48 85 c0             	test   %rax,%rax
    134e:	74 45                	je     1395 <func0+0x65>
    1350:	8b 13                	mov    (%rbx),%edx
    1352:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
    1356:	45 89 f0             	mov    %r14d,%r8d
    1359:	41 83 e0 03          	and    $0x3,%r8d
    135d:	48 83 f9 03          	cmp    $0x3,%rcx
    1361:	73 3c                	jae    139f <func0+0x6f>
    1363:	31 f6                	xor    %esi,%esi
    1365:	4d 85 c0             	test   %r8,%r8
    1368:	74 2d                	je     1397 <func0+0x67>
    136a:	48 8d 3c b0          	lea    (%rax,%rsi,4),%rdi
    136e:	48 8d 34 b3          	lea    (%rbx,%rsi,4),%rsi
    1372:	31 db                	xor    %ebx,%ebx
    1374:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    137b:	00 00 00 00 00 
    1380:	8b 0c 9e             	mov    (%rsi,%rbx,4),%ecx
    1383:	39 d1                	cmp    %edx,%ecx
    1385:	0f 4f d1             	cmovg  %ecx,%edx
    1388:	89 14 9f             	mov    %edx,(%rdi,%rbx,4)
    138b:	48 ff c3             	inc    %rbx
    138e:	49 39 d8             	cmp    %rbx,%r8
    1391:	75 ed                	jne    1380 <func0+0x50>
    1393:	eb 02                	jmp    1397 <func0+0x67>
    1395:	31 c0                	xor    %eax,%eax
    1397:	48 83 c4 08          	add    $0x8,%rsp
    139b:	5b                   	pop    %rbx
    139c:	41 5e                	pop    %r14
    139e:	c3                   	ret    
    139f:	41 83 e6 fc          	and    $0xfffffffc,%r14d
    13a3:	31 f6                	xor    %esi,%esi
    13a5:	eb 16                	jmp    13bd <func0+0x8d>
    13a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    13ae:	00 00 
    13b0:	89 54 b0 0c          	mov    %edx,0xc(%rax,%rsi,4)
    13b4:	48 83 c6 04          	add    $0x4,%rsi
    13b8:	49 39 f6             	cmp    %rsi,%r14
    13bb:	74 a8                	je     1365 <func0+0x35>
    13bd:	8b 0c b3             	mov    (%rbx,%rsi,4),%ecx
    13c0:	39 d1                	cmp    %edx,%ecx
    13c2:	0f 4f d1             	cmovg  %ecx,%edx
    13c5:	89 14 b0             	mov    %edx,(%rax,%rsi,4)
    13c8:	8b 7c b3 04          	mov    0x4(%rbx,%rsi,4),%edi
    13cc:	39 d7                	cmp    %edx,%edi
    13ce:	7f 02                	jg     13d2 <func0+0xa2>
    13d0:	89 d7                	mov    %edx,%edi
    13d2:	89 7c b0 04          	mov    %edi,0x4(%rax,%rsi,4)
    13d6:	8b 4c b3 08          	mov    0x8(%rbx,%rsi,4),%ecx
    13da:	39 f9                	cmp    %edi,%ecx
    13dc:	7f 02                	jg     13e0 <func0+0xb0>
    13de:	89 f9                	mov    %edi,%ecx
    13e0:	89 4c b0 08          	mov    %ecx,0x8(%rax,%rsi,4)
    13e4:	8b 54 b3 0c          	mov    0xc(%rbx,%rsi,4),%edx
    13e8:	39 ca                	cmp    %ecx,%edx
    13ea:	7f c4                	jg     13b0 <func0+0x80>
    13ec:	89 ca                	mov    %ecx,%edx
    13ee:	eb c0                	jmp    13b0 <func0+0x80>

