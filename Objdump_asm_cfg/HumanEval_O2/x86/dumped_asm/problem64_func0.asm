00000000000012c0 <func0>:
    12c0:	55                   	push   %rbp
    12c1:	53                   	push   %rbx
    12c2:	48 81 ec 98 01 00 00 	sub    $0x198,%rsp
    12c9:	89 fb                	mov    %edi,%ebx
    12cb:	48 89 e7             	mov    %rsp,%rdi
    12ce:	31 ed                	xor    %ebp,%ebp
    12d0:	ba 90 01 00 00       	mov    $0x190,%edx
    12d5:	31 f6                	xor    %esi,%esi
    12d7:	e8 64 fd ff ff       	call   1040 <memset@plt>
    12dc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
    12e3:	00 
    12e4:	83 fb 03             	cmp    $0x3,%ebx
    12e7:	7c 71                	jl     135a <func0+0x9a>
    12e9:	41 89 d8             	mov    %ebx,%r8d
    12ec:	75 0c                	jne    12fa <func0+0x3a>
    12ee:	b9 03 00 00 00       	mov    $0x3,%ecx
    12f3:	ba 01 00 00 00       	mov    $0x1,%edx
    12f8:	eb 51                	jmp    134b <func0+0x8b>
    12fa:	49 8d 70 fe          	lea    -0x2(%r8),%rsi
    12fe:	48 83 e6 fe          	and    $0xfffffffffffffffe,%rsi
    1302:	48 f7 de             	neg    %rsi
    1305:	b9 03 00 00 00       	mov    $0x3,%ecx
    130a:	ba 01 00 00 00       	mov    $0x1,%edx
    130f:	31 ff                	xor    %edi,%edi
    1311:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1318:	0f 1f 84 00 00 00 00 
    131f:	00 
    1320:	8b 44 8c f8          	mov    -0x8(%rsp,%rcx,4),%eax
    1324:	8b 6c 8c fc          	mov    -0x4(%rsp,%rcx,4),%ebp
    1328:	01 c2                	add    %eax,%edx
    132a:	01 fa                	add    %edi,%edx
    132c:	89 14 8c             	mov    %edx,(%rsp,%rcx,4)
    132f:	01 ea                	add    %ebp,%edx
    1331:	01 c2                	add    %eax,%edx
    1333:	89 54 8c 04          	mov    %edx,0x4(%rsp,%rcx,4)
    1337:	48 8d 04 0e          	lea    (%rsi,%rcx,1),%rax
    133b:	48 83 c0 02          	add    $0x2,%rax
    133f:	48 83 c1 02          	add    $0x2,%rcx
    1343:	89 ef                	mov    %ebp,%edi
    1345:	48 83 f8 03          	cmp    $0x3,%rax
    1349:	75 d5                	jne    1320 <func0+0x60>
    134b:	41 f6 c0 01          	test   $0x1,%r8b
    134f:	74 09                	je     135a <func0+0x9a>
    1351:	03 54 8c f8          	add    -0x8(%rsp,%rcx,4),%edx
    1355:	01 ea                	add    %ebp,%edx
    1357:	89 14 8c             	mov    %edx,(%rsp,%rcx,4)
    135a:	48 63 c3             	movslq %ebx,%rax
    135d:	8b 04 84             	mov    (%rsp,%rax,4),%eax
    1360:	48 81 c4 98 01 00 00 	add    $0x198,%rsp
    1367:	5b                   	pop    %rbx
    1368:	5d                   	pop    %rbp
    1369:	c3                   	ret    

