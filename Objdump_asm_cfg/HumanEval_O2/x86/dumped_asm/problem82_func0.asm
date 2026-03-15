00000000000014f0 <func0>:
    14f0:	55                   	push   %rbp
    14f1:	41 57                	push   %r15
    14f3:	41 56                	push   %r14
    14f5:	41 55                	push   %r13
    14f7:	41 54                	push   %r12
    14f9:	53                   	push   %rbx
    14fa:	50                   	push   %rax
    14fb:	41 89 f6             	mov    %esi,%r14d
    14fe:	48 89 fb             	mov    %rdi,%rbx
    1501:	48 63 ee             	movslq %esi,%rbp
    1504:	48 8d 3c ed 00 00 00 	lea    0x0(,%rbp,8),%rdi
    150b:	00 
    150c:	e8 4f fb ff ff       	call   1060 <malloc@plt>
    1511:	85 ed                	test   %ebp,%ebp
    1513:	0f 8e a5 01 00 00    	jle    16be <func0+0x1ce>
    1519:	44 89 f1             	mov    %r14d,%ecx
    151c:	31 d2                	xor    %edx,%edx
    151e:	f2 0f 10 05 0a 0c 00 	movsd  0xc0a(%rip),%xmm0        # 2130 <_IO_stdin_used+0x130>
    1525:	00 
    1526:	f2 0f 10 0d 0a 0c 00 	movsd  0xc0a(%rip),%xmm1        # 2138 <_IO_stdin_used+0x138>
    152d:	00 
    152e:	48 8d 35 5b 0c 00 00 	lea    0xc5b(%rip),%rsi        # 2190 <_IO_stdin_used+0x190>
    1535:	f2 0f 10 15 03 0c 00 	movsd  0xc03(%rip),%xmm2        # 2140 <_IO_stdin_used+0x140>
    153c:	00 
    153d:	48 8d 3d 0a 0b 00 00 	lea    0xb0a(%rip),%rdi        # 204e <_IO_stdin_used+0x4e>
    1544:	f2 0f 10 1d fc 0b 00 	movsd  0xbfc(%rip),%xmm3        # 2148 <_IO_stdin_used+0x148>
    154b:	00 
    154c:	48 8d 2d 9d 0b 00 00 	lea    0xb9d(%rip),%rbp        # 20f0 <_IO_stdin_used+0xf0>
    1553:	f2 0f 10 25 f5 0b 00 	movsd  0xbf5(%rip),%xmm4        # 2150 <_IO_stdin_used+0x150>
    155a:	00 
    155b:	4c 8d 05 e5 0a 00 00 	lea    0xae5(%rip),%r8        # 2047 <_IO_stdin_used+0x47>
    1562:	f2 0f 10 2d ee 0b 00 	movsd  0xbee(%rip),%xmm5        # 2158 <_IO_stdin_used+0x158>
    1569:	00 
    156a:	4c 8d 0d 21 0c 00 00 	lea    0xc21(%rip),%r9        # 2192 <_IO_stdin_used+0x192>
    1571:	f2 0f 10 35 e7 0b 00 	movsd  0xbe7(%rip),%xmm6        # 2160 <_IO_stdin_used+0x160>
    1578:	00 
    1579:	4c 8d 15 15 0c 00 00 	lea    0xc15(%rip),%r10        # 2195 <_IO_stdin_used+0x195>
    1580:	f2 44 0f 10 25 df 0b 	movsd  0xbdf(%rip),%xmm12        # 2168 <_IO_stdin_used+0x168>
    1587:	00 00 
    1589:	4c 8d 1d bc 0a 00 00 	lea    0xabc(%rip),%r11        # 204c <_IO_stdin_used+0x4c>
    1590:	f2 44 0f 10 05 d7 0b 	movsd  0xbd7(%rip),%xmm8        # 2170 <_IO_stdin_used+0x170>
    1597:	00 00 
    1599:	4c 8d 35 a9 0a 00 00 	lea    0xaa9(%rip),%r14        # 2049 <_IO_stdin_used+0x49>
    15a0:	f2 44 0f 10 0d cf 0b 	movsd  0xbcf(%rip),%xmm9        # 2178 <_IO_stdin_used+0x178>
    15a7:	00 00 
    15a9:	f2 44 0f 10 15 ce 0b 	movsd  0xbce(%rip),%xmm10        # 2180 <_IO_stdin_used+0x180>
    15b0:	00 00 
    15b2:	4c 8d 2d 35 0b 00 00 	lea    0xb35(%rip),%r13        # 20ee <_IO_stdin_used+0xee>
    15b9:	f2 44 0f 10 1d c6 0b 	movsd  0xbc6(%rip),%xmm11        # 2188 <_IO_stdin_used+0x188>
    15c0:	00 00 
    15c2:	4c 8d 3d 05 0b 00 00 	lea    0xb05(%rip),%r15        # 20ce <_IO_stdin_used+0xce>
    15c9:	4c 8d 25 74 0a 00 00 	lea    0xa74(%rip),%r12        # 2044 <_IO_stdin_used+0x44>
    15d0:	eb 1e                	jmp    15f0 <func0+0x100>
    15d2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    15d9:	1f 84 00 00 00 00 00 
    15e0:	4c 89 24 d0          	mov    %r12,(%rax,%rdx,8)
    15e4:	48 ff c2             	inc    %rdx
    15e7:	48 39 d1             	cmp    %rdx,%rcx
    15ea:	0f 84 ce 00 00 00    	je     16be <func0+0x1ce>
    15f0:	f3 0f 10 3c 93       	movss  (%rbx,%rdx,4),%xmm7
    15f5:	f3 0f 5a ff          	cvtss2sd %xmm7,%xmm7
    15f9:	66 0f 2e f8          	ucomisd %xmm0,%xmm7
    15fd:	73 e1                	jae    15e0 <func0+0xf0>
    15ff:	66 0f 2e f9          	ucomisd %xmm1,%xmm7
    1603:	76 0b                	jbe    1610 <func0+0x120>
    1605:	48 89 34 d0          	mov    %rsi,(%rax,%rdx,8)
    1609:	eb d9                	jmp    15e4 <func0+0xf4>
    160b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1610:	66 0f 2e fa          	ucomisd %xmm2,%xmm7
    1614:	76 06                	jbe    161c <func0+0x12c>
    1616:	48 89 3c d0          	mov    %rdi,(%rax,%rdx,8)
    161a:	eb c8                	jmp    15e4 <func0+0xf4>
    161c:	66 0f 2e fb          	ucomisd %xmm3,%xmm7
    1620:	76 06                	jbe    1628 <func0+0x138>
    1622:	48 89 2c d0          	mov    %rbp,(%rax,%rdx,8)
    1626:	eb bc                	jmp    15e4 <func0+0xf4>
    1628:	66 0f 2e fc          	ucomisd %xmm4,%xmm7
    162c:	76 06                	jbe    1634 <func0+0x144>
    162e:	4c 89 04 d0          	mov    %r8,(%rax,%rdx,8)
    1632:	eb b0                	jmp    15e4 <func0+0xf4>
    1634:	66 0f 2e fd          	ucomisd %xmm5,%xmm7
    1638:	76 06                	jbe    1640 <func0+0x150>
    163a:	4c 89 0c d0          	mov    %r9,(%rax,%rdx,8)
    163e:	eb a4                	jmp    15e4 <func0+0xf4>
    1640:	66 0f 2e fe          	ucomisd %xmm6,%xmm7
    1644:	76 06                	jbe    164c <func0+0x15c>
    1646:	4c 89 14 d0          	mov    %r10,(%rax,%rdx,8)
    164a:	eb 98                	jmp    15e4 <func0+0xf4>
    164c:	66 41 0f 2e fc       	ucomisd %xmm12,%xmm7
    1651:	76 06                	jbe    1659 <func0+0x169>
    1653:	4c 89 1c d0          	mov    %r11,(%rax,%rdx,8)
    1657:	eb 8b                	jmp    15e4 <func0+0xf4>
    1659:	66 41 0f 2e f8       	ucomisd %xmm8,%xmm7
    165e:	76 09                	jbe    1669 <func0+0x179>
    1660:	4c 89 34 d0          	mov    %r14,(%rax,%rdx,8)
    1664:	e9 7b ff ff ff       	jmp    15e4 <func0+0xf4>
    1669:	66 41 0f 2e f9       	ucomisd %xmm9,%xmm7
    166e:	76 17                	jbe    1687 <func0+0x197>
    1670:	4c 8d 2d 15 0a 00 00 	lea    0xa15(%rip),%r13        # 208c <_IO_stdin_used+0x8c>
    1677:	4c 89 2c d0          	mov    %r13,(%rax,%rdx,8)
    167b:	4c 8d 2d 6c 0a 00 00 	lea    0xa6c(%rip),%r13        # 20ee <_IO_stdin_used+0xee>
    1682:	e9 5d ff ff ff       	jmp    15e4 <func0+0xf4>
    1687:	66 41 0f 2e fa       	ucomisd %xmm10,%xmm7
    168c:	76 09                	jbe    1697 <func0+0x1a7>
    168e:	4c 89 2c d0          	mov    %r13,(%rax,%rdx,8)
    1692:	e9 4d ff ff ff       	jmp    15e4 <func0+0xf4>
    1697:	66 41 0f 2e fb       	ucomisd %xmm11,%xmm7
    169c:	76 17                	jbe    16b5 <func0+0x1c5>
    169e:	4c 8d 35 08 0a 00 00 	lea    0xa08(%rip),%r14        # 20ad <_IO_stdin_used+0xad>
    16a5:	4c 89 34 d0          	mov    %r14,(%rax,%rdx,8)
    16a9:	4c 8d 35 99 09 00 00 	lea    0x999(%rip),%r14        # 2049 <_IO_stdin_used+0x49>
    16b0:	e9 2f ff ff ff       	jmp    15e4 <func0+0xf4>
    16b5:	4c 89 3c d0          	mov    %r15,(%rax,%rdx,8)
    16b9:	e9 26 ff ff ff       	jmp    15e4 <func0+0xf4>
    16be:	48 83 c4 08          	add    $0x8,%rsp
    16c2:	5b                   	pop    %rbx
    16c3:	41 5c                	pop    %r12
    16c5:	41 5d                	pop    %r13
    16c7:	41 5e                	pop    %r14
    16c9:	41 5f                	pop    %r15
    16cb:	5d                   	pop    %rbp
    16cc:	c3                   	ret    

