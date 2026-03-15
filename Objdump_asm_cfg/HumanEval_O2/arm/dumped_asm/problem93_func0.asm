0000000100000584 <_func0>:
100000584: 1e264003    	frinta	s3, s0
100000588: 1e264024    	frinta	s4, s1
10000058c: 1e264045    	frinta	s5, s2
100000590: 1e202060    	fcmp	s3, s0
100000594: 1e210480    	fccmp	s4, s1, #0x0, eq
100000598: 1e2204a0    	fccmp	s5, s2, #0x0, eq
10000059c: 54000060    	b.eq	0x1000005a8 <_func0+0x24>
1000005a0: 52800000    	mov	w0, #0x0                ; =0
1000005a4: d65f03c0    	ret
1000005a8: 1e212803    	fadd	s3, s0, s1
1000005ac: 1e222060    	fcmp	s3, s2
1000005b0: 1a9f17e8    	cset	w8, eq
1000005b4: 1e222803    	fadd	s3, s0, s2
1000005b8: 1e212060    	fcmp	s3, s1
1000005bc: 1a9f1508    	csinc	w8, w8, wzr, ne
1000005c0: 1e222821    	fadd	s1, s1, s2
1000005c4: 1e202020    	fcmp	s1, s0
1000005c8: 1a9f1500    	csinc	w0, w8, wzr, ne
1000005cc: d65f03c0    	ret

