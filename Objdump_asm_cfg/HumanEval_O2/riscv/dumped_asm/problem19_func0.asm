0000000000000844 <func0>:
 844:	7139                	add	sp,sp,-64
 846:	fc06                	sd	ra,56(sp)
 848:	f822                	sd	s0,48(sp)
 84a:	f426                	sd	s1,40(sp)
 84c:	f04a                	sd	s2,32(sp)
 84e:	ec4e                	sd	s3,24(sp)
 850:	e852                	sd	s4,16(sp)
 852:	e456                	sd	s5,8(sp)
 854:	892e                	mv	s2,a1
 856:	8aaa                	mv	s5,a0
 858:	e19ff0ef          	jal	670 <strlen@plt>
 85c:	8a2a                	mv	s4,a0
 85e:	0005041b          	sext.w	s0,a0
 862:	854a                	mv	a0,s2
 864:	e0dff0ef          	jal	670 <strlen@plt>
 868:	00143593          	seqz	a1,s0
 86c:	0005099b          	sext.w	s3,a0
 870:	01342633          	slt	a2,s0,s3
 874:	8dd1                	or	a1,a1,a2
 876:	4401                	li	s0,0
 878:	e19d                	bnez	a1,89e <func0+0x5a>
 87a:	4401                	li	s0,0
 87c:	40aa053b          	subw	a0,s4,a0
 880:	2505                	addw	a0,a0,1
 882:	1502                	sll	a0,a0,0x20
 884:	02055493          	srl	s1,a0,0x20
 888:	8556                	mv	a0,s5
 88a:	85ca                	mv	a1,s2
 88c:	864e                	mv	a2,s3
 88e:	e03ff0ef          	jal	690 <strncmp@plt>
 892:	00153513          	seqz	a0,a0
 896:	9c29                	addw	s0,s0,a0
 898:	14fd                	add	s1,s1,-1
 89a:	0a85                	add	s5,s5,1
 89c:	f4f5                	bnez	s1,888 <func0+0x44>
 89e:	8522                	mv	a0,s0
 8a0:	70e2                	ld	ra,56(sp)
 8a2:	7442                	ld	s0,48(sp)
 8a4:	74a2                	ld	s1,40(sp)
 8a6:	7902                	ld	s2,32(sp)
 8a8:	69e2                	ld	s3,24(sp)
 8aa:	6a42                	ld	s4,16(sp)
 8ac:	6aa2                	ld	s5,8(sp)
 8ae:	6121                	add	sp,sp,64
 8b0:	8082                	ret
