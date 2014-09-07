% assignment 1 for Mech Fund 1

% rc || circuit
r1 = 3;
r2 = 5;
r3 = 1;

rt = 1/((1/r1)+(1/r2)+(1/r3));

% rand matrix
randm = randi([50,100],2,3);

% linspace 1
lnspc1 = linspace(1,5,9);

% linspace 2
lnspc2 = linspace(-pi,pi,20);

% basic io
inp1 = input("Give #:\n");
fprintf("Your # is: %.2f\n", inp1);
