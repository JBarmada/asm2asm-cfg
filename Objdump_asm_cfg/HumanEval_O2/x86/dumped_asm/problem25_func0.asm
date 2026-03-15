0000000000001230 <func0>:
    1230:	b9 01 00 00 00       	mov    $0x1,%ecx
    1235:	83 ff 04             	cmp    $0x4,%edi
    1238:	7c 1a                	jl     1254 <func0+0x24>
    123a:	be 02 00 00 00       	mov    $0x2,%esi
    123f:	90                   	nop
    1240:	89 f8                	mov    %edi,%eax
    1242:	99                   	cltd   
    1243:	f7 fe                	idiv   %esi
    1245:	85 d2                	test   %edx,%edx
    1247:	74 0d                	je     1256 <func0+0x26>
    1249:	ff c6                	inc    %esi
    124b:	89 f0                	mov    %esi,%eax
    124d:	0f af c6             	imul   %esi,%eax
    1250:	39 f8                	cmp    %edi,%eax
    1252:	7e ec                	jle    1240 <func0+0x10>
    1254:	89 c8                	mov    %ecx,%eax
    1256:	c3                   	ret    

