function P = genpnts
# target points ([x1,x2,...,xN;y1,y2,...,yN;gamma1,gamma2,....,gammaN])
sides = 8;
P = [];
for j = 8:8
	for i = 0:sides
		P = [P ,[j*cos(i*2*pi/sides);j*sin(i*2*pi/sides);i*2*pi/sides]];
	endfor
endfor

for i = 1:sides
	if(!mod(i,2))
		P = [P, P(:,i)];
	endif
endfor
P = [P, P(:,2)];

#{
for i = 1:sides
	if(mod(i,2))
		P = [P, P(:,i)];
	endif
endfor
P = [P, P(:,1)];
#}
#P = [P(:,1), P(:,2)];

endfunction
