0000000000000acc <func0>:
 acc:	7139                	add	sp,sp,-64
 ace:	fc06                	sd	ra,56(sp)
 ad0:	f822                	sd	s0,48(sp)
 ad2:	f426                	sd	s1,40(sp)
 ad4:	f04a                	sd	s2,32(sp)
 ad6:	ec4e                	sd	s3,24(sp)
 ad8:	e852                	sd	s4,16(sp)
 ada:	e456                	sd	s5,8(sp)
 adc:	e05a                	sd	s6,0(sp)
 ade:	00058023          	sb	zero,0(a1)
 ae2:	04a05e63          	blez	a0,b3e <func0+0x72>
 ae6:	892e                	mv	s2,a1
 ae8:	84aa                	mv	s1,a0
 aea:	4981                	li	s3,0
 aec:	00000a17          	auipc	s4,0x0
 af0:	274a0a13          	add	s4,s4,628 # d60 <_IO_stdin_used+0x20c>
 af4:	00000a97          	auipc	s5,0x0
 af8:	238a8a93          	add	s5,s5,568 # d2c <_IO_stdin_used+0x1d8>
 afc:	a809                	j	b0e <func0+0x42>
 afe:	0004851b          	sext.w	a0,s1
 b02:	00a025b3          	sgtz	a1,a0
 b06:	00b989bb          	addw	s3,s3,a1
 b0a:	02a05a63          	blez	a0,b3e <func0+0x72>
 b0e:	02099513          	sll	a0,s3,0x20
 b12:	01e55593          	srl	a1,a0,0x1e
 b16:	95d2                	add	a1,a1,s4
 b18:	4180                	lw	s0,0(a1)
 b1a:	0004859b          	sext.w	a1,s1
 b1e:	fe85c0e3          	blt	a1,s0,afe <func0+0x32>
 b22:	9101                	srl	a0,a0,0x20
 b24:	050a                	sll	a0,a0,0x2
 b26:	9556                	add	a0,a0,s5
 b28:	4108                	lw	a0,0(a0)
 b2a:	00aa8b33          	add	s6,s5,a0
 b2e:	854a                	mv	a0,s2
 b30:	85da                	mv	a1,s6
 b32:	b2fff0ef          	jal	660 <strcat@plt>
 b36:	9c81                	subw	s1,s1,s0
 b38:	fe84dbe3          	bge	s1,s0,b2e <func0+0x62>
 b3c:	b7c9                	j	afe <func0+0x32>
 b3e:	70e2                	ld	ra,56(sp)
 b40:	7442                	ld	s0,48(sp)
 b42:	74a2                	ld	s1,40(sp)
 b44:	7902                	ld	s2,32(sp)
 b46:	69e2                	ld	s3,24(sp)
 b48:	6a42                	ld	s4,16(sp)
 b4a:	6aa2                	ld	s5,8(sp)
 b4c:	6b02                	ld	s6,0(sp)
 b4e:	6121                	add	sp,sp,64
 b50:	8082                	ret
