00000000000008a4 <func0>:
 8a4:	bb010113          	add	sp,sp,-1104
 8a8:	44113423          	sd	ra,1096(sp)
 8ac:	44813023          	sd	s0,1088(sp)
 8b0:	42913c23          	sd	s1,1080(sp)
 8b4:	43213823          	sd	s2,1072(sp)
 8b8:	43313423          	sd	s3,1064(sp)
 8bc:	43413023          	sd	s4,1056(sp)
 8c0:	41513c23          	sd	s5,1048(sp)
 8c4:	41613823          	sd	s6,1040(sp)
 8c8:	892a                	mv	s2,a0
 8ca:	0808                	add	a0,sp,16
 8cc:	40000613          	li	a2,1024
 8d0:	01010993          	add	s3,sp,16
 8d4:	4581                	li	a1,0
 8d6:	dfbff0ef          	jal	6d0 <memset@plt>
 8da:	00094483          	lbu	s1,0(s2)
 8de:	c8a9                	beqz	s1,930 <func0+0x8c>
 8e0:	de1ff0ef          	jal	6c0 <__ctype_tolower_loc@plt>
 8e4:	00053a83          	ld	s5,0(a0)
 8e8:	4a01                	li	s4,0
 8ea:	00190413          	add	s0,s2,1
 8ee:	4905                	li	s2,1
 8f0:	a029                	j	8fa <func0+0x56>
 8f2:	00044483          	lbu	s1,0(s0)
 8f6:	0405                	add	s0,s0,1
 8f8:	cc8d                	beqz	s1,932 <func0+0x8e>
 8fa:	0ff4f513          	zext.b	a0,s1
 8fe:	050a                	sll	a0,a0,0x2
 900:	9556                	add	a0,a0,s5
 902:	00054483          	lbu	s1,0(a0)
 906:	00249513          	sll	a0,s1,0x2
 90a:	00a98b33          	add	s6,s3,a0
 90e:	000b2503          	lw	a0,0(s6)
 912:	f165                	bnez	a0,8f2 <func0+0x4e>
 914:	dcdff0ef          	jal	6e0 <__ctype_b_loc@plt>
 918:	6108                	ld	a0,0(a0)
 91a:	00149593          	sll	a1,s1,0x1
 91e:	952e                	add	a0,a0,a1
 920:	00154503          	lbu	a0,1(a0)
 924:	8911                	and	a0,a0,4
 926:	d571                	beqz	a0,8f2 <func0+0x4e>
 928:	012b2023          	sw	s2,0(s6)
 92c:	2a05                	addw	s4,s4,1
 92e:	b7d1                	j	8f2 <func0+0x4e>
 930:	4a01                	li	s4,0
 932:	8552                	mv	a0,s4
 934:	44813083          	ld	ra,1096(sp)
 938:	44013403          	ld	s0,1088(sp)
 93c:	43813483          	ld	s1,1080(sp)
 940:	43013903          	ld	s2,1072(sp)
 944:	42813983          	ld	s3,1064(sp)
 948:	42013a03          	ld	s4,1056(sp)
 94c:	41813a83          	ld	s5,1048(sp)
 950:	41013b03          	ld	s6,1040(sp)
 954:	45010113          	add	sp,sp,1104
 958:	8082                	ret
