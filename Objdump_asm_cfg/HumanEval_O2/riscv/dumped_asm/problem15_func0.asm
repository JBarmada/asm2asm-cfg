0000000000000aa4 <func0>:
 aa4:	715d                	add	sp,sp,-80
 aa6:	e486                	sd	ra,72(sp)
 aa8:	e0a2                	sd	s0,64(sp)
 aaa:	fc26                	sd	s1,56(sp)
 aac:	f84a                	sd	s2,48(sp)
 aae:	f44e                	sd	s3,40(sp)
 ab0:	f052                	sd	s4,32(sp)
 ab2:	ec56                	sd	s5,24(sp)
 ab4:	e85a                	sd	s6,16(sp)
 ab6:	e45e                	sd	s7,8(sp)
 ab8:	892e                	mv	s2,a1
 aba:	8aaa                	mv	s5,a0
 abc:	557d                	li	a0,-1
 abe:	02055413          	srl	s0,a0,0x20
 ac2:	8556                	mv	a0,s5
 ac4:	cadff0ef          	jal	770 <strlen@plt>
 ac8:	8a2a                	mv	s4,a0
 aca:	00050b1b          	sext.w	s6,a0
 ace:	02051493          	sll	s1,a0,0x20
 ad2:	41d4d513          	sra	a0,s1,0x1d
 ad6:	c8bff0ef          	jal	760 <malloc@plt>
 ada:	89aa                	mv	s3,a0
 adc:	0084e533          	or	a0,s1,s0
 ae0:	0505                	add	a0,a0,1
 ae2:	9501                	sra	a0,a0,0x20
 ae4:	c7dff0ef          	jal	760 <malloc@plt>
 ae8:	84aa                	mv	s1,a0
 aea:	00050023          	sb	zero,0(a0)
 aee:	05605563          	blez	s6,b38 <func0+0x94>
 af2:	008a7bb3          	and	s7,s4,s0
 af6:	844e                	mv	s0,s3
 af8:	8526                	mv	a0,s1
 afa:	c77ff0ef          	jal	770 <strlen@plt>
 afe:	8b2a                	mv	s6,a0
 b00:	00250593          	add	a1,a0,2
 b04:	8526                	mv	a0,s1
 b06:	c9bff0ef          	jal	7a0 <realloc@plt>
 b0a:	000a8583          	lb	a1,0(s5)
 b0e:	84aa                	mv	s1,a0
 b10:	955a                	add	a0,a0,s6
 b12:	00b50023          	sb	a1,0(a0)
 b16:	000500a3          	sb	zero,1(a0)
 b1a:	8526                	mv	a0,s1
 b1c:	c55ff0ef          	jal	770 <strlen@plt>
 b20:	0505                	add	a0,a0,1
 b22:	c3fff0ef          	jal	760 <malloc@plt>
 b26:	e008                	sd	a0,0(s0)
 b28:	85a6                	mv	a1,s1
 b2a:	c57ff0ef          	jal	780 <strcpy@plt>
 b2e:	0421                	add	s0,s0,8
 b30:	1bfd                	add	s7,s7,-1
 b32:	0a85                	add	s5,s5,1
 b34:	fc0b92e3          	bnez	s7,af8 <func0+0x54>
 b38:	8526                	mv	a0,s1
 b3a:	c87ff0ef          	jal	7c0 <free@plt>
 b3e:	01492023          	sw	s4,0(s2)
 b42:	854e                	mv	a0,s3
 b44:	60a6                	ld	ra,72(sp)
 b46:	6406                	ld	s0,64(sp)
 b48:	74e2                	ld	s1,56(sp)
 b4a:	7942                	ld	s2,48(sp)
 b4c:	79a2                	ld	s3,40(sp)
 b4e:	7a02                	ld	s4,32(sp)
 b50:	6ae2                	ld	s5,24(sp)
 b52:	6b42                	ld	s6,16(sp)
 b54:	6ba2                	ld	s7,8(sp)
 b56:	6161                	add	sp,sp,80
 b58:	8082                	ret
