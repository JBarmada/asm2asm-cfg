0000000000001300 <func0>:
    1300:	89 f9                	mov    %edi,%ecx
    1302:	f7 d9                	neg    %ecx
    1304:	0f 48 cf             	cmovs  %edi,%ecx
    1307:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    130c:	48 89 c8             	mov    %rcx,%rax
    130f:	48 0f af c2          	imul   %rdx,%rax
    1313:	48 c1 e8 23          	shr    $0x23,%rax
    1317:	01 c0                	add    %eax,%eax
    1319:	8d 04 80             	lea    (%rax,%rax,4),%eax
    131c:	29 c1                	sub    %eax,%ecx
    131e:	89 f0                	mov    %esi,%eax
    1320:	f7 d8                	neg    %eax
    1322:	0f 48 c6             	cmovs  %esi,%eax
    1325:	48 0f af d0          	imul   %rax,%rdx
    1329:	48 c1 ea 23          	shr    $0x23,%rdx
    132d:	01 d2                	add    %edx,%edx
    132f:	8d 14 92             	lea    (%rdx,%rdx,4),%edx
    1332:	29 d0                	sub    %edx,%eax
    1334:	0f af c1             	imul   %ecx,%eax
    1337:	c3                   	ret    

