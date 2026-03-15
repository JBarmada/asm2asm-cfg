0000000000001820 <func0>:
    1820:	41 57                	push   %r15
    1822:	41 56                	push   %r14
    1824:	41 54                	push   %r12
    1826:	53                   	push   %rbx
    1827:	50                   	push   %rax
    1828:	49 89 ff             	mov    %rdi,%r15
    182b:	e8 00 f8 ff ff       	call   1030 <strlen@plt>
    1830:	49 89 c6             	mov    %rax,%r14
    1833:	48 8d 1d 2e 08 00 00 	lea    0x82e(%rip),%rbx        # 2068 <_IO_stdin_used+0x68>
    183a:	41 83 fe 05          	cmp    $0x5,%r14d
    183e:	7c 20                	jl     1860 <func0+0x40>
    1840:	41 0f b6 07          	movzbl (%r15),%eax
    1844:	3c 41                	cmp    $0x41,%al
    1846:	7c 18                	jl     1860 <func0+0x40>
    1848:	83 c0 a5             	add    $0xffffffa5,%eax
    184b:	83 f8 24             	cmp    $0x24,%eax
    184e:	77 1f                	ja     186f <func0+0x4f>
    1850:	48 b9 3f 00 00 00 1f 	movabs $0x1f0000003f,%rcx
    1857:	00 00 00 
    185a:	48 0f a3 c1          	bt     %rax,%rcx
    185e:	73 0f                	jae    186f <func0+0x4f>
    1860:	48 89 d8             	mov    %rbx,%rax
    1863:	48 83 c4 08          	add    $0x8,%rsp
    1867:	5b                   	pop    %rbx
    1868:	41 5c                	pop    %r12
    186a:	41 5e                	pop    %r14
    186c:	41 5f                	pop    %r15
    186e:	c3                   	ret    
    186f:	44 89 f0             	mov    %r14d,%eax
    1872:	4d 8d 24 07          	lea    (%r15,%rax,1),%r12
    1876:	49 83 c4 fc          	add    $0xfffffffffffffffc,%r12
    187a:	48 8d 35 85 0c 00 00 	lea    0xc85(%rip),%rsi        # 2506 <_IO_stdin_used+0x506>
    1881:	4c 89 e7             	mov    %r12,%rdi
    1884:	e8 c7 f7 ff ff       	call   1050 <strcmp@plt>
    1889:	85 c0                	test   %eax,%eax
    188b:	74 26                	je     18b3 <func0+0x93>
    188d:	48 8d 35 64 08 00 00 	lea    0x864(%rip),%rsi        # 20f8 <_IO_stdin_used+0xf8>
    1894:	4c 89 e7             	mov    %r12,%rdi
    1897:	e8 b4 f7 ff ff       	call   1050 <strcmp@plt>
    189c:	85 c0                	test   %eax,%eax
    189e:	74 13                	je     18b3 <func0+0x93>
    18a0:	48 8d 35 20 08 00 00 	lea    0x820(%rip),%rsi        # 20c7 <_IO_stdin_used+0xc7>
    18a7:	4c 89 e7             	mov    %r12,%rdi
    18aa:	e8 a1 f7 ff ff       	call   1050 <strcmp@plt>
    18af:	85 c0                	test   %eax,%eax
    18b1:	75 ad                	jne    1860 <func0+0x40>
    18b3:	44 89 f0             	mov    %r14d,%eax
    18b6:	48 83 f8 08          	cmp    $0x8,%rax
    18ba:	73 0b                	jae    18c7 <func0+0xa7>
    18bc:	31 c9                	xor    %ecx,%ecx
    18be:	31 f6                	xor    %esi,%esi
    18c0:	31 d2                	xor    %edx,%edx
    18c2:	e9 29 01 00 00       	jmp    19f0 <func0+0x1d0>
    18c7:	41 83 e6 07          	and    $0x7,%r14d
    18cb:	48 89 c1             	mov    %rax,%rcx
    18ce:	4c 29 f1             	sub    %r14,%rcx
    18d1:	66 45 0f ef ed       	pxor   %xmm13,%xmm13
    18d6:	31 d2                	xor    %edx,%edx
    18d8:	66 44 0f 6f 05 0f 0d 	movdqa 0xd0f(%rip),%xmm8        # 25f0 <_IO_stdin_used+0x5f0>
    18df:	00 00 
    18e1:	66 44 0f 6f 0d 16 0d 	movdqa 0xd16(%rip),%xmm9        # 2600 <_IO_stdin_used+0x600>
    18e8:	00 00 
    18ea:	66 45 0f 76 d2       	pcmpeqd %xmm10,%xmm10
    18ef:	66 44 0f 6f 25 18 0d 	movdqa 0xd18(%rip),%xmm12        # 2610 <_IO_stdin_used+0x610>
    18f6:	00 00 
    18f8:	66 44 0f 6f 1d 1f 0d 	movdqa 0xd1f(%rip),%xmm11        # 2620 <_IO_stdin_used+0x620>
    18ff:	00 00 
    1901:	66 0f ef c9          	pxor   %xmm1,%xmm1
    1905:	66 0f ef d2          	pxor   %xmm2,%xmm2
    1909:	66 0f ef f6          	pxor   %xmm6,%xmm6
    190d:	0f 1f 00             	nopl   (%rax)
    1910:	66 41 0f 6e 24 17    	movd   (%r15,%rdx,1),%xmm4
    1916:	66 41 0f 6e 5c 17 04 	movd   0x4(%r15,%rdx,1),%xmm3
    191d:	66 0f 6f c4          	movdqa %xmm4,%xmm0
    1921:	66 41 0f fc c0       	paddb  %xmm8,%xmm0
    1926:	66 0f 6f eb          	movdqa %xmm3,%xmm5
    192a:	66 41 0f fc e8       	paddb  %xmm8,%xmm5
    192f:	66 0f 6f f8          	movdqa %xmm0,%xmm7
    1933:	66 41 0f de f9       	pmaxub %xmm9,%xmm7
    1938:	66 0f 74 f8          	pcmpeqb %xmm0,%xmm7
    193c:	66 41 0f ef fa       	pxor   %xmm10,%xmm7
    1941:	66 0f 60 ff          	punpcklbw %xmm7,%xmm7
    1945:	66 0f 61 ff          	punpcklwd %xmm7,%xmm7
    1949:	66 41 0f db fc       	pand   %xmm12,%xmm7
    194e:	66 44 0f fe ef       	paddd  %xmm7,%xmm13
    1953:	66 0f 6f c5          	movdqa %xmm5,%xmm0
    1957:	66 41 0f de c1       	pmaxub %xmm9,%xmm0
    195c:	66 0f 74 c5          	pcmpeqb %xmm5,%xmm0
    1960:	66 41 0f ef c2       	pxor   %xmm10,%xmm0
    1965:	66 0f 60 c0          	punpcklbw %xmm0,%xmm0
    1969:	66 0f 61 c0          	punpcklwd %xmm0,%xmm0
    196d:	66 41 0f db c4       	pand   %xmm12,%xmm0
    1972:	66 0f fe c8          	paddd  %xmm0,%xmm1
    1976:	66 41 0f 74 e3       	pcmpeqb %xmm11,%xmm4
    197b:	66 0f 60 e4          	punpcklbw %xmm4,%xmm4
    197f:	66 0f 61 e4          	punpcklwd %xmm4,%xmm4
    1983:	66 41 0f db e4       	pand   %xmm12,%xmm4
    1988:	66 0f fe d4          	paddd  %xmm4,%xmm2
    198c:	66 41 0f 74 db       	pcmpeqb %xmm11,%xmm3
    1991:	66 0f 60 db          	punpcklbw %xmm3,%xmm3
    1995:	66 0f 61 db          	punpcklwd %xmm3,%xmm3
    1999:	66 41 0f db dc       	pand   %xmm12,%xmm3
    199e:	66 0f fe f3          	paddd  %xmm3,%xmm6
    19a2:	48 83 c2 08          	add    $0x8,%rdx
    19a6:	48 39 d1             	cmp    %rdx,%rcx
    19a9:	0f 85 61 ff ff ff    	jne    1910 <func0+0xf0>
    19af:	66 0f fe f2          	paddd  %xmm2,%xmm6
    19b3:	66 0f 70 c6 ee       	pshufd $0xee,%xmm6,%xmm0
    19b8:	66 0f fe c6          	paddd  %xmm6,%xmm0
    19bc:	66 0f 70 d0 55       	pshufd $0x55,%xmm0,%xmm2
    19c1:	66 0f fe d0          	paddd  %xmm0,%xmm2
    19c5:	66 0f 7e d2          	movd   %xmm2,%edx
    19c9:	66 41 0f fe cd       	paddd  %xmm13,%xmm1
    19ce:	66 0f 70 c1 ee       	pshufd $0xee,%xmm1,%xmm0
    19d3:	66 0f fe c1          	paddd  %xmm1,%xmm0
    19d7:	66 0f 70 c8 55       	pshufd $0x55,%xmm0,%xmm1
    19dc:	66 0f fe c8          	paddd  %xmm0,%xmm1
    19e0:	66 0f 7e ce          	movd   %xmm1,%esi
    19e4:	4d 85 f6             	test   %r14,%r14
    19e7:	74 28                	je     1a11 <func0+0x1f1>
    19e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    19f0:	41 0f b6 3c 0f       	movzbl (%r15,%rcx,1),%edi
    19f5:	8d 5f d0             	lea    -0x30(%rdi),%ebx
    19f8:	80 fb 0a             	cmp    $0xa,%bl
    19fb:	83 d6 00             	adc    $0x0,%esi
    19fe:	31 db                	xor    %ebx,%ebx
    1a00:	40 80 ff 2e          	cmp    $0x2e,%dil
    1a04:	0f 94 c3             	sete   %bl
    1a07:	01 da                	add    %ebx,%edx
    1a09:	48 ff c1             	inc    %rcx
    1a0c:	48 39 c8             	cmp    %rcx,%rax
    1a0f:	75 df                	jne    19f0 <func0+0x1d0>
    1a11:	83 fa 01             	cmp    $0x1,%edx
    1a14:	48 8d 05 4d 06 00 00 	lea    0x64d(%rip),%rax        # 2068 <_IO_stdin_used+0x68>
    1a1b:	48 8d 1d ee 05 00 00 	lea    0x5ee(%rip),%rbx        # 2010 <_IO_stdin_used+0x10>
    1a22:	48 0f 45 d8          	cmovne %rax,%rbx
    1a26:	83 fe 04             	cmp    $0x4,%esi
    1a29:	48 0f 43 d8          	cmovae %rax,%rbx
    1a2d:	e9 2e fe ff ff       	jmp    1860 <func0+0x40>

