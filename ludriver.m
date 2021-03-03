a = [1 1 2;3 1 1;1 1 1];
b = [1; 2; 3];
n = length(a);
tol = 0;
x = zeros(n,1);
ludec(a, b, n, tol, x);