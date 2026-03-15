00000000000012f0 <func0>:
    12f0:	55                   	push   %rbp
    12f1:	41 57                	push   %r15
    12f3:	41 56                	push   %r14
    12f5:	41 54                	push   %r12
    12f7:	53                   	push   %rbx
    12f8:	49 89 f6             	mov    %rsi,%r14
    12fb:	80 3f 00             	cmpb   $0x0,(%rdi)
    12fe:	0f 84 8c 00 00 00    	je     1390 <func0+0xa0>
    1304:	49 89 fc             	mov    %rdi,%r12
    1307:	31 db                	xor    %ebx,%ebx
    1309:	45 31 ff             	xor    %r15d,%r15d
    130c:	31 ed                	xor    %ebp,%ebp
    130e:	eb 12                	jmp    1322 <func0+0x32>
    1310:	ff c5                	inc    %ebp
    1312:	48 ff c3             	inc    %rbx
    1315:	4c 89 e7             	mov    %r12,%rdi
    1318:	e8 13 fd ff ff       	call   1030 <strlen@plt>
    131d:	48 39 d8             	cmp    %rbx,%rax
    1320:	76 4f                	jbe    1371 <func0+0x81>
    1322:	41 80 3c 1c 20       	cmpb   $0x20,(%r12,%rbx,1)
    1327:	74 e7                	je     1310 <func0+0x20>
    1329:	b0 5f                	mov    $0x5f,%al
    132b:	83 fd 01             	cmp    $0x1,%ebp
    132e:	74 21                	je     1351 <func0+0x61>
    1330:	83 fd 02             	cmp    $0x2,%ebp
    1333:	75 13                	jne    1348 <func0+0x58>
    1335:	41 8d 4f 01          	lea    0x1(%r15),%ecx
    1339:	49 63 d7             	movslq %r15d,%rdx
    133c:	41 c6 04 16 5f       	movb   $0x5f,(%r14,%rdx,1)
    1341:	bd 02 00 00 00       	mov    $0x2,%ebp
    1346:	eb 0c                	jmp    1354 <func0+0x64>
    1348:	7e 14                	jle    135e <func0+0x6e>
    134a:	b0 2d                	mov    $0x2d,%al
    134c:	bd 01 00 00 00       	mov    $0x1,%ebp
    1351:	44 89 f9             	mov    %r15d,%ecx
    1354:	41 01 ef             	add    %ebp,%r15d
    1357:	48 63 c9             	movslq %ecx,%rcx
    135a:	41 88 04 0e          	mov    %al,(%r14,%rcx,1)
    135e:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
    1363:	49 63 cf             	movslq %r15d,%rcx
    1366:	41 ff c7             	inc    %r15d
    1369:	41 88 04 0e          	mov    %al,(%r14,%rcx,1)
    136d:	31 ed                	xor    %ebp,%ebp
    136f:	eb a1                	jmp    1312 <func0+0x22>
    1371:	b0 5f                	mov    $0x5f,%al
    1373:	83 fd 01             	cmp    $0x1,%ebp
    1376:	74 26                	je     139e <func0+0xae>
    1378:	83 fd 02             	cmp    $0x2,%ebp
    137b:	75 18                	jne    1395 <func0+0xa5>
    137d:	41 8d 4f 01          	lea    0x1(%r15),%ecx
    1381:	49 63 d7             	movslq %r15d,%rdx
    1384:	41 c6 04 16 5f       	movb   $0x5f,(%r14,%rdx,1)
    1389:	bd 02 00 00 00       	mov    $0x2,%ebp
    138e:	eb 11                	jmp    13a1 <func0+0xb1>
    1390:	45 31 ff             	xor    %r15d,%r15d
    1393:	eb 16                	jmp    13ab <func0+0xbb>
    1395:	7e 14                	jle    13ab <func0+0xbb>
    1397:	b0 2d                	mov    $0x2d,%al
    1399:	bd 01 00 00 00       	mov    $0x1,%ebp
    139e:	44 89 f9             	mov    %r15d,%ecx
    13a1:	41 01 ef             	add    %ebp,%r15d
    13a4:	48 63 c9             	movslq %ecx,%rcx
    13a7:	41 88 04 0e          	mov    %al,(%r14,%rcx,1)
    13ab:	49 63 c7             	movslq %r15d,%rax
    13ae:	41 c6 04 06 00       	movb   $0x0,(%r14,%rax,1)
    13b3:	5b                   	pop    %rbx
    13b4:	41 5c                	pop    %r12
    13b6:	41 5e                	pop    %r14
    13b8:	41 5f                	pop    %r15
    13ba:	5d                   	pop    %rbp
    13bb:	c3                   	ret    

