#performs 3 arm reverse kinematics 
# p = [x,y,gamma] or [x;y;gamma] :position of endeffector
# l = [a,b,c] or [a;b;c] :lengths of arms
#
# returns A = [a,b,c;ta1,ta2,ta3;tb1,tb2,tb3] :matrix whos column vectors are
# are position vectors (thetas tx1,..,tx3 are relative to the previous arm
# position)
function A = rkin3(p,l)

	#find q for 2R kin solution
	q = [p(1);p(2)]-(l(3)*[cos(p(3)); sin(p(3))]);

	#solve for theta1 and 2
	T = rkin(q,[l(1),l(2)]);
	
	#check for invalid values
	if (any(isnan(T)))
		A = NaN;
		return
	endif

	#solve for theta3s
	t31 = p(3)-(T(2,1)+T(2,2));
	t32 = p(3)-(T(3,1)+T(3,2));

	#append to solution matrix
	A = [T,[l(3);t31;t32]];
endfunction
