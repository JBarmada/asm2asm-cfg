00000000000017c0 <func0>:
    17c0:	0f 57 c0             	xorps  %xmm0,%xmm0
    17c3:	0f 29 44 24 e8       	movaps %xmm0,-0x18(%rsp)
    17c8:	0f 29 44 24 d8       	movaps %xmm0,-0x28(%rsp)
    17cd:	0f 29 44 24 c8       	movaps %xmm0,-0x38(%rsp)
    17d2:	0f 29 44 24 b8       	movaps %xmm0,-0x48(%rsp)
    17d7:	0f 29 44 24 a8       	movaps %xmm0,-0x58(%rsp)
    17dc:	0f 29 44 24 98       	movaps %xmm0,-0x68(%rsp)
    17e1:	48 c7 44 24 f8 00 00 	movq   $0x0,-0x8(%rsp)
    17e8:	00 00 
    17ea:	45 31 c9             	xor    %r9d,%r9d
    17ed:	eb 04                	jmp    17f3 <func0+0x33>
    17ef:	90                   	nop
    17f0:	48 ff c7             	inc    %rdi
    17f3:	0f b6 07             	movzbl (%rdi),%eax
    17f6:	83 f8 20             	cmp    $0x20,%eax
    17f9:	74 f5                	je     17f0 <func0+0x30>
    17fb:	85 c0                	test   %eax,%eax
    17fd:	74 21                	je     1820 <func0+0x60>
    17ff:	48 0f be c0          	movsbq %al,%rax
    1803:	44 8b 84 84 14 fe ff 	mov    -0x1ec(%rsp,%rax,4),%r8d
    180a:	ff 
    180b:	45 8d 50 01          	lea    0x1(%r8),%r10d
    180f:	44 89 94 84 14 fe ff 	mov    %r10d,-0x1ec(%rsp,%rax,4)
    1816:	ff 
    1817:	45 39 c8             	cmp    %r9d,%r8d
    181a:	45 0f 4d ca          	cmovge %r10d,%r9d
    181e:	eb d0                	jmp    17f0 <func0+0x30>
    1820:	31 ff                	xor    %edi,%edi
    1822:	45 31 c0             	xor    %r8d,%r8d
    1825:	eb 13                	jmp    183a <func0+0x7a>
    1827:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    182e:	00 00 
    1830:	48 83 c7 02          	add    $0x2,%rdi
    1834:	48 83 ff 1a          	cmp    $0x1a,%rdi
    1838:	74 35                	je     186f <func0+0xaf>
    183a:	8b 44 bc 98          	mov    -0x68(%rsp,%rdi,4),%eax
    183e:	89 04 be             	mov    %eax,(%rsi,%rdi,4)
    1841:	44 39 c8             	cmp    %r9d,%eax
    1844:	75 0d                	jne    1853 <func0+0x93>
    1846:	4d 63 d0             	movslq %r8d,%r10
    1849:	41 ff c0             	inc    %r8d
    184c:	8d 47 61             	lea    0x61(%rdi),%eax
    184f:	42 88 04 11          	mov    %al,(%rcx,%r10,1)
    1853:	8b 44 bc 9c          	mov    -0x64(%rsp,%rdi,4),%eax
    1857:	89 44 be 04          	mov    %eax,0x4(%rsi,%rdi,4)
    185b:	44 39 c8             	cmp    %r9d,%eax
    185e:	75 d0                	jne    1830 <func0+0x70>
    1860:	4d 63 d0             	movslq %r8d,%r10
    1863:	41 ff c0             	inc    %r8d
    1866:	8d 47 62             	lea    0x62(%rdi),%eax
    1869:	42 88 04 11          	mov    %al,(%rcx,%r10,1)
    186d:	eb c1                	jmp    1830 <func0+0x70>
    186f:	44 89 0a             	mov    %r9d,(%rdx)
    1872:	49 63 c0             	movslq %r8d,%rax
    1875:	c6 04 01 00          	movb   $0x0,(%rcx,%rax,1)
    1879:	c3                   	ret    

