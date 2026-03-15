00000001000005d8 <_func0>:
1000005d8: 6b02003f    	cmp	w1, w2
1000005dc: 1a82b028    	csel	w8, w1, w2, lt
1000005e0: 6b010049    	subs	w9, w2, w1
1000005e4: 1a89b3e9    	csel	w9, wzr, w9, lt
1000005e8: 0b000108    	add	w8, w8, w0
1000005ec: 29002468    	stp	w8, w9, [x3]
1000005f0: d65f03c0    	ret

