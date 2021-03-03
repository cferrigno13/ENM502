function [T] = twodee(h,al)
N = 1/h;
n = (N+1)^2;
T = zeros(n,1);
b = zeros(n,1);
for z = 1:n
    b(z) = -al;
end
a = zeros(n,n);
for i = 1:n
    if i <= N
        a(i,i) = 1;
        b(i) = 0;
    end
    for j = 1:N+1
        if i == j*(N+1)
            a(i,i) = 1;
            b(i) = 0;
        end
        if i == j*(N+1)+1
            a(i,i) = 1;
            b(i) = 0;
        end
    end
    if i <= n && i > (n-(N+1))
        a(i,i) = 1;
        b(i) = 0;
    end
    if b(i) ~= 0
        a(i,i-(N+1)) = N^2;
        a(i,i-1) = N^2;
        a(i,i) = -4*(N^2);
        a(i,i+1) = N^2;
        a(i,i+(N+1)) = N^2;
    end
end
[T] = ludec(a,b,n,0,T);
%reshape(T,N+1,N+1)
end