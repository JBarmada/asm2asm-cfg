0000000000001210 <func0>:
    1210:	85 ff                	test   %edi,%edi
    1212:	7e 31                	jle    1245 <func0+0x35>
    1214:	41 89 f8             	mov    %edi,%r8d
    1217:	49 8d 40 ff          	lea    -0x1(%r8),%rax
    121b:	45 89 c1             	mov    %r8d,%r9d
    121e:	41 83 e1 07          	and    $0x7,%r9d
    1222:	48 83 f8 07          	cmp    $0x7,%rax
    1226:	73 23                	jae    124b <func0+0x3b>
    1228:	ba 01 00 00 00       	mov    $0x1,%edx
    122d:	b8 01 00 00 00       	mov    $0x1,%eax
    1232:	bf 01 00 00 00       	mov    $0x1,%edi
    1237:	4d 85 c9             	test   %r9,%r9
    123a:	0f 85 b0 00 00 00    	jne    12f0 <func0+0xe0>
    1240:	e9 bb 00 00 00       	jmp    1300 <func0+0xf0>
    1245:	b8 01 00 00 00       	mov    $0x1,%eax
    124a:	c3                   	ret    
    124b:	41 83 e0 f8          	and    $0xfffffff8,%r8d
    124f:	49 f7 d8             	neg    %r8
    1252:	b8 01 00 00 00       	mov    $0x1,%eax
    1257:	ba 08 00 00 00       	mov    $0x8,%edx
    125c:	bf 01 00 00 00       	mov    $0x1,%edi
    1261:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1268:	0f 1f 84 00 00 00 00 
    126f:	00 
    1270:	48 8d 72 f9          	lea    -0x7(%rdx),%rsi
    1274:	48 0f af f7          	imul   %rdi,%rsi
    1278:	48 0f af c6          	imul   %rsi,%rax
    127c:	48 8d 7a fa          	lea    -0x6(%rdx),%rdi
    1280:	48 0f af fe          	imul   %rsi,%rdi
    1284:	48 0f af c7          	imul   %rdi,%rax
    1288:	48 8d 72 fb          	lea    -0x5(%rdx),%rsi
    128c:	48 0f af f7          	imul   %rdi,%rsi
    1290:	48 0f af c6          	imul   %rsi,%rax
    1294:	48 8d 7a fc          	lea    -0x4(%rdx),%rdi
    1298:	48 0f af fe          	imul   %rsi,%rdi
    129c:	48 0f af c7          	imul   %rdi,%rax
    12a0:	48 8d 72 fd          	lea    -0x3(%rdx),%rsi
    12a4:	48 0f af f7          	imul   %rdi,%rsi
    12a8:	48 0f af c6          	imul   %rsi,%rax
    12ac:	48 8d 4a fe          	lea    -0x2(%rdx),%rcx
    12b0:	48 0f af ce          	imul   %rsi,%rcx
    12b4:	48 0f af c1          	imul   %rcx,%rax
    12b8:	48 8d 7a ff          	lea    -0x1(%rdx),%rdi
    12bc:	48 0f af f9          	imul   %rcx,%rdi
    12c0:	48 0f af c7          	imul   %rdi,%rax
    12c4:	48 0f af fa          	imul   %rdx,%rdi
    12c8:	48 0f af c7          	imul   %rdi,%rax
    12cc:	49 8d 0c 10          	lea    (%r8,%rdx,1),%rcx
    12d0:	48 83 c1 08          	add    $0x8,%rcx
    12d4:	48 83 c2 08          	add    $0x8,%rdx
    12d8:	48 83 f9 08          	cmp    $0x8,%rcx
    12dc:	75 92                	jne    1270 <func0+0x60>
    12de:	48 83 c2 f9          	add    $0xfffffffffffffff9,%rdx
    12e2:	4d 85 c9             	test   %r9,%r9
    12e5:	74 19                	je     1300 <func0+0xf0>
    12e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    12ee:	00 00 
    12f0:	48 0f af fa          	imul   %rdx,%rdi
    12f4:	48 0f af c7          	imul   %rdi,%rax
    12f8:	48 ff c2             	inc    %rdx
    12fb:	49 ff c9             	dec    %r9
    12fe:	75 f0                	jne    12f0 <func0+0xe0>
    1300:	c3                   	ret    

