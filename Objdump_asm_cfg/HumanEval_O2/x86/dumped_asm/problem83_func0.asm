0000000000001490 <func0>:
    1490:	50                   	push   %rax
    1491:	e8 9a fb ff ff       	call   1030 <strlen@plt>
    1496:	48 89 c1             	mov    %rax,%rcx
    1499:	83 f9 02             	cmp    $0x2,%ecx
    149c:	7d 04                	jge    14a2 <func0+0x12>
    149e:	31 c0                	xor    %eax,%eax
    14a0:	59                   	pop    %rcx
    14a1:	c3                   	ret    
    14a2:	b0 01                	mov    $0x1,%al
    14a4:	83 f9 04             	cmp    $0x4,%ecx
    14a7:	72 f7                	jb     14a0 <func0+0x10>
    14a9:	be 02 00 00 00       	mov    $0x2,%esi
    14ae:	66 90                	xchg   %ax,%ax
    14b0:	89 c8                	mov    %ecx,%eax
    14b2:	99                   	cltd   
    14b3:	f7 fe                	idiv   %esi
    14b5:	85 d2                	test   %edx,%edx
    14b7:	74 0b                	je     14c4 <func0+0x34>
    14b9:	ff c6                	inc    %esi
    14bb:	89 f0                	mov    %esi,%eax
    14bd:	0f af c6             	imul   %esi,%eax
    14c0:	39 c8                	cmp    %ecx,%eax
    14c2:	7e ec                	jle    14b0 <func0+0x20>
    14c4:	85 d2                	test   %edx,%edx
    14c6:	0f 95 c0             	setne  %al
    14c9:	59                   	pop    %rcx
    14ca:	c3                   	ret    

