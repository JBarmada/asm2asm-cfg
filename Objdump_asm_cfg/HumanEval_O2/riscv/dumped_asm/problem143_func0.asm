00000000000009d4 <func0>:
 9d4:	04b05263          	blez	a1,a18 <func0+0x44>
 9d8:	4681                	li	a3,0
 9da:	4601                	li	a2,0
 9dc:	aaaab737          	lui	a4,0xaaaab
 9e0:	aab7081b          	addw	a6,a4,-1365 # ffffffffaaaaaaab <__global_pointer$+0xffffffffaaaa82ab>
 9e4:	55555737          	lui	a4,0x55555
 9e8:	5557089b          	addw	a7,a4,1365 # 55555555 <__global_pointer$+0x55552d55>
 9ec:	a809                	j	9fe <func0+0x2a>
 9ee:	4118                	lw	a4,0(a0)
 9f0:	02e7073b          	mulw	a4,a4,a4
 9f4:	9e39                	addw	a2,a2,a4
 9f6:	0685                	add	a3,a3,1
 9f8:	0511                	add	a0,a0,4
 9fa:	02d58063          	beq	a1,a3,a1a <func0+0x46>
 9fe:	0306873b          	mulw	a4,a3,a6
 a02:	fee8f6e3          	bgeu	a7,a4,9ee <func0+0x1a>
 a06:	4118                	lw	a4,0(a0)
 a08:	0036f793          	and	a5,a3,3
 a0c:	f7e5                	bnez	a5,9f4 <func0+0x20>
 a0e:	02e707bb          	mulw	a5,a4,a4
 a12:	02e7873b          	mulw	a4,a5,a4
 a16:	bff9                	j	9f4 <func0+0x20>
 a18:	4601                	li	a2,0
 a1a:	8532                	mv	a0,a2
 a1c:	8082                	ret
