0000000000000d48 <func0>:
 d48:	7179                	add	sp,sp,-48
 d4a:	f406                	sd	ra,40(sp)
 d4c:	f022                	sd	s0,32(sp)
 d4e:	ec26                	sd	s1,24(sp)
 d50:	e84a                	sd	s2,16(sp)
 d52:	e44e                	sd	s3,8(sp)
 d54:	842a                	mv	s0,a0
 d56:	91bff0ef          	jal	670 <strlen@plt>
 d5a:	84aa                	mv	s1,a0
 d5c:	2501                	sext.w	a0,a0
 d5e:	4595                	li	a1,5
 d60:	00000917          	auipc	s2,0x0
 d64:	13390913          	add	s2,s2,307 # e93 <_IO_stdin_used+0x67>
 d68:	0ab54a63          	blt	a0,a1,e1c <func0+0xd4>
 d6c:	00044503          	lbu	a0,0(s0)
 d70:	04100593          	li	a1,65
 d74:	0ab56463          	bltu	a0,a1,e1c <func0+0xd4>
 d78:	fa55059b          	addw	a1,a0,-91
 d7c:	0ff5f593          	zext.b	a1,a1
 d80:	0065b593          	sltiu	a1,a1,6
 d84:	07b53513          	sltiu	a0,a0,123
 d88:	00154513          	xor	a0,a0,1
 d8c:	8d4d                	or	a0,a0,a1
 d8e:	e559                	bnez	a0,e1c <func0+0xd4>
 d90:	02049513          	sll	a0,s1,0x20
 d94:	9101                	srl	a0,a0,0x20
 d96:	9522                	add	a0,a0,s0
 d98:	ffc50993          	add	s3,a0,-4
 d9c:	00000597          	auipc	a1,0x0
 da0:	59558593          	add	a1,a1,1429 # 1331 <_IO_stdin_used+0x505>
 da4:	854e                	mv	a0,s3
 da6:	8ebff0ef          	jal	690 <strcmp@plt>
 daa:	c10d                	beqz	a0,dcc <func0+0x84>
 dac:	00000597          	auipc	a1,0x0
 db0:	17758593          	add	a1,a1,375 # f23 <_IO_stdin_used+0xf7>
 db4:	854e                	mv	a0,s3
 db6:	8dbff0ef          	jal	690 <strcmp@plt>
 dba:	c909                	beqz	a0,dcc <func0+0x84>
 dbc:	00000597          	auipc	a1,0x0
 dc0:	13658593          	add	a1,a1,310 # ef2 <_IO_stdin_used+0xc6>
 dc4:	854e                	mv	a0,s3
 dc6:	8cbff0ef          	jal	690 <strcmp@plt>
 dca:	e929                	bnez	a0,e1c <func0+0xd4>
 dcc:	4581                	li	a1,0
 dce:	4501                	li	a0,0
 dd0:	567d                	li	a2,-1
 dd2:	9201                	srl	a2,a2,0x20
 dd4:	8e65                	and	a2,a2,s1
 dd6:	00044683          	lbu	a3,0(s0)
 dda:	fd06871b          	addw	a4,a3,-48
 dde:	0ff77713          	zext.b	a4,a4
 de2:	00a73713          	sltiu	a4,a4,10
 de6:	9db9                	addw	a1,a1,a4
 de8:	fd268693          	add	a3,a3,-46
 dec:	0016b693          	seqz	a3,a3
 df0:	9d35                	addw	a0,a0,a3
 df2:	167d                	add	a2,a2,-1
 df4:	0405                	add	s0,s0,1
 df6:	f265                	bnez	a2,dd6 <func0+0x8e>
 df8:	0045b593          	sltiu	a1,a1,4
 dfc:	0015c593          	xor	a1,a1,1
 e00:	157d                	add	a0,a0,-1
 e02:	00a03533          	snez	a0,a0
 e06:	8d4d                	or	a0,a0,a1
 e08:	e511                	bnez	a0,e14 <func0+0xcc>
 e0a:	00000917          	auipc	s2,0x0
 e0e:	03290913          	add	s2,s2,50 # e3c <_IO_stdin_used+0x10>
 e12:	a029                	j	e1c <func0+0xd4>
 e14:	00000917          	auipc	s2,0x0
 e18:	07f90913          	add	s2,s2,127 # e93 <_IO_stdin_used+0x67>
 e1c:	854a                	mv	a0,s2
 e1e:	70a2                	ld	ra,40(sp)
 e20:	7402                	ld	s0,32(sp)
 e22:	64e2                	ld	s1,24(sp)
 e24:	6942                	ld	s2,16(sp)
 e26:	69a2                	ld	s3,8(sp)
 e28:	6145                	add	sp,sp,48
 e2a:	8082                	ret
