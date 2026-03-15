0000000000000a08 <func0>:
 a08:	1141                	add	sp,sp,-16
 a0a:	e406                	sd	ra,8(sp)
 a0c:	e022                	sd	s0,0(sp)
 a0e:	00a5d763          	bge	a1,a0,a1c <func0+0x14>
 a12:	00000517          	auipc	a0,0x0
 a16:	22e50513          	add	a0,a0,558 # c40 <_IO_stdin_used+0x1d4>
 a1a:	a0a1                	j	a62 <func0+0x5a>
 a1c:	00a5843b          	addw	s0,a1,a0
 a20:	02100513          	li	a0,33
 a24:	c4dff0ef          	jal	670 <malloc@plt>
 a28:	00050023          	sb	zero,0(a0)
 a2c:	02050593          	add	a1,a0,32
 a30:	02050023          	sb	zero,32(a0)
 a34:	460d                	li	a2,3
 a36:	86a2                	mv	a3,s0
 a38:	01f4551b          	srlw	a0,s0,0x1f
 a3c:	9d21                	addw	a0,a0,s0
 a3e:	4015541b          	sraw	s0,a0,0x1
 a42:	01f5551b          	srlw	a0,a0,0x1f
 a46:	9d21                	addw	a0,a0,s0
 a48:	0fe57513          	and	a0,a0,254
 a4c:	40a4053b          	subw	a0,s0,a0
 a50:	0305071b          	addw	a4,a0,48
 a54:	fff58513          	add	a0,a1,-1
 a58:	fee58fa3          	sb	a4,-1(a1)
 a5c:	85aa                	mv	a1,a0
 a5e:	fcd64ce3          	blt	a2,a3,a36 <func0+0x2e>
 a62:	60a2                	ld	ra,8(sp)
 a64:	6402                	ld	s0,0(sp)
 a66:	0141                	add	sp,sp,16
 a68:	8082                	ret
