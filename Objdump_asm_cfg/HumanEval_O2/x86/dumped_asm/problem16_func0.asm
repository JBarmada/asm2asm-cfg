0000000000001270 <func0>:
    1270:	55                   	push   %rbp
    1271:	41 57                	push   %r15
    1273:	41 56                	push   %r14
    1275:	41 54                	push   %r12
    1277:	53                   	push   %rbx
    1278:	85 ff                	test   %edi,%edi
    127a:	0f 8e 97 00 00 00    	jle    1317 <func0+0xa7>
    1280:	41 89 fe             	mov    %edi,%r14d
    1283:	41 89 fc             	mov    %edi,%r12d
    1286:	41 f7 dc             	neg    %r12d
    1289:	bb 02 00 00 00       	mov    $0x2,%ebx
    128e:	bd 01 00 00 00       	mov    $0x1,%ebp
    1293:	4c 8d 3d 0c 0e 00 00 	lea    0xe0c(%rip),%r15        # 20a6 <_IO_stdin_used+0xa6>
    129a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12a0:	31 ff                	xor    %edi,%edi
    12a2:	31 f6                	xor    %esi,%esi
    12a4:	4c 89 fa             	mov    %r15,%rdx
    12a7:	89 e9                	mov    %ebp,%ecx
    12a9:	31 c0                	xor    %eax,%eax
    12ab:	e8 90 fd ff ff       	call   1040 <snprintf@plt>
    12b0:	01 c3                	add    %eax,%ebx
    12b2:	41 8d 04 2c          	lea    (%r12,%rbp,1),%eax
    12b6:	ff c0                	inc    %eax
    12b8:	89 e9                	mov    %ebp,%ecx
    12ba:	ff c1                	inc    %ecx
    12bc:	89 cd                	mov    %ecx,%ebp
    12be:	83 f8 01             	cmp    $0x1,%eax
    12c1:	75 dd                	jne    12a0 <func0+0x30>
    12c3:	48 63 fb             	movslq %ebx,%rdi
    12c6:	e8 a5 fd ff ff       	call   1070 <malloc@plt>
    12cb:	48 85 c0             	test   %rax,%rax
    12ce:	74 60                	je     1330 <func0+0xc0>
    12d0:	49 89 c7             	mov    %rax,%r15
    12d3:	66 c7 00 30 00       	movw   $0x30,(%rax)
    12d8:	45 85 f6             	test   %r14d,%r14d
    12db:	7e 56                	jle    1333 <func0+0xc3>
    12dd:	4c 89 fb             	mov    %r15,%rbx
    12e0:	48 ff c3             	inc    %rbx
    12e3:	bd 01 00 00 00       	mov    $0x1,%ebp
    12e8:	4c 8d 35 b7 0d 00 00 	lea    0xdb7(%rip),%r14        # 20a6 <_IO_stdin_used+0xa6>
    12ef:	90                   	nop
    12f0:	48 89 df             	mov    %rbx,%rdi
    12f3:	4c 89 f6             	mov    %r14,%rsi
    12f6:	89 ea                	mov    %ebp,%edx
    12f8:	31 c0                	xor    %eax,%eax
    12fa:	e8 81 fd ff ff       	call   1080 <sprintf@plt>
    12ff:	48 98                	cltq   
    1301:	48 01 c3             	add    %rax,%rbx
    1304:	41 8d 04 2c          	lea    (%r12,%rbp,1),%eax
    1308:	ff c0                	inc    %eax
    130a:	89 e9                	mov    %ebp,%ecx
    130c:	ff c1                	inc    %ecx
    130e:	89 cd                	mov    %ecx,%ebp
    1310:	83 f8 01             	cmp    $0x1,%eax
    1313:	75 db                	jne    12f0 <func0+0x80>
    1315:	eb 1c                	jmp    1333 <func0+0xc3>
    1317:	bf 02 00 00 00       	mov    $0x2,%edi
    131c:	e8 4f fd ff ff       	call   1070 <malloc@plt>
    1321:	48 85 c0             	test   %rax,%rax
    1324:	74 0a                	je     1330 <func0+0xc0>
    1326:	49 89 c7             	mov    %rax,%r15
    1329:	66 c7 00 30 00       	movw   $0x30,(%rax)
    132e:	eb 03                	jmp    1333 <func0+0xc3>
    1330:	45 31 ff             	xor    %r15d,%r15d
    1333:	4c 89 f8             	mov    %r15,%rax
    1336:	5b                   	pop    %rbx
    1337:	41 5c                	pop    %r12
    1339:	41 5e                	pop    %r14
    133b:	41 5f                	pop    %r15
    133d:	5d                   	pop    %rbp
    133e:	c3                   	ret    

