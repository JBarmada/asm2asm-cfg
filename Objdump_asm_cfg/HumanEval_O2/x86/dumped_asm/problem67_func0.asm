00000000000012f0 <func0>:
    12f0:	0f b6 17             	movzbl (%rdi),%edx
    12f3:	84 d2                	test   %dl,%dl
    12f5:	74 26                	je     131d <func0+0x2d>
    12f7:	48 ff c7             	inc    %rdi
    12fa:	31 c9                	xor    %ecx,%ecx
    12fc:	31 c0                	xor    %eax,%eax
    12fe:	66 90                	xchg   %ax,%ax
    1300:	8d 72 bf             	lea    -0x41(%rdx),%esi
    1303:	40 80 fe 1a          	cmp    $0x1a,%sil
    1307:	0f b6 d2             	movzbl %dl,%edx
    130a:	0f 43 d1             	cmovae %ecx,%edx
    130d:	0f b6 d2             	movzbl %dl,%edx
    1310:	01 d0                	add    %edx,%eax
    1312:	0f b6 17             	movzbl (%rdi),%edx
    1315:	48 ff c7             	inc    %rdi
    1318:	84 d2                	test   %dl,%dl
    131a:	75 e4                	jne    1300 <func0+0x10>
    131c:	c3                   	ret    
    131d:	31 c0                	xor    %eax,%eax
    131f:	c3                   	ret    

