1;

function deg = f1()
	deg = input("enter in degrees: ");
endfunction

function rad = f2(deg)
	rad = deg*pi/180;
endfunction

function f3(deg,rad)
	fprintf("Deg: %.2f Rad: %.2f",deg,rad);
endfunction

d = f1();
f3(d,f2(d));
