0000000000001250 <func0>:
    1250:	53                   	push   %rbx
    1251:	48 81 ec a0 0f 00 00 	sub    $0xfa0,%rsp
    1258:	89 fb                	mov    %edi,%ebx
    125a:	48 89 e7             	mov    %rsp,%rdi
    125d:	ba a0 0f 00 00       	mov    $0xfa0,%edx
    1262:	31 f6                	xor    %esi,%esi
    1264:	e8 d7 fd ff ff       	call   1040 <memset@plt>
    1269:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%rsp)
    1270:	00 
    1271:	83 fb 02             	cmp    $0x2,%ebx
    1274:	0f 8c 85 00 00 00    	jl     12ff <func0+0xaf>
    127a:	89 d9                	mov    %ebx,%ecx
    127c:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
    1280:	48 83 c1 fe          	add    $0xfffffffffffffffe,%rcx
    1284:	89 d0                	mov    %edx,%eax
    1286:	83 e0 03             	and    $0x3,%eax
    1289:	48 83 f9 03          	cmp    $0x3,%rcx
    128d:	73 0c                	jae    129b <func0+0x4b>
    128f:	be 02 00 00 00       	mov    $0x2,%esi
    1294:	b9 01 00 00 00       	mov    $0x1,%ecx
    1299:	eb 44                	jmp    12df <func0+0x8f>
    129b:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
    129f:	48 f7 da             	neg    %rdx
    12a2:	be 02 00 00 00       	mov    $0x2,%esi
    12a7:	b9 01 00 00 00       	mov    $0x1,%ecx
    12ac:	0f 1f 40 00          	nopl   0x0(%rax)
    12b0:	03 4c b4 f8          	add    -0x8(%rsp,%rsi,4),%ecx
    12b4:	89 0c b4             	mov    %ecx,(%rsp,%rsi,4)
    12b7:	8b 7c b4 fc          	mov    -0x4(%rsp,%rsi,4),%edi
    12bb:	01 cf                	add    %ecx,%edi
    12bd:	89 7c b4 04          	mov    %edi,0x4(%rsp,%rsi,4)
    12c1:	01 f9                	add    %edi,%ecx
    12c3:	89 4c b4 08          	mov    %ecx,0x8(%rsp,%rsi,4)
    12c7:	01 f9                	add    %edi,%ecx
    12c9:	89 4c b4 0c          	mov    %ecx,0xc(%rsp,%rsi,4)
    12cd:	48 8d 3c 32          	lea    (%rdx,%rsi,1),%rdi
    12d1:	48 83 c7 04          	add    $0x4,%rdi
    12d5:	48 83 c6 04          	add    $0x4,%rsi
    12d9:	48 83 ff 02          	cmp    $0x2,%rdi
    12dd:	75 d1                	jne    12b0 <func0+0x60>
    12df:	48 85 c0             	test   %rax,%rax
    12e2:	74 1b                	je     12ff <func0+0xaf>
    12e4:	48 8d 14 b4          	lea    (%rsp,%rsi,4),%rdx
    12e8:	31 f6                	xor    %esi,%esi
    12ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12f0:	03 4c b2 f8          	add    -0x8(%rdx,%rsi,4),%ecx
    12f4:	89 0c b2             	mov    %ecx,(%rdx,%rsi,4)
    12f7:	48 ff c6             	inc    %rsi
    12fa:	48 39 f0             	cmp    %rsi,%rax
    12fd:	75 f1                	jne    12f0 <func0+0xa0>
    12ff:	48 63 c3             	movslq %ebx,%rax
    1302:	8b 04 84             	mov    (%rsp,%rax,4),%eax
    1305:	48 81 c4 a0 0f 00 00 	add    $0xfa0,%rsp
    130c:	5b                   	pop    %rbx
    130d:	c3                   	ret    

