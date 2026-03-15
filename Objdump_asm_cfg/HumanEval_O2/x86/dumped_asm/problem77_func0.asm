00000000000014b0 <func0>:
    14b0:	85 ff                	test   %edi,%edi
    14b2:	7e 24                	jle    14d8 <func0+0x28>
    14b4:	31 c9                	xor    %ecx,%ecx
    14b6:	ba 01 00 00 00       	mov    $0x1,%edx
    14bb:	31 c0                	xor    %eax,%eax
    14bd:	0f 1f 00             	nopl   (%rax)
    14c0:	39 fa                	cmp    %edi,%edx
    14c2:	74 17                	je     14db <func0+0x2b>
    14c4:	0f af d6             	imul   %esi,%edx
    14c7:	39 fa                	cmp    %edi,%edx
    14c9:	7f 0c                	jg     14d7 <func0+0x27>
    14cb:	44 8d 41 01          	lea    0x1(%rcx),%r8d
    14cf:	83 f9 63             	cmp    $0x63,%ecx
    14d2:	44 89 c1             	mov    %r8d,%ecx
    14d5:	72 e9                	jb     14c0 <func0+0x10>
    14d7:	c3                   	ret    
    14d8:	31 c0                	xor    %eax,%eax
    14da:	c3                   	ret    
    14db:	b8 01 00 00 00       	mov    $0x1,%eax
    14e0:	c3                   	ret    

