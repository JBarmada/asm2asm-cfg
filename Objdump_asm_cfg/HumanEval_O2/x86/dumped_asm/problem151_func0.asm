00000000000013a0 <func0>:
    13a0:	41 89 d0             	mov    %edx,%r8d
    13a3:	41 89 f1             	mov    %esi,%r9d
    13a6:	31 c9                	xor    %ecx,%ecx
    13a8:	83 ff 02             	cmp    $0x2,%edi
    13ab:	0f 9d c1             	setge  %cl
    13ae:	83 ff 04             	cmp    $0x4,%edi
    13b1:	7c 22                	jl     13d5 <func0+0x35>
    13b3:	be 02 00 00 00       	mov    $0x2,%esi
    13b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    13bf:	00 
    13c0:	89 f8                	mov    %edi,%eax
    13c2:	99                   	cltd   
    13c3:	f7 fe                	idiv   %esi
    13c5:	85 d2                	test   %edx,%edx
    13c7:	0f 44 ca             	cmove  %edx,%ecx
    13ca:	ff c6                	inc    %esi
    13cc:	89 f0                	mov    %esi,%eax
    13ce:	0f af c6             	imul   %esi,%eax
    13d1:	39 f8                	cmp    %edi,%eax
    13d3:	7e eb                	jle    13c0 <func0+0x20>
    13d5:	85 c9                	test   %ecx,%ecx
    13d7:	45 0f 44 c8          	cmove  %r8d,%r9d
    13db:	44 89 c8             	mov    %r9d,%eax
    13de:	c3                   	ret    

