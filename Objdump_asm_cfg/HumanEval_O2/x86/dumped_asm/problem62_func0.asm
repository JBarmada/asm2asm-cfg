00000000000013c0 <func0>:
    13c0:	41 56                	push   %r14
    13c2:	53                   	push   %rbx
    13c3:	50                   	push   %rax
    13c4:	49 89 fe             	mov    %rdi,%r14
    13c7:	e8 64 fc ff ff       	call   1030 <strlen@plt>
    13cc:	48 85 c0             	test   %rax,%rax
    13cf:	74 55                	je     1426 <func0+0x66>
    13d1:	41 0f b6 16          	movzbl (%r14),%edx
    13d5:	31 c9                	xor    %ecx,%ecx
    13d7:	80 fa 28             	cmp    $0x28,%dl
    13da:	0f 94 c1             	sete   %cl
    13dd:	31 f6                	xor    %esi,%esi
    13df:	80 fa 29             	cmp    $0x29,%dl
    13e2:	40 0f 94 c6          	sete   %sil
    13e6:	29 f1                	sub    %esi,%ecx
    13e8:	78 42                	js     142c <func0+0x6c>
    13ea:	be 01 00 00 00       	mov    $0x1,%esi
    13ef:	90                   	nop
    13f0:	48 89 f2             	mov    %rsi,%rdx
    13f3:	48 39 f0             	cmp    %rsi,%rax
    13f6:	74 26                	je     141e <func0+0x5e>
    13f8:	41 0f b6 1c 16       	movzbl (%r14,%rdx,1),%ebx
    13fd:	31 f6                	xor    %esi,%esi
    13ff:	80 fb 28             	cmp    $0x28,%bl
    1402:	40 0f 94 c6          	sete   %sil
    1406:	01 f1                	add    %esi,%ecx
    1408:	31 ff                	xor    %edi,%edi
    140a:	80 fb 29             	cmp    $0x29,%bl
    140d:	40 0f 94 c7          	sete   %dil
    1411:	48 8d 72 01          	lea    0x1(%rdx),%rsi
    1415:	29 f9                	sub    %edi,%ecx
    1417:	79 d7                	jns    13f0 <func0+0x30>
    1419:	b9 01 00 00 00       	mov    $0x1,%ecx
    141e:	48 39 d0             	cmp    %rdx,%rax
    1421:	0f 96 c2             	setbe  %dl
    1424:	eb 0d                	jmp    1433 <func0+0x73>
    1426:	31 c9                	xor    %ecx,%ecx
    1428:	b2 01                	mov    $0x1,%dl
    142a:	eb 07                	jmp    1433 <func0+0x73>
    142c:	31 d2                	xor    %edx,%edx
    142e:	b9 01 00 00 00       	mov    $0x1,%ecx
    1433:	85 c9                	test   %ecx,%ecx
    1435:	0f 94 c0             	sete   %al
    1438:	20 d0                	and    %dl,%al
    143a:	48 83 c4 08          	add    $0x8,%rsp
    143e:	5b                   	pop    %rbx
    143f:	41 5e                	pop    %r14
    1441:	c3                   	ret    

