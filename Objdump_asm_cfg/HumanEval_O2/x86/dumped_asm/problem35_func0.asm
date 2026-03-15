0000000000001230 <func0>:
    1230:	55                   	push   %rbp
    1231:	41 57                	push   %r15
    1233:	41 56                	push   %r14
    1235:	53                   	push   %rbx
    1236:	50                   	push   %rax
    1237:	49 89 d6             	mov    %rdx,%r14
    123a:	89 f5                	mov    %esi,%ebp
    123c:	49 89 ff             	mov    %rdi,%r15
    123f:	48 63 de             	movslq %esi,%rbx
    1242:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
    1249:	00 
    124a:	e8 11 fe ff ff       	call   1060 <malloc@plt>
    124f:	85 db                	test   %ebx,%ebx
    1251:	0f 8e 95 00 00 00    	jle    12ec <func0+0xbc>
    1257:	89 ea                	mov    %ebp,%edx
    1259:	31 f6                	xor    %esi,%esi
    125b:	45 31 d2             	xor    %r10d,%r10d
    125e:	eb 11                	jmp    1271 <func0+0x41>
    1260:	49 63 ca             	movslq %r10d,%rcx
    1263:	41 ff c2             	inc    %r10d
    1266:	89 3c 88             	mov    %edi,(%rax,%rcx,4)
    1269:	48 ff c6             	inc    %rsi
    126c:	48 39 d6             	cmp    %rdx,%rsi
    126f:	74 1e                	je     128f <func0+0x5f>
    1271:	41 8b 3c b7          	mov    (%r15,%rsi,4),%edi
    1275:	45 85 d2             	test   %r10d,%r10d
    1278:	7e e6                	jle    1260 <func0+0x30>
    127a:	44 89 d5             	mov    %r10d,%ebp
    127d:	31 db                	xor    %ebx,%ebx
    127f:	90                   	nop
    1280:	3b 3c 98             	cmp    (%rax,%rbx,4),%edi
    1283:	74 e4                	je     1269 <func0+0x39>
    1285:	48 ff c3             	inc    %rbx
    1288:	48 39 dd             	cmp    %rbx,%rbp
    128b:	75 f3                	jne    1280 <func0+0x50>
    128d:	eb d1                	jmp    1260 <func0+0x30>
    128f:	41 83 fa 02          	cmp    $0x2,%r10d
    1293:	7c 5a                	jl     12ef <func0+0xbf>
    1295:	45 8d 42 ff          	lea    -0x1(%r10),%r8d
    1299:	45 89 d1             	mov    %r10d,%r9d
    129c:	45 31 db             	xor    %r11d,%r11d
    129f:	4c 89 cf             	mov    %r9,%rdi
    12a2:	48 89 c5             	mov    %rax,%rbp
    12a5:	eb 15                	jmp    12bc <func0+0x8c>
    12a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    12ae:	00 00 
    12b0:	48 83 c5 04          	add    $0x4,%rbp
    12b4:	48 ff cf             	dec    %rdi
    12b7:	4d 39 c3             	cmp    %r8,%r11
    12ba:	74 33                	je     12ef <func0+0xbf>
    12bc:	4c 89 db             	mov    %r11,%rbx
    12bf:	49 ff c3             	inc    %r11
    12c2:	4d 39 cb             	cmp    %r9,%r11
    12c5:	73 e9                	jae    12b0 <func0+0x80>
    12c7:	be 01 00 00 00       	mov    $0x1,%esi
    12cc:	eb 0a                	jmp    12d8 <func0+0xa8>
    12ce:	66 90                	xchg   %ax,%ax
    12d0:	48 ff c6             	inc    %rsi
    12d3:	48 39 f7             	cmp    %rsi,%rdi
    12d6:	74 d8                	je     12b0 <func0+0x80>
    12d8:	8b 0c 98             	mov    (%rax,%rbx,4),%ecx
    12db:	8b 54 b5 00          	mov    0x0(%rbp,%rsi,4),%edx
    12df:	39 d1                	cmp    %edx,%ecx
    12e1:	7e ed                	jle    12d0 <func0+0xa0>
    12e3:	89 14 98             	mov    %edx,(%rax,%rbx,4)
    12e6:	89 4c b5 00          	mov    %ecx,0x0(%rbp,%rsi,4)
    12ea:	eb e4                	jmp    12d0 <func0+0xa0>
    12ec:	45 31 d2             	xor    %r10d,%r10d
    12ef:	45 89 16             	mov    %r10d,(%r14)
    12f2:	48 83 c4 08          	add    $0x8,%rsp
    12f6:	5b                   	pop    %rbx
    12f7:	41 5e                	pop    %r14
    12f9:	41 5f                	pop    %r15
    12fb:	5d                   	pop    %rbp
    12fc:	c3                   	ret    

