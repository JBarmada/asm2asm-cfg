0000000000001300 <func0>:
    1300:	85 f6                	test   %esi,%esi
    1302:	7e 24                	jle    1328 <func0+0x28>
    1304:	39 17                	cmp    %edx,(%rdi)
    1306:	7d 23                	jge    132b <func0+0x2b>
    1308:	89 f0                	mov    %esi,%eax
    130a:	be 01 00 00 00       	mov    $0x1,%esi
    130f:	90                   	nop
    1310:	48 89 f1             	mov    %rsi,%rcx
    1313:	48 39 f0             	cmp    %rsi,%rax
    1316:	74 09                	je     1321 <func0+0x21>
    1318:	48 8d 71 01          	lea    0x1(%rcx),%rsi
    131c:	39 14 8f             	cmp    %edx,(%rdi,%rcx,4)
    131f:	7c ef                	jl     1310 <func0+0x10>
    1321:	48 39 c1             	cmp    %rax,%rcx
    1324:	0f 93 c0             	setae  %al
    1327:	c3                   	ret    
    1328:	b0 01                	mov    $0x1,%al
    132a:	c3                   	ret    
    132b:	31 c0                	xor    %eax,%eax
    132d:	c3                   	ret    

