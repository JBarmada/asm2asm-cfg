00000000000008d4 <func0>:
 8d4:	4589                	li	a1,2
 8d6:	00b55463          	bge	a0,a1,8de <func0+0xa>
 8da:	4501                	li	a0,0
 8dc:	8082                	ret
 8de:	4611                	li	a2,4
 8e0:	4585                	li	a1,1
 8e2:	00c56d63          	bltu	a0,a2,8fc <func0+0x28>
 8e6:	4589                	li	a1,2
 8e8:	02b56633          	rem	a2,a0,a1
 8ec:	c611                	beqz	a2,8f8 <func0+0x24>
 8ee:	0585                	add	a1,a1,1
 8f0:	02b586b3          	mul	a3,a1,a1
 8f4:	fed55ae3          	bge	a0,a3,8e8 <func0+0x14>
 8f8:	00c035b3          	snez	a1,a2
 8fc:	852e                	mv	a0,a1
 8fe:	8082                	ret
