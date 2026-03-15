00000000000013b0 <func0>:
    13b0:	31 c0                	xor    %eax,%eax
    13b2:	eb 1d                	jmp    13d1 <func0+0x21>
    13b4:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
    13bb:	00 00 00 00 00 
    13c0:	ff c0                	inc    %eax
    13c2:	31 d2                	xor    %edx,%edx
    13c4:	80 f9 3e             	cmp    $0x3e,%cl
    13c7:	0f 94 c2             	sete   %dl
    13ca:	48 ff c7             	inc    %rdi
    13cd:	29 d0                	sub    %edx,%eax
    13cf:	78 12                	js     13e3 <func0+0x33>
    13d1:	0f b6 0f             	movzbl (%rdi),%ecx
    13d4:	83 f9 3c             	cmp    $0x3c,%ecx
    13d7:	74 e7                	je     13c0 <func0+0x10>
    13d9:	85 c9                	test   %ecx,%ecx
    13db:	75 e5                	jne    13c2 <func0+0x12>
    13dd:	85 c0                	test   %eax,%eax
    13df:	0f 94 c0             	sete   %al
    13e2:	c3                   	ret    
    13e3:	31 c0                	xor    %eax,%eax
    13e5:	c3                   	ret    

