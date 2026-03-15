0000000000001220 <func0>:
    1220:	89 f8                	mov    %edi,%eax
    1222:	85 f6                	test   %esi,%esi
    1224:	74 17                	je     123d <func0+0x1d>
    1226:	89 f2                	mov    %esi,%edx
    1228:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    122f:	00 
    1230:	89 d1                	mov    %edx,%ecx
    1232:	99                   	cltd   
    1233:	f7 f9                	idiv   %ecx
    1235:	89 c8                	mov    %ecx,%eax
    1237:	85 d2                	test   %edx,%edx
    1239:	75 f5                	jne    1230 <func0+0x10>
    123b:	89 c8                	mov    %ecx,%eax
    123d:	c3                   	ret    

