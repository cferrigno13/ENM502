function [a,b] = onedeeC(N, al, a, b)
%N = 1/h;
%T = zeros(N+1,1);
%a = zeros(N+1,N+1);
for i = 2:N
    a(i,i-1) = 1;
    a(i,i) = -2;
    a(i,i+1) = 1;
end
a = a * N^2;
a(1,1) = 1;
a(N+1,N+1) = 1;
%b = zeros(N+1,1);
for z = 1:N+1
    if a(z,z) ~= 1
        b(z) = -al;
    end
end
%[T] = ludec(a,b,N+1,0,T);
end