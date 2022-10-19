1.
	result:
	2.716667e+00    6.537628e+00
	1.844444e+00    5.315395e+00
	-3.570679e+00   -7.981534e+00
	6.459132e+00    1.338272e+01
	1.654622e+01    3.327375e+01
	1.369219e+02    2.738656e+02
	-4.797842e+03   -9.595684e+03
	3.620911e+06    7.241822e+06
	7.928960e+11    1.585792e+12
	4.591541e+21    9.183081e+21

	it fails to converge☹️

2.
	0.724880564039904	-7.805256814973498
	1.224880295294654	-0.888729743780569
	0.724836241812091	-7.805256645171331
	0.224911245562278	3.598168349869430

3.
	bracketing method can't find roots if there's no sign change in
	given inputs, so it's impossible to find roots in region [0,1].

	secant method works better in polynomials that with degree>=1,
	else it's easier to get diverged.

	to put it simply, I'd recommend to use secant method in this problem
	for bracketing method wouldn't work in this case.