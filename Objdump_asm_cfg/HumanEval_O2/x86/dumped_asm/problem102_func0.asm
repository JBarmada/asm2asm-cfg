0000000000001310 <func0>:
    1310:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1315:	39 fe                	cmp    %edi,%esi
    1317:	7c 11                	jl     132a <func0+0x1a>
    1319:	89 f1                	mov    %esi,%ecx
    131b:	81 e1 01 00 00 80    	and    $0x80000001,%ecx
    1321:	39 fe                	cmp    %edi,%esi
    1323:	75 06                	jne    132b <func0+0x1b>
    1325:	83 f9 01             	cmp    $0x1,%ecx
    1328:	75 01                	jne    132b <func0+0x1b>
    132a:	c3                   	ret    
    132b:	31 c0                	xor    %eax,%eax
    132d:	83 f9 01             	cmp    $0x1,%ecx
    1330:	0f 94 c0             	sete   %al
    1333:	29 c6                	sub    %eax,%esi
    1335:	89 f0                	mov    %esi,%eax
    1337:	c3                   	ret    

