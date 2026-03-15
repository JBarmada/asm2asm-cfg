00000000000009f4 <func0>:
 9f4:	1141                	add	sp,sp,-16
 9f6:	e406                	sd	ra,8(sp)
 9f8:	c39ff0ef          	jal	630 <strlen@plt>
 9fc:	0005061b          	sext.w	a2,a0
 a00:	4589                	li	a1,2
 a02:	00b65463          	bge	a2,a1,a0a <func0+0x16>
 a06:	4581                	li	a1,0
 a08:	a005                	j	a28 <func0+0x34>
 a0a:	4691                	li	a3,4
 a0c:	4585                	li	a1,1
 a0e:	00d66d63          	bltu	a2,a3,a28 <func0+0x34>
 a12:	4589                	li	a1,2
 a14:	02b566bb          	remw	a3,a0,a1
 a18:	c691                	beqz	a3,a24 <func0+0x30>
 a1a:	2585                	addw	a1,a1,1
 a1c:	02b5873b          	mulw	a4,a1,a1
 a20:	fee65ae3          	bge	a2,a4,a14 <func0+0x20>
 a24:	00d035b3          	snez	a1,a3
 a28:	852e                	mv	a0,a1
 a2a:	60a2                	ld	ra,8(sp)
 a2c:	0141                	add	sp,sp,16
 a2e:	8082                	ret
