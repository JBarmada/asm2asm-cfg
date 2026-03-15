00000000000014b0 <func0>:
    14b0:	85 f6                	test   %esi,%esi
    14b2:	7e 4f                	jle    1503 <func0+0x53>
    14b4:	41 89 f1             	mov    %esi,%r9d
    14b7:	31 d2                	xor    %edx,%edx
    14b9:	41 b8 ab aa aa aa    	mov    $0xaaaaaaab,%r8d
    14bf:	31 c0                	xor    %eax,%eax
    14c1:	eb 1d                	jmp    14e0 <func0+0x30>
    14c3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    14ca:	84 00 00 00 00 00 
    14d0:	8b 0c 97             	mov    (%rdi,%rdx,4),%ecx
    14d3:	0f af c9             	imul   %ecx,%ecx
    14d6:	01 c8                	add    %ecx,%eax
    14d8:	48 ff c2             	inc    %rdx
    14db:	49 39 d1             	cmp    %rdx,%r9
    14de:	74 25                	je     1505 <func0+0x55>
    14e0:	89 d6                	mov    %edx,%esi
    14e2:	49 0f af f0          	imul   %r8,%rsi
    14e6:	48 c1 ee 21          	shr    $0x21,%rsi
    14ea:	8d 34 76             	lea    (%rsi,%rsi,2),%esi
    14ed:	39 f2                	cmp    %esi,%edx
    14ef:	74 df                	je     14d0 <func0+0x20>
    14f1:	8b 0c 97             	mov    (%rdi,%rdx,4),%ecx
    14f4:	f6 c2 03             	test   $0x3,%dl
    14f7:	75 dd                	jne    14d6 <func0+0x26>
    14f9:	89 ce                	mov    %ecx,%esi
    14fb:	0f af f1             	imul   %ecx,%esi
    14fe:	0f af ce             	imul   %esi,%ecx
    1501:	eb d3                	jmp    14d6 <func0+0x26>
    1503:	31 c0                	xor    %eax,%eax
    1505:	c3                   	ret    

