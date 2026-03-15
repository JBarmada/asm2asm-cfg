0000000000001240 <func0>:
    1240:	55                   	push   %rbp
    1241:	41 57                	push   %r15
    1243:	41 56                	push   %r14
    1245:	41 54                	push   %r12
    1247:	53                   	push   %rbx
    1248:	49 89 f6             	mov    %rsi,%r14
    124b:	48 89 fb             	mov    %rdi,%rbx
    124e:	e8 ed fd ff ff       	call   1040 <strlen@plt>
    1253:	49 89 c7             	mov    %rax,%r15
    1256:	4c 89 f7             	mov    %r14,%rdi
    1259:	e8 e2 fd ff ff       	call   1040 <strlen@plt>
    125e:	31 ed                	xor    %ebp,%ebp
    1260:	45 85 ff             	test   %r15d,%r15d
    1263:	74 37                	je     129c <func0+0x5c>
    1265:	41 39 c7             	cmp    %eax,%r15d
    1268:	7c 32                	jl     129c <func0+0x5c>
    126a:	4c 63 e0             	movslq %eax,%r12
    126d:	45 29 e7             	sub    %r12d,%r15d
    1270:	41 ff c7             	inc    %r15d
    1273:	31 ed                	xor    %ebp,%ebp
    1275:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    127c:	00 00 00 00 
    1280:	48 89 df             	mov    %rbx,%rdi
    1283:	4c 89 f6             	mov    %r14,%rsi
    1286:	4c 89 e2             	mov    %r12,%rdx
    1289:	e8 a2 fd ff ff       	call   1030 <strncmp@plt>
    128e:	83 f8 01             	cmp    $0x1,%eax
    1291:	83 d5 00             	adc    $0x0,%ebp
    1294:	48 ff c3             	inc    %rbx
    1297:	49 ff cf             	dec    %r15
    129a:	75 e4                	jne    1280 <func0+0x40>
    129c:	89 e8                	mov    %ebp,%eax
    129e:	5b                   	pop    %rbx
    129f:	41 5c                	pop    %r12
    12a1:	41 5e                	pop    %r14
    12a3:	41 5f                	pop    %r15
    12a5:	5d                   	pop    %rbp
    12a6:	c3                   	ret    

