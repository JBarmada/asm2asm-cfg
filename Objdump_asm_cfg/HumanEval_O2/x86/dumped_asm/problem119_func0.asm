0000000000001470 <func0>:
    1470:	55                   	push   %rbp
    1471:	41 57                	push   %r15
    1473:	41 56                	push   %r14
    1475:	41 54                	push   %r12
    1477:	53                   	push   %rbx
    1478:	49 89 ff             	mov    %rdi,%r15
    147b:	e8 b0 fb ff ff       	call   1030 <strlen@plt>
    1480:	83 c0 fe             	add    $0xfffffffe,%eax
    1483:	85 c0                	test   %eax,%eax
    1485:	7e 74                	jle    14fb <func0+0x8b>
    1487:	89 c3                	mov    %eax,%ebx
    1489:	41 bc ff ff ff ff    	mov    $0xffffffff,%r12d
    148f:	49 01 dc             	add    %rbx,%r12
    1492:	48 ff c3             	inc    %rbx
    1495:	4c 8d 35 60 0d 00 00 	lea    0xd60(%rip),%r14        # 21fc <_IO_stdin_used+0x1fc>
    149c:	eb 0e                	jmp    14ac <func0+0x3c>
    149e:	66 90                	xchg   %ax,%ax
    14a0:	49 ff cc             	dec    %r12
    14a3:	48 ff cb             	dec    %rbx
    14a6:	48 83 fb 01          	cmp    $0x1,%rbx
    14aa:	7e 4f                	jle    14fb <func0+0x8b>
    14ac:	41 0f b6 6c 1f ff    	movzbl -0x1(%r15,%rbx,1),%ebp
    14b2:	40 0f be f5          	movsbl %bpl,%esi
    14b6:	ba 0b 00 00 00       	mov    $0xb,%edx
    14bb:	4c 89 f7             	mov    %r14,%rdi
    14be:	e8 8d fb ff ff       	call   1050 <memchr@plt>
    14c3:	48 85 c0             	test   %rax,%rax
    14c6:	74 d8                	je     14a0 <func0+0x30>
    14c8:	41 0f be 34 1f       	movsbl (%r15,%rbx,1),%esi
    14cd:	ba 0b 00 00 00       	mov    $0xb,%edx
    14d2:	4c 89 f7             	mov    %r14,%rdi
    14d5:	e8 76 fb ff ff       	call   1050 <memchr@plt>
    14da:	48 85 c0             	test   %rax,%rax
    14dd:	75 c1                	jne    14a0 <func0+0x30>
    14df:	44 89 e0             	mov    %r12d,%eax
    14e2:	41 0f be 34 07       	movsbl (%r15,%rax,1),%esi
    14e7:	ba 0b 00 00 00       	mov    $0xb,%edx
    14ec:	4c 89 f7             	mov    %r14,%rdi
    14ef:	e8 5c fb ff ff       	call   1050 <memchr@plt>
    14f4:	48 85 c0             	test   %rax,%rax
    14f7:	75 a7                	jne    14a0 <func0+0x30>
    14f9:	eb 02                	jmp    14fd <func0+0x8d>
    14fb:	31 ed                	xor    %ebp,%ebp
    14fd:	40 88 2d 45 2b 00 00 	mov    %bpl,0x2b45(%rip)        # 4049 <func0.out>
    1504:	48 8d 05 3e 2b 00 00 	lea    0x2b3e(%rip),%rax        # 4049 <func0.out>
    150b:	5b                   	pop    %rbx
    150c:	41 5c                	pop    %r12
    150e:	41 5e                	pop    %r14
    1510:	41 5f                	pop    %r15
    1512:	5d                   	pop    %rbp
    1513:	c3                   	ret    

