00000000000012f0 <func0>:
    12f0:	53                   	push   %rbx
    12f1:	48 89 fb             	mov    %rdi,%rbx
    12f4:	e8 37 fd ff ff       	call   1030 <strlen@plt>
    12f9:	48 83 f8 03          	cmp    $0x3,%rax
    12fd:	73 04                	jae    1303 <func0+0x13>
    12ff:	31 c0                	xor    %eax,%eax
    1301:	eb 3a                	jmp    133d <func0+0x4d>
    1303:	48 89 c7             	mov    %rax,%rdi
    1306:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
    130a:	b0 01                	mov    $0x1,%al
    130c:	3a 4b 01             	cmp    0x1(%rbx),%cl
    130f:	74 2a                	je     133b <func0+0x4b>
    1311:	b0 01                	mov    $0x1,%al
    1313:	be 03 00 00 00       	mov    $0x3,%esi
    1318:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    131f:	00 
    1320:	3a 4c 33 fd          	cmp    -0x3(%rbx,%rsi,1),%cl
    1324:	74 15                	je     133b <func0+0x4b>
    1326:	48 39 f7             	cmp    %rsi,%rdi
    1329:	0f 97 c0             	seta   %al
    132c:	74 0d                	je     133b <func0+0x4b>
    132e:	0f b6 14 33          	movzbl (%rbx,%rsi,1),%edx
    1332:	48 ff c6             	inc    %rsi
    1335:	38 ca                	cmp    %cl,%dl
    1337:	89 d1                	mov    %edx,%ecx
    1339:	75 e5                	jne    1320 <func0+0x30>
    133b:	34 01                	xor    $0x1,%al
    133d:	24 01                	and    $0x1,%al
    133f:	5b                   	pop    %rbx
    1340:	c3                   	ret    

