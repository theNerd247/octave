#reverse kinematics for a two joint endofactor
#returns NaN if p and l are invalid values
# p = [x,y]
# l = [a_length,b_length]
function T = rkin(p,l)

	#find location of last joint
	x = p(1);
	y = p(2);
	a = l(1);
	b = l(2);

	#solve for theta2
	d = 2*a*b;
	f = x^2+y^2-a^2-b^2;	

	c2 = f/d;
	theta2 = acos(c2);

	#check for bad position values 
	# avoid extremely small differences as a result of computer error
	if (imag(theta2) != 0 && abs(f-d) > 1e-15)
		T = NaN;
		return
	endif 

	theta2 = real(theta2);

	s2 = sin(theta2);

	#solve for theta1
	A = [a + b*c2, -b*s2,p(1); b*s2, a+b*c2,p(2)];
	
	r = rref(A)*[0;0;1];
	
	theta1 = atan2(r(2),r(1));

	#solve for thetb1,2
	thetb1 = 2*atan2(p(2),p(1))-theta1;
	thetb2 = -theta2;

	T = [a,b;theta1,theta2;thetb1,thetb2];
endfunction
