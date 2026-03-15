00000000000013a0 <func0>:
    13a0:	53                   	push   %rbx
    13a1:	85 f6                	test   %esi,%esi
    13a3:	7e 6b                	jle    1410 <func0+0x70>
    13a5:	41 89 f0             	mov    %esi,%r8d
    13a8:	45 31 d2             	xor    %r10d,%r10d
    13ab:	41 b9 cd cc cc cc    	mov    $0xcccccccd,%r9d
    13b1:	31 c0                	xor    %eax,%eax
    13b3:	eb 15                	jmp    13ca <func0+0x2a>
    13b5:	89 f2                	mov    %esi,%edx
    13b7:	31 f6                	xor    %esi,%esi
    13b9:	41 39 d3             	cmp    %edx,%r11d
    13bc:	40 0f 9f c6          	setg   %sil
    13c0:	01 f0                	add    %esi,%eax
    13c2:	49 ff c2             	inc    %r10
    13c5:	4d 39 c2             	cmp    %r8,%r10
    13c8:	74 48                	je     1412 <func0+0x72>
    13ca:	42 8b 14 97          	mov    (%rdi,%r10,4),%edx
    13ce:	be 01 00 00 00       	mov    $0x1,%esi
    13d3:	85 d2                	test   %edx,%edx
    13d5:	7f e9                	jg     13c0 <func0+0x20>
    13d7:	89 d6                	mov    %edx,%esi
    13d9:	f7 de                	neg    %esi
    13db:	45 31 db             	xor    %r11d,%r11d
    13de:	83 fa f6             	cmp    $0xfffffff6,%edx
    13e1:	7f d2                	jg     13b5 <func0+0x15>
    13e3:	45 31 db             	xor    %r11d,%r11d
    13e6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    13ed:	00 00 00 
    13f0:	89 f2                	mov    %esi,%edx
    13f2:	49 0f af d1          	imul   %r9,%rdx
    13f6:	48 c1 ea 23          	shr    $0x23,%rdx
    13fa:	8d 0c 12             	lea    (%rdx,%rdx,1),%ecx
    13fd:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
    1400:	89 f3                	mov    %esi,%ebx
    1402:	29 cb                	sub    %ecx,%ebx
    1404:	41 01 db             	add    %ebx,%r11d
    1407:	83 fe 63             	cmp    $0x63,%esi
    140a:	89 d6                	mov    %edx,%esi
    140c:	77 e2                	ja     13f0 <func0+0x50>
    140e:	eb a7                	jmp    13b7 <func0+0x17>
    1410:	31 c0                	xor    %eax,%eax
    1412:	5b                   	pop    %rbx
    1413:	c3                   	ret    

