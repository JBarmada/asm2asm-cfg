0000000000000800 <func0>:
 800:	04a05b63          	blez	a0,856 <func0+0x56>
 804:	4281                	li	t0,0
 806:	4585                	li	a1,1
 808:	ccccd637          	lui	a2,0xccccd
 80c:	ccd6061b          	addw	a2,a2,-819 # ffffffffcccccccd <__global_pointer$+0xffffffffcccca4cd>
 810:	02061313          	sll	t1,a2,0x20
 814:	4829                	li	a6,10
 816:	48a5                	li	a7,9
 818:	a801                	j	828 <func0+0x28>
 81a:	0005061b          	sext.w	a2,a0
 81e:	02b685bb          	mulw	a1,a3,a1
 822:	853a                	mv	a0,a4
 824:	02c8f463          	bgeu	a7,a2,84c <func0+0x4c>
 828:	02051613          	sll	a2,a0,0x20
 82c:	02663633          	mulhu	a2,a2,t1
 830:	02365713          	srl	a4,a2,0x23
 834:	0307063b          	mulw	a2,a4,a6
 838:	40c507bb          	subw	a5,a0,a2
 83c:	0017f613          	and	a2,a5,1
 840:	4685                	li	a3,1
 842:	c211                	beqz	a2,846 <func0+0x46>
 844:	86be                	mv	a3,a5
 846:	da71                	beqz	a2,81a <func0+0x1a>
 848:	4285                	li	t0,1
 84a:	bfc1                	j	81a <func0+0x1a>
 84c:	4501                	li	a0,0
 84e:	00028363          	beqz	t0,854 <func0+0x54>
 852:	852e                	mv	a0,a1
 854:	8082                	ret
 856:	4501                	li	a0,0
 858:	8082                	ret
