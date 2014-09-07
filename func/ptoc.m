#converts A = [l1,l2,...,lN;theta1,theta2,...thetaN] to
#         B = [x1,x2,...,xN;y1,y2,...,yN]
# for robot arms. NOTE: theta2,theta3,...,thetaN are all based off of thetaN-1
# position
function B = ptoc(A)

	if(any(isnan(A)))
		B = NaN;
		return
	endif

	B = [A(1,1)*[cos(A(2,1)); sin(A(2,1))]];
	gamma = A(2,1);

	for i = 2:columns(A)
		gamma += A(2,i);
		B = [B, B(:,i-1)+A(1,i)*[cos(gamma);sin(gamma)]];
	endfor

endfunction
