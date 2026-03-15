00000000000012b0 <func0>:
    12b0:	85 ff                	test   %edi,%edi
    12b2:	7e 4d                	jle    1301 <func0+0x51>
    12b4:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    12ba:	31 c9                	xor    %ecx,%ecx
    12bc:	41 b8 cd cc cc cc    	mov    $0xcccccccd,%r8d
    12c2:	b8 01 00 00 00       	mov    $0x1,%eax
    12c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    12ce:	00 00 
    12d0:	89 fe                	mov    %edi,%esi
    12d2:	49 0f af f0          	imul   %r8,%rsi
    12d6:	48 c1 ee 23          	shr    $0x23,%rsi
    12da:	8d 14 36             	lea    (%rsi,%rsi,1),%edx
    12dd:	44 8d 14 92          	lea    (%rdx,%rdx,4),%r10d
    12e1:	89 fa                	mov    %edi,%edx
    12e3:	44 29 d2             	sub    %r10d,%edx
    12e6:	f6 c2 01             	test   $0x1,%dl
    12e9:	41 0f 44 d1          	cmove  %r9d,%edx
    12ed:	41 0f 45 c9          	cmovne %r9d,%ecx
    12f1:	0f af c2             	imul   %edx,%eax
    12f4:	83 ff 09             	cmp    $0x9,%edi
    12f7:	89 f7                	mov    %esi,%edi
    12f9:	77 d5                	ja     12d0 <func0+0x20>
    12fb:	85 c9                	test   %ecx,%ecx
    12fd:	0f 44 c1             	cmove  %ecx,%eax
    1300:	c3                   	ret    
    1301:	31 c0                	xor    %eax,%eax
    1303:	c3                   	ret    

