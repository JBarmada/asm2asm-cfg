0000000000001270 <func0>:
    1270:	55                   	push   %rbp
    1271:	41 57                	push   %r15
    1273:	41 56                	push   %r14
    1275:	41 54                	push   %r12
    1277:	53                   	push   %rbx
    1278:	48 81 ec 00 04 00 00 	sub    $0x400,%rsp
    127f:	48 89 fd             	mov    %rdi,%rbp
    1282:	48 89 e7             	mov    %rsp,%rdi
    1285:	45 31 f6             	xor    %r14d,%r14d
    1288:	ba 00 04 00 00       	mov    $0x400,%edx
    128d:	31 f6                	xor    %esi,%esi
    128f:	e8 ac fd ff ff       	call   1040 <memset@plt>
    1294:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    1298:	84 db                	test   %bl,%bl
    129a:	74 50                	je     12ec <func0+0x7c>
    129c:	e8 af fd ff ff       	call   1050 <__ctype_tolower_loc@plt>
    12a1:	4c 8b 38             	mov    (%rax),%r15
    12a4:	48 ff c5             	inc    %rbp
    12a7:	45 31 f6             	xor    %r14d,%r14d
    12aa:	eb 0f                	jmp    12bb <func0+0x4b>
    12ac:	0f 1f 40 00          	nopl   0x0(%rax)
    12b0:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    12b4:	48 ff c5             	inc    %rbp
    12b7:	84 db                	test   %bl,%bl
    12b9:	74 31                	je     12ec <func0+0x7c>
    12bb:	0f b6 c3             	movzbl %bl,%eax
    12be:	41 8b 1c 87          	mov    (%r15,%rax,4),%ebx
    12c2:	4c 0f be e3          	movsbq %bl,%r12
    12c6:	42 83 3c a4 00       	cmpl   $0x0,(%rsp,%r12,4)
    12cb:	75 e3                	jne    12b0 <func0+0x40>
    12cd:	e8 8e fd ff ff       	call   1060 <__ctype_b_loc@plt>
    12d2:	48 8b 00             	mov    (%rax),%rax
    12d5:	0f b6 cb             	movzbl %bl,%ecx
    12d8:	f6 44 48 01 04       	testb  $0x4,0x1(%rax,%rcx,2)
    12dd:	74 d1                	je     12b0 <func0+0x40>
    12df:	42 c7 04 a4 01 00 00 	movl   $0x1,(%rsp,%r12,4)
    12e6:	00 
    12e7:	41 ff c6             	inc    %r14d
    12ea:	eb c4                	jmp    12b0 <func0+0x40>
    12ec:	44 89 f0             	mov    %r14d,%eax
    12ef:	48 81 c4 00 04 00 00 	add    $0x400,%rsp
    12f6:	5b                   	pop    %rbx
    12f7:	41 5c                	pop    %r12
    12f9:	41 5e                	pop    %r14
    12fb:	41 5f                	pop    %r15
    12fd:	5d                   	pop    %rbp
    12fe:	c3                   	ret    

