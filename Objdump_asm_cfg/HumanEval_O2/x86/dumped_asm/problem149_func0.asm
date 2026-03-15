0000000000001550 <func0>:
    1550:	55                   	push   %rbp
    1551:	41 57                	push   %r15
    1553:	41 56                	push   %r14
    1555:	41 55                	push   %r13
    1557:	41 54                	push   %r12
    1559:	53                   	push   %rbx
    155a:	50                   	push   %rax
    155b:	48 89 14 24          	mov    %rdx,(%rsp)
    155f:	49 89 f7             	mov    %rsi,%r15
    1562:	49 89 fd             	mov    %rdi,%r13
    1565:	48 8d 1d ff 0a 00 00 	lea    0xaff(%rip),%rbx        # 206b <_IO_stdin_used+0x6b>
    156c:	48 89 df             	mov    %rbx,%rdi
    156f:	4c 89 ee             	mov    %r13,%rsi
    1572:	e8 d9 fa ff ff       	call   1050 <strcmp@plt>
    1577:	45 31 e4             	xor    %r12d,%r12d
    157a:	f7 d8                	neg    %eax
    157c:	41 be 00 00 00 00    	mov    $0x0,%r14d
    1582:	45 19 f6             	sbb    %r14d,%r14d
    1585:	48 89 df             	mov    %rbx,%rdi
    1588:	4c 89 fe             	mov    %r15,%rsi
    158b:	e8 c0 fa ff ff       	call   1050 <strcmp@plt>
    1590:	f7 d8                	neg    %eax
    1592:	45 19 e4             	sbb    %r12d,%r12d
    1595:	48 8d 1d c3 0a 00 00 	lea    0xac3(%rip),%rbx        # 205f <_IO_stdin_used+0x5f>
    159c:	48 89 df             	mov    %rbx,%rdi
    159f:	4c 89 ee             	mov    %r13,%rsi
    15a2:	e8 a9 fa ff ff       	call   1050 <strcmp@plt>
    15a7:	85 c0                	test   %eax,%eax
    15a9:	bd 01 00 00 00       	mov    $0x1,%ebp
    15ae:	44 0f 44 f5          	cmove  %ebp,%r14d
    15b2:	48 89 df             	mov    %rbx,%rdi
    15b5:	4c 89 fe             	mov    %r15,%rsi
    15b8:	e8 93 fa ff ff       	call   1050 <strcmp@plt>
    15bd:	85 c0                	test   %eax,%eax
    15bf:	44 0f 44 e5          	cmove  %ebp,%r12d
    15c3:	48 8d 1d 9b 0a 00 00 	lea    0xa9b(%rip),%rbx        # 2065 <_IO_stdin_used+0x65>
    15ca:	48 89 df             	mov    %rbx,%rdi
    15cd:	4c 89 ee             	mov    %r13,%rsi
    15d0:	e8 7b fa ff ff       	call   1050 <strcmp@plt>
    15d5:	85 c0                	test   %eax,%eax
    15d7:	bd 02 00 00 00       	mov    $0x2,%ebp
    15dc:	44 0f 44 f5          	cmove  %ebp,%r14d
    15e0:	48 89 df             	mov    %rbx,%rdi
    15e3:	4c 89 fe             	mov    %r15,%rsi
    15e6:	e8 65 fa ff ff       	call   1050 <strcmp@plt>
    15eb:	85 c0                	test   %eax,%eax
    15ed:	44 0f 44 e5          	cmove  %ebp,%r12d
    15f1:	48 8d 1d 9a 0a 00 00 	lea    0xa9a(%rip),%rbx        # 2092 <_IO_stdin_used+0x92>
    15f8:	48 89 df             	mov    %rbx,%rdi
    15fb:	4c 89 ee             	mov    %r13,%rsi
    15fe:	e8 4d fa ff ff       	call   1050 <strcmp@plt>
    1603:	85 c0                	test   %eax,%eax
    1605:	bd 03 00 00 00       	mov    $0x3,%ebp
    160a:	44 0f 44 f5          	cmove  %ebp,%r14d
    160e:	48 89 df             	mov    %rbx,%rdi
    1611:	4c 89 fe             	mov    %r15,%rsi
    1614:	e8 37 fa ff ff       	call   1050 <strcmp@plt>
    1619:	85 c0                	test   %eax,%eax
    161b:	44 0f 44 e5          	cmove  %ebp,%r12d
    161f:	48 8d 1d ec 09 00 00 	lea    0x9ec(%rip),%rbx        # 2012 <_IO_stdin_used+0x12>
    1626:	48 89 df             	mov    %rbx,%rdi
    1629:	4c 89 ee             	mov    %r13,%rsi
    162c:	e8 1f fa ff ff       	call   1050 <strcmp@plt>
    1631:	85 c0                	test   %eax,%eax
    1633:	bd 04 00 00 00       	mov    $0x4,%ebp
    1638:	44 0f 44 f5          	cmove  %ebp,%r14d
    163c:	48 89 df             	mov    %rbx,%rdi
    163f:	4c 89 fe             	mov    %r15,%rsi
    1642:	e8 09 fa ff ff       	call   1050 <strcmp@plt>
    1647:	85 c0                	test   %eax,%eax
    1649:	44 0f 44 e5          	cmove  %ebp,%r12d
    164d:	48 8d 1d b0 09 00 00 	lea    0x9b0(%rip),%rbx        # 2004 <_IO_stdin_used+0x4>
    1654:	48 89 df             	mov    %rbx,%rdi
    1657:	4c 89 ee             	mov    %r13,%rsi
    165a:	e8 f1 f9 ff ff       	call   1050 <strcmp@plt>
    165f:	85 c0                	test   %eax,%eax
    1661:	bd 05 00 00 00       	mov    $0x5,%ebp
    1666:	44 0f 44 f5          	cmove  %ebp,%r14d
    166a:	48 89 df             	mov    %rbx,%rdi
    166d:	4c 89 fe             	mov    %r15,%rsi
    1670:	e8 db f9 ff ff       	call   1050 <strcmp@plt>
    1675:	85 c0                	test   %eax,%eax
    1677:	44 0f 44 e5          	cmove  %ebp,%r12d
    167b:	48 8d 1d 89 09 00 00 	lea    0x989(%rip),%rbx        # 200b <_IO_stdin_used+0xb>
    1682:	48 89 df             	mov    %rbx,%rdi
    1685:	4c 89 ee             	mov    %r13,%rsi
    1688:	e8 c3 f9 ff ff       	call   1050 <strcmp@plt>
    168d:	85 c0                	test   %eax,%eax
    168f:	bd 06 00 00 00       	mov    $0x6,%ebp
    1694:	44 0f 44 f5          	cmove  %ebp,%r14d
    1698:	48 89 df             	mov    %rbx,%rdi
    169b:	4c 89 fe             	mov    %r15,%rsi
    169e:	e8 ad f9 ff ff       	call   1050 <strcmp@plt>
    16a3:	85 c0                	test   %eax,%eax
    16a5:	44 0f 44 e5          	cmove  %ebp,%r12d
    16a9:	48 8d 1d 6a 09 00 00 	lea    0x96a(%rip),%rbx        # 201a <_IO_stdin_used+0x1a>
    16b0:	48 89 df             	mov    %rbx,%rdi
    16b3:	4c 89 ee             	mov    %r13,%rsi
    16b6:	e8 95 f9 ff ff       	call   1050 <strcmp@plt>
    16bb:	85 c0                	test   %eax,%eax
    16bd:	bd 07 00 00 00       	mov    $0x7,%ebp
    16c2:	44 0f 44 f5          	cmove  %ebp,%r14d
    16c6:	48 89 df             	mov    %rbx,%rdi
    16c9:	4c 89 fe             	mov    %r15,%rsi
    16cc:	e8 7f f9 ff ff       	call   1050 <strcmp@plt>
    16d1:	48 8b 0c 24          	mov    (%rsp),%rcx
    16d5:	85 c0                	test   %eax,%eax
    16d7:	44 0f 44 e5          	cmove  %ebp,%r12d
    16db:	41 83 fe ff          	cmp    $0xffffffff,%r14d
    16df:	0f 84 30 01 00 00    	je     1815 <func0+0x2c5>
    16e5:	41 83 fc ff          	cmp    $0xffffffff,%r12d
    16e9:	0f 84 26 01 00 00    	je     1815 <func0+0x2c5>
    16ef:	45 39 e6             	cmp    %r12d,%r14d
    16f2:	0f 84 1d 01 00 00    	je     1815 <func0+0x2c5>
    16f8:	45 89 e7             	mov    %r12d,%r15d
    16fb:	45 0f 4f fe          	cmovg  %r14d,%r15d
    16ff:	45 0f 4c e6          	cmovl  %r14d,%r12d
    1703:	44 89 e0             	mov    %r12d,%eax
    1706:	f7 d0                	not    %eax
    1708:	44 01 f8             	add    %r15d,%eax
    170b:	89 01                	mov    %eax,(%rcx)
    170d:	0f 8e 02 01 00 00    	jle    1815 <func0+0x2c5>
    1713:	89 c7                	mov    %eax,%edi
    1715:	48 c1 e7 03          	shl    $0x3,%rdi
    1719:	e8 42 f9 ff ff       	call   1060 <malloc@plt>
    171e:	41 8d 4c 24 01       	lea    0x1(%r12),%ecx
    1723:	44 39 f9             	cmp    %r15d,%ecx
    1726:	0f 83 f1 00 00 00    	jae    181d <func0+0x2cd>
    172c:	89 cb                	mov    %ecx,%ebx
    172e:	44 89 f9             	mov    %r15d,%ecx
    1731:	44 29 e1             	sub    %r12d,%ecx
    1734:	44 8d 51 fe          	lea    -0x2(%rcx),%r10d
    1738:	41 83 fa 05          	cmp    $0x5,%r10d
    173c:	0f 82 ea 00 00 00    	jb     182c <func0+0x2dc>
    1742:	83 c1 fe             	add    $0xfffffffe,%ecx
    1745:	0f 88 e1 00 00 00    	js     182c <func0+0x2dc>
    174b:	49 ff c2             	inc    %r10
    174e:	4d 89 d0             	mov    %r10,%r8
    1751:	49 83 e0 fc          	and    $0xfffffffffffffffc,%r8
    1755:	49 8d 48 fc          	lea    -0x4(%r8),%rcx
    1759:	49 89 c9             	mov    %rcx,%r9
    175c:	49 c1 e9 02          	shr    $0x2,%r9
    1760:	49 ff c1             	inc    %r9
    1763:	48 85 c9             	test   %rcx,%rcx
    1766:	0f 84 35 01 00 00    	je     18a1 <func0+0x351>
    176c:	4c 89 cf             	mov    %r9,%rdi
    176f:	48 83 e7 fe          	and    $0xfffffffffffffffe,%rdi
    1773:	48 8d 0d 36 26 00 00 	lea    0x2636(%rip),%rcx        # 3db0 <__do_global_dtors_aux_fini_array_entry+0x8>
    177a:	48 8d 14 d9          	lea    (%rcx,%rbx,8),%rdx
    177e:	48 83 c2 30          	add    $0x30,%rdx
    1782:	31 ed                	xor    %ebp,%ebp
    1784:	49 bb 00 00 00 00 04 	movabs $0x400000000,%r11
    178b:	00 00 00 
    178e:	49 be 00 00 00 00 08 	movabs $0x800000000,%r14
    1795:	00 00 00 
    1798:	31 f6                	xor    %esi,%esi
    179a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    17a0:	48 89 e9             	mov    %rbp,%rcx
    17a3:	48 c1 f9 1d          	sar    $0x1d,%rcx
    17a7:	0f 10 44 f2 d0       	movups -0x30(%rdx,%rsi,8),%xmm0
    17ac:	0f 10 4c f2 e0       	movups -0x20(%rdx,%rsi,8),%xmm1
    17b1:	0f 10 54 f2 f0       	movups -0x10(%rdx,%rsi,8),%xmm2
    17b6:	0f 10 1c f2          	movups (%rdx,%rsi,8),%xmm3
    17ba:	0f 11 04 08          	movups %xmm0,(%rax,%rcx,1)
    17be:	0f 11 4c 08 10       	movups %xmm1,0x10(%rax,%rcx,1)
    17c3:	49 8d 0c 2b          	lea    (%r11,%rbp,1),%rcx
    17c7:	48 c1 f9 1d          	sar    $0x1d,%rcx
    17cb:	0f 11 14 08          	movups %xmm2,(%rax,%rcx,1)
    17cf:	0f 11 5c 08 10       	movups %xmm3,0x10(%rax,%rcx,1)
    17d4:	48 83 c6 08          	add    $0x8,%rsi
    17d8:	4c 01 f5             	add    %r14,%rbp
    17db:	48 83 c7 fe          	add    $0xfffffffffffffffe,%rdi
    17df:	75 bf                	jne    17a0 <func0+0x250>
    17e1:	41 f6 c1 01          	test   $0x1,%r9b
    17e5:	74 20                	je     1807 <func0+0x2b7>
    17e7:	48 8d 0c 1e          	lea    (%rsi,%rbx,1),%rcx
    17eb:	48 8d 15 be 25 00 00 	lea    0x25be(%rip),%rdx        # 3db0 <__do_global_dtors_aux_fini_array_entry+0x8>
    17f2:	0f 10 04 ca          	movups (%rdx,%rcx,8),%xmm0
    17f6:	0f 10 4c ca 10       	movups 0x10(%rdx,%rcx,8),%xmm1
    17fb:	48 63 ce             	movslq %esi,%rcx
    17fe:	0f 11 04 c8          	movups %xmm0,(%rax,%rcx,8)
    1802:	0f 11 4c c8 10       	movups %xmm1,0x10(%rax,%rcx,8)
    1807:	4d 39 c2             	cmp    %r8,%r10
    180a:	74 11                	je     181d <func0+0x2cd>
    180c:	4c 01 c3             	add    %r8,%rbx
    180f:	43 8d 14 04          	lea    (%r12,%r8,1),%edx
    1813:	eb 1a                	jmp    182f <func0+0x2df>
    1815:	c7 01 00 00 00 00    	movl   $0x0,(%rcx)
    181b:	31 c0                	xor    %eax,%eax
    181d:	48 83 c4 08          	add    $0x8,%rsp
    1821:	5b                   	pop    %rbx
    1822:	41 5c                	pop    %r12
    1824:	41 5d                	pop    %r13
    1826:	41 5e                	pop    %r14
    1828:	41 5f                	pop    %r15
    182a:	5d                   	pop    %rbp
    182b:	c3                   	ret    
    182c:	44 89 e2             	mov    %r12d,%edx
    182f:	44 89 fe             	mov    %r15d,%esi
    1832:	29 de                	sub    %ebx,%esi
    1834:	8d 4b 01             	lea    0x1(%rbx),%ecx
    1837:	40 f6 c6 01          	test   $0x1,%sil
    183b:	74 1a                	je     1857 <func0+0x307>
    183d:	48 8d 35 6c 25 00 00 	lea    0x256c(%rip),%rsi        # 3db0 <__do_global_dtors_aux_fini_array_entry+0x8>
    1844:	48 8b 34 de          	mov    (%rsi,%rbx,8),%rsi
    1848:	44 29 e2             	sub    %r12d,%edx
    184b:	48 63 d2             	movslq %edx,%rdx
    184e:	48 89 34 d0          	mov    %rsi,(%rax,%rdx,8)
    1852:	89 da                	mov    %ebx,%edx
    1854:	48 ff c3             	inc    %rbx
    1857:	41 39 cf             	cmp    %ecx,%r15d
    185a:	74 c1                	je     181d <func0+0x2cd>
    185c:	44 89 e6             	mov    %r12d,%esi
    185f:	f7 de                	neg    %esi
    1861:	4c 8d 05 48 25 00 00 	lea    0x2548(%rip),%r8        # 3db0 <__do_global_dtors_aux_fini_array_entry+0x8>
    1868:	48 89 d9             	mov    %rbx,%rcx
    186b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1870:	44 29 e2             	sub    %r12d,%edx
    1873:	48 63 d2             	movslq %edx,%rdx
    1876:	49 8b 2c d8          	mov    (%r8,%rbx,8),%rbp
    187a:	49 8b 7c d8 08       	mov    0x8(%r8,%rbx,8),%rdi
    187f:	48 89 2c d0          	mov    %rbp,(%rax,%rdx,8)
    1883:	8d 14 1e             	lea    (%rsi,%rbx,1),%edx
    1886:	48 63 d2             	movslq %edx,%rdx
    1889:	48 89 3c d0          	mov    %rdi,(%rax,%rdx,8)
    188d:	48 83 c1 02          	add    $0x2,%rcx
    1891:	8d 53 01             	lea    0x1(%rbx),%edx
    1894:	48 89 cb             	mov    %rcx,%rbx
    1897:	41 39 cf             	cmp    %ecx,%r15d
    189a:	75 d4                	jne    1870 <func0+0x320>
    189c:	e9 7c ff ff ff       	jmp    181d <func0+0x2cd>
    18a1:	31 f6                	xor    %esi,%esi
    18a3:	41 f6 c1 01          	test   $0x1,%r9b
    18a7:	0f 85 3a ff ff ff    	jne    17e7 <func0+0x297>
    18ad:	e9 55 ff ff ff       	jmp    1807 <func0+0x2b7>

