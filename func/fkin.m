#forward kinematics for a N joint endeffector
# A [ r1, r2, ... , rn; theta1,theta2, ... , thetan]
function [r,theta,gamma] = fkin(A)

	gamma = 0;
	z = 0;
	for i = 1:columns(A)
		gamma += A(2,i);
		z += A(1,i)*[cos(gamma); sin(gamma)];
	endfor

	#store the length and theta for p
	r = sqrt(z(1)^2+z(2)^2);
	theta = atan2(z(2),z(1));
endfunction
