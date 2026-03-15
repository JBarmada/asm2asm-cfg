00000000000014a0 <func0>:
    14a0:	f3 0f 10 0f          	movss  (%rdi),%xmm1
    14a4:	f3 0f 11 0a          	movss  %xmm1,(%rdx)
    14a8:	f3 0f 10 47 04       	movss  0x4(%rdi),%xmm0
    14ad:	f3 0f 11 42 04       	movss  %xmm0,0x4(%rdx)
    14b2:	85 f6                	test   %esi,%esi
    14b4:	7e 7d                	jle    1533 <func0+0x93>
    14b6:	41 89 f0             	mov    %esi,%r8d
    14b9:	f3 0f 10 1d c3 0c 00 	movss  0xcc3(%rip),%xmm3        # 2184 <_IO_stdin_used+0x184>
    14c0:	00 
    14c1:	45 31 c9             	xor    %r9d,%r9d
    14c4:	0f 28 15 45 0b 00 00 	movaps 0xb45(%rip),%xmm2        # 2010 <_IO_stdin_used+0x10>
    14cb:	4d 89 c2             	mov    %r8,%r10
    14ce:	48 89 fe             	mov    %rdi,%rsi
    14d1:	eb 19                	jmp    14ec <func0+0x4c>
    14d3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    14da:	84 00 00 00 00 00 
    14e0:	48 83 c6 04          	add    $0x4,%rsi
    14e4:	49 ff ca             	dec    %r10
    14e7:	4d 39 c1             	cmp    %r8,%r9
    14ea:	74 47                	je     1533 <func0+0x93>
    14ec:	4c 89 c8             	mov    %r9,%rax
    14ef:	49 ff c1             	inc    %r9
    14f2:	4d 39 c1             	cmp    %r8,%r9
    14f5:	73 e9                	jae    14e0 <func0+0x40>
    14f7:	b9 01 00 00 00       	mov    $0x1,%ecx
    14fc:	eb 0a                	jmp    1508 <func0+0x68>
    14fe:	66 90                	xchg   %ax,%ax
    1500:	48 ff c1             	inc    %rcx
    1503:	49 39 ca             	cmp    %rcx,%r10
    1506:	74 d8                	je     14e0 <func0+0x40>
    1508:	f3 0f 10 24 87       	movss  (%rdi,%rax,4),%xmm4
    150d:	0f 28 ec             	movaps %xmm4,%xmm5
    1510:	f3 0f 5c 2c 8e       	subss  (%rsi,%rcx,4),%xmm5
    1515:	0f 54 ea             	andps  %xmm2,%xmm5
    1518:	0f 2e dd             	ucomiss %xmm5,%xmm3
    151b:	76 e3                	jbe    1500 <func0+0x60>
    151d:	f3 0f 11 22          	movss  %xmm4,(%rdx)
    1521:	f3 0f 10 04 8e       	movss  (%rsi,%rcx,4),%xmm0
    1526:	f3 0f 11 42 04       	movss  %xmm0,0x4(%rdx)
    152b:	0f 28 cc             	movaps %xmm4,%xmm1
    152e:	0f 28 dd             	movaps %xmm5,%xmm3
    1531:	eb cd                	jmp    1500 <func0+0x60>
    1533:	0f 2e c8             	ucomiss %xmm0,%xmm1
    1536:	76 09                	jbe    1541 <func0+0xa1>
    1538:	f3 0f 11 02          	movss  %xmm0,(%rdx)
    153c:	f3 0f 11 4a 04       	movss  %xmm1,0x4(%rdx)
    1541:	c3                   	ret    

