000000000000097c <func0>:
 97c:	715d                	add	sp,sp,-80
 97e:	e486                	sd	ra,72(sp)
 980:	e0a2                	sd	s0,64(sp)
 982:	fc26                	sd	s1,56(sp)
 984:	f84a                	sd	s2,48(sp)
 986:	f44e                	sd	s3,40(sp)
 988:	f052                	sd	s4,32(sp)
 98a:	ec56                	sd	s5,24(sp)
 98c:	e85a                	sd	s6,16(sp)
 98e:	e45e                	sd	s7,8(sp)
 990:	e062                	sd	s8,0(sp)
 992:	89ae                	mv	s3,a1
 994:	892a                	mv	s2,a0
 996:	852e                	mv	a0,a1
 998:	da9ff0ef          	jal	740 <strlen@plt>
 99c:	84aa                	mv	s1,a0
 99e:	00050a9b          	sext.w	s5,a0
 9a2:	0015151b          	sllw	a0,a0,0x1
 9a6:	00156513          	or	a0,a0,1
 9aa:	d87ff0ef          	jal	730 <malloc@plt>
 9ae:	8a2a                	mv	s4,a0
 9b0:	05505563          	blez	s5,9fa <func0+0x7e>
 9b4:	4401                	li	s0,0
 9b6:	015a0bb3          	add	s7,s4,s5
 9ba:	02049513          	sll	a0,s1,0x20
 9be:	02055c13          	srl	s8,a0,0x20
 9c2:	4b05                	li	s6,1
 9c4:	84d6                	mv	s1,s5
 9c6:	008985b3          	add	a1,s3,s0
 9ca:	8552                	mv	a0,s4
 9cc:	8626                	mv	a2,s1
 9ce:	d43ff0ef          	jal	710 <strncpy@plt>
 9d2:	009a0533          	add	a0,s4,s1
 9d6:	85ce                	mv	a1,s3
 9d8:	8622                	mv	a2,s0
 9da:	d37ff0ef          	jal	710 <strncpy@plt>
 9de:	000b8023          	sb	zero,0(s7)
 9e2:	854a                	mv	a0,s2
 9e4:	85d2                	mv	a1,s4
 9e6:	d7bff0ef          	jal	760 <strstr@plt>
 9ea:	e909                	bnez	a0,9fc <func0+0x80>
 9ec:	0405                	add	s0,s0,1
 9ee:	01542b33          	slt	s6,s0,s5
 9f2:	14fd                	add	s1,s1,-1
 9f4:	fc8c19e3          	bne	s8,s0,9c6 <func0+0x4a>
 9f8:	a011                	j	9fc <func0+0x80>
 9fa:	4b01                	li	s6,0
 9fc:	8552                	mv	a0,s4
 9fe:	d73ff0ef          	jal	770 <free@plt>
 a02:	001b7513          	and	a0,s6,1
 a06:	60a6                	ld	ra,72(sp)
 a08:	6406                	ld	s0,64(sp)
 a0a:	74e2                	ld	s1,56(sp)
 a0c:	7942                	ld	s2,48(sp)
 a0e:	79a2                	ld	s3,40(sp)
 a10:	7a02                	ld	s4,32(sp)
 a12:	6ae2                	ld	s5,24(sp)
 a14:	6b42                	ld	s6,16(sp)
 a16:	6ba2                	ld	s7,8(sp)
 a18:	6c02                	ld	s8,0(sp)
 a1a:	6161                	add	sp,sp,80
 a1c:	8082                	ret
