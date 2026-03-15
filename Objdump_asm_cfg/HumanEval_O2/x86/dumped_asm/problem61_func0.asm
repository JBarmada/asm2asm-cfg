0000000000001240 <func0>:
    1240:	8d 4f 01             	lea    0x1(%rdi),%ecx
    1243:	0f af cf             	imul   %edi,%ecx
    1246:	89 c8                	mov    %ecx,%eax
    1248:	c1 e8 1f             	shr    $0x1f,%eax
    124b:	01 c8                	add    %ecx,%eax
    124d:	d1 f8                	sar    %eax
    124f:	c3                   	ret    

