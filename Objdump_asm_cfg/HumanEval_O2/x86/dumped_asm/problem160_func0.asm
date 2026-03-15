0000000000001330 <func0>:
    1330:	89 d0                	mov    %edx,%eax
    1332:	29 f0                	sub    %esi,%eax
    1334:	7d 0a                	jge    1340 <func0+0x10>
    1336:	01 fa                	add    %edi,%edx
    1338:	89 11                	mov    %edx,(%rcx)
    133a:	31 c0                	xor    %eax,%eax
    133c:	89 41 04             	mov    %eax,0x4(%rcx)
    133f:	c3                   	ret    
    1340:	01 fe                	add    %edi,%esi
    1342:	89 31                	mov    %esi,(%rcx)
    1344:	89 41 04             	mov    %eax,0x4(%rcx)
    1347:	c3                   	ret    

