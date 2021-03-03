function [x] = ludec(a, b, n, tol, x)
o = zeros(1,n);
s = zeros(1,n);
er = 0;
[a, n, o, ~, ~, er] = dec(a, n, o, s, tol, er);
if er ~= -1
    [~, ~, ~, ~, x] = sub(a, o, n, b, x);
end
end