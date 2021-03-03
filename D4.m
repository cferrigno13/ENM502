%% Problem 4

%% 1D Case for my Solver

clear
clc

q = [500:100:1000,1000:250:2000];
TLU1D = zeros(length(q),1);


MYSOLVER1D = figure(1);
for i = 1:length(q)
h = 1/q(i);
N = q(i);
a = zeros(N+1,N+1);
b = zeros(N+1,1);
T = zeros(N+1,1);
al = 2;
[a,b] = onedeeC(N, al, a, b);
tic()
[T] = ludec(a,b,N+1,0,T);
TLU1D(i) = toc();
end

X = log(q);
Y = log(TLU1D);
p = polyfit(X,Y,1);
plot(X,Y,'r-o');
hold on
plot(X,p(1)*X+p(2));
xlabel('log(N)')
ylabel('log(time)')
title('Solve time vs N for my LU solver in 1D')
hold off
xl = xlim;
yl = ylim;
xt = .05 * (xl(2)-xl(1)) + xl(1);
yt = .9 * (yl(2)-yl(1)) + yl(1);
caption = sprintf('y = %f * x + %f \noperation scaling = n^{%f}',p(1),p(2),p(1));
text(xt,yt,caption,'FontSize',14,'Color', 'k', 'FontWeight', 'bold');


%% 1D Case for the built in MATLAB solver

clear
clc

q = [5000:100:10000];
TMS1D = zeros(length(q),1);

MATLABSOLVER1D = figure(2);
for i = 1:length(q)
h = 1/q(i);
N = q(i);
a = zeros(N+1,N+1);
b = zeros(N+1,1);
T = zeros(N+1,1);
al = 2;
[a,b] = onedeeC(N, al, a, b);
a = sparse(a);
tic()
[T] = a\b;
TMS1D(i) = toc();
end

X = log(q);
Y = log(TMS1D);
p = polyfit(X,Y,1);
plot(X,Y,'r-o');
hold on
plot(X,p(1)*X+p(2));
xlabel('log(N)')
ylabel('log(time)')
title('Solve time vs N for the bult in MATLAB solver in 1D')
hold off
xl = xlim;
yl = ylim;
xt = .05 * (xl(2)-xl(1)) + xl(1);
yt = .9 * (yl(2)-yl(1)) + yl(1);
caption = sprintf('y = %f * x + %f \noperation scaling = n^{%f}',p(1),p(2),p(1));
text(xt,yt,caption,'FontSize',14,'Color', 'k', 'FontWeight', 'bold');

saveas(MATLABSOLVER1D,'1D_Timing_MatlabSolver.png')


%% 2D Case for my solver

clear
clc

q = [20:5:45];
qq = q.^2;
TLU2D = zeros(length(q),1);

MYSOLVER2D = figure(3);
for i = 1:length(q)
N = q(i);
n = (N+1)^2;
a = zeros(n,n);
b = zeros(n,1);
al = 2;
T = zeros(n,1);
[a,b] = twodeeC(N,al,a,b);
tic()
[T] = ludec(a,b,n,0,T);
TLU2D(i) = toc();
end

X = log(qq);
Y = log(TLU2D);
p = polyfit(X,Y,1);
plot(X,Y,'r-o');
hold on
plot(X,p(1)*X+p(2));
xlabel('log(n)')
ylabel('log(time)')
title('Solve time vs Matrix Size for my LU solver in 2D')
hold off
xl = xlim;
yl = ylim;
xt = .05 * (xl(2)-xl(1)) + xl(1);
yt = .9 * (yl(2)-yl(1)) + yl(1);
caption = sprintf('y = %f * x + %f \noperation scaling = n^{%f}',p(1),p(2),p(1));
text(xt,yt,caption,'FontSize',14,'Color', 'k', 'FontWeight', 'bold');

saveas(MYSOLVER2D,'2D_Timing_MySolver.png')



%% 2D Case for MATLAB intrinsic solver

clear
clc

q = [50:2:70 70:5:100 100:10:130];
qq = q.^2;
TMS2D = zeros(length(q),1);

MATSOLVER2D = figure(4);
for i = 1:length(q)
N = q(i);
n = (N+1)^2;
a = zeros(n,n);
b = zeros(n,1);
al = 2;
T = zeros(n,1);
[a,b] = twodeeC(N,al,a,b);
a = sparse(a);
tic()
[T] = a\b;
TMS2D(i) = toc();
end

X = log(qq);
Y = log(TMS2D);
p = polyfit(X,Y,1);
plot(X,Y,'r-o');
hold on
plot(X,p(1)*X+p(2));
xlabel('log(n)')
ylabel('log(time)')
title('Solve time vs Matrix Size for the intrinsic MATLAB solver in 2D')
hold off
xl = xlim;
yl = ylim;
xt = .05 * (xl(2)-xl(1)) + xl(1);
yt = .9 * (yl(2)-yl(1)) + yl(1);
caption = sprintf('y = %f * x + %f \noperation scaling = n^{%f}',p(1),p(2),p(1));
text(xt,yt,caption,'FontSize',14,'Color', 'k', 'FontWeight', 'bold');

saveas(MATSOLVER2D,'2D_Timing_MatlabSolver.png')

