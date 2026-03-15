00000000000016a0 <func0>:
    16a0:	41 57                	push   %r15
    16a2:	41 56                	push   %r14
    16a4:	41 54                	push   %r12
    16a6:	53                   	push   %rbx
    16a7:	50                   	push   %rax
    16a8:	49 89 d6             	mov    %rdx,%r14
    16ab:	41 89 f7             	mov    %esi,%r15d
    16ae:	49 89 fc             	mov    %rdi,%r12
    16b1:	89 f0                	mov    %esi,%eax
    16b3:	c1 e8 1f             	shr    $0x1f,%eax
    16b6:	01 f0                	add    %esi,%eax
    16b8:	d1 f8                	sar    %eax
    16ba:	48 98                	cltq   
    16bc:	48 8d 3c 85 04 00 00 	lea    0x4(,%rax,4),%rdi
    16c3:	00 
    16c4:	e8 87 f9 ff ff       	call   1050 <malloc@plt>
    16c9:	45 85 ff             	test   %r15d,%r15d
    16cc:	0f 8e be 01 00 00    	jle    1890 <func0+0x1f0>
    16d2:	41 8d 57 ff          	lea    -0x1(%r15),%edx
    16d6:	41 89 d0             	mov    %edx,%r8d
    16d9:	41 d1 e8             	shr    %r8d
    16dc:	83 fa 0f             	cmp    $0xf,%edx
    16df:	77 06                	ja     16e7 <func0+0x47>
    16e1:	31 f6                	xor    %esi,%esi
    16e3:	31 ff                	xor    %edi,%edi
    16e5:	eb 5a                	jmp    1741 <func0+0xa1>
    16e7:	41 8d 70 01          	lea    0x1(%r8),%esi
    16eb:	89 f1                	mov    %esi,%ecx
    16ed:	83 e1 07             	and    $0x7,%ecx
    16f0:	bf 08 00 00 00       	mov    $0x8,%edi
    16f5:	48 0f 45 f9          	cmovne %rcx,%rdi
    16f9:	48 29 fe             	sub    %rdi,%rsi
    16fc:	48 8d 3c 36          	lea    (%rsi,%rsi,1),%rdi
    1700:	31 c9                	xor    %ecx,%ecx
    1702:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1709:	1f 84 00 00 00 00 00 
    1710:	41 0f 10 04 cc       	movups (%r12,%rcx,8),%xmm0
    1715:	41 0f 10 4c cc 10    	movups 0x10(%r12,%rcx,8),%xmm1
    171b:	0f c6 c1 88          	shufps $0x88,%xmm1,%xmm0
    171f:	41 0f 10 4c cc 20    	movups 0x20(%r12,%rcx,8),%xmm1
    1725:	41 0f 10 54 cc 30    	movups 0x30(%r12,%rcx,8),%xmm2
    172b:	0f c6 ca 88          	shufps $0x88,%xmm2,%xmm1
    172f:	0f 11 04 88          	movups %xmm0,(%rax,%rcx,4)
    1733:	0f 11 4c 88 10       	movups %xmm1,0x10(%rax,%rcx,4)
    1738:	48 83 c1 08          	add    $0x8,%rcx
    173c:	48 39 ce             	cmp    %rcx,%rsi
    173f:	75 cf                	jne    1710 <func0+0x70>
    1741:	48 8d 0c b0          	lea    (%rax,%rsi,4),%rcx
    1745:	89 d3                	mov    %edx,%ebx
    1747:	48 d1 eb             	shr    %rbx
    174a:	48 29 f3             	sub    %rsi,%rbx
    174d:	48 ff c3             	inc    %rbx
    1750:	49 8d 34 bc          	lea    (%r12,%rdi,4),%rsi
    1754:	31 ff                	xor    %edi,%edi
    1756:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    175d:	00 00 00 
    1760:	f3 0f 10 04 fe       	movss  (%rsi,%rdi,8),%xmm0
    1765:	f3 0f 11 04 b9       	movss  %xmm0,(%rcx,%rdi,4)
    176a:	48 ff c7             	inc    %rdi
    176d:	48 39 fb             	cmp    %rdi,%rbx
    1770:	75 ee                	jne    1760 <func0+0xc0>
    1772:	83 fa 02             	cmp    $0x2,%edx
    1775:	73 1d                	jae    1794 <func0+0xf4>
    1777:	45 85 ff             	test   %r15d,%r15d
    177a:	0f 8e 10 01 00 00    	jle    1890 <func0+0x1f0>
    1780:	44 89 fa             	mov    %r15d,%edx
    1783:	41 83 ff 01          	cmp    $0x1,%r15d
    1787:	0f 85 aa 00 00 00    	jne    1837 <func0+0x197>
    178d:	31 c9                	xor    %ecx,%ecx
    178f:	e9 d9 00 00 00       	jmp    186d <func0+0x1cd>
    1794:	31 d2                	xor    %edx,%edx
    1796:	44 89 c6             	mov    %r8d,%esi
    1799:	eb 0e                	jmp    17a9 <func0+0x109>
    179b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    17a0:	ff c2                	inc    %edx
    17a2:	ff ce                	dec    %esi
    17a4:	44 39 c2             	cmp    %r8d,%edx
    17a7:	74 ce                	je     1777 <func0+0xd7>
    17a9:	89 f6                	mov    %esi,%esi
    17ab:	41 39 d0             	cmp    %edx,%r8d
    17ae:	76 f0                	jbe    17a0 <func0+0x100>
    17b0:	f3 0f 10 00          	movss  (%rax),%xmm0
    17b4:	83 fe 01             	cmp    $0x1,%esi
    17b7:	75 27                	jne    17e0 <func0+0x140>
    17b9:	31 db                	xor    %ebx,%ebx
    17bb:	40 f6 c6 01          	test   $0x1,%sil
    17bf:	74 df                	je     17a0 <func0+0x100>
    17c1:	f3 0f 10 4c 98 04    	movss  0x4(%rax,%rbx,4),%xmm1
    17c7:	0f 2e c1             	ucomiss %xmm1,%xmm0
    17ca:	76 d4                	jbe    17a0 <func0+0x100>
    17cc:	f3 0f 11 0c 98       	movss  %xmm1,(%rax,%rbx,4)
    17d1:	f3 0f 11 44 98 04    	movss  %xmm0,0x4(%rax,%rbx,4)
    17d7:	eb c7                	jmp    17a0 <func0+0x100>
    17d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    17e0:	89 f7                	mov    %esi,%edi
    17e2:	83 e7 fe             	and    $0xfffffffe,%edi
    17e5:	31 c9                	xor    %ecx,%ecx
    17e7:	eb 1b                	jmp    1804 <func0+0x164>
    17e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    17f0:	f3 0f 11 4c 88 04    	movss  %xmm1,0x4(%rax,%rcx,4)
    17f6:	f3 0f 11 44 88 08    	movss  %xmm0,0x8(%rax,%rcx,4)
    17fc:	48 89 d9             	mov    %rbx,%rcx
    17ff:	48 39 df             	cmp    %rbx,%rdi
    1802:	74 b7                	je     17bb <func0+0x11b>
    1804:	f3 0f 10 4c 88 04    	movss  0x4(%rax,%rcx,4),%xmm1
    180a:	0f 2e c1             	ucomiss %xmm1,%xmm0
    180d:	76 11                	jbe    1820 <func0+0x180>
    180f:	f3 0f 11 0c 88       	movss  %xmm1,(%rax,%rcx,4)
    1814:	f3 0f 11 44 88 04    	movss  %xmm0,0x4(%rax,%rcx,4)
    181a:	eb 07                	jmp    1823 <func0+0x183>
    181c:	0f 1f 40 00          	nopl   0x0(%rax)
    1820:	0f 28 c1             	movaps %xmm1,%xmm0
    1823:	48 8d 59 02          	lea    0x2(%rcx),%rbx
    1827:	f3 0f 10 4c 88 08    	movss  0x8(%rax,%rcx,4),%xmm1
    182d:	0f 2e c1             	ucomiss %xmm1,%xmm0
    1830:	77 be                	ja     17f0 <func0+0x150>
    1832:	0f 28 c1             	movaps %xmm1,%xmm0
    1835:	eb c5                	jmp    17fc <func0+0x15c>
    1837:	89 d6                	mov    %edx,%esi
    1839:	83 e6 fe             	and    $0xfffffffe,%esi
    183c:	31 db                	xor    %ebx,%ebx
    183e:	31 c9                	xor    %ecx,%ecx
    1840:	89 df                	mov    %ebx,%edi
    1842:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
    1848:	f3 0f 10 04 b8       	movss  (%rax,%rdi,4),%xmm0
    184d:	f3 41 0f 11 04 8e    	movss  %xmm0,(%r14,%rcx,4)
    1853:	f3 41 0f 10 44 8c 04 	movss  0x4(%r12,%rcx,4),%xmm0
    185a:	f3 41 0f 11 44 8e 04 	movss  %xmm0,0x4(%r14,%rcx,4)
    1861:	48 83 c1 02          	add    $0x2,%rcx
    1865:	48 ff c3             	inc    %rbx
    1868:	48 39 ce             	cmp    %rcx,%rsi
    186b:	75 d3                	jne    1840 <func0+0x1a0>
    186d:	f6 c2 01             	test   $0x1,%dl
    1870:	74 1e                	je     1890 <func0+0x1f0>
    1872:	89 ca                	mov    %ecx,%edx
    1874:	83 e2 fe             	and    $0xfffffffe,%edx
    1877:	f6 c1 01             	test   $0x1,%cl
    187a:	48 8d 14 50          	lea    (%rax,%rdx,2),%rdx
    187e:	49 8d 34 8c          	lea    (%r12,%rcx,4),%rsi
    1882:	48 0f 44 f2          	cmove  %rdx,%rsi
    1886:	f3 0f 10 06          	movss  (%rsi),%xmm0
    188a:	f3 41 0f 11 04 8e    	movss  %xmm0,(%r14,%rcx,4)
    1890:	48 89 c7             	mov    %rax,%rdi
    1893:	48 83 c4 08          	add    $0x8,%rsp
    1897:	5b                   	pop    %rbx
    1898:	41 5c                	pop    %r12
    189a:	41 5e                	pop    %r14
    189c:	41 5f                	pop    %r15
    189e:	e9 8d f7 ff ff       	jmp    1030 <free@plt>

