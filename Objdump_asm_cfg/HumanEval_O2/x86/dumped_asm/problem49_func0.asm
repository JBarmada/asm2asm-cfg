00000000000012c0 <func0>:
    12c0:	53                   	push   %rbx
    12c1:	48 89 fb             	mov    %rdi,%rbx
    12c4:	e8 67 fd ff ff       	call   1030 <strlen@plt>
    12c9:	b1 01                	mov    $0x1,%cl
    12cb:	83 f8 02             	cmp    $0x2,%eax
    12ce:	7c 69                	jl     1339 <func0+0x79>
    12d0:	0f b6 0b             	movzbl (%rbx),%ecx
    12d3:	8d 50 ff             	lea    -0x1(%rax),%edx
    12d6:	48 63 d2             	movslq %edx,%rdx
    12d9:	3a 0c 13             	cmp    (%rbx,%rdx,1),%cl
    12dc:	75 59                	jne    1337 <func0+0x77>
    12de:	49 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%r8
    12e5:	ff ff ff 
    12e8:	41 89 c1             	mov    %eax,%r9d
    12eb:	41 d1 e9             	shr    %r9d
    12ee:	48 c1 e0 20          	shl    $0x20,%rax
    12f2:	48 be 00 00 00 00 fe 	movabs $0xfffffffe00000000,%rsi
    12f9:	ff ff ff 
    12fc:	48 01 c6             	add    %rax,%rsi
    12ff:	bf 01 00 00 00       	mov    $0x1,%edi
    1304:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    130b:	00 00 00 00 00 
    1310:	48 89 f8             	mov    %rdi,%rax
    1313:	49 39 f9             	cmp    %rdi,%r9
    1316:	74 17                	je     132f <func0+0x6f>
    1318:	0f b6 14 03          	movzbl (%rbx,%rax,1),%edx
    131c:	48 89 f1             	mov    %rsi,%rcx
    131f:	48 c1 f9 20          	sar    $0x20,%rcx
    1323:	4c 01 c6             	add    %r8,%rsi
    1326:	48 8d 78 01          	lea    0x1(%rax),%rdi
    132a:	3a 14 0b             	cmp    (%rbx,%rcx,1),%dl
    132d:	74 e1                	je     1310 <func0+0x50>
    132f:	4c 39 c8             	cmp    %r9,%rax
    1332:	0f 93 c1             	setae  %cl
    1335:	eb 02                	jmp    1339 <func0+0x79>
    1337:	31 c9                	xor    %ecx,%ecx
    1339:	89 c8                	mov    %ecx,%eax
    133b:	5b                   	pop    %rbx
    133c:	c3                   	ret    

