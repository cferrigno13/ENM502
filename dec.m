function [a, n, o, s, tol, er] = dec(a, n, o, s, tol, er)
for i = 1:n
    o(i) = i;
    s(i) = abs(a(i,1));
    for j = 2:n
        if abs(a(i,j)) > s(i)
            s(i) = abs(a(i,j));
        end
    end
end
for k = 1:n-1
    p(a,o,s,n,k)
    if abs(a(o(k),k)/s(o(k))) < tol
        er = -1;
        disp(a(o(k),k)/s(o(k)))
        return
    end
    for i = k+1:n
        f = a(o(i),k)/a(o(k),k);
        a(o(i),k) = f;
        for j =k+1:n
            a(o(i),j) = a(o(i),j) - f*a(o(k),j);
        end
    end
end
if abs(a(o(k),k)/s(o(k))) < tol
    er = -1;
    disp(a(o(k),k)/s(o(k)))
end
end