00000000000014b0 <func0>:
    14b0:	53                   	push   %rbx
    14b1:	39 f7                	cmp    %esi,%edi
    14b3:	7e 09                	jle    14be <func0+0xe>
    14b5:	48 8d 05 19 0d 00 00 	lea    0xd19(%rip),%rax        # 21d5 <_IO_stdin_used+0x1d5>
    14bc:	5b                   	pop    %rbx
    14bd:	c3                   	ret    
    14be:	89 f3                	mov    %esi,%ebx
    14c0:	01 fb                	add    %edi,%ebx
    14c2:	bf 21 00 00 00       	mov    $0x21,%edi
    14c7:	e8 84 fb ff ff       	call   1050 <malloc@plt>
    14cc:	c6 00 00             	movb   $0x0,(%rax)
    14cf:	c6 40 20 00          	movb   $0x0,0x20(%rax)
    14d3:	48 83 c0 20          	add    $0x20,%rax
    14d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    14de:	00 00 
    14e0:	89 d9                	mov    %ebx,%ecx
    14e2:	c1 e9 1f             	shr    $0x1f,%ecx
    14e5:	01 d9                	add    %ebx,%ecx
    14e7:	89 ca                	mov    %ecx,%edx
    14e9:	d1 fa                	sar    %edx
    14eb:	c1 e9 1f             	shr    $0x1f,%ecx
    14ee:	01 d1                	add    %edx,%ecx
    14f0:	81 e1 fe 00 00 00    	and    $0xfe,%ecx
    14f6:	89 d6                	mov    %edx,%esi
    14f8:	29 ce                	sub    %ecx,%esi
    14fa:	40 80 c6 30          	add    $0x30,%sil
    14fe:	40 88 70 ff          	mov    %sil,-0x1(%rax)
    1502:	48 ff c8             	dec    %rax
    1505:	83 fb 03             	cmp    $0x3,%ebx
    1508:	89 d3                	mov    %edx,%ebx
    150a:	7f d4                	jg     14e0 <func0+0x30>
    150c:	5b                   	pop    %rbx
    150d:	c3                   	ret    

