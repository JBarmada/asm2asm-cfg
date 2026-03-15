00000000000013b0 <func0>:
    13b0:	0f b6 0f             	movzbl (%rdi),%ecx
    13b3:	84 c9                	test   %cl,%cl
    13b5:	74 45                	je     13fc <func0+0x4c>
    13b7:	45 31 c0             	xor    %r8d,%r8d
    13ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    13c0:	0f be c9             	movsbl %cl,%ecx
    13c3:	83 c1 a3             	add    $0xffffffa3,%ecx
    13c6:	69 d1 c5 4e 00 00    	imul   $0x4ec5,%ecx,%edx
    13cc:	89 d0                	mov    %edx,%eax
    13ce:	c1 e8 1f             	shr    $0x1f,%eax
    13d1:	c1 ea 13             	shr    $0x13,%edx
    13d4:	01 c2                	add    %eax,%edx
    13d6:	8d 04 92             	lea    (%rdx,%rdx,4),%eax
    13d9:	8d 04 80             	lea    (%rax,%rax,4),%eax
    13dc:	01 d0                	add    %edx,%eax
    13de:	29 c1                	sub    %eax,%ecx
    13e0:	80 c1 61             	add    $0x61,%cl
    13e3:	42 88 0c 06          	mov    %cl,(%rsi,%r8,1)
    13e7:	42 0f b6 4c 07 01    	movzbl 0x1(%rdi,%r8,1),%ecx
    13ed:	49 ff c0             	inc    %r8
    13f0:	84 c9                	test   %cl,%cl
    13f2:	75 cc                	jne    13c0 <func0+0x10>
    13f4:	44 89 c0             	mov    %r8d,%eax
    13f7:	c6 04 06 00          	movb   $0x0,(%rsi,%rax,1)
    13fb:	c3                   	ret    
    13fc:	31 c0                	xor    %eax,%eax
    13fe:	c6 04 06 00          	movb   $0x0,(%rsi,%rax,1)
    1402:	c3                   	ret    

