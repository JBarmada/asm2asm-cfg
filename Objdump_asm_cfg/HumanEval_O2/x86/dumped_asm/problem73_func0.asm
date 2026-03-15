0000000000001320 <func0>:
    1320:	53                   	push   %rbx
    1321:	41 89 f0             	mov    %esi,%r8d
    1324:	41 c1 e8 1f          	shr    $0x1f,%r8d
    1328:	41 01 f0             	add    %esi,%r8d
    132b:	41 d1 f8             	sar    %r8d
    132e:	45 31 d2             	xor    %r10d,%r10d
    1331:	83 fe 02             	cmp    $0x2,%esi
    1334:	7c 34                	jl     136a <func0+0x4a>
    1336:	45 89 c1             	mov    %r8d,%r9d
    1339:	44 8d 5e ff          	lea    -0x1(%rsi),%r11d
    133d:	31 c9                	xor    %ecx,%ecx
    133f:	45 31 d2             	xor    %r10d,%r10d
    1342:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    1349:	1f 84 00 00 00 00 00 
    1350:	8b 04 8f             	mov    (%rdi,%rcx,4),%eax
    1353:	49 63 db             	movslq %r11d,%rbx
    1356:	3b 04 9f             	cmp    (%rdi,%rbx,4),%eax
    1359:	75 29                	jne    1384 <func0+0x64>
    135b:	45 8d 14 42          	lea    (%r10,%rax,2),%r10d
    135f:	48 ff c1             	inc    %rcx
    1362:	41 ff cb             	dec    %r11d
    1365:	49 39 c9             	cmp    %rcx,%r9
    1368:	75 e6                	jne    1350 <func0+0x30>
    136a:	81 e6 01 00 00 80    	and    $0x80000001,%esi
    1370:	83 fe 01             	cmp    $0x1,%esi
    1373:	75 07                	jne    137c <func0+0x5c>
    1375:	49 63 c0             	movslq %r8d,%rax
    1378:	44 03 14 87          	add    (%rdi,%rax,4),%r10d
    137c:	41 39 d2             	cmp    %edx,%r10d
    137f:	0f 9e c0             	setle  %al
    1382:	5b                   	pop    %rbx
    1383:	c3                   	ret    
    1384:	31 c0                	xor    %eax,%eax
    1386:	5b                   	pop    %rbx
    1387:	c3                   	ret    

