0000000000001230 <func0>:
    1230:	83 ff 04             	cmp    $0x4,%edi
    1233:	7d 03                	jge    1238 <func0+0x8>
    1235:	89 f8                	mov    %edi,%eax
    1237:	c3                   	ret    
    1238:	b9 02 00 00 00       	mov    $0x2,%ecx
    123d:	eb 0c                	jmp    124b <func0+0x1b>
    123f:	90                   	nop
    1240:	ff c1                	inc    %ecx
    1242:	89 c8                	mov    %ecx,%eax
    1244:	0f af c1             	imul   %ecx,%eax
    1247:	39 f8                	cmp    %edi,%eax
    1249:	7f ea                	jg     1235 <func0+0x5>
    124b:	89 f8                	mov    %edi,%eax
    124d:	0f 1f 00             	nopl   (%rax)
    1250:	99                   	cltd   
    1251:	f7 f9                	idiv   %ecx
    1253:	39 cf                	cmp    %ecx,%edi
    1255:	7e e9                	jle    1240 <func0+0x10>
    1257:	85 d2                	test   %edx,%edx
    1259:	75 e5                	jne    1240 <func0+0x10>
    125b:	89 f8                	mov    %edi,%eax
    125d:	99                   	cltd   
    125e:	f7 f9                	idiv   %ecx
    1260:	89 c7                	mov    %eax,%edi
    1262:	eb ec                	jmp    1250 <func0+0x20>

