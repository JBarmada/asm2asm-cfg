00000000000013d0 <func0>:
    13d0:	39 d7                	cmp    %edx,%edi
    13d2:	0f 4f d7             	cmovg  %edi,%edx
    13d5:	39 ce                	cmp    %ecx,%esi
    13d7:	0f 4c ce             	cmovl  %esi,%ecx
    13da:	29 d1                	sub    %edx,%ecx
    13dc:	48 8d 35 21 0c 00 00 	lea    0xc21(%rip),%rsi        # 2004 <_IO_stdin_used+0x4>
    13e3:	83 f9 02             	cmp    $0x2,%ecx
    13e6:	7d 04                	jge    13ec <func0+0x1c>
    13e8:	48 89 f0             	mov    %rsi,%rax
    13eb:	c3                   	ret    
    13ec:	4c 8d 05 7d 0c 00 00 	lea    0xc7d(%rip),%r8        # 2070 <_IO_stdin_used+0x70>
    13f3:	83 f9 04             	cmp    $0x4,%ecx
    13f6:	73 04                	jae    13fc <func0+0x2c>
    13f8:	4c 89 c0             	mov    %r8,%rax
    13fb:	c3                   	ret    
    13fc:	bf 02 00 00 00       	mov    $0x2,%edi
    1401:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1408:	0f 1f 84 00 00 00 00 
    140f:	00 
    1410:	89 c8                	mov    %ecx,%eax
    1412:	99                   	cltd   
    1413:	f7 ff                	idiv   %edi
    1415:	85 d2                	test   %edx,%edx
    1417:	74 cf                	je     13e8 <func0+0x18>
    1419:	ff c7                	inc    %edi
    141b:	89 f8                	mov    %edi,%eax
    141d:	0f af c7             	imul   %edi,%eax
    1420:	39 c8                	cmp    %ecx,%eax
    1422:	7e ec                	jle    1410 <func0+0x40>
    1424:	4c 89 c0             	mov    %r8,%rax
    1427:	c3                   	ret    

