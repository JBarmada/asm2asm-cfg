0000000000001160 <func0>:
    1160:	55                   	push   %rbp
    1161:	53                   	push   %rbx
    1162:	50                   	push   %rax
    1163:	89 f5                	mov    %esi,%ebp
    1165:	48 89 fb             	mov    %rdi,%rbx
    1168:	8d 45 01             	lea    0x1(%rbp),%eax
    116b:	48 63 f8             	movslq %eax,%rdi
    116e:	be 04 00 00 00       	mov    $0x4,%esi
    1173:	e8 c8 fe ff ff       	call   1040 <calloc@plt>
    1178:	85 ed                	test   %ebp,%ebp
    117a:	7e 2f                	jle    11ab <func0+0x4b>
    117c:	41 89 e8             	mov    %ebp,%r8d
    117f:	83 fd 01             	cmp    $0x1,%ebp
    1182:	75 3d                	jne    11c1 <func0+0x61>
    1184:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
    1189:	31 d2                	xor    %edx,%edx
    118b:	41 f6 c0 01          	test   $0x1,%r8b
    118f:	74 1f                	je     11b0 <func0+0x50>
    1191:	48 63 0c 93          	movslq (%rbx,%rdx,4),%rcx
    1195:	8b 14 88             	mov    (%rax,%rcx,4),%edx
    1198:	ff c2                	inc    %edx
    119a:	39 e9                	cmp    %ebp,%ecx
    119c:	89 ee                	mov    %ebp,%esi
    119e:	0f 4f f1             	cmovg  %ecx,%esi
    11a1:	89 14 88             	mov    %edx,(%rax,%rcx,4)
    11a4:	39 ca                	cmp    %ecx,%edx
    11a6:	0f 4d ee             	cmovge %esi,%ebp
    11a9:	eb 05                	jmp    11b0 <func0+0x50>
    11ab:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
    11b0:	48 89 c7             	mov    %rax,%rdi
    11b3:	e8 78 fe ff ff       	call   1030 <free@plt>
    11b8:	89 e8                	mov    %ebp,%eax
    11ba:	48 83 c4 08          	add    $0x8,%rsp
    11be:	5b                   	pop    %rbx
    11bf:	5d                   	pop    %rbp
    11c0:	c3                   	ret    
    11c1:	45 89 c1             	mov    %r8d,%r9d
    11c4:	41 83 e1 fe          	and    $0xfffffffe,%r9d
    11c8:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
    11cd:	31 d2                	xor    %edx,%edx
    11cf:	eb 1d                	jmp    11ee <func0+0x8e>
    11d1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    11d8:	0f 1f 84 00 00 00 00 
    11df:	00 
    11e0:	39 f9                	cmp    %edi,%ecx
    11e2:	0f 4d ee             	cmovge %esi,%ebp
    11e5:	48 83 c2 02          	add    $0x2,%rdx
    11e9:	49 39 d1             	cmp    %rdx,%r9
    11ec:	74 9d                	je     118b <func0+0x2b>
    11ee:	48 63 3c 93          	movslq (%rbx,%rdx,4),%rdi
    11f2:	8b 0c b8             	mov    (%rax,%rdi,4),%ecx
    11f5:	ff c1                	inc    %ecx
    11f7:	89 0c b8             	mov    %ecx,(%rax,%rdi,4)
    11fa:	89 fe                	mov    %edi,%esi
    11fc:	39 ef                	cmp    %ebp,%edi
    11fe:	7f 02                	jg     1202 <func0+0xa2>
    1200:	89 ee                	mov    %ebp,%esi
    1202:	39 f9                	cmp    %edi,%ecx
    1204:	0f 4d ee             	cmovge %esi,%ebp
    1207:	48 63 7c 93 04       	movslq 0x4(%rbx,%rdx,4),%rdi
    120c:	8b 0c b8             	mov    (%rax,%rdi,4),%ecx
    120f:	ff c1                	inc    %ecx
    1211:	89 0c b8             	mov    %ecx,(%rax,%rdi,4)
    1214:	89 fe                	mov    %edi,%esi
    1216:	39 ef                	cmp    %ebp,%edi
    1218:	7f c6                	jg     11e0 <func0+0x80>
    121a:	89 ee                	mov    %ebp,%esi
    121c:	eb c2                	jmp    11e0 <func0+0x80>

