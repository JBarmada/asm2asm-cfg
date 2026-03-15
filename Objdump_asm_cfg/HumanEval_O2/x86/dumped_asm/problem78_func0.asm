00000000000012f0 <func0>:
    12f0:	89 f8                	mov    %edi,%eax
    12f2:	f7 d8                	neg    %eax
    12f4:	0f 48 c7             	cmovs  %edi,%eax
    12f7:	31 c9                	xor    %ecx,%ecx
    12f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1300:	89 ca                	mov    %ecx,%edx
    1302:	0f af d1             	imul   %ecx,%edx
    1305:	0f af d1             	imul   %ecx,%edx
    1308:	ff c1                	inc    %ecx
    130a:	39 c2                	cmp    %eax,%edx
    130c:	72 f2                	jb     1300 <func0+0x10>
    130e:	0f 96 c0             	setbe  %al
    1311:	0f b6 c0             	movzbl %al,%eax
    1314:	c3                   	ret    

