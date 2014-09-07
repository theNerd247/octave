function PS = getPS(P,n)
# generate path points
PS = [];

# PS = [Q1 Q2 ... Q(N-1) PN] where
#		QN = [xN,xN+n,...,x(N+1)-d; same thing for y; same thing for gamma]
#		and PN is the last column of P
for i = 1:1:(columns(P)-1)
	PS = [PS, linspace(P(:,i),P(:,i+1)-((P(:,i+1)-P(:,i))/n),n)];
endfor

PS = [PS, P(:,columns(P))];
endfunction
