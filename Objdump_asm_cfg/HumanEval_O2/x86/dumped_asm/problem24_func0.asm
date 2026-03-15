00000000000011e0 <func0>:
    11e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    11e5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    11ec:	00 00 00 00 
    11f0:	ff c0                	inc    %eax
    11f2:	80 3f 00             	cmpb   $0x0,(%rdi)
    11f5:	48 8d 7f 01          	lea    0x1(%rdi),%rdi
    11f9:	75 f5                	jne    11f0 <func0+0x10>
    11fb:	c3                   	ret    

