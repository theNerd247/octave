function [g,bconfig] = getGamma(p,q)
	#calculate s
	s = [q(1);q(2)]-([p(1);p(2)]-[p(3);p(4)]);
endfunction
