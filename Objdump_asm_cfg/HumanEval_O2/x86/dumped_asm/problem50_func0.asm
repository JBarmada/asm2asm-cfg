00000000000012e0 <func0>:
    12e0:	85 ff                	test   %edi,%edi
    12e2:	7e 14                	jle    12f8 <func0+0x18>
    12e4:	8d 47 ff             	lea    -0x1(%rdi),%eax
    12e7:	89 f9                	mov    %edi,%ecx
    12e9:	83 e1 03             	and    $0x3,%ecx
    12ec:	83 f8 03             	cmp    $0x3,%eax
    12ef:	73 0d                	jae    12fe <func0+0x1e>
    12f1:	ba 01 00 00 00       	mov    $0x1,%edx
    12f6:	eb 36                	jmp    132e <func0+0x4e>
    12f8:	b8 01 00 00 00       	mov    $0x1,%eax
    12fd:	c3                   	ret    
    12fe:	83 e7 fc             	and    $0xfffffffc,%edi
    1301:	ba 01 00 00 00       	mov    $0x1,%edx
    1306:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    130d:	00 00 00 
    1310:	01 d2                	add    %edx,%edx
    1312:	89 d0                	mov    %edx,%eax
    1314:	99                   	cltd   
    1315:	f7 fe                	idiv   %esi
    1317:	8d 04 12             	lea    (%rdx,%rdx,1),%eax
    131a:	99                   	cltd   
    131b:	f7 fe                	idiv   %esi
    131d:	8d 04 12             	lea    (%rdx,%rdx,1),%eax
    1320:	99                   	cltd   
    1321:	f7 fe                	idiv   %esi
    1323:	8d 04 12             	lea    (%rdx,%rdx,1),%eax
    1326:	99                   	cltd   
    1327:	f7 fe                	idiv   %esi
    1329:	83 c7 fc             	add    $0xfffffffc,%edi
    132c:	75 e2                	jne    1310 <func0+0x30>
    132e:	85 c9                	test   %ecx,%ecx
    1330:	74 19                	je     134b <func0+0x6b>
    1332:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1339:	1f 84 00 00 00 00 00 
    1340:	01 d2                	add    %edx,%edx
    1342:	89 d0                	mov    %edx,%eax
    1344:	99                   	cltd   
    1345:	f7 fe                	idiv   %esi
    1347:	ff c9                	dec    %ecx
    1349:	75 f5                	jne    1340 <func0+0x60>
    134b:	89 d0                	mov    %edx,%eax
    134d:	c3                   	ret    

