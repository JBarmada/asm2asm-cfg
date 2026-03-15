00000001000004d4 <_func0>:
1000004d4: 340000e1    	cbz	w1, 0x1000004f0 <_func0+0x1c>
1000004d8: aa0103e8    	mov	x8, x1
1000004dc: 1ac10c09    	sdiv	w9, w0, w1
1000004e0: 1b018121    	msub	w1, w9, w1, w0
1000004e4: aa0803e0    	mov	x0, x8
1000004e8: 35ffff81    	cbnz	w1, 0x1000004d8 <_func0+0x4>
1000004ec: aa0803e0    	mov	x0, x8
1000004f0: d65f03c0    	ret

