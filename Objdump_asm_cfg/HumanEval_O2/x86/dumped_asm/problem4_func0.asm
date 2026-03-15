0000000000001320 <func0>:
    1320:	85 f6                	test   %esi,%esi
    1322:	7e 36                	jle    135a <func0+0x3a>
    1324:	8b 07                	mov    (%rdi),%eax
    1326:	85 c0                	test   %eax,%eax
    1328:	78 33                	js     135d <func0+0x3d>
    132a:	89 f1                	mov    %esi,%ecx
    132c:	be 01 00 00 00       	mov    $0x1,%esi
    1331:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1338:	0f 1f 84 00 00 00 00 
    133f:	00 
    1340:	48 89 f2             	mov    %rsi,%rdx
    1343:	48 39 f1             	cmp    %rsi,%rcx
    1346:	74 09                	je     1351 <func0+0x31>
    1348:	48 8d 72 01          	lea    0x1(%rdx),%rsi
    134c:	03 04 97             	add    (%rdi,%rdx,4),%eax
    134f:	79 ef                	jns    1340 <func0+0x20>
    1351:	31 c0                	xor    %eax,%eax
    1353:	48 39 ca             	cmp    %rcx,%rdx
    1356:	0f 92 c0             	setb   %al
    1359:	c3                   	ret    
    135a:	31 c0                	xor    %eax,%eax
    135c:	c3                   	ret    
    135d:	b8 01 00 00 00       	mov    $0x1,%eax
    1362:	c3                   	ret    

