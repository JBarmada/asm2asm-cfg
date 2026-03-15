00000000000012e0 <func0>:
    12e0:	85 ff                	test   %edi,%edi
    12e2:	0f 8e 83 00 00 00    	jle    136b <func0+0x8b>
    12e8:	45 31 d2             	xor    %r10d,%r10d
    12eb:	41 b9 cd cc cc cc    	mov    $0xcccccccd,%r9d
    12f1:	31 c0                	xor    %eax,%eax
    12f3:	eb 13                	jmp    1308 <func0+0x28>
    12f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    12fc:	00 00 00 00 
    1300:	41 ff c2             	inc    %r10d
    1303:	41 39 fa             	cmp    %edi,%r10d
    1306:	74 65                	je     136d <func0+0x8d>
    1308:	41 69 f2 a3 8b 2e ba 	imul   $0xba2e8ba3,%r10d,%esi
    130f:	81 fe 75 d1 45 17    	cmp    $0x1745d175,%esi
    1315:	41 0f 93 c0          	setae  %r8b
    1319:	41 69 f2 c5 4e ec c4 	imul   $0xc4ec4ec5,%r10d,%esi
    1320:	81 fe 14 3b b1 13    	cmp    $0x13b13b14,%esi
    1326:	0f 93 c2             	setae  %dl
    1329:	41 84 d0             	test   %dl,%r8b
    132c:	75 d2                	jne    1300 <func0+0x20>
    132e:	45 85 d2             	test   %r10d,%r10d
    1331:	74 cd                	je     1300 <func0+0x20>
    1333:	45 89 d0             	mov    %r10d,%r8d
    1336:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    133d:	00 00 00 
    1340:	44 89 c2             	mov    %r8d,%edx
    1343:	49 0f af d1          	imul   %r9,%rdx
    1347:	48 c1 ea 23          	shr    $0x23,%rdx
    134b:	8d 0c 12             	lea    (%rdx,%rdx,1),%ecx
    134e:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
    1351:	44 89 c6             	mov    %r8d,%esi
    1354:	29 ce                	sub    %ecx,%esi
    1356:	31 c9                	xor    %ecx,%ecx
    1358:	83 fe 07             	cmp    $0x7,%esi
    135b:	0f 94 c1             	sete   %cl
    135e:	01 c8                	add    %ecx,%eax
    1360:	41 83 f8 09          	cmp    $0x9,%r8d
    1364:	41 89 d0             	mov    %edx,%r8d
    1367:	77 d7                	ja     1340 <func0+0x60>
    1369:	eb 95                	jmp    1300 <func0+0x20>
    136b:	31 c0                	xor    %eax,%eax
    136d:	c3                   	ret    

