a = 1;
b = 1;

anglea = -pi/6
angleb = pi/4

[r,t,g] = fkin([a,b;anglea,angleb])

rx = r*cos(t)
ry = r*sin(t)

A = rkin([rx;ry],[a;b])

[r1,t1,g1] = fkin([a,b;A(1,1),A(2,1)])
[r2,t2,g2] = fkin([a,b;A(1,2),A(2,2)])

