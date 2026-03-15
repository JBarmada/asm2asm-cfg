0000000000001230 <func0>:
    1230:	85 f6                	test   %esi,%esi
    1232:	7e 1d                	jle    1251 <func0+0x21>
    1234:	89 f1                	mov    %esi,%ecx
    1236:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
    123a:	89 c8                	mov    %ecx,%eax
    123c:	83 e0 03             	and    $0x3,%eax
    123f:	48 83 fa 03          	cmp    $0x3,%rdx
    1243:	73 15                	jae    125a <func0+0x2a>
    1245:	f3 0f 10 0d 83 0e 00 	movss  0xe83(%rip),%xmm1        # 20d0 <_IO_stdin_used+0xd0>
    124c:	00 
    124d:	31 d2                	xor    %edx,%edx
    124f:	eb 4f                	jmp    12a0 <func0+0x70>
    1251:	f3 0f 10 05 77 0e 00 	movss  0xe77(%rip),%xmm0        # 20d0 <_IO_stdin_used+0xd0>
    1258:	00 
    1259:	c3                   	ret    
    125a:	83 e1 fc             	and    $0xfffffffc,%ecx
    125d:	f3 0f 10 0d 6b 0e 00 	movss  0xe6b(%rip),%xmm1        # 20d0 <_IO_stdin_used+0xd0>
    1264:	00 
    1265:	31 d2                	xor    %edx,%edx
    1267:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    126e:	00 00 
    1270:	f3 0f 10 04 97       	movss  (%rdi,%rdx,4),%xmm0
    1275:	f3 0f 5f c1          	maxss  %xmm1,%xmm0
    1279:	f3 0f 10 4c 97 04    	movss  0x4(%rdi,%rdx,4),%xmm1
    127f:	f3 0f 5f c8          	maxss  %xmm0,%xmm1
    1283:	f3 0f 10 44 97 08    	movss  0x8(%rdi,%rdx,4),%xmm0
    1289:	f3 0f 5f c1          	maxss  %xmm1,%xmm0
    128d:	f3 0f 10 4c 97 0c    	movss  0xc(%rdi,%rdx,4),%xmm1
    1293:	f3 0f 5f c8          	maxss  %xmm0,%xmm1
    1297:	48 83 c2 04          	add    $0x4,%rdx
    129b:	48 39 d1             	cmp    %rdx,%rcx
    129e:	75 d0                	jne    1270 <func0+0x40>
    12a0:	0f 28 c1             	movaps %xmm1,%xmm0
    12a3:	48 85 c0             	test   %rax,%rax
    12a6:	74 1c                	je     12c4 <func0+0x94>
    12a8:	48 8d 0c 97          	lea    (%rdi,%rdx,4),%rcx
    12ac:	31 d2                	xor    %edx,%edx
    12ae:	66 90                	xchg   %ax,%ax
    12b0:	f3 0f 10 04 91       	movss  (%rcx,%rdx,4),%xmm0
    12b5:	f3 0f 5f c1          	maxss  %xmm1,%xmm0
    12b9:	48 ff c2             	inc    %rdx
    12bc:	0f 28 c8             	movaps %xmm0,%xmm1
    12bf:	48 39 d0             	cmp    %rdx,%rax
    12c2:	75 ec                	jne    12b0 <func0+0x80>
    12c4:	c3                   	ret    

