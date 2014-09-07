function [cel,kelvin] = tempconv(x)
	cel = (x-32)*(5/9);
	kelvin = cel+273.15;
endfunction
