00000000000012f0 <func0>:
    12f0:	55                   	push   %rbp
    12f1:	41 57                	push   %r15
    12f3:	41 56                	push   %r14
    12f5:	41 54                	push   %r12
    12f7:	53                   	push   %rbx
    12f8:	49 89 f6             	mov    %rsi,%r14
    12fb:	48 89 fb             	mov    %rdi,%rbx
    12fe:	31 c9                	xor    %ecx,%ecx
    1300:	31 ed                	xor    %ebp,%ebp
    1302:	45 31 ff             	xor    %r15d,%r15d
    1305:	31 c0                	xor    %eax,%eax
    1307:	eb 0e                	jmp    1317 <func0+0x27>
    1309:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1310:	85 d2                	test   %edx,%edx
    1312:	74 49                	je     135d <func0+0x6d>
    1314:	48 ff c3             	inc    %rbx
    1317:	0f b6 13             	movzbl (%rbx),%edx
    131a:	83 fa 28             	cmp    $0x28,%edx
    131d:	74 31                	je     1350 <func0+0x60>
    131f:	83 fa 29             	cmp    $0x29,%edx
    1322:	75 ec                	jne    1310 <func0+0x20>
    1324:	ff c9                	dec    %ecx
    1326:	75 ec                	jne    1314 <func0+0x24>
    1328:	4d 63 e7             	movslq %r15d,%r12
    132b:	41 ff c7             	inc    %r15d
    132e:	4a 8d 34 a5 04 00 00 	lea    0x4(,%r12,4),%rsi
    1335:	00 
    1336:	48 89 c7             	mov    %rax,%rdi
    1339:	e8 12 fd ff ff       	call   1050 <realloc@plt>
    133e:	42 89 2c a0          	mov    %ebp,(%rax,%r12,4)
    1342:	31 c9                	xor    %ecx,%ecx
    1344:	31 ed                	xor    %ebp,%ebp
    1346:	eb cc                	jmp    1314 <func0+0x24>
    1348:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    134f:	00 
    1350:	39 e9                	cmp    %ebp,%ecx
    1352:	8d 49 01             	lea    0x1(%rcx),%ecx
    1355:	0f 4d e9             	cmovge %ecx,%ebp
    1358:	48 ff c3             	inc    %rbx
    135b:	eb ba                	jmp    1317 <func0+0x27>
    135d:	45 89 3e             	mov    %r15d,(%r14)
    1360:	5b                   	pop    %rbx
    1361:	41 5c                	pop    %r12
    1363:	41 5e                	pop    %r14
    1365:	41 5f                	pop    %r15
    1367:	5d                   	pop    %rbp
    1368:	c3                   	ret    

