00000000000012c0 <func0>:
    12c0:	55                   	push   %rbp
    12c1:	41 56                	push   %r14
    12c3:	53                   	push   %rbx
    12c4:	89 fd                	mov    %edi,%ebp
    12c6:	bf 40 00 00 00       	mov    $0x40,%edi
    12cb:	e8 b0 fd ff ff       	call   1080 <malloc@plt>
    12d0:	48 85 c0             	test   %rax,%rax
    12d3:	74 34                	je     1309 <func0+0x49>
    12d5:	48 89 c3             	mov    %rax,%rbx
    12d8:	c6 40 3f 00          	movb   $0x0,0x3f(%rax)
    12dc:	85 ed                	test   %ebp,%ebp
    12de:	74 2d                	je     130d <func0+0x4d>
    12e0:	7e 36                	jle    1318 <func0+0x58>
    12e2:	b8 3e 00 00 00       	mov    $0x3e,%eax
    12e7:	89 e9                	mov    %ebp,%ecx
    12e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    12f0:	89 ea                	mov    %ebp,%edx
    12f2:	80 e2 01             	and    $0x1,%dl
    12f5:	80 ca 30             	or     $0x30,%dl
    12f8:	88 14 03             	mov    %dl,(%rbx,%rax,1)
    12fb:	48 ff c8             	dec    %rax
    12fe:	d1 e9                	shr    %ecx
    1300:	83 fd 01             	cmp    $0x1,%ebp
    1303:	89 cd                	mov    %ecx,%ebp
    1305:	77 e9                	ja     12f0 <func0+0x30>
    1307:	eb 14                	jmp    131d <func0+0x5d>
    1309:	31 ed                	xor    %ebp,%ebp
    130b:	eb 62                	jmp    136f <func0+0xaf>
    130d:	c6 43 3e 30          	movb   $0x30,0x3e(%rbx)
    1311:	b8 3d 00 00 00       	mov    $0x3d,%eax
    1316:	eb 05                	jmp    131d <func0+0x5d>
    1318:	b8 3e 00 00 00       	mov    $0x3e,%eax
    131d:	4c 63 f0             	movslq %eax,%r14
    1320:	66 41 c7 44 1e ff 64 	movw   $0x6264,-0x1(%r14,%rbx,1)
    1327:	62 
    1328:	b8 42 00 00 00       	mov    $0x42,%eax
    132d:	44 29 f0             	sub    %r14d,%eax
    1330:	48 63 f8             	movslq %eax,%rdi
    1333:	e8 48 fd ff ff       	call   1080 <malloc@plt>
    1338:	48 85 c0             	test   %rax,%rax
    133b:	74 28                	je     1365 <func0+0xa5>
    133d:	48 89 c5             	mov    %rax,%rbp
    1340:	49 8d 34 1e          	lea    (%r14,%rbx,1),%rsi
    1344:	48 ff ce             	dec    %rsi
    1347:	48 89 c7             	mov    %rax,%rdi
    134a:	e8 f1 fc ff ff       	call   1040 <strcpy@plt>
    134f:	48 89 ef             	mov    %rbp,%rdi
    1352:	e8 f9 fc ff ff       	call   1050 <strlen@plt>
    1357:	66 c7 44 05 00 64 62 	movw   $0x6264,0x0(%rbp,%rax,1)
    135e:	c6 44 05 02 00       	movb   $0x0,0x2(%rbp,%rax,1)
    1363:	eb 02                	jmp    1367 <func0+0xa7>
    1365:	31 ed                	xor    %ebp,%ebp
    1367:	48 89 df             	mov    %rbx,%rdi
    136a:	e8 c1 fc ff ff       	call   1030 <free@plt>
    136f:	48 89 e8             	mov    %rbp,%rax
    1372:	5b                   	pop    %rbx
    1373:	41 5e                	pop    %r14
    1375:	5d                   	pop    %rbp
    1376:	c3                   	ret    

