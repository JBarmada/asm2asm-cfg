0000000000001200 <func0>:
    1200:	48 81 ec 18 01 00 00 	sub    $0x118,%rsp
    1207:	0f 28 05 52 0e 00 00 	movaps 0xe52(%rip),%xmm0        # 2060 <_IO_stdin_used+0x60>
    120e:	0f 29 44 24 80       	movaps %xmm0,-0x80(%rsp)
    1213:	83 ff 04             	cmp    $0x4,%edi
    1216:	0f 8c 92 00 00 00    	jl     12ae <func0+0xae>
    121c:	44 8d 47 01          	lea    0x1(%rdi),%r8d
    1220:	41 83 f8 05          	cmp    $0x5,%r8d
    1224:	75 0c                	jne    1232 <func0+0x32>
    1226:	b9 04 00 00 00       	mov    $0x4,%ecx
    122b:	45 31 d2             	xor    %r10d,%r10d
    122e:	31 d2                	xor    %edx,%edx
    1230:	eb 61                	jmp    1293 <func0+0x93>
    1232:	4d 8d 48 fc          	lea    -0x4(%r8),%r9
    1236:	49 83 e1 fe          	and    $0xfffffffffffffffe,%r9
    123a:	49 f7 d9             	neg    %r9
    123d:	b9 04 00 00 00       	mov    $0x4,%ecx
    1242:	31 f6                	xor    %esi,%esi
    1244:	31 d2                	xor    %edx,%edx
    1246:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    124d:	00 00 00 
    1250:	8b 84 8c 78 ff ff ff 	mov    -0x88(%rsp,%rcx,4),%eax
    1257:	44 8b 94 8c 7c ff ff 	mov    -0x84(%rsp,%rcx,4),%r10d
    125e:	ff 
    125f:	01 c2                	add    %eax,%edx
    1261:	01 f2                	add    %esi,%edx
    1263:	03 94 8c 70 ff ff ff 	add    -0x90(%rsp,%rcx,4),%edx
    126a:	89 54 8c 80          	mov    %edx,-0x80(%rsp,%rcx,4)
    126e:	44 01 d2             	add    %r10d,%edx
    1271:	01 c2                	add    %eax,%edx
    1273:	03 94 8c 74 ff ff ff 	add    -0x8c(%rsp,%rcx,4),%edx
    127a:	89 54 8c 84          	mov    %edx,-0x7c(%rsp,%rcx,4)
    127e:	49 8d 04 09          	lea    (%r9,%rcx,1),%rax
    1282:	48 83 c0 02          	add    $0x2,%rax
    1286:	48 83 c1 02          	add    $0x2,%rcx
    128a:	44 89 d6             	mov    %r10d,%esi
    128d:	48 83 f8 04          	cmp    $0x4,%rax
    1291:	75 bd                	jne    1250 <func0+0x50>
    1293:	41 f6 c0 01          	test   $0x1,%r8b
    1297:	74 15                	je     12ae <func0+0xae>
    1299:	03 94 8c 78 ff ff ff 	add    -0x88(%rsp,%rcx,4),%edx
    12a0:	44 01 d2             	add    %r10d,%edx
    12a3:	03 94 8c 70 ff ff ff 	add    -0x90(%rsp,%rcx,4),%edx
    12aa:	89 54 8c 80          	mov    %edx,-0x80(%rsp,%rcx,4)
    12ae:	48 63 c7             	movslq %edi,%rax
    12b1:	8b 44 84 80          	mov    -0x80(%rsp,%rax,4),%eax
    12b5:	48 81 c4 18 01 00 00 	add    $0x118,%rsp
    12bc:	c3                   	ret    

