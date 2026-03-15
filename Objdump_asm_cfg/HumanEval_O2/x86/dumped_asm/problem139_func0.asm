00000000000012e0 <func0>:
    12e0:	40 f6 c7 01          	test   $0x1,%dil
    12e4:	0f 94 c0             	sete   %al
    12e7:	83 ff 08             	cmp    $0x8,%edi
    12ea:	0f 9d c1             	setge  %cl
    12ed:	20 c1                	and    %al,%cl
    12ef:	0f b6 c1             	movzbl %cl,%eax
    12f2:	c3                   	ret    

